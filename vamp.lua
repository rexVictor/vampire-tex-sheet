require('Ordered')
local P = {}

--imports
local SheetMaker = require('src.sheet')
local ResourceBundle = require('libs.resourcebundle')
local require = require
local io = io
local pairs = pairs
local setmetatable = setmetatable
local tex = tex
local tonumber = tonumber
local math = math

_ENV = P

function P.makeCircles(value, count)
  count = count or 5
  tex.sprint("\\circleFont{}")
  for i=1, value do
    if i == 6 then
      tex.sprint("\\,")
    end
    tex.sprint("●")
  end
  for i=value+1,tonumber(count) do
    if i == 6 then
      tex.sprint("\\,")
    end
    tex.sprint("○")
  end
end

function P.makeHumanityCircles(value)
  tex.sprint("\\bigCircleFont")
  tex.sprint("\\hfill{}")
  for i = 1,value do
    tex.sprint("●\\hfill{}")
  end
  for i=value+1,10 do
    tex.sprint("○\\hfill{}")
  end
end

function P.makeWillpowerSquares()
  tex.sprint("\\bigCircleFont")
  tex.sprint("\\hfill{}")
  for i=1,10 do
    tex.sprint("□\\hfill{}")
  end
end

function P.makeBloodpool(max)
  tex.sprint("\\begin{tabu} to \\linewidth{@{}X[c] X[c] X[c] X[c] X[c] X[c] X[c] X[c] X[c] X[c]}")
  local lastLineCount = max % 10
  local lineCount = math.floor(max / 10)
  for i=1,lineCount do
    for j=1,9 do
      tex.sprint("\\bloodpoolSquareFont{} □ & ")
    end
    tex.sprint("\\bloodpoolSquareFont{} □\\\\")
  end
  if lastLineCount ~= 0 then
    for i = 1, lastLineCount do
      tex.sprint("\\bloodpoolSquareFont{}□&")
    end
  end
  tex.sprint("\\end{tabu}")
end

function P.makeHealth(count)
  if (count == 0) then return end
  tex.sprint("\\begin{tabu} to \\linewidth{@{}")
  for i=1,count do
    tex.sprint("X[c] ")
  end
  tex.sprint(" @{}}")
  tex.sprint("\\rowfont{\\healthSquareFont{}}")
  local notFirst = false
  for i=1,count do
    if (notFirst) then tex.sprint("&") end
    tex.sprint("□")
    notFirst = true
  end
  tex.sprint("\\\\")
end

function P.endHealth()
  tex.sprint("\\end{tabu}")
end

return P

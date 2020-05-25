--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}
-- level is passed in as a variety in entry functions
function Tile:init(x, y, color, variety, shiny)
    
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety
    self.shiny = shiny

end

function Tile:render(x, y, shiny)
    -- draw shadow
    love.graphics.setColor(34, 32, 52, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)

    -- draw tile itself
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x, self.y + y)
    --TODO fix shiny rendering - has to follow tile
    if self.shiny == true then 
        love.graphics.setBlendMode('add')

        love.graphics.setColor(255, 255, 255, 150)
        love.graphics.rectangle('fill', (self.gridY) * 32 + (VIRTUAL_WIDTH - 272),
            (self.gridX) * 32 + 16, 16, 16, 4)

        -- back to alpha
        love.graphics.setBlendMode('alpha')
    end 
end
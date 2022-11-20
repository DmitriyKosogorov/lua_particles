require("particle")
require("vector")
require("square")

function love.load()
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()

    square_number=10

    squares={}

    for i=0, square_number do
        squares[i]=Square:create(Vector:create(love.math.random(0,width-100),love.math.random(0,height-100)))
    end

end

function love.update()
    for i=0, square_number do
        squares[i]:update()
    end
end

function love.draw()
    for i=0, square_number do
        squares[i]:draw()
    end
end

function love.mousepressed(x,y,button,istouch, presses)
    if(button==1) then
        for i=0, square_number do
            if(squares[i]:inside(x,y)) then
                squares[i]:explode()
            end
        end
    end
end
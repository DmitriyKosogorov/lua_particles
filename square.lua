Square={}
Square.__index=Square

function Square:create(position)
    local square={}
    setmetatable(square, Square)
    square.position=position
    square.width=100
    square.height=100
    square.particles={
        [0]=Particle:create(Vector:create(position.x, position.y)),
        [1]=Particle:create(Vector:create(position.x, position.y+50)),
        [2]=Particle:create(Vector:create(position.x+50, position.y)),
        [3]=Particle:create(Vector:create(position.x+50, position.y+50))}
    square.particled=false
    return square
end

function Square:update()
    if(self.particled==true) then
        for k,v in pairs(self.particles) do
            v:update()
        end 
    end
end

function Square:explode()
    self.particled=true
end

function Square:inside(x,y)
    if(self.particled==false) then
        if(x>=self.position.x and x<=self.position.x+100 and y>= self.position.y and y<=self.position.y+100) then
            self.particles[0].width=x-self.position.x
            self.particles[0].height=y-self.position.y
            
            self.particles[1].width=x-self.position.x
            self.particles[1].height=self.position.y+100-y
            self.particles[1].position.y=y

            self.particles[2].width=self.position.x+100-x
            self.particles[2].height=y-self.position.y
            self.particles[2].position.x=x

            self.particles[3].width=self.position.x+100-x
            self.particles[3].height=self.position.y+100-y
            self.particles[3].position.x=x
            self.particles[3].position.y=y
            return true
        end
    end
    return false
end

function Square:draw()
    if(self.particled==false) then
        love.graphics.rectangle("line", self.position.x, self.position.y, self.width, self.height)
    else
        for k,v in pairs(self.particles) do
            v:draw()
        end
    end
end
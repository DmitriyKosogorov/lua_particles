Particle={}
Particle.__index=Particle

function Particle:create(position)
    local particle={}
    setmetatable(particle, Particle)
    particle.position=position
    particle.acceleration=Vector:create(0,0.05)
    particle.velocity=Vector:create(math.random(-10,10)/10, math.random(-10,0)/10)
    particle.lifespan=200
    particle.width=50
    particle.height=50
    return particle
end


function Particle:update()
    self.velocity:add(self.acceleration)
    self.position:add(self.velocity)
    self.lifespan=self.lifespan-1
end

function Particle:isDead()
    if self.lifespan<0 then
        return true
    end
    return false
end

function Particle:draw()
    r,g,b,a=love.graphics.getColor()
    love.graphics.setColor(255,255,255, self.lifespan/100)
    love.graphics.rectangle("line", self.position.x, self.position.y, self.width, self.height)
    love.graphics.setColor(r,g,b,a)
end

function Particle:applyForce(force)
    self.acceleration:add(force)
end
--robot = require("robot")
robot = require("testing")
movement = {}

function movement.move(direction, n)
    for i=1,n do
        direction()
    end
end

function movement.moveForward(n)
    movement.move(robot.forward, n)
end

function movement.moveBackwards(n)
    movement.move(robot.backwards, n)
end

function movement.moveLeft(n)
    robot.turnLeft()
    movement.moveForward(n)
end

function movement.moveRight(n)
    robot.turnRight()
    movement.moveForward(n)
end

return movement

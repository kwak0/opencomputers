--robot = require("robot")
robot = require("testing")
movement = require("movement")

arg = {...}
blockIndex = 0

function orientate()
    while robot.detect() do
        robot.turnRight()
    end
    robot.forward()
    robot.turnLeft()
end

function lineUpRow()
    movement.moveLeft(2)
    robot.turnRight()
end

function place(cube)
    blockIndex = blockIndex + 1
    if cube[blockIndex] == nil then
        robot.select(cube.default)
    else
        robot.select(cube[blockIndex])
    end
    robot.place()
end

function placeRow(cube)
    for i=1,2 do
        place(cube)
        movement.moveRight(1)
        robot.turnLeft()
    end
    place(cube)
    print("Row Done")
end

function placeLayer(cube)
    for i=1,2 do
        placeRow(cube)
        robot.back()
        lineUpRow()
    end
    placeRow(cube)
    print("Layer Done")
end

function drop(cube)
    robot.back()
    robot.select(cube["drop"])
    robot.drop()
    robot.forward()
end

function placeCube(cube, n)
    orientate()
    for j=1,n do
        for i=1,3 do
            movement.moveForward(2)
            placeLayer(cube)
            lineUpRow()
            if i ~= 3 then
                robot.up()
            end
        end

        for i=1,2 do
            robot.down()
        end
        drop(cube)
        print("Completed " .. cubeName)
    end
end

cubes = {
    ["enderpearl"]={["default"]=1, ["drop"]=3; [14]=2},
}

cubeName = arg[1]
n = arg[2] or 1
if cubeName == nil then
    print("Enter cube to build")
elseif cubes[cubeName] == nil then
    print('Unknown cube "' .. cubeName .. '"')
elseif not tonumber(n) then
    print(n .. " is not an integer")
else
    placeCube(cubes[arg[1]], n)
end

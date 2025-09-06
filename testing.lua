math = require("math")
testing = {}

printFunctions = {"forward", "back", "up", "down", "turnLeft", "turnRight", "place", "placeDown", "drop"}
randBoolFunctions = {"detect"}

function printTesting(f)
    return function()
        print("running ".. f .. "()...")
    end
end

for _, f in ipairs(printFunctions) do
    testing[f] = printTesting(f)
end

for _, f in ipairs(randBoolFunctions) do
    testing[f] = function()
        return math.random(0, 1) == 1
    end
end

function testing.select(i)
    print("running select()... Selected slot " .. i)
end

return testing

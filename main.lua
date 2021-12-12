function love.load()

    Score1 = 0

    Score2 = 0

    windyfield = require "windfield" 

    world = windyfield.newWorld(0,1000)

    player1 = world:newRectangleCollider(600, 570, 40, 10)

    player2 = world:newRectangleCollider(200,570, 40, 10)

    midDivider = world:newRectangleCollider(400, 560, 5, 40)

    midDivider: setType('static')

    ramp1 = world:newLineCollider(10, 560,30,580)

    ramp1: setType('static')

    ramp2 = world:newLineCollider(790, 560,770,580)

    ramp2: setType('static')

    ground1 = world:newRectangleCollider(0,580, 400, 20)

    ground1:setType('static')

    ground2 = world:newRectangleCollider(400,580, 400, 20)

    ground2:setType('static')

    sideBlock = world:newRectangleCollider(0,0, 10, 600)

    sideBlock:setType('static')

    sideBlock2 = world:newRectangleCollider(790,0, 10, 600)

    sideBlock2:setType('static')

    airBlock = world:newRectangleCollider(0,0, 800, 20)

    airBlock:setType('static')

    scoreBall = world:newCircleCollider(love.math.random(11, 789), 30 ,5)

    scoreBall:setRestitution(0.925)

    xx = 512

    yy = 10

    xxx = 580

    yyy= 10
end

function p1distance(xcord1, xcord2, ycord1, ycord2)

    return math.sqrt(xcord2 - xcord1)^2 + (ycord2 - ycord1)^2

end

function p2distance(xcord1, xcord2, ycord1, ycord2)

    return math.sqrt(xcord2 - xcord1)^2 + (ycord2 - ycord1)^2

end

function love.mousepressed(x, y, button, istouch, presses )
    
    if button == 1 then
    
        local mouseToTarget = p1distance(x, xx, whyy, y)
    
        if mouseToTarget <= 20 then
    
            Score2 = Score2 + 1 
    
           scoreBall:setPosition(love.math.random(11, 789), 30)
    
        end
    
    end

    if button == 1 then
        
        local mouseToTarget2 = p2distance(x, xxx, y, yyy)
        
        if mouseToTarget2 <= 20 then
            
            Score1 = Score1 + 1 

            scoreBall:setPosition(love.math.random(11, 789), 30)

        end

    end

end

function love.update(dt)

    player2x, player2y = player2:getLinearVelocity()

    world:update(dt)

    if love.keyboard.isDown('right') and player2x < 500 then

        player2:applyForce(500,0)

    elseif love.keyboard.isDown('left') and player2y > -500 then

        player2:applyForce(-500,0)

    end

    if love.keyboard.isDown('d') and player2x < 500 then

        player1:applyForce(500,0)

    elseif love.keyboard.isDown('a') and player2y > -500 then

        player1:applyForce(-500,0)

    end

end

function love.draw()
    
    
    love.graphics.circle("fill", 513, 10, 10)

    love.graphics.circle("fill", 573, 10, 10)

    love.graphics.print("Point for 1 ->", 420,0)

    love.graphics.print("<- Point for 2", 585,0)

    love.graphics.print("Player 1 score: ",50,0)

    love.graphics.print(Score1, 140, 0)

    love.graphics.print("Player 2 score: ", 250, 0)

    love.graphics.print(Score2,340, 0)

    if winner1 == true then

        love.graphics.print("PLAYER 1 HAS WON", 400, 0)

    elseif winner2 == true then

        love.graphics.print("PLAYER 2 HAS WON", 400, 0)

    end

    world:draw()

end

--Hello CS50 staff! I am Mert Esat Yerel. I am a sophmore out of Virginia Beach, Virginia, and I have chosen to do my final project as a game coded in Lua inside of Love2D. My game is ping pong.
--Here is a quick demonstration. But before I do that, let me explain the game. As you saw, the screen was split into 2 half with 2 players.
--The goal is to get the ball PERMANENTLY stuck on the other side until they concede. This is a couch co-op game, you play it on the same device using the arrow keys and wasd.
--If the ball gets stuck, you can concede that point by pressing a button up top. There is no point limit, you can go as far as you'd like. Thank you for checking it out,
--and here is some gameplay.

-- Bad gameplay as I tried to play 2 people at once, but I believe that showed off the game well. The way it gets stuck is if it reaches the middle and you cannot bounce it off.
--Again, thank you for watching, and this has been my CS50x Final Presentation: Ping Pong!
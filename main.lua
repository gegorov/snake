SNAKE_SPEED = 100;
TILE_SIZE = 32;
WINDOW_WIDTH = 1280;
WINDOW_HEIGHT = 720;

local snakeX = 0;
local snakeY = 0;

local snakeMoving = 'rigth';

function love.load()
  -- body
  love.window.setTitle('Snake50');
  love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
    fullscreen = false
  })
end

function love.keypressed(key)
  -- body
  if key == 'escape' then
    -- body
    love.event.quit();
  end

  if key == 'left' then
    snakeMoving = 'left';
  elseif key == 'right' then
    snakeMoving = 'right';
  elseif key == 'up' then
    snakeMoving = 'up';
  elseif key == 'down' then
    snakeMoving = 'down';
  end
  
end

function love.update(dt)
  -- body
  if snakeMoving == 'left' then
    -- body
    snakeX = snakeX - SNAKE_SPEED * dt;
  elseif snakeMoving == 'right' then  
    snakeX = snakeX + SNAKE_SPEED * dt;
  elseif snakeMoving == 'up' then  
    snakeY = snakeY - SNAKE_SPEED * dt;
  elseif snakeMoving == 'down' then  
    snakeY = snakeY + SNAKE_SPEED * dt;
  end
end

function love.draw()
  -- body
  love.graphics.setColor(0, 1, 0, 1);
  love.graphics.rectangle('fill', snakeX, snakeY, TILE_SIZE, TILE_SIZE);
end

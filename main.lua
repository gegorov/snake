TILE_SIZE = 32;
WINDOW_WIDTH = 1280;
WINDOW_HEIGHT = 720;

MAX_TILES_X = WINDOW_WIDTH / TILE_SIZE;
MAX_TILES_Y = math.floor(WINDOW_HEIGHT / TILE_SIZE) - 1;

TILE_EMPTY = 0;
TILE_SNAKE_HEAD = 1;
TILE_SNAKE_BODY = 2;
TILE_APPLE = 3;

-- time in secods that snake moves one tile 
SNAKE_SPEED = 0.5;

local tileGrid = {};

local snakeX = 1;
local snakeY = 1;
local snakeMoving = 'rigth';
local snakeTimer = 0;

function love.load()
  -- body
  love.window.setTitle('Snake50');
  love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
    fullscreen = false,
    resizable = true
  })
  math.randomseed(os.time());
  initializeGrid();
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
  snakeTimer = snakeTimer + dt;

  if snakeTimer >= SNAKE_SPEED then
    -- body
    if snakeMoving == 'left' then
      -- body
      snakeX = snakeX - 1;
    elseif snakeMoving == 'right' then  
      snakeX = snakeX + 1;
    elseif snakeMoving == 'up' then  
      snakeY = snakeY - 1;
    elseif snakeMoving == 'down' then  
      snakeY = snakeY + 1;
    end

    snakeTimer = 0.1;
  end
end

function love.draw()
  -- body
  drawGrid();
  drawSnake();
end

function drawGrid() 
  
  for y = 1, MAX_TILES_Y do 
    for x = 1, MAX_TILES_X do
      -- love.graphics.rectangle('line', (x - 1) * TILE_SIZE, (y - 1) * TILE_SIZE,
      -- TILE_SIZE, TILE_SIZE);
      if tileGrid[y][x] == TILE_EMPTY then
        -- change the color to white for grid
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.rectangle('line', (x - 1) * TILE_SIZE, (y - 1) * TILE_SIZE, TILE_SIZE, TILE_SIZE);

      elseif tileGrid[y][x] == TILE_APPLE then
        -- change the color to white for apple
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.rectangle('fill', (x - 1) * TILE_SIZE, (y - 1) * TILE_SIZE, TILE_SIZE, TILE_SIZE);

      end
    end
  end
end

function drawSnake() 
  love.graphics.setColor(0, 1, 0, 1)
  love.graphics.rectangle('fill', (snakeX - 1) * TILE_SIZE, (snakeY - 1) * TILE_SIZE, TILE_SIZE, TILE_SIZE);
end

function initializeGrid()
  -- body
  for y = 1, MAX_TILES_Y do
    table.insert( tileGrid, {} )
    for x = 1, MAX_TILES_X do
      table.insert(tileGrid[y], TILE_EMPTY);
    end
  end

  local appleX, appleY = math.random( MAX_TILES_X), math.random( MAX_TILES_Y)
  tileGrid[appleY][appleX] = TILE_APPLE;
end
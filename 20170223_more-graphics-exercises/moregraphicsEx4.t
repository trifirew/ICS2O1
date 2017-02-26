% Keisun Wu
% 20170224

% 4) Snowflake
const MIDX : int := maxx div 2
const MIDY : int := maxy div 2

drawline (MIDX - 200, MIDY, MIDX + 200, MIDY, cyan)
drawline (MIDX - 100, MIDY - 174, MIDX + 100, MIDY + 174, cyan)
drawline (MIDX - 100, MIDY + 174, MIDX + 100, MIDY - 174, cyan)

drawline (MIDX - 100, MIDY, MIDX - 150, MIDY + 87, cyan)
drawline (MIDX - 100, MIDY, MIDX - 150, MIDY - 87, cyan)
drawline (MIDX + 100, MIDY, MIDX + 150, MIDY + 87, cyan)
drawline (MIDX + 100, MIDY, MIDX + 150, MIDY - 87, cyan)

drawline (MIDX - 50, MIDY + 87, MIDX - 150, MIDY + 87, cyan)
drawline (MIDX + 50, MIDY + 87, MIDX + 150, MIDY + 87, cyan)
drawline (MIDX - 50, MIDY - 87, MIDX - 150, MIDY - 87, cyan)
drawline (MIDX + 50, MIDY - 87, MIDX + 150, MIDY - 87, cyan)

drawline (MIDX - 50, MIDY + 87, MIDX, MIDY + 174, cyan)
drawline (MIDX + 50, MIDY + 87, MIDX, MIDY + 174, cyan)
drawline (MIDX - 50, MIDY - 87, MIDX, MIDY - 174, cyan)
drawline (MIDX + 50, MIDY - 87, MIDX, MIDY - 174, cyan)



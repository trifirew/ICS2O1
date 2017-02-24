% Keisun Wu
% 20170223

% 1) Canadian flag
RGB.SetColor(red,1,0,0) % set red to real red(#FF0000)

drawfillbox(0,0,125,maxy,red)
drawfillbox(maxx,0,maxx-125,maxy,red)
drawfillmapleleaf(maxx div 2-125,75,maxx div 2+125,maxy-75,red)

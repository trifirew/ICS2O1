% Keisun Wu
% 20170223

% 8)
var font20, font15 : int
font20:= Font.New ("sans serif:20:bold")
font15 := Font.New("snas serif:15")
RGB.SetColor(101,0.5,0.5,0.5)   % custom grey color
RGB.SetColor(102,0.75,0,0.75)    % custom rose red
RGB.SetColor(103,0.25,0.25,0.5) % custom indigo

% Draw figures
drawbox(50,50,100,200,102)
drawfillarc (200, 200, 100, 100, 0, 135, red)
drawfilloval(300,50,100,50,103)

% Draw texts
Font.Draw("37.5%", 190,235,font20,101)
Font.Draw("Red filled arc",180,180,font15,red)
Font.Draw("Rose red box", 25,25,font15,102)
Font.Draw("Indigo oval",410,25,font20,103)


% Keisun Wu
% 20170301
% 4) Ask for starting time, finishing time, and distance of your trip, 
%    and output average speed.

var startH, startM, finishH, finishM : int
var distance, speed : real

put "When did you start your trip? (input only the hour)"
get startH
put "When did you start your trip? (input only the minute)"
get startM
put "When did you finish your trip? (input only the hour)"
get finishH
put "When did you finish your trip? (input only the minute)"
get finishM
put "What was the distance of your trip? (in kilometers)"
get distance

speed := distance / ((finishH + finishM / 60) - (startH + startM / 60))

put skip
put "Your average speed of this trip was ", speed : 0 : 1, " km/h."

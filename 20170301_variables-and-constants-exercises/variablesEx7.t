% Keisun Wu
% 20170301
% 7) Baseball player performance calculator

const MIDX : int := maxx div 2
const FONT1 : int := Font.New ("serif:12")

var batAvg, slugAvg : real
var totalHits, totalBat : int
var singles, doubles, triples, homeRuns : int
var batAvgInfo, slugAvgInfo : string


put "What is your total number of hits?"
get totalHits
put "What is your total number of times at bat?"
get totalBat
put "What is your number of singles?"
get singles
put "What is your number of doubles?"
get doubles
put "What is your number of triples?"
get triples
put "What is your number of home runs?"
get homeRuns

batAvg := totalHits / totalBat
slugAvg := (singles + 2 * doubles + 3 * triples + 4 * homeRuns) / totalBat

batAvgInfo := "Batting average: " + frealstr (batAvg, 0, 2)
slugAvgInfo := "Slugging average: " + frealstr (slugAvg, 0, 2)

cls

drawfillarc (MIDX, 50, 300, 300, 45, 135, green)

% Draw the diamond inside
drawline (MIDX, 50, MIDX + 100, 150, white)
drawline (MIDX, 50, MIDX - 100, 150, white)
drawline (MIDX, 250, MIDX + 100, 150, white)
drawline (MIDX, 250, MIDX - 100, 150, white)

Font.Draw (batAvgInfo, MIDX - 62, 150, FONT1, white)
Font.Draw (slugAvgInfo, MIDX - 67, 125, FONT1, white)

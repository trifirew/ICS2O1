% Keisun Wu
% 20170303
% 7) Baseball player performance calculator

const MIDX : int := maxx div 2
const FONT1 : int := Font.New ("serif:12")

var batAvg, slugAvg : real
var totalHits, totalBat : int
var singles, doubles, triples, homeRuns : int
var batAvgStr, slugAvgStr : string
var singlesStr, doublesStr, triplesStr, homeRunsStr : string

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

% Calculate total number of hits, and the averages
totalHits := singles + doubles + triples + homeRuns
batAvg := totalHits / totalBat
slugAvg := (singles + 2 * doubles + 3 * triples + 4 * homeRuns) / totalBat
% Convert all numbers to strings
batAvgStr := "Batting average: " + frealstr (batAvg, 0, 2)
slugAvgStr := "Slugging average: " + frealstr (slugAvg, 0, 2)
singlesStr := intstr (singles)
doublesStr := intstr (doubles)
triplesStr := intstr (triples)
homeRunsStr := intstr (homeRuns)

cls
drawfillarc (MIDX, 50, 300, 300, 45, 135, brown)
drawfilloval (MIDX, 50, 25, 25, brown)
% Draw the diamond inside
drawline (MIDX, 50, MIDX + 100, 150, green)
drawline (MIDX, 50, MIDX - 100, 150, green)
drawline (MIDX, 250, MIDX + 100, 150, green)
drawline (MIDX, 250, MIDX - 100, 150, green)
drawfill (MIDX, 150, green, green)
drawfilloval (MIDX, 50, 25, 25, brown)
% Draw all the number onto the screen
Font.Draw (batAvgStr, MIDX - 62, 150, FONT1, white)
Font.Draw (slugAvgStr, MIDX - 67, 125, FONT1, white)
Font.Draw (singlesStr, MIDX + 95, 170, FONT1, white)
Font.Draw (doublesStr, MIDX - 5, 260, FONT1, white)
Font.Draw (triplesStr, MIDX - 105, 170, FONT1, white)
Font.Draw (homeRunsStr, MIDX - 5, 45, FONT1, white)

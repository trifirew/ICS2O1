% Keisun Wu
% 20170321
% 3. Conversion table from miles to kilometres

put "MILES", "" : 17, "KILOMETERS"
put ""
for mile : 5 .. 100 by 5
    put mile : 3, "" : 20, mile * 1.6 : 5 : 1
end for

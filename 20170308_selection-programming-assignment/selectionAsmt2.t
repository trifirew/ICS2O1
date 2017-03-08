% Keisun Wu
% 20170308
% 2) Determine the dosage for a prescription based on weight.

var weight, dosage : real
put "Input your weight in kg: " ..
get weight
assert weight > 0
if weight < 16 then
    dosage := weight * 0.6
elsif weight < 25 then
    dosage := weight * 0.75
elsif weight < 40 then
    dosage := weight * 0.83
elsif weight < 65 then
    dosage := weight * 1.2
else
    dosage := weight * 1.3
end if
put "You would receive a dosage of ", dosage, " mg."

/* Problem Statement2: What are the Top 10 route(origin and dest) that has seen maximum diversions? */

file = load '/home/matlab/Aviation Project/cleaned.csv' using PigStorage(',') as (year:int, month:int, flight_no:int, origin:chararray, destination:chararray, cancelled:int, cancellation_code:chararray, diversion:int);
filt = filter file by diversion ==1;
groupbyroute = group filt by (origin, destination);
relation = foreach groupbyroute generate group.origin as origin, group.destination as destination, COUNT(filt.diversion) as diversion;
ordered_relation = order relation by diversion DESC;
result = limit ordered_relation 10;
store result into '/home/matlab/Aviation Project/output2';




/* refer the output2 file to see the output of CODE*/

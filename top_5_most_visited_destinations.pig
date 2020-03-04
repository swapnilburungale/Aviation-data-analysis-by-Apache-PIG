/* Problem Statement3: What are the Top 5 visited destination? */

file = load '/home/matlab/Aviation Project/cleaned.csv' using PigStorage(',') as (year:int, month:int, flight_no:int, origin:chararray, destination:chararray, cancelled:int, cancellation_code:chararray, diversion:int);
groupbydest = group file by destination;
relation = foreach groupbydest generate group as destination,COUNT(file.destination) as frequency;
ordered_relation = order relation by frequency DESC;
result = limit  ordered_relation 5;
store result into '/home/matlab/Aviation Project/output3';


/* Refer the output3 file to see the output of the CODE*/


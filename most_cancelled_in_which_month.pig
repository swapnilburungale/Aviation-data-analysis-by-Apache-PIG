/* Problem statement1: Which month have seen the most number of cancellation due to bad weather?*/

file = load '/home/matlab/Aviation Project/cleaned.csv' using PigStorage(',') as (year:int, month:int, flight_no:int, origin:chararray, destination:chararray, cancelled:int, cancellation_code:chararray, diversion:int);
cancelled = filter file by cancelled == 1 AND cancellation_code == 'B';
groupbymonth = group cancelled by month;
total = foreach groupbymonth generate group as month, COUNT(cancelled)as totalno;
ordered_total = order total by totalno DESC;
most_cancelled = limit ordered_total 1;
STORE most_cancelled INTO '/home/matlab/Aviation Project/output1';



/* Refer the output1 to see the output of the CODE*/

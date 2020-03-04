import csv
with open("/home/matlab/Aviation Project/DelayedFlights.csv","rb") as source:
    rdr= csv.reader( source )
    source.next()
    with open("/home/matlab/Aviation Project/cleaned.csv","wb") as result:
        wtr= csv.writer( result )
        for r in rdr:
            wtr.writerow( (r[1], r[2],r[10], r[17], r[18], r[22], r[23],r[24]) )

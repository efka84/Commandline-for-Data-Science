# Shell Data Cleaning Procedures

1. explore 'SA_290_Pnebo_Abzug.csv', find out if the file has header, meaning column names
 
 >-  `head -1 SA__290_Pnebo_Abzug.csv`

2. Find out the number of columns, by transforming comma , to  to new line '\n'  and counting the line number
>* `head -1 SA__290_Pnebo_Abzug.csv  | tr , '\n' | wc -l`


3. For some programs we need the column number. we'll create a file w/ number and col names **the short way**

>* `head -n 1 SA__290_Pnebo_Abzug.csv | tr , '\n' | nl -w1`

4. to include empty lines use 
>* head -n 1 SA__290_Pnebo_Abzug.csv | tr , '\n' | nl -ba  

##  The long way 
>* `seq 28 > colnr.txt && head -1 SA__290_Pnebo_Abzug.csv  | tr , '\n' | wc -l > colname.txt`

 i. we paste them together and delete the colnr.txt and colname.txt
paste colnr.txt colnames.txt > columns.txt && rm coln*.txt
#### show columns 3 and 11
>* `cut -d',' -f3,11  SA__290_Pnebo_Abzug.csv | head`

**for better overview insert tabs instead of commas**
>* `cut -d',' -f3,11  SA__290_Pnebo_Abzug.csv | tr , '\t' | head`

**find out the number of transactions in the month of december**
 >* `cut -d',' -f3,11  SA__290_Pnebo_Abzug.csv | tr , '\t' |grep "2019-12" | wc -lc`

**Sum of the first column `f1` using `Mysys2 (path C:\mysys64)`  basic calculator `bc`**
>* `cut -d',' -f1 data.csv | paste -sd+ |  bc`

## Remove Timestamp from dates using `awk`'s global substitution `gsub` with regular expression

 >* `awk '{gsub(/[0-9]{2}:[0-9]{2}:[0-9]{2}/,"");}1'`

 
## Delete any white space with `tr`
>* `tr -d ' '`

### Delete record number 3 from table
> `awk 'NR!=3' table`

# Getting stats with `csvstat` 


-------------------------------------------------------
# Plotting with `gnuplot -e` 

>`gnuplot -e "set term dumb 56 26; plot 'data.csv' '-' with linespoints"`

or you can pipe the output of a data to `gnuplot -e` as following:
>`cat data.csv | gnuplot -e "set term dumb 56 26; plot '-' with linespoints"`

![](gnuplot dumb terminal.JPG)

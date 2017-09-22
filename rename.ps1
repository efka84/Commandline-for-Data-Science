
# rename files recorded by caen digitizer
# original file names: Average Trace100 Scanresult Step.dat
#                       Scanresult Step 100.txt
dir *.dat | Rename-Item -NewName {$_.name -replace "Average Trace",""}    # rename / remove "Average Trace" with nothing
dir *.dat | Rename-Item -NewName {$_.name -replace "Scanresult Step",""}
dir *.dat | Rename-Item -NewName {$_.name -replace " ",""}

dir *.txt | Rename-Item -NewName {$_.name -replace "Scanresult Step",""}
dir *.txt | Rename-Item -NewName {$_.name -replace " ",""}

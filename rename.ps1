
# rename files recorded by caen digitizer

dir *.dat | Rename-Item -NewName {$_.name -replace "Average Trace",""}    # rename / remove "Average Trace" with nothing
dir *.dat | Rename-Item -NewName {$_.name -replace "Scanresult Step",""}
dir *.dat | Rename-Item -NewName {$_.name -replace " ",""}

dir *.txt | Rename-Item -NewName {$_.name -replace "Scanresult Step",""}
dir *.txt | Rename-Item -NewName {$_.name -replace " ",""}

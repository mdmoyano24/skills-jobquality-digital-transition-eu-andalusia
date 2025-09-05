version 15.1
clear all
set more off
cap mkdir "outputs"
cap mkdir "outputs/stata"
cap which esttab
if _rc ssc install estout, replace
display "Stata setup completed."

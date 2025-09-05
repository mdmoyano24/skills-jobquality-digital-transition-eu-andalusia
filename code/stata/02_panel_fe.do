version 15.1
clear all
set more off
local panel "data/processed/panel.csv"
capture confirm file "`panel'"
if _rc local panel "data/processed/panel_sample.csv"
import delimited using "`panel'", clear varnames(1) encoding(UTF-8)
encode region, gen(region_id)
xtset region_id year
quietly xtreg telework_share temp_share broadband i.year, fe vce(cluster region_id)
estimates store FE1
cap which esttab
if _rc==0 {
    esttab FE1 using "outputs/stata/fe_results.csv", replace b(%9.3f) se(%9.3f) star(* 0.10 ** 0.05 *** 0.01) stats(N r2_within) csv
}
log using "outputs/stata/02_panel_fe.smcl", replace
di "Run: " c(current_date) " " c(current_time)
estimates replay FE1
log close
display "Done."

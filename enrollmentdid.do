

####################

import delimited scorecard.csv

sort opeid year
by opeid year: drop if _n>1
tsset opeid year



preserve
keep if year ==2011
destring parentrecipients, force replace
gen perc_plus_pre = parentrecipients/num_full
destring parentrecipients, force replace

destring unsubrecipient, force replace
destring subrecipient, force replace

gen perc_sub_pre = subrecipients/num_full
gen perc_unsub_pre = unsubrecipien/num_full

duplicates drop opeid year, force

keep perc_plus_pre perc_unsub_pre  perc_sub_pre  opeid
save plus_pre, replace
restore 
merge m:1 opeid using plus_pre
drop _m

encode state, gen(state2) 

#

ADM_RATE

preserve
keep if year ==2011
keep ugds_x  opeid
rename ugds_x ugds_2011
duplicates drop opeid year, force
save data_2011, replace
restore
drop _m
merge m:1 opeid using data_2011
drop _m

####### Number
gen ugds_ratio = ugds_x /ugds_2011
xtreg ugds_ratio ib2011.year##c.perc_plus_pre i.year##i.control_y  i.year##i.tier i.year##i.state2 i.year##c.perc_sub_pre i.year##c.perc_unsub_pre, fe cluster(opeid)
coefplot, vertical keep(*.year#*.perc_plus_pre) recast(connected) lc(black) mcolor(black) offset(0) omitted baselevels xlabel( 1 "2007" 2 "2008" 3 "2009"  4 "2010" 5 "2011" 6 "2012" 7 "2013" 8 "2014" 9 "2015")  ciopts(recast(rcap) lc(black) lp(-)) xtitle("") xline(5, lc(black) lpattern(dash)) graphregion(color(none)) title("Enrollment Relative to 2011")
graph export enroll.pdf, replace 
#drop comes from tier 2 schools. Public/Private, not for profit

gen post = 0
replace post = 1 if year >2011 

xtreg ugds_ratio i.post##c.perc_plus_pre
xtreg ugds_ratio i.post##c.perc_plus_pre  i.post##i.control_y  i.post##i.tier i.post##i.state2 i.post##c.perc_sub_pre i.post##c.perc_unsub_pre, cluster(opeid)
xtreg ugds_ratio i.post##c.perc_plus_pre  i.post##i.control i.post##i.tier i.post##i.state2 i.post##c.perc_sub_pre i.post##c.perc_unsub_pre, fe cluster(opeid)


######### TEst Scores

xtreg satmt75 ib2011.year##c.perc_plus_pre i.year##i.control_y  i.year##i.tier i.year##i.state2 i.year##c.perc_sub_pre i.year##c.perc_unsub_pre, fe cluster(opeid)
coefplot, vertical keep(*.year#*.perc_plus_pre) recast(connected) lc(black) mcolor(black) offset(0) omitted baselevels xlabel( 1 "2007" 2 "2008" 3 "2009"  4 "2010" 5 "2011" 6 "2012" 7 "2013" 8 "2014" 9 "2015")  ciopts(recast(rcap) lc(black) lp(-)) xtitle("") xline(5, lc(black) lpattern(dash)) graphregion(color(none)) title("Average SAT Score")
graph export math75_sat.pdf, replace 



#Admin
ADM_RATE
xtreg adm_rate_x ib2011.year##c.perc_plus_pre  if tier<3, fe cluster(opeid)
coefplot, vertical keep(*.year#*.perc_plus_pre) recast(connected) lc(black) mcolor(black) offset(0) omitted baselevels xlabel( 1 "2007" 2 "2008" 3 "2009"  4 "2010" 5 "2011" 6 "2012" 7 "2013" 8 "2014" 9 "2015")  ciopts(recast(rcap) lc(black) lp(-)) xtitle("") xline(5, lc(black) lpattern(dash)) graphregion(color(none)) title("Average SAT Score")
graph export admin.pdf, replace 
# only look at selective schools
xtreg adm_rate_x ib2011.year##c.perc_plus_pre    if tier<3, fe

#########
# Minority - cann't finnd much

import delimited loan_figures.csv
save loan_figures, replace

clear 
import delimited enroll
merge m:m unitid year using loan_figures
keep if _m==3
drop _m
merge m:1 opeid using plus_pre
drop _m

encode state, gen(state2) 
xtreg black ib2011.year##c.perc_plus_pre i.year##i.control  i.year##i.tier i.year##i.state2 i.year##c.perc_sub_pre i.year##c.perc_unsub_pre, fe cluster(opeid)
xtreg white ib2011.year##c.perc_plus_pre, fe
EFAIANT

gen black_hispanic = (efbkaat)/eftotlt
replace black_hispanic=(efrace18)/efrace24 if black_==.

gen white = (efwhitt)/eftotlt
replace white=(efrace22)/efrace24 if white==.

# Income
clear 
import delimited tuition.csv
merge m:m unitid year using loan_figures
keep if _m==3
drop _m
merge m:1 opeid using plus_pre
drop _m
encode state, gen(state2) 


sort unitid year
by unitid year: drop if _n>1
tsset unitid year
sort unitid year
drop growth
by unitid: gen growth = (chg2ay3-l.chg2ay3)/l.chg2ay3
sum growth, d
replace growth = . if growth> r(p99)

#drop if year ==2006
xtreg growth ib2011.year##c.perc_plus_pre i.year##i.control  i.year##i.tier i.year##i.state2 i.year##c.perc_sub_pre i.year##c.perc_unsub_pre, fe cluster(opeid)
CHG1AT3
xtreg chg2ay3 ib2011.year##c.perc_plus_pre, fe
i.year##c.perc_unsub_pre
CHG3AY3

# Pell


######### Price


## Posted Tuition

## Avg Net Price


clear 
import delimited scorecard.csv
merge m:m unitid year using loan_figures
keep if _m==3
drop _m
merge m:1 opeid using plus_pre
drop _m
encode state, gen(state2) 
reg  tuition2  i.year


sort unitid year
by unitid year: drop if _n>1
tsset unitid year
sort unitid year
drop growth


by unitid: gen growth = (chg2ay3-l.chg2ay3)/l.chg2ay3
sum tuitionfee_o, d
replace tuitionfee_o = . if tuitionfee_o> r(p99)
replace tuitionfee_o = . if tuitionfee_o< r(p1)



####### Posted Tuition 
#drop if year ==2006
replace tuition3 = . if tuition3==0
xtreg chg3ay3 ib2011.year##c.perc_plus_pre i.year##i.control  i.year##i.tier i.year##i.state2 i.year##c.perc_unsub_pre i.year##c.perc_sub_pre if year>2006 & control==3, fe cluster(opeid)

xtreg tuitionfee_in ib2011.year##c.perc_plus_pre i.year##i.control_y i.year##i.tier  i.year##i.state2 i.year##c.perc_unsub_pre i.year##c.perc_sub_pre if year>2006 , fe cluster(opeid)
xtreg tuitfte ib2011.year##c.perc_plus_pre i.year##i.control_y i.year##i.tier  i.year##i.state2 i.year##c.perc_unsub_pre i.year##c.perc_sub_pre if year>2006  & control_y==1, fe 

xtreg tuitfte ib2011.year##c.perc_plus_pre i.year##i.control_y i.year##i.tier  i.year##i.state2 i.year##c.perc_unsub_pre i.year##c.perc_sub_pre if year>2006  & control_y==3, fe 
coefplot, vertical keep(*.year#*.perc_plus_pre) recast(connected) lc(black) mcolor(black) offset(0) omitted baselevels xlabel( 1 "2007" 2 "2008" 3 "2009"  4 "2010" 5 "2011" 6 "2012" 7 "2013" 8 "2014" 9 "2015")  ciopts(recast(rcap) lc(black) lp(-)) xtitle("") xline(5, lc(black) lpattern(dash)) graphregion(color(none)) title("Average SAT Score")
graph export tuition_forprofit.pdf, replace 




CHG3AY3
xtreg tuition3 ib2011.year##c.perc_plus_pre, fe
i.year##c.perc_unsub_pre
CHG3AY3

## Institutional Aid




############################################
### Total Revenue from tuition












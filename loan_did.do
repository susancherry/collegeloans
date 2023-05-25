cd /disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities

python3
import pandas as pd
import numpy as np

#pre
data3=pd.read_stata("pre_data.dta")

#loans
loans=pd.read_csv("loans_2005_2021.csv")
loans['Sub - # of Disbursements']=pd.to_numeric(loans['Sub - # of Disbursements'],errors='coerce')
loans['Unsub - # of Disbursements']=pd.to_numeric(loans['Unsub - # of Disbursements'],errors='coerce')
loans['Parent - # of Disbursements']=pd.to_numeric(loans['Parent - # of Disbursements'],errors='coerce')

#scorecard in pre period 
data2=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/scorecard/MERGED2010_11_PP.csv")
data2["tier"]=2
data2.loc[data2.ADM_RATE>.9,"tier"]=3
data2.loc[np.isnan(data2.ADM_RATE),"tier"]=3
data2.loc[data2["SAT_AVG"]>=1170,"tier"]=1
#type
"CONTROL"
#enrollment
"UGDS"
#avg income
"FAMINC"
#admissions rate
"ADM_RATE"
#ave SAT
"SAT_AVG"

data2[~pd.isnull(data2["NPT4_PRIV"])]

data2[["CONTROL","UGDS","DEP_INC_AVG","FAMINC","ADM_RATE","SAT_AVG","tier","UNITID","OPEID"]]

data2=data2[["CONTROL","UGDS","DEP_INC_AVG","FAMINC","ADM_RATE","SAT_AVG","tier","UNITID","OPEID","STABBR"]]


total = data3.merge(data2, left_on="unitid", right_on="UNITID")

loans["OPE ID"]=pd.to_numeric(loans["OPE ID"])
total["OPEID"]=pd.to_numeric(total["OPEID"],errors="coerce")


total=loans.merge(total, left_on="OPE ID", right_on="OPEID")

total.to_csv("loan_figures.csv")






##########################################################################################

stata
import delimited loan_figures.csv, clear


sort opeid year
by opeid year: drop if _n>1
tsset opeid year
destring v22, replace force 
destring v17, replace force 
destring v12, replace force 

gen log_plus = log(v22)
gen perc=v22/(v12+v17+v22)
replace perc=perc*100
gen total = (v12+v17+v22)

tsset opeid year
by opeid: gen growth_total = (total-l.total)/l.total


by opeid: gen growth_plus = log_p-l.log_


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
destring parentrecipients, force replace

gen plus_perc= parentrecipients/num_full
#destring dep_inc_avg, replace force
#destring fam, replace force

#gen log_total = log(total)
gen low_per = perc_lowest+perc_lowe

drop if year <2006
drop if year >2015

merge m:1 opeid using FL
gen FFEL = 0
replace FFEL=1 if _m==3
drop _m

replace growth_total=. if growth_total>18.59997 

gen total2 = (v12+v17)

tsset opeid year
by opeid: gen growth_total2 = (total2-l.total2)/l.total2
replace  growth_total2=. if growth_total2>16.26993 

by opeid: gen growth_p2 = (parentofdisbursements-l.parentofdisbursements)/l.parentofdisbursements
replace growth_p2 =. if growth_p2>5


by opeid: gen growth_total3 = (v17-l.v17)/l.v17
replace  growth_total3=. if growth_total2>   12.30836 
encode state, gen(state2) 


xtreg growth_plus ib2011.year##c.perc_plus_pre  i.year##i.control i.year##c.ug i.year##i.tier i.year##i.state2 i.year##c.perc_sub_pre i.year##c.perc_unsub_pre, fe cluster(opeid)
coefplot, vertical keep(*.year#*.perc_plus_pre) recast(connected) lc(black) mcolor(black) offset(0) omitted baselevels xlabel( 1 "2007" 2 "2008" 3 "2009"  4 "2010" 5 "2011" 6 "2012" 7 "2013" 8 "2014" 9 "2015")  ciopts(recast(rcap) lc(black) lp(-)) xtitle("") xline(5, lc(black) lpattern(dash)) graphregion(color(none)) title("Growth in $ of Unsubsidized Federal Loans")
graph export unsub.pdf, replace 

xtreg growth_total3 ib2011.year##c.perc_plus_pre  i.year##i.control i.year##c.ug i.year##i.tier i.year##i.state2 i.year##c.perc_sub_pre i.year##c.perc_unsub_pre, fe cluster(opeid)
coefplot, vertical keep(*.year#*.perc_plus_pre) recast(connected) lc(black) mcolor(black) offset(0) omitted baselevels xlabel( 1 "2007" 2 "2008" 3 "2009"  4 "2010" 5 "2011" 6 "2012" 7 "2013" 8 "2014" 9 "2015")  ciopts(recast(rcap) lc(black) lp(-)) xtitle("") xline(5, lc(black) lpattern(dash)) graphregion(color(none)) title("Growth in $ of Unsubsidized Federal Loans")
graph export unsub.pdf, replace 

gen post = 0
replace post = 1 if year >2011 

xtreg growth_plus i.post##c.perc_plus_pre
xtreg growth_plus i.post##c.perc_plus_pre  i.post##i.control i.post##c.ug i.post##i.tier i.post##i.state2 i.post##c.perc_sub_pre i.post##c.perc_unsub_pre, cluster(opeid)
xtreg growth_plus i.post##c.perc_plus_pre  i.post##i.control i.post##c.ug i.post##i.tier i.post##i.state2 i.post##c.perc_sub_pre i.post##c.perc_unsub_pre, fe cluster(opeid)


xtreg growth_plus i.post##c.perc_plus_pre
xtreg growth_plus i.post##c.perc_plus_pre  i.post##i.control i.post##c.ug i.post##i.tier i.post##i.state2 i.post##c.perc_sub_pre i.post##c.perc_unsub_pre, cluster(opeid)
xtreg growth_plus i.post##c.perc_plus_pre  i.post##i.control i.post##c.ug i.post##i.tier i.post##i.state2 i.post##c.perc_sub_pre i.post##c.perc_unsub_pre, fe cluster(opeid)


xtreg growth_total3 i.post##c.perc_plus_pre
xtreg growth_total3 i.post##c.perc_plus_pre  i.post##i.control i.post##c.ug i.post##i.tier i.post##i.state2 i.post##c.perc_sub_pre i.post##c.perc_unsub_pre, cluster(opeid)
xtreg growth_total3 i.post##c.perc_plus_pre  i.post##i.control i.post##c.ug i.post##i.tier i.post##i.state2 i.post##c.perc_sub_pre i.post##c.perc_unsub_pre, fe cluster(opeid)


xtreg growth_plus ib2011.year##c.perc_plus_pre  i.year##i.control i.year##c.ug i.year##i.tier i.year##i.state2 i.year##c.perc_sub_pre i.year##c.perc_unsub_pre if tier ==3, fe cluster(opeid)
xtreg growth_plus ib2011.year##c.perc_plus_pre if control==2
xtreg growth_plus ib2011.year##c.perc_plus_pre if control==3












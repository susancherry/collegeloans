cd disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/
python3 
import pandas as pd 

###########################################################################################
################## Charges by program year 
data1=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/charges_byprogram/ic2007_py.csv")
data1["year"]=2007
data2=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/charges_byprogram/ic2008_py.csv")
data2["year"]=2008
data3=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/charges_byprogram/ic2009_py_rv.csv")
data3["year"]=2009
data4=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/charges_byprogram/ic2010_py_rv.csv")
data4["year"]=2010
data5=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/charges_byprogram/ic2011_py_rv.csv")
data5["year"]=2011
data6=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/charges_byprogram/ic2012_py.csv")
data6["year"]=2012
data7=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/charges_byprogram/ic2013_py.csv")
data7["year"]=2013
data8=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/charges_byprogram/ic2014_py.csv")
data8["year"]=2014
data9=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/charges_byprogram/ic2015_py.csv")
data9["year"]=2015
data=pd.concat([data1,data2])
data=pd.concat([data,data3])
data=pd.concat([data,data4])
data=pd.concat([data,data5])
data=pd.concat([data,data6])
data=pd.concat([data,data7])
data=pd.concat([data,data8])
data=pd.concat([data,data9])
data.to_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/charges_byprogram/combineddata.csv")

###########################################################################################
################## Charges by academic year 
data1=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/charges_academicyear/ic2007_ay.csv")
data1["year"]=2007
data2=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/charges_academicyear/ic2008_ay.csv")
data2["year"]=2008
data3=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/charges_academicyear/ic2009_ay_rv.csv")
data3["year"]=2009
data4=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/charges_academicyear/ic2010_ay_rv.csv")
data4["year"]=2010
data5=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/charges_academicyear/ic2011_ay_rv.csv")
data5["year"]=2011
data6=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/charges_academicyear/ic2012_ay.csv")
data6["year"]=2012
data7=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/charges_academicyear/ic2013_ay.csv")
data7["year"]=2013
data8=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/charges_academicyear/ic2014_ay.csv")
data8["year"]=2014
data9=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/charges_academicyear/ic2015_ay.csv")
data9["year"]=2015
data=pd.concat([data1,data2])
data=pd.concat([data,data3])
data=pd.concat([data,data4])
data=pd.concat([data,data5])
data=pd.concat([data,data6])
data=pd.concat([data,data7])
data=pd.concat([data,data8])
data=pd.concat([data,data9])
data.to_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/charges_academicyear/combineddata.csv")


###########################################################################################
################## Educational Offerings
data1=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/educationalofferings/ic2007.csv")
data1["year"]=2007
data2=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/educationalofferings/ic2008_rv.csv")
data2["year"]=2008
data3=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/educationalofferings/ic2009_rv.csv")
data3["year"]=2009
data4=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/educationalofferings/ic2010_rv.csv")
data4["year"]=2010
data5=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/educationalofferings/ic2011_rv.csv")
data5["year"]=2011
data6=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/educationalofferings/ic2012_rv.csv")
data6["year"]=2012
data7=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/educationalofferings/ic2013_rv.csv")
data7["year"]=2013
data8=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/educationalofferings/ic2014_rv.csv")
data8["year"]=2014
data9=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/educationalofferings/ic2015_rv.csv")
data9["year"]=2015
data=pd.concat([data1,data2])
data=pd.concat([data,data3])
data=pd.concat([data,data4])
data=pd.concat([data,data5])
data=pd.concat([data,data6])
data=pd.concat([data,data7])
data=pd.concat([data,data8])
data=pd.concat([data,data9])
data.to_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/educationalofferings/combineddata.csv")

###########################################################################################
################## Admissions
data1=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/admissions/ic2007.csv")
data1["year"]=2007
data2=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/admissions/ic2008_rv.csv")
data2["year"]=2008
data3=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/admissions/ic2009_rv.csv")
data3["year"]=2009
data4=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/admissions/ic2010_rv.csv")
data4["year"]=2010
data5=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/admissions/ic2011_rv.csv")
data5["year"]=2011
data6=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/admissions/ic2012_rv.csv")
data6["year"]=2012
data7=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/admissions/ic2013_rv.csv")
data7["year"]=2013
data8=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/admissions/adm2014_rv.csv")
data8["year"]=2014
data9=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/admissions/adm2015_rv.csv")
data9["year"]=2015
data=pd.concat([data1,data2])
data=pd.concat([data,data3])
data=pd.concat([data,data4])
data=pd.concat([data,data5])
data=pd.concat([data,data6])
data=pd.concat([data,data7])
data=pd.concat([data,data8])
data=pd.concat([data,data9])
data.to_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/admissions/combineddata.csv")





###########################################################################################
################## Headcount
data1=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/headcount/effy2007_rv.csv")
data1["year"]=2007
data2=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/headcount/effy2008_rv.csv")
data2["year"]=2008
data3=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/headcount/effy2009_rv.csv")
data3["year"]=2009
data4=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/headcount/effy2010_rv.csv")
data4["year"]=2010
data5=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/headcount/effy2011_rv.csv")
data5["year"]=2011
data6=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/headcount/effy2012_rv.csv")
data6["year"]=2012
data7=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/headcount/effy2013_rv.csv")
data7["year"]=2013
data8=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/headcount/effy2014_rv.csv")
data8["year"]=2014
data9=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/headcount/effy2015_rv.csv")
data9["year"]=2015
data=pd.concat([data1,data2])
data=pd.concat([data,data3])
data=pd.concat([data,data4])
data=pd.concat([data,data5])
data=pd.concat([data,data6])
data=pd.concat([data,data7])
data=pd.concat([data,data8])
data=pd.concat([data,data9])
data.to_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/headcount/combineddata.csv")




###########################################################################################
################## Instructional 
data1=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/instructional_enrollment/efia2007_rv.csv")
data1["year"]=2007
data2=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/instructional_enrollment/efia2008_rv.csv")
data2["year"]=2008
data3=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/instructional_enrollment/efia2009_rv.csv")
data3["year"]=2009
data4=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/instructional_enrollment/efia2010_rv.csv")
data4["year"]=2010
data5=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/instructional_enrollment/efia2011_rv.csv")
data5["year"]=2011
data6=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/instructional_enrollment/efia2012_rv.csv")
data6["year"]=2012
data7=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/instructional_enrollment/efia2013_rv.csv")
data7["year"]=2013
data8=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/instructional_enrollment/efia2014_rv.csv")
data8["year"]=2014
data9=pd.read_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/instructional_enrollment/efia2015_rv.csv")
data9["year"]=2015
data=pd.concat([data1,data2])
data=pd.concat([data,data3])
data=pd.concat([data,data4])
data=pd.concat([data,data5])
data=pd.concat([data,data6])
data=pd.concat([data,data7])
data=pd.concat([data,data8])
data=pd.concat([data,data9])
data.to_csv("/disk/homedirs/nber/cre2114/equifax_scratch/equifax/sc4331/universities/Data/instructional_enrollment/combineddata.csv")


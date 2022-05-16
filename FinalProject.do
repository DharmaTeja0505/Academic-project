use "H:\Time Series & Econometrics\Data Files\guns", clear
g othervio=vio-(rob+mur)
summarize vio mur rob othervio incarc_rate pb1064 pw1064 pm1029 avginc density pop shall,detail
pwcorr

/* year wise violence when shall law not in place */
preserve
	keep if shall==0
	collapse vio,by(year)
	twoway line vio year,ysc(r(100,1000))
restore
/* year wise violence when shall law  in place */
preserve
	keep if shall==1
	collapse vio,by(year)
	twoway line vio year,ysc(r(100,500))
restore

/* year wise murder when shall law not in place */

preserve
	keep if shall==0
	collapse mur,by(year)
	twoway line mur year,ysc(r(1,20))
restore
/* year wise murder when shall law  in place */
preserve
	keep if shall==1
	collapse mur,by(year)
	twoway line mur year,ysc(r(1,10))  
restore
/* year wise robbery when shall law not in place */
preserve
	keep if shall==0
	collapse rob,by(year)
	twoway line rob year,ysc(r(20,300))  
restore
/* year wise robbery when shall law  in place */
preserve
	keep if shall==1
	collapse rob,by(year)
	twoway line rob year,ysc(r(20,300))  
restore
/* year wise other violence when shall law not in place */
preserve
	keep if shall==0
	collapse othervio,by(year)
	twoway line othervio year,ysc(r(100,800)) 
restore 
/* year wise other violence when shall law  in place */
preserve
	keep if shall==1
	collapse othervio,by(year)
	twoway line othervio year,ysc(r(100,500))
restore

/*Distribution Plots */

histogram vio, freq normal
graph hbox vio
summarize vio,detail


histogram mur, freq normal
graph hbox mur
summarize mur,detail

histogram rob, freq normal
graph hbox rob
summarize rob,detail

histogram othervio, freq normal
graph hbox othervio
summarize othervio,detail

histogram incarc_rate, freq normal
graph hbox incarc_rate
summarize incarc,detail

histogram pb1064, freq normal
graph hbox pb1064
summarize pb1064,detail

histogram pw1064, freq normal
graph hbox pw1064
summarize pw1064,detail

histogram pm1029, freq normal
graph hbox pm1029
summarize pm1029,detail

histogram pop, freq normal
graph hbox pop
summarize pop,detail

histogram avginc, freq normal
graph hbox avginc
summarize avginc,detail

histogram density, freq normal
graph hbox density
summarize density,detail

/* scatter plot w.r.t explanatory variables with shall law */

twoway scatter vio incarc_rate,mlabel(shall)
twoway scatter mur incarc_rate,mlabel(shall)
twoway scatter rob incarc_rate,mlabel(shall)
twoway scatter othervio incarc_rate,mlabel(shall)


twoway scatter vio pb1064,mlabel(shall)
twoway scatter mur pb1064,mlabel(shall)
twoway scatter rob pb1064,mlabel(shall)
twoway scatter othervio pb1064,mlabel(shall)

twoway scatter vio pw1064,mlabel(shall)
twoway scatter mur pw1064,mlabel(shall)
twoway scatter rob pw1064,mlabel(shall)
twoway scatter othervio pw1064,mlabel(shall)

twoway scatter vio pm1029,mlabel(shall)
twoway scatter mur pm1029,mlabel(shall)
twoway scatter rob pm1029,mlabel(shall)
twoway scatter othervio pm1029,mlabel(shall)


twoway scatter vio pop,mlabel(shall)
twoway scatter mur pop,mlabel(shall)
twoway scatter rob pop,mlabel(shall)
twoway scatter othervio pop,mlabel(shall)

twoway scatter vio avginc,mlabel(shall)
twoway scatter mur avginc,mlabel(shall)
twoway scatter rob avginc,mlabel(shall)
twoway scatter othervio avginc,mlabel(shall)

twoway scatter vio density,mlabel(shall)
twoway scatter mur density,mlabel(shall)
twoway scatter rob density,mlabel(shall)
twoway scatter othervio density,mlabel(shall)

/* scatter plot with different crime rates w.r.t year with shall and with out shall law */
preserve 
	keep if shall == 0
	graph twoway scatter vio year||scatter vio year
	graph twoway scatter mur year||scatter mur year
	graph twoway scatter rob year||scatter rob year
	graph twoway scatter othervio year||scatter othervio year
restore

preserve
	keep if shall == 1
	graph twoway scatter vio year||scatter vio year
	graph twoway scatter mur year||scatter mur year
	graph twoway scatter rob year||scatter rob year
	graph twoway scatter othervio year||scatter othervio year
restore

/* Violence rate when shall law not in place across states */
preserve
	keep if shall==0
	collapse vio,by(stateid)
	twoway line vio stateid
restore
/* Violence rate when shall law  in place across states */

preserve
	keep if shall==1
	collapse vio,by(stateid)
	twoway line vio stateid
restore
/* Murder rate when shall law not in place across states */

preserve
	keep if shall==0
	collapse mur,by(stateid)
	twoway line mur stateid
restore
/* Murder rate when shall law  in place across states */

preserve
	keep if shall==1
	collapse mur,by(stateid)
	twoway line mur stateid
restore
/* Robbery rate when shall law not in place across states */

preserve
	keep if shall==0
	collapse rob,by(stateid)
	twoway line rob stateid
restore

/* Robbery rate when shall law  in place across states */

preserve
	keep if shall==1
	collapse rob,by(stateid)
	twoway line rob stateid
restore

/* Other Violence rate when shall law not in place across states */

preserve
	keep if shall==0
	collapse othervio,by(stateid)
	twoway line othervio stateid
restore
/* Other Violence rate when shall law in place across states */


preserve
	keep if shall==1
	collapse othervio,by(stateid)
	twoway line othervio stateid
restore


/*hardcoding unique values as i tried with list and memory list cant get clue */

gen stateid7780 = stateid if(shall==1 & (year>=77 & year<=80))
replace stateid7780=0 if(stateid7780==.)
replace stateid7780 =stateid if (stateid == 18|stateid==33|stateid==50|stateid==53)

gen stateid8085 = stateid if(shall==1 & (year>=81 & year<=85) & stateid!=stateid7780)
replace stateid8085=0 if(stateid8085==.)
replace stateid8085 =stateid if (stateid == 23)

gen stateid8590 = stateid if(shall==1 & (year>=86 & year<=90)&stateid!=stateid7780 & stateid!=stateid8085)
replace stateid8085=0 if(stateid8085==.)
replace stateid8085 =stateid if (stateid == 12|stateid==13|stateid==38|stateid==42|stateid==46|stateid==49|stateid==54)


gen stateid9095 = stateid if(shall==1 & (year>=91 & year<=95)&stateid!=stateid7780 & stateid!=stateid8085&stateid!=stateid8590)
replace stateid9095=0 if(stateid9095==.)
replace stateid9095 =stateid if (stateid == 2|stateid==4|stateid==16|stateid==22|stateid==28|stateid==30|stateid==41|stateid==47|stateid==56)


gen stateid9599 = stateid if(shall==1 & (year>=96 & year<=99)&stateid!=stateid7780 & stateid!=stateid8085&stateid!=stateid8590&stateid!=stateid9095)
replace stateid9599=0 if(stateid9599==.)
replace stateid9599 =stateid if (stateid == 5|stateid==21|stateid==32|stateid==37|stateid==40|stateid==45|stateid==48|stateid==51)


/*Year 77-80 violence rate when states implemented shall law across years */

preserve
	keep if (stateid7780!=0)
	collapse vio,by(year)
	twoway line vio year,ysc(r(200,600))
restore
/*Year 80-85 violence rate when states implemented shall law across years */

preserve
	keep if (stateid8085!=0)
	collapse vio,by(year)
	twoway line vio year,ysc(r(200,600))
restore

/*Year 85-90 violence rate when states implemented shall law across years */


preserve
	keep if (stateid8590!=0)
	collapse vio,by(year)
	twoway line vio year,ysc(r(200,600))
restore

/*Year 90-95 violence rate when states implemented shall law across years */


preserve
	keep if (stateid9095!=0)
	collapse vio,by(year)
	twoway line vio year,ysc(r(200,600))
restore

/*Year 95-99 violence rate when states implemented shall law across years */
preserve
	keep if (stateid9599!=0)
	collapse vio,by(year)
	twoway line vio year,ysc(r(200,600))
restore

/*Year 77-80 Murder rate when states implemented shall law across years */

preserve
	keep if (stateid7780!=0)
	collapse mur,by(year)
	twoway line mur year,ysc(r(1,10))
restore
/*Year 80-85 Murder rate when states implemented shall law across years */

preserve
	keep if (stateid8085!=0)
	collapse mur,by(year)
	twoway line mur year,ysc(r(1,10))
restore
/*Year 85-90 Murder rate when states implemented shall law across years */

preserve
	keep if (stateid8590!=0)
	collapse mur,by(year)
	twoway line mur year,ysc(r(1,10))
restore

/*Year 90-95 Murder rate when states implemented shall law across years */


preserve
	keep if (stateid9095!=0)
	collapse mur,by(year)
	twoway line mur year,ysc(r(1,10))
restore

/*Year 95-99 Murder rate when states implemented shall law across years */


preserve
	keep if (stateid9599!=0)
	collapse mur,by(year)
	twoway line mur year,ysc(r(1,10))
restore

/*Year 77-80 Robbery rate when states implemented shall law across years */


preserve
	keep if (stateid7780!=0)
	collapse rob,by(year)
	twoway line rob year,ysc(r(1,10))
restore

/*Year 80-85 Robbery rate when states implemented shall law across years */


preserve
	keep if (stateid8085!=0)
	collapse rob,by(year)
	twoway line rob year,ysc(r(1,10))
restore

/*Year 85-90 Robbery rate when states implemented shall law across years */


preserve
	keep if (stateid8590!=0)
	collapse rob,by(year)
	twoway line rob year,ysc(r(1,10))
restore

/*Year 90-95 Robbery rate when states implemented shall law across years */


preserve
	keep if (stateid9095!=0)
	collapse rob,by(year)
	twoway line rob year,ysc(r(1,10))
restore

/*Year 95-99 Robbery rate when states implemented shall law across years */


preserve
	keep if (stateid9599!=0)
	collapse rob,by(year)
	twoway line rob year,ysc(r(1,10))
restore

/*Year 77-80 Other Violence rate when states implemented shall law across years */


preserve
	keep if (stateid7780!=0)
	collapse othervio,by(year)
	twoway line othervio year,ysc(r(1,10))
restore

/*Year 80-85 Other Violence rate when states implemented shall law across years */


preserve
	keep if (stateid8085!=0)
	collapse othervio,by(year)
	twoway line othervio year,ysc(r(1,10))
restore

/*Year 85-90 Other Violence rate when states implemented shall law across years */


preserve
	keep if (stateid8590!=0)
	collapse othervio,by(year)
	twoway line othervio year,ysc(r(1,10))
restore

/*Year 90-95 Other Violence rate when states implemented shall law across years */


preserve
	keep if (stateid9095!=0)
	collapse othervio,by(year)
	twoway line othervio year,ysc(r(1,10))
restore

/*Year 95-99 Other Violence rate when states implemented shall law across years */


preserve
	keep if (stateid9599!=0)
	collapse othervio,by(year)
	twoway line othervio year,ysc(r(1,10))
restore



xtset stateid year
xtline vio
xtline mur
xtline rob
xtline othervio


g logvio=log(vio)
histogram logvio, freq normal
graph hbox logvio
summarize logvio,detail

g logmur=log(mur)
histogram logmur, freq normal
graph hbox logmur
summarize logmur,detail

g logrob=log(rob)
histogram logrob, freq normal
graph hbox logrob
summarize logrob,detail

g logothervio=log(othervio)
histogram logothervio, freq normal
graph hbox logothervio
summarize logothervio,detail

g logincarc_rate=log(incarc_rate)
histogram logincarc_rate, freq normal
graph hbox logincarc_rate
summarize logincarc_rate,detail

g logdensity=log(density)
histogram logdensity, freq normal
graph hbox logdensity
summarize logdensity,detail



reg logvio logincarc_rate pb1064 pw1064 pm1029 pop avginc logdensity shall 
estimates store ols

test pb1064 pw1064

predict ehat,xb

predict s1,residual

graph twoway scatter s1 ehat, yline(0)

estat imtest, white

reg logvio logincarc_rate pm1029 pop avginc shall logdensity

predict ehat1,xb

predict s2,residual

graph twoway scatter s2 ehat1, yline(0)

estat imtest, white


reg logvio logincarc_rate pb1064 pw1064 pm1029 pop avginc shall logdensity, vce(robust)
estimates store fixedclusterrobust

predict ehat3,xb

predict s3,residual

graph twoway scatter s3 ehat3, yline(0)

estat imtest, white

reg logvio logincarc_rate pm1029 pop avginc shall logdensity,vce(robust)

predict ehat4,xb

predict s4,residual

graph twoway scatter s4 ehat4, yline(0)


xtreg logvio logincarc_rate pb1064 pw1064 pm1029 pop avginc shall logdensity, fe

xtreg logvio logincarc_rate pb1064 pw1064 pm1029 pop avginc shall logdensity, fe vce(cluster stateid)

predict ehat5,xb

predict s5,residual

graph twoway scatter s5 ehat5, yline(0)

xttest3


test avginc

xtreg logvio logincarc_rate pb1064 pw1064 pm1029 pop shall logdensity, fe vce (cluster stateid)

predict ehat6,xb

predict s6,residual

graph twoway scatter s6 ehat6, yline(0)


xtreg logvio logincarc_rate pb1064 pw1064 pm1029 pop avginc shall logdensity i.year, fe

xtreg logvio logincarc_rate pb1064 pw1064 pm1029 pop avginc shall logdensity i.year, fe vce(cluster stateid)

predict ehat7,xb

predict s7,residual

graph twoway scatter s7 ehat7, yline(0)


testparm i.year

/*Other Study w.r.y mur,rob and other vio w.r.t shall law and other variables */


reg logmur logincarc_rate pb1064 pw1064 pm1029 pop avginc shall logdensity, vce(robust)
estimate store olsmur

reg logrob logincarc_rate pb1064 pw1064 pm1029 pop avginc shall logdensity, vce(robust)
estimate store olsrob

reg logothervio logincarc_rate pb1064 pw1064 pm1029 pop avginc shall logdensity, vce(robust)
estimate store olsothervio

xtreg logmur logincarc_rate pb1064 pw1064 pm1029 pop avginc shall logdensity, fe vce(cluster stateid)
estimate store femur

xtreg logrob logincarc_rate pb1064 pw1064 pm1029 pop avginc shall logdensity, fe vce(cluster stateid)
estimate store ferob

xtreg logothervio logincarc_rate pb1064 pw1064 pm1029 pop avginc shall logdensity, fe vce(cluster stateid)
estimate store feothervio

xtreg logmur logincarc_rate pb1064 pw1064 pm1029 pop avginc shall logdensity i.year, fe vce(cluster stateid)
estimate store tfemur
testparm i.year


xtreg logrob logincarc_rate pb1064 pw1064 pm1029 pop avginc shall logdensity i.year, fe vce(cluster stateid)
estimate store tferob
testparm i.year


xtreg logothervio logincarc_rate pb1064 pw1064 pm1029 pop avginc shall logdensity i.year, fe vce(cluster stateid)
estimate store tfeothervio
testparm i.year

/*Compare other crime rates study*/

estimate table olsmur femur tfemur
estimate table olsrob ferob tferob
estimate table olsothervio feothervio tfeothervio

translate @Results "Project.pdf"





/*The End */
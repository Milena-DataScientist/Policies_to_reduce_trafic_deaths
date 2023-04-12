**use "H:\STATA BUAN\car_fatalities (4).dta", clear

use "H:\BUAN 6312\Project\car_fatalities (4).dta" , clear

//generate transformed variables
g VFR = mraidall*10000
g lnperinc = ln(perinc)
g lnpop = ln(pop)
g lnvmiles = ln(vmiles)
g lnpop1517 = ln(pop1517)
g lnpop1820 = ln(pop1820)
g lnpop2124 = ln(pop2124)



* panel data
order state year VFR beertax jaild comserd mlda unrate lnperinc gspch yngdrv dry lnpop lnpop1517 lnpop1820 lnpop2124 lnvmiles
xtset state year
xtsum

* (1) alcohol involved VFR by state
xtline mraidall

* (2) overal alcohol involved VFR over time
sort year
foreach var in mraidall beertax jaild comserd {
	by year: egen mean_`var' = mean(`var')
}

tsline mean_mraidall
tsline mean_beertax mean_jaild mean_comserd

* (2.1) Overall Alchohol involved deaths over time by tax cost
foreach var in mraidall {
	by year: egen bellow_mean_`var'= mean(`var') if beertax < .513256
	by year: egen above_mean_`var'1 = mean(`var') if beertax >= .513256 
}

tsline bellow_mean_mraidall above_mean_mraidall

*(2.2) Overall Alchohol involved deaths over time by drinking age

foreach var in mraidall {
	by year: egen mlda_`var'_18 = mean(`var') if mlda < 19
	by year: egen mlda_`var'_19 = mean(`var') if mlda >= 19 & mlda < 20
	by year: egen mlda_`var'_20 = mean(`var') if mlda >= 20 & mlda < 21
	by year: egen mlda_`var'_21 = mean(`var') if mlda == 21
}

tsline mlda_mraidall_18 mlda_mraidall_19 mlda_mraidall_20 mlda_mraidall_21

* (3) overal alcohol involved VFR over time for by group
sort year
foreach var in mraidall beertax jaild comserd {
	by year: egen mean_`var'0 = mean(`var') if jaild==0 
	by year: egen mean_`var'1 = mean(`var') if jaild==1 
	by year: egen mean_`var'2 = mean(`var') if comserd==0 
	by year: egen mean_`var'3 = mean(`var') if comserd==1 	
}

tsline mean_mraidall mean_mraidall0 mean_mraidall1 mean_mraidall2 mean_mraidall3
tsline mean_beertax mean_beertax0 mean_beertax1 mean_beertax2 mean_beertax3

* (4) histogram by year
histogram yngdrv, by(year)

**** Regressions*****
** Model 1 Pooled OLS Cluster Robust

reg VFR beertax jaild comserd mlda unrate lnperinc gspch yngdrv dry lnpop lnpop1517 lnpop1820 lnpop2124 lnvmiles spircons mormon sobapt, vce(cluster state)

** Model 2 Fixed Effects***

xtreg VFR beertax jaild comserd mlda unrate lnperinc gspch yngdrv dry lnpop lnpop1517 lnpop1820 lnpop2124 lnvmiles spircons mormon sobapt, fe vce(cluster state)


*** Model 3 Time Fixed Effects***

xtreg VFR beertax jaild comserd mlda unrate lnperinc gspch yngdrv dry lnpop lnpop1517 lnpop1820 lnpop2124 lnvmiles spircons mormon sobapt i.year, fe vce(cluster state)

* (5) omitted variables
xtreg mraidall beertax jaild comserd unrate perinc gspch mlda yngdrv dry pop vmiles

test beertax 
* Prob > F = 0.5640
** Fail to reject null, beer tax does not have a significant effect on the model
** will still keep in the model because it is one of the 3 policies still wanting to see the effect of

test jaild
* Prob > F = 0.0058
** Mandatory jail service has a significant effect on alcohol involved VFR

test comserd
* Prob > F = 0.1220
** Fail to reject null, mandatory community service does not have a significant effect on the model
** will still keep in the model because it is one of the 3 policies still wanting to see the effect of

test unrate 
* Prob > F = 0.0024

test perinc
* Prob > F = 0.0078

test gspch
* Prob > F = 0.3663
** Fail to reject null, remove comserd from model

test mlda 
* Prob > F = 0.4807
** Fail to reject null, remove mlda from model

test yngdrv
* Prob > F = 0.0001

test dry
* Prob > F = 0.0686
** Fail to reject null, remove dry from model

test pop
** constraint dropped -> no chi2

test vmiles
* Prob > F = 0.8412
** Fail to reject null, remove vmiles from model


* (6) fixed effects
xtreg mraidall beertax jaild comserd unrate perinc yngdrv

xtreg mraidall beertax jaild comserd mlda unrate perinc yngdrv, fe vce(cluster state)

* (7) time fixed effects ** Restrricted Model 1***
xtreg VFR beertax jaild comserd mlda unrate spircons yngdrv lnpop1517 lnpop1820 lnpop2124 i.year, fe vce(cluster state)

testparm i.year


** Restricted model 2 **

xtreg VFR beertax jaild comserd mlda unrate spircons i.year, fe vce(cluster state)

* Prob > F = 0.0002
** Time effects are jointly statistically significant, so should add time fixed effects to model

* (8) random effects
xtreg VFR beertax jaild comserd mlda unrate i.year, re cluster(state)

* (9) hausman 2
xtreg mraidall beertax jaild comserd mlda unrate i.year, fe
estimates store fixed2

xtreg mraidall beertax jaild comserd mlda unrate spircons i.year, re
estimates store random2

hausman fixed2 random2
* Prob > chi2 = 0.0000
** Reject null, use the time fixed effects estimator

** Hausman 1 **
xtreg VFR beertax jaild comserd mlda unrate spircons i.year, fe
estimates store fixed1

xtreg VFR beertax jaild comserd mlda unrate spircons i.year, re
estimates store random1

hausman fixed1 random1

***Final Restricted Model:
***xtreg mraidall beertax jaild comserd unrate perinc yngdrv i.year, fe vce(cluster state)

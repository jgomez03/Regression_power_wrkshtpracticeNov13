####REGRESSION POWER ANALYSIS 

####WHEN YOU KNOW THE POPULATION R2

###determine f2 - what is f2???
my.f2 <- .20 / (1-.20)
print(my.f2)

##f2 = .25 (effect size)

###determine the degrees of freedom for original study
##degrees of freedom predictors: = number of predictors = 3

###calculate power
library(pwr)
pwr.f2.test(u=3, f2=.25, power=.80)

## results: 
## Multiple regression power calculation 
## u = 3
## v = 43.70447 <- degrees of freedom needed for OUR study
## f2 = 0.25
## sig.level = 0.05
## power = 0.8

N = 3 + 44 + 1 #calculating N needed for our study
print(N)

####WHEN YOU DON'T KNOW THE POPULATION R2
###Safeguard power analysis

##calculate CI for R2
library(MBESS)
ci.R2(R2=.20, p=3, N=100, Random.Predictors=FALSE)

##determine f2
my.f2 <- 0.0596 / (1 - 0.0596)
print(my.f2)
f2 = 0.06337729 = R2 = 0.0586

##calculate power
library(pwr)
pwr.f2.test(u=3, f2=0.06338, power=.80)

## results
## Multiple regression power calculation 
## u = 3
## v = 171.9757
## f2 = 0.06338
## sig.level = 0.05
## power = 0.8

##calculate N
## N = u + v +1

N = 3 + 172 + 1
print(N)
# 176

##therefore, the safeguard N for this study is 176 (much higher than the non-safeguard of N of 48)

####POWER ANALYSIS: INCREMENTAL PREDICTION IN MULTIPLE REGRESSION - NOT  SAFEGUARD

## determine degrees of freedom 
# only interested in incremental prediction of one variable  so u = 1

##determine f2
# we know sr2 = .02 and R2 = .20, use these to calculate f2
my.f2 <- .02 / (1 - .20)
print(my.f2)
#0.025

##calculate power
library(pwr)
pwr.f2.test(u=1, f2=0.025, power=.80)
# results:
# Multiple regression power calculation 
# u = 1
# v = 313.8867
# f2 = 0.025
# sig.level = 0.05
# power = 0.8

##calculate N
N = 1 + 314 + 1
print(N)
# N = 316

####DETERMINE POWER OBTAINED FOR A CERTAIN N, incrimental prediciton - say you have a restricted N and know you won't have enough to get .80 power
pwr.f2.test(u=1, v=73, f2=0.025)
#  Multiple regression power calculation 
# u = 1
# v = 73
# f2 = 0.025
# sig.level = 0.05
# power = 0.2718443

# you can see power for an N of 73 is .27 (27% chance of finding an effect if an effect exists)


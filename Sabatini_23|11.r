# ____________________________________________________________________
#Esercizio 1

power1 <- pwr.t.test(d=10/pooled.sd,power = 0.8, 
                     sig.level = 0.05, alternative = "two.sided",
                     type = "two.sample")
power1

plot(power1)

# RISPOSTA Q1.1: 

# ____________________________________________________________________
#Esercizio 2

power2 <- pwr.t.test(n=50, power= 0.8, sig.level= 0.05, alternative = "two.sided",
                     type = "two.sample")
mdc2 = 0.565858*pooled.sd

# RISPOSTA Q2.1: 

# ____________________________________________________________________
#Esercizio 3

power3 <- pwr.t.test (d=0.3, 
          n= 50, sig.level= 0.05,
          alternative = "two.sided",
          type = "two.sample")
power3
mdc3 = 0.3*pooled.sd

# RISPOSTA Q3.1: 

# ____________________________________________________________________
#Esercizio 4

n4 <- c(15, 35, 54, 72, 93, 120, 138, 273)
power4 <- pwr.t.test(d=0.3, n=n4, sig.level= 0.05,
                       alternative = "two.sided",
                       type = "two.sample")

plot(power4$n, power4$power, type = "l")

# RISPOSTA Q4.1: 

# ____________________________________________________________________
#Esercizio 5

mdc5 <- c(2, 4,7,9,12)
power5 <- pwr.t.test(d=mdc5/pooled.sd,
                     n=100, sig.level= 0.05,
                     alternative = "two.sided",
                     type = "two.sample")

# RISPOSTA Q5.1: 

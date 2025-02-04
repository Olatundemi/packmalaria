initial(Sr) <- 0.7 * Nh0
initial(Ss) <- 0.2 * Nh0
initial(Ir) <- 0.05 * Nh0
initial(Is) <- 0.05 * Nh0
initial(R) <- 0
initial(X) <- 0.5 * Nv0
initial(Y) <- 0.5 * Nv0

update(Sr) <- rho * mu * Nh - (1 - c) * m * beta_r * Sr * Y / Nv - mu * Sr + lsr * Ss - lrs * Sr + rho * omega * R
update(Ss) <- (1 - rho) * mu * Nh - (1 - c) * m * beta_s * Ss * Y / Nv - mu * Ss + lrs * Sr - lsr * Ss + (1 - rho) * omega * R
update(Ir) <- (1 - c) * m * beta_r * Sr * Y / Nv - (gamma_r + mu) * Ir + delta_sr * Is - delta_rs * Ir
update(Is) <- (1 - c) * m * beta_s * Ss * Y / Nv - (gamma_s + mu) * Is + delta_rs * Ir - delta_sr * Is
update(R) <- gamma_r * Ir + gamma_s * Is - (omega + mu) * R
update(X) <- eta * Nv - (1 - c) * alpha_r * X * Ir / Nh - (1 - c) * alpha_s * X * Is / Nh - eta * X
update(Y) <- (1 - c) * alpha_r * X * Ir / Nh + (1 - c) * alpha_s * X * Is / Nh - eta * Y

Nh <- Sr + Ss + Ir + Is + R
Nv <- X + Y

# Parameters
# mu <- parameter(1 / (70 * 365))  # Natural birth/mortality rate of humans (per day)
# rho <- parameter(0.2)            # Fraction/probability of humans with high resistance
# beta_r <- parameter(0.0044)      # Infection rate from mosquitoes to resistant humans
# beta_s <- parameter(0.0066)      # Infection rate from mosquitoes to sensitive humans
# gamma_r <- parameter(1 / 365)    # Recovery rate for resistant humans
# gamma_s <- parameter(1 / 100)    # Recovery rate for sensitive humans
# alpha_r <- parameter(0.0044)     # Infection rate from resistant humans to mosquitoes
# alpha_s <- parameter(0.0062)     # Infection rate from sensitive humans to mosquitoes
# omega <- parameter(1 / (5 * 365)) # Waning immunity rate (humans becoming susceptible again)
# eta <- parameter(1 / 15)         # Natural birth/death rate of mosquitoes
# lsr <- parameter(0.05)           # Rate of change from sensitive to resistant
# lrs <- parameter(0.03)           # Rate of change from resistant to sensitive
# delta_sr <- parameter(0.01)      # Rate of change from sensitive infected to resistant infected
# delta_rs <- parameter(0.01)      # Rate of change from resistant infected to sensitive infected
# c <- parameter(0.5)              # Mosquito net coverage (reducing infection rate)
# m <- parameter(10)               # Mosquito-to-human ratio
# Nh0 <- parameter(1000)           # Initial human population size
# Nv0 <- parameter(200)           # Initial mosquito population size


# # Remove human demography (simulate on epidemic timescale)
# mu      <- parameter(0)           # no births/deaths in humans
# omega   <- parameter(0)           # no waning immunity for short term
#
# # Human Population Parameters
# rho     <- parameter(0.7)         # 70% of new cases are resistant
# beta_r  <- parameter(0.002)       # reduced transmission rate for resistant humans
# beta_s  <- parameter(0.004)       # reduced transmission rate for sensitive humans
#
# # Recovery rates (typical infectious period: ~2-3 weeks)
# gamma_r <- parameter(1/21)        # ~0.0476 per day (resistant recover slower)
# gamma_s <- parameter(1/14)        # ~0.0714 per day (sensitive recover faster)
#
# # Conversion among susceptible states (make these flows moderate)
# lsr     <- parameter(0.005)       # from Ss to Sr
# lrs     <- parameter(0.003)       # from Sr to Ss
#
# # Conversion among infected states (also moderate)
# delta_sr <- parameter(0.005)      # from Is to Ir
# delta_rs <- parameter(0.005)      # from Ir to Is
#
# # Mosquito Population Parameters
# m       <- parameter(10)          # mosquito-to-human ratio
# alpha_r <- parameter(0.002)       # transmission rate from Ir to mosquitoes
# alpha_s <- parameter(0.003)       # transmission rate from Is to mosquitoes
# eta     <- parameter(1/15)        # mosquito birth/death rate (fast turnover)
# c       <- parameter(0.5)         # mosquito net coverage
#
# # Initial Populations
# Nh0     <- parameter(1000)
# Nv0     <- parameter(200)


# Include human demography
mu      <- parameter(1/(70*365))  # ~3.91e-5 per day
omega   <- parameter(1/(5*365))   # ~0.000548 per day (waning over ~5 years)

# Human Population Parameters
rho     <- parameter(0.7)
beta_r  <- parameter(0.0044)
beta_s  <- parameter(0.0066)

# Adjust recovery rates to be on a faster time scale than demography:
gamma_r <- parameter(1/21)        # ~0.0476 per day (resistant)
gamma_s <- parameter(1/14)        # ~0.0714 per day (sensitive)

# Moderated conversion rates for susceptibles:
lsr     <- parameter(0.01)
lrs     <- parameter(0.005)

# Moderated conversion rates for infecteds:
delta_sr <- parameter(0.005)
delta_rs <- parameter(0.005)

# Mosquito Population Parameters remain similar:
m       <- parameter(2)
alpha_r <- parameter(0.0044)
alpha_s <- parameter(0.0062)
eta     <- parameter(1/15)
c       <- parameter(0.5)

# Initial Populations
Nh0     <- parameter(1000000)
Nv0     <- parameter(2000000)


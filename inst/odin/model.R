# Transition Probabilities
p_IrR <- 1 - exp(-gamma_r * dt)
p_IsR <- 1 - exp(-gamma_s * dt)
p_RSrSs <- 1 - exp(-omega * dt)  # Waning immunity

# Adjusted Infection Probabilities with ITN Decay
p_SrIr <- 1 - exp(- (1 - c) * beta_r * Ir / N * dt)
p_SsIs <- 1 - exp(- (1 - c) * beta_s * Is / N * dt)

# Immune status changes
p_SsSr <- lsr * dt
p_SrSs <- lrs * dt

# Transitions between infection types
p_IrIs <- delta_rs * dt
p_IsIr <- delta_sr * dt

# Sampling Transitions Using a Mix of Distributions
n_SrIr <- Poisson(p_SrIr * Sr)
n_SsIs <- Poisson(p_SsIs * Ss)

n_IrR <- Binomial(Ir, p_IrR)
n_IsR <- Binomial(Is, p_IsR)

n_SsSr <- Binomial(Ss, p_SsSr)
n_SrSs <- Binomial(Sr, p_SrSs)

n_IrIs <- Binomial(Ir, p_IrIs)
n_IsIr <- Binomial(Is, p_IsIr)

# Waning Immunity: Recovered to Susceptible
n_RtoS <- Binomial(R, p_RSrSs)      # Total returning to S
n_RtoSr <- Binomial(n_RtoS, rho)    # Returning to Sr
n_RtoSs <- n_RtoS - n_RtoSr         # Remaining go to Ss

# Births (Added to Susceptible Compartments)
n_births <- Poisson(mu * N * dt)   # Newborns per time step
n_births_Sr <- Binomial(n_births, rho)  # Fraction to Sr
n_births_Ss <- n_births - n_births_Sr   # Remaining to Ss

# Natural Deaths (Apply to All Compartments)
n_death_Sr <- Binomial(Sr, mu * dt)
n_death_Ss <- Binomial(Ss, mu * dt)
n_death_Ir <- Binomial(Ir, mu * dt)
n_death_Is <- Binomial(Is, mu * dt)
n_death_R <- Binomial(R, mu * dt)

# State Updates
update(Sr) <- Sr - n_SrIr + n_SsSr - n_SrSs + n_RtoSr + n_births_Sr - n_death_Sr
update(Ss) <- Ss - n_SsIs + n_SrSs - n_SsSr + n_RtoSs + n_births_Ss - n_death_Ss
update(Ir) <- Ir + n_SrIr - n_IrR + n_IsIr - n_IrIs - n_death_Ir
update(Is) <- Is + n_SsIs - n_IsR + n_IrIs - n_IsIr - n_death_Is
update(R)  <- R + n_IrR + n_IsR - n_RtoS - n_death_R
update(c) <- c * exp(-theta * dt) + lambda * (c0 - c) * dt # ITN Coverage Decay + Replenishment
update(inc) <- p_SrIr * Sr + p_SsIs * Ss

# Initial Conditions
initial(Sr) <- 0.2 * N
initial(Ss) <- 0.7 * N
initial(Ir) <- 0.05 * N
initial(Is) <- 0.05 * N
initial(R)  <- 0
initial(c) <- c0
initial(inc) <- 0

# Parameters
beta_r <- parameter(0.1)
beta_s <- parameter(0.2)
gamma_r <- parameter(0.05)
gamma_s <- parameter(0.1)
omega <- parameter(1 / (1 * 365))  # Waning immunity (1 years)
lsr <- parameter(0.02)
lrs <- parameter(0.01)
delta_sr <- parameter(0.005)
delta_rs <- parameter(0.005)
c0 <- parameter(0.5)         # Initial ITN coverage (50%)
theta <- parameter(0.01)     # ITN decay rate
lambda <- parameter(0.005)   # ITN replenishment rate
rho <- parameter(0.2)        # Fraction of recovered returning to Sr
mu <- parameter(1 / (50 * 365))  # Birth/Death rate (~50-year lifespan)
N <- parameter(1000)

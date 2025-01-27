# Define the model using odin2
gen <- odin2::odin({

  # Initial Conditions
  initial(Sr) <- 0.7 * Nh0     # Initial number of resistant susceptible humans
  initial(Ss) <- 0.2 * Nh0     # Initial number of sensitive susceptible humans
  initial(Ir) <- 0.05 * Nh0    # Initial number of resistant infected humans
  initial(Is) <- 0.05 * Nh0    # Initial number of sensitive infected humans
  initial(R) <- 0              # Initial number of recovered humans
  initial(X) <- 0.5 * Nv0      # Initial number of uninfected mosquitoes
  initial(Y) <- 0.5 * Nv0      # Initial number of infected mosquitoes

  # State Updates
  update(Sr) <- rho * mu * Nh - (1 - c) * m * beta_r * Sr * Y / Nv - mu * Sr + lsr * Ss - lrs * Sr + rho * omega * R
  update(Ss) <- (1 - rho) * mu * Nh - (1 - c) * m * beta_s * Ss * Y / Nv - mu * Ss + lrs * Sr - lsr * Ss + (1 - rho) * omega * R
  update(Ir) <- (1 - c) * m * beta_r * Sr * Y / Nv - (gamma_r + mu) * Ir + delta_sr * Is - delta_rs * Ir
  update(Is) <- (1 - c) * m * beta_s * Ss * Y / Nv - (gamma_s + mu) * Is + delta_rs * Ir - delta_sr * Is
  update(R) <- gamma_r * Ir + gamma_s * Is - (omega + mu) * R
  update(X) <- eta * Nv - (1 - c) * alpha_r * X * Ir / Nh - (1 - c) * alpha_s * X * Is / Nh - eta * X
  update(Y) <- (1 - c) * alpha_r * X * Ir / Nh + (1 - c) * alpha_s * X * Is / Nh - eta * Y

  # Helper Variables
  Nh <- Sr + Ss + Ir + Is + R  # Total human population
  Nv <- X + Y                  # Total mosquito population



  # Parameters
  mu <- parameter(1 / (70 * 365))  # Natural birth/mortality rate of humans (per day)
  rho <- parameter(0.7)            # Fraction of humans with high resistance
  beta_r <- parameter(0.0044)      # Infection rate from mosquitoes to resistant humans
  beta_s <- parameter(0.0066)      # Infection rate from mosquitoes to sensitive humans
  gamma_r <- parameter(1 / 365)    # Recovery rate for resistant humans
  gamma_s <- parameter(1 / 100)    # Recovery rate for sensitive humans
  alpha_r <- parameter(0.0044)     # Infection rate from resistant humans to mosquitoes
  alpha_s <- parameter(0.0062)     # Infection rate from sensitive humans to mosquitoes
  omega <- parameter(1 / (5 * 365)) # Waning immunity rate (humans becoming susceptible again)
  eta <- parameter(1 / 15)         # Natural birth/death rate of mosquitoes
  lsr <- parameter(0.05)           # Rate of change from sensitive to resistant
  lrs <- parameter(0.03)           # Rate of change from resistant to sensitive
  delta_sr <- parameter(0.01)      # Rate of change from sensitive infected to resistant infected
  delta_rs <- parameter(0.01)      # Rate of change from resistant infected to sensitive infected
  c <- parameter(0.5)              # Mosquito net coverage (reducing infection rate)
  m <- parameter(10)               # Mosquito-to-human ratio
  Nh0 <- parameter(1000)           # Initial human population size
  Nv0 <- parameter(200)           # Initial mosquito population size
})

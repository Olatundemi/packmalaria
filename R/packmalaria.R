#' Define the model using odin2
#'
#' This function generates the malaria model using odin2.
#'
#' @export
create_gen <- function() {
  odin2::odin({
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

    mu <- parameter(1 / (70 * 365))
    rho <- parameter(0.7)
    beta_r <- parameter(0.0044)
    beta_s <- parameter(0.0066)
    gamma_r <- parameter(1 / 365)
    gamma_s <- parameter(1 / 100)
    alpha_r <- parameter(0.0044)
    alpha_s <- parameter(0.0062)
    omega <- parameter(1 / (5 * 365))
    eta <- parameter(1 / 15)
    lsr <- parameter(0.05)
    lrs <- parameter(0.03)
    delta_sr <- parameter(0.01)
    delta_rs <- parameter(0.01)
    c <- parameter(0.5)
    m <- parameter(10)
    Nh0 <- parameter(1000)
    Nv0 <- parameter(200)
  })
}

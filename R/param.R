#' Get default model parameters
#'
#' This function returns the default parameter values for the malaria model.
#' \code{get_params} specifies model default parameters
#' @param beta_r Infection rate from mosquitoes to resistant humans
#' @param beta_s Infection rate from mosquitoes to sensitive humans
#' @param gamma_r Recovery rate for resistant humans
#' @param gamma_s Recovery rate for sensitive humans
#' @param omega  Waning immunity
#' @param lsr Rate of change from sensitive to resistant
#' @param lrs Rate of change from resistant to sensitive
#' @param delta_sr Rate of change from sensitive infected to resistant infected
#' @param delta_rs Rate of change from resistant infected to sensitive infected
#' @param c0 Initial ITN coverage
#' @param theta ITN decay rate
#' @param lambda ITN replenishment rate
#' @param rho Fraction of recovered returning to Sr
#' @param mu Birth/Death rate
#' @param N Total human population
#'
#' @export
 get_params <- function(
        beta_r = 0.1,
        beta_s = 0.2,
        gamma_r = 0.05,
        gamma_s = 0.1,
        omega = 1 / (1 * 365),  # Waning immunity (1 years)
        lsr = 0.02,
        lrs = 0.01,
        delta_sr = 0.005,
        delta_rs = 0.005,
        c0 = 0.5,         # Initial ITN coverage (50%)
        theta = 0.01,     # ITN decay rate
        lambda = 0.005,   # ITN replenishment rate
        rho = 0.2,        # Fraction of recovered returning to Sr
        mu = 1 / (50 * 365),  # Birth/Death rate (~70-year lifespan)
        N = 1000
   ){

   # set up param list
   params <- list()

   params$beta_r <- beta_r
   params$beta_s <- beta_s
   params$gamma_r <- gamma_r
   params$gamma_s <- gamma_s
   params$omega <- omega
   params$lsr <- lsr
   params$lrs <- lrs
   params$delta_sr <- delta_sr
   params$delta_rs <- delta_rs
   params$c0 <- c0         # Initial ITN coverage (50%)
   params$theta <- theta
   params$lambda <- lambda
   params$rho <- rho
   params$mu <- mu
   params$N <- N

   return(params)
  }

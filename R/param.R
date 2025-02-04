#' Get default model parameters
#'
#' This function returns the default parameter values for the malaria model.
#'
#' @export
get_default_params <- function() {
  list(
    mu = 0, #1 / (70 * 365),
    rho = 0.7,
    beta_r = 0.002, #0.0044,
    beta_s = 0.004, #0.0066,
    gamma_r = 1/21,#1 / 365,
    gamma_s = 1/14, #1 / 100,
    alpha_r = 0.002, #0.0044,
    alpha_s = 0.003, #0.0062,
    omega = 0, #1 / (5 * 365),
    eta = 1 / 15,
    lsr = 0.005, #0.05,
    lrs = 0.003, #0.03,
    delta_sr = 0.005, #0.01,
    delta_rs = 0.005, #0.01,
    c = 0.5,
    m = 2,
    Nh0 = 1000000,#10,
    Nv0 = 2000000#5
  )
}

## Generated by dust2 (version 0.3.16) - do not edit
model <- structure(
  function() get("model"),
  class = "dust_system_generator",
  name = "model",
  package = "packmalaria",
  path = NULL,
  parameters = data.frame(
    name = c("mu", "omega", "rho", "beta_r", "beta_s", "gamma_r", "gamma_s", "lsr", "lrs", "delta_sr", "delta_rs", "m", "alpha_r", "alpha_s", "eta", "c", "Nh0", "Nv0"),
    type = c("real_type", "real_type", "real_type", "real_type", "real_type", "real_type", "real_type", "real_type", "real_type", "real_type", "real_type", "real_type", "real_type", "real_type", "real_type", "real_type", "real_type", "real_type"),
    constant = c(FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE),
    required = c(FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE),
    rank = c(0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L)),
  properties = list(
    time_type = "discrete",
    has_compare = FALSE,
    has_adjoint = FALSE),
  default_dt = 1)
packmalaria <- structure(
  function() get("packmalaria"),
  class = "dust_system_generator",
  name = "packmalaria",
  package = "packmalaria",
  path = NULL,
  parameters = data.frame(
    name = c("N", "I0", "beta", "gamma"),
    type = c("real_type", "real_type", "real_type", "real_type"),
    constant = c(FALSE, FALSE, FALSE, FALSE),
    required = c(FALSE, FALSE, FALSE, FALSE),
    rank = c(0L, 0L, 0L, 0L)),
  properties = list(
    time_type = "continuous",
    has_compare = FALSE,
    has_adjoint = FALSE),
  default_dt = NULL)

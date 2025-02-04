#' @export
initialize_system <- function(gen = NULL, params = get_default_params(), n_particles = 2) {
  if (is.null(gen)) {
    gen <- model
  }

  sys <- dust2::dust_system_create(
    generator = gen(),
    pars = params,
    n_particles = n_particles
  )
  dust2::dust_system_set_state_initial(sys)
  sys
}

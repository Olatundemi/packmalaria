#' @export
simulate_model <- function(gen = NULL, params = get_default_params(), n_particles = 10, time_steps = 365, output_format = "dataframe") {
  # Use default generator if not provided
  if (is.null(gen)) {
    gen <- create_gen()
  }

  # Initializing the system
  sys <- initialize_system(gen, params, n_particles)

  # Running the simulation for all time steps
  output <- dust2::dust_system_simulate(sys, 1:time_steps)

  # mean across particles for each state variable at each time step
  mean_output <- apply(output, c(1, 3), mean)  # Mean across the second dimension (particles)

  # Converting to a dataframe
  results_df <- as.data.frame(t(mean_output))  # Transposing to align time with rows

  # column names based on state variables
  colnames(results_df) <- c("Sr", "Ss", "Ir", "Is", "R", "X", "Y")

  # Adding a time column
  results_df$time <- 1:time_steps

  # Adding derived variables
  results_df <- results_df %>%
    mutate(
      Nh = Sr + Ss + Ir + Is + R,
      Nv = X + Y,
      prevalence_humans = (Ir + Is) / Nh,
      prevalence_mosquitoes = Y / Nv
    )

  # Returning results
  if (output_format == "dataframe") {
    return(results_df)
  } else {
    stop("Unsupported output format. Only 'dataframe' is currently supported.")
  }
}

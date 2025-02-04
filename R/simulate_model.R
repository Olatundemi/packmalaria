#' @export
simulate_model <- function(gen = NULL, params = get_default_params(), n_particles = 1, time_steps = 365, output_format = "dataframe") {
  # Use default generator if not provided
  if (is.null(gen)) {
    gen <- model
  }

  # Initializing the system
  sys <- initialize_system(gen, params, n_particles)

  # Running the simulation for all time steps
  output <- dust2::dust_system_simulate(sys, 1:time_steps)

  # mean across particles for each state variable at each time step
  mean_output <- apply(output, c(1, 3), mean)  # Mean across the second dimension (particles)

  results_df <- as.data.frame(t(mean_output))  # Transposing to align time with rows

  # column names based on state variables
  colnames(results_df) <- c("Sr", "Ss", "Ir", "Is", "R", "X", "Y")

  # Adding a time column
  results_df$time <- 1:time_steps

  # Adding derived variables
  results_df$Nh <- results_df$Sr + results_df$Ss + results_df$Ir + results_df$Is + results_df$R
  results_df$Nv <- results_df$X + results_df$Y
  results_df$prevalence_humans <- (results_df$Ir + results_df$Is) / results_df$Nh
  results_df$prevalence_mosquitoes <- results_df$Y / results_df$Nv

  # Returning results
  if (output_format == "dataframe") {
    return(results_df)
  } else {
    stop("Unsupported output format. Only 'dataframe' is currently supported.")
  }
}

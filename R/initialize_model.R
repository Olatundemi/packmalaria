#' @importFrom dplyr %>% mutate



# Function to initialize the model system
initialize_system <- function(gen, params, n_particles = 2) {
  sys <- dust2::dust_system_create(
    generator = gen(),
    pars = params,
    n_particles = n_particles
  )
  dust2::dust_system_set_state_initial(sys)
  sys
}



simulate_model <- function(gen, params, n_particles = 10, time_steps = 365, output_format = "dataframe") {
  # Initialize the system
  sys <- initialize_system(gen, params, n_particles)

  # Run the simulation for all time steps
  output <- dust2::dust_system_simulate(sys, 1:time_steps)

  # Calculate mean across particles for each state variable at each time step
  mean_output <- apply(output, c(1, 3), mean)  # Mean across the second dimension (particles)

  # Convert to a dataframe
  results_df <- as.data.frame(t(mean_output))  # Transpose to align time with rows

  # Assign column names based on state variables
  colnames(results_df) <- c("Sr", "Ss", "Ir", "Is", "R", "X", "Y")

  # Add a time column
  results_df$time <- 1:time_steps

  # Add derived variables
  results_df <- results_df %>%
    mutate(
      Nh = Sr + Ss + Ir + Is + R,
      Nv = X + Y,
      prevalence_humans = (Ir + Is) / Nh,
      prevalence_mosquitoes = Y / Nv
    )

  # Return results
  if (output_format == "dataframe") {
    return(results_df)
  } else {
    stop("Unsupported output format. Only 'dataframe' is currently supported.")
  }
}

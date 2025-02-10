#------------------------------------------------
#' Function that return deterministic/stochastic simulation of the model
#'
#' \code{simulate_model} # A simulation function that creates a dust2 system from the SIR model.
#'
#' @param time_steps duration of simulation times usually expressed as a measure of days
#' @param params User's defined parameters for model compilation.
#' @param output_format simulation output format
#' @param n_particles number of particles to determine model stochasticity
#' @param gen compiled model (default).


#' @export
simulate_model <- function(gen = NULL,
                           params = get_params(),
                           time_steps = 365,
                           n_particles = 1,
                           output_format = "dataframe"){
  gen <- model

  sys <- dust2::dust_system_create(gen(), params, n_particles = n_particles)
  dust2::dust_system_set_state_initial(sys)

  #The simulation times.
  time <- 0:time_steps

  # Running simulation. The output is assumed to have a time column as its first column.
  out <- dust2::dust_system_simulate(sys, time)

  # Remove the first column (typically the time) and then transpose
  out <- out[, -1, drop = FALSE]
  out <- t(out)

  # Bind a time column. Here we use 1:time_steps
  out <- cbind(time = 1:time_steps, out)

  # Converting to data frame.
  out <- as.data.frame(out)

  #state variable names renamed
  state_variable_names <- c("Sr", "Ss", "Ir", "Is", "R", "itn_cov", "inc")
  colnames(out)[2:(length(state_variable_names) + 1)] <- state_variable_names

  # Computes derived quantities .
  expected_states <- state_variable_names
  if (all(expected_states %in% colnames(out))) {
    N <- out$Sr + out$Ss + out$Ir + out$Is + out$R  # Compute total human population.
    # Compute epi-parameters
    out$prevalence <- with(out, ifelse(N > 0, (Ir + Is) / N, NA))
  } else {
    warning("Not all expected state variables found; derived variables were not computed.")
  }
  # Allow for other output formats if needed.
  if (output_format == "dataframe") {
    return(out)
  } else {
    stop("Unsupported output format. Only 'dataframe' is currently supported.")
  }
}

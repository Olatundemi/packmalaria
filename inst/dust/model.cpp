// Generated by odin2 (version 0.3.5) - do not edit
#include <dust2/common.hpp>
// [[dust2::class(model)]]
// [[dust2::time_type(discrete)]]
// [[dust2::parameter(beta_r, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(beta_s, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(gamma_r, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(gamma_s, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(omega, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(lsr, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(lrs, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(delta_sr, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(delta_rs, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(c0, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(theta, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(lambda, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(rho, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(mu, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(N, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
class model {
public:
  model() = delete;
  using real_type = double;
  using rng_state_type = monty::random::generator<real_type>;
  struct shared_state {
    struct offset_type {
      struct {
        size_t Sr;
        size_t Ss;
        size_t Ir;
        size_t Is;
        size_t R;
        size_t c;
        size_t inc;
      } state;
    } offset;
    real_type beta_r;
    real_type beta_s;
    real_type gamma_r;
    real_type gamma_s;
    real_type omega;
    real_type lsr;
    real_type lrs;
    real_type delta_sr;
    real_type delta_rs;
    real_type c0;
    real_type theta;
    real_type lambda;
    real_type rho;
    real_type mu;
    real_type N;
  };
  struct internal_state {};
  using data_type = dust2::no_data;
  static dust2::packing packing_state(const shared_state& shared) {
    return dust2::packing{
      {"Sr", {}},
      {"Ss", {}},
      {"Ir", {}},
      {"Is", {}},
      {"R", {}},
      {"c", {}},
      {"inc", {}}
    };
  }
  static dust2::packing packing_gradient(const shared_state& shared) {
    return dust2::packing{
    };
  }
  static shared_state build_shared(cpp11::list parameters) {
    const real_type beta_r = dust2::r::read_real(parameters, "beta_r", static_cast<real_type>(0.10000000000000001));
    const real_type beta_s = dust2::r::read_real(parameters, "beta_s", static_cast<real_type>(0.20000000000000001));
    const real_type gamma_r = dust2::r::read_real(parameters, "gamma_r", static_cast<real_type>(0.050000000000000003));
    const real_type gamma_s = dust2::r::read_real(parameters, "gamma_s", static_cast<real_type>(0.10000000000000001));
    const real_type omega = dust2::r::read_real(parameters, "omega", 1 / (1 * 365));
    const real_type lsr = dust2::r::read_real(parameters, "lsr", static_cast<real_type>(0.02));
    const real_type lrs = dust2::r::read_real(parameters, "lrs", static_cast<real_type>(0.01));
    const real_type delta_sr = dust2::r::read_real(parameters, "delta_sr", static_cast<real_type>(0.0050000000000000001));
    const real_type delta_rs = dust2::r::read_real(parameters, "delta_rs", static_cast<real_type>(0.0050000000000000001));
    const real_type c0 = dust2::r::read_real(parameters, "c0", static_cast<real_type>(0.5));
    const real_type theta = dust2::r::read_real(parameters, "theta", static_cast<real_type>(0.01));
    const real_type lambda = dust2::r::read_real(parameters, "lambda", static_cast<real_type>(0.0050000000000000001));
    const real_type rho = dust2::r::read_real(parameters, "rho", static_cast<real_type>(0.20000000000000001));
    const real_type mu = dust2::r::read_real(parameters, "mu", 1 / (50 * 365));
    const real_type N = dust2::r::read_real(parameters, "N", 1000);
    shared_state::offset_type offset;
    offset.state.Sr = 0;
    offset.state.Ss = 1;
    offset.state.Ir = 2;
    offset.state.Is = 3;
    offset.state.R = 4;
    offset.state.c = 5;
    offset.state.inc = 6;
    return shared_state{offset, beta_r, beta_s, gamma_r, gamma_s, omega, lsr, lrs, delta_sr, delta_rs, c0, theta, lambda, rho, mu, N};
  }
  static internal_state build_internal(const shared_state& shared) {
    return internal_state{};
  }
  static void update_shared(cpp11::list parameters, shared_state& shared) {
    shared.beta_r = dust2::r::read_real(parameters, "beta_r", shared.beta_r);
    shared.beta_s = dust2::r::read_real(parameters, "beta_s", shared.beta_s);
    shared.gamma_r = dust2::r::read_real(parameters, "gamma_r", shared.gamma_r);
    shared.gamma_s = dust2::r::read_real(parameters, "gamma_s", shared.gamma_s);
    shared.omega = dust2::r::read_real(parameters, "omega", shared.omega);
    shared.lsr = dust2::r::read_real(parameters, "lsr", shared.lsr);
    shared.lrs = dust2::r::read_real(parameters, "lrs", shared.lrs);
    shared.delta_sr = dust2::r::read_real(parameters, "delta_sr", shared.delta_sr);
    shared.delta_rs = dust2::r::read_real(parameters, "delta_rs", shared.delta_rs);
    shared.c0 = dust2::r::read_real(parameters, "c0", shared.c0);
    shared.theta = dust2::r::read_real(parameters, "theta", shared.theta);
    shared.lambda = dust2::r::read_real(parameters, "lambda", shared.lambda);
    shared.rho = dust2::r::read_real(parameters, "rho", shared.rho);
    shared.mu = dust2::r::read_real(parameters, "mu", shared.mu);
    shared.N = dust2::r::read_real(parameters, "N", shared.N);
  }
  static void update_internal(const shared_state& shared, internal_state& internal) {
  }
  static void initial(real_type time, const shared_state& shared, internal_state& internal, rng_state_type& rng_state, real_type* state) {
    state[0] = static_cast<real_type>(0.20000000000000001) * shared.N;
    state[1] = static_cast<real_type>(0.69999999999999996) * shared.N;
    state[2] = static_cast<real_type>(0.050000000000000003) * shared.N;
    state[3] = static_cast<real_type>(0.050000000000000003) * shared.N;
    state[4] = 0;
    state[5] = shared.c0;
    state[6] = 0;
  }
  static void update(real_type time, real_type dt, const real_type* state, const shared_state& shared, internal_state& internal, rng_state_type& rng_state, real_type* state_next) {
    const auto Sr = state[0];
    const auto Ss = state[1];
    const auto Ir = state[2];
    const auto Is = state[3];
    const auto R = state[4];
    const auto c = state[5];
    const real_type p_IrR = 1 - monty::math::exp(-shared.gamma_r * dt);
    const real_type p_IsR = 1 - monty::math::exp(-shared.gamma_s * dt);
    const real_type p_RSrSs = 1 - monty::math::exp(-shared.omega * dt);
    const real_type p_SrIr = 1 - monty::math::exp(-(1 - c) * shared.beta_r * Ir / shared.N * dt);
    const real_type p_SsIs = 1 - monty::math::exp(-(1 - c) * shared.beta_s * Is / shared.N * dt);
    const real_type p_SsSr = shared.lsr * dt;
    const real_type p_SrSs = shared.lrs * dt;
    const real_type p_IrIs = shared.delta_rs * dt;
    const real_type p_IsIr = shared.delta_sr * dt;
    const real_type n_births = monty::random::poisson<real_type>(rng_state, shared.mu * shared.N * dt);
    const real_type n_death_Sr = monty::random::binomial<real_type>(rng_state, Sr, shared.mu * dt);
    const real_type n_death_Ss = monty::random::binomial<real_type>(rng_state, Ss, shared.mu * dt);
    const real_type n_death_Ir = monty::random::binomial<real_type>(rng_state, Ir, shared.mu * dt);
    const real_type n_death_Is = monty::random::binomial<real_type>(rng_state, Is, shared.mu * dt);
    const real_type n_death_R = monty::random::binomial<real_type>(rng_state, R, shared.mu * dt);
    const real_type n_SrIr = monty::random::poisson<real_type>(rng_state, p_SrIr * Sr);
    const real_type n_SsIs = monty::random::poisson<real_type>(rng_state, p_SsIs * Ss);
    const real_type n_IrR = monty::random::binomial<real_type>(rng_state, Ir, p_IrR);
    const real_type n_IsR = monty::random::binomial<real_type>(rng_state, Is, p_IsR);
    const real_type n_SsSr = monty::random::binomial<real_type>(rng_state, Ss, p_SsSr);
    const real_type n_SrSs = monty::random::binomial<real_type>(rng_state, Sr, p_SrSs);
    const real_type n_IrIs = monty::random::binomial<real_type>(rng_state, Ir, p_IrIs);
    const real_type n_IsIr = monty::random::binomial<real_type>(rng_state, Is, p_IsIr);
    const real_type n_RtoS = monty::random::binomial<real_type>(rng_state, R, p_RSrSs);
    const real_type n_births_Sr = monty::random::binomial<real_type>(rng_state, n_births, shared.rho);
    const real_type n_RtoSr = monty::random::binomial<real_type>(rng_state, n_RtoS, shared.rho);
    const real_type n_births_Ss = n_births - n_births_Sr;
    const real_type n_RtoSs = n_RtoS - n_RtoSr;
    state_next[0] = Sr - n_SrIr + n_SsSr - n_SrSs + n_RtoSr + n_births_Sr - n_death_Sr;
    state_next[1] = Ss - n_SsIs + n_SrSs - n_SsSr + n_RtoSs + n_births_Ss - n_death_Ss;
    state_next[2] = Ir + n_SrIr - n_IrR + n_IsIr - n_IrIs - n_death_Ir;
    state_next[3] = Is + n_SsIs - n_IsR + n_IrIs - n_IsIr - n_death_Is;
    state_next[4] = R + n_IrR + n_IsR - n_RtoS - n_death_R;
    state_next[5] = c * monty::math::exp(-shared.theta * dt) + shared.lambda * (shared.c0 - c) * dt;
    state_next[6] = p_SrIr * Sr + p_SsIs * Ss;
  }
  static auto zero_every(const shared_state& shared) {
    return dust2::zero_every_type<real_type>();
  }
};

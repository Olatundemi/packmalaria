// Generated by odin2 (version 0.3.5) - do not edit
#include <dust2/common.hpp>
// [[dust2::class(model)]]
// [[dust2::time_type(discrete)]]
// [[dust2::parameter(mu, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(omega, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(rho, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(beta_r, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(beta_s, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(gamma_r, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(gamma_s, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(lsr, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(lrs, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(delta_sr, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(delta_rs, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(m, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(alpha_r, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(alpha_s, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(eta, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(c, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(Nh0, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
// [[dust2::parameter(Nv0, type = "real_type", rank = 0, required = FALSE, constant = FALSE)]]
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
        size_t X;
        size_t Y;
      } state;
    } offset;
    real_type mu;
    real_type omega;
    real_type rho;
    real_type beta_r;
    real_type beta_s;
    real_type gamma_r;
    real_type gamma_s;
    real_type lsr;
    real_type lrs;
    real_type delta_sr;
    real_type delta_rs;
    real_type m;
    real_type alpha_r;
    real_type alpha_s;
    real_type eta;
    real_type c;
    real_type Nh0;
    real_type Nv0;
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
      {"X", {}},
      {"Y", {}}
    };
  }
  static dust2::packing packing_gradient(const shared_state& shared) {
    return dust2::packing{
    };
  }
  static shared_state build_shared(cpp11::list parameters) {
    const real_type mu = dust2::r::read_real(parameters, "mu", 1 / (70 * 365));
    const real_type omega = dust2::r::read_real(parameters, "omega", 1 / (5 * 365));
    const real_type rho = dust2::r::read_real(parameters, "rho", static_cast<real_type>(0.69999999999999996));
    const real_type beta_r = dust2::r::read_real(parameters, "beta_r", static_cast<real_type>(0.0044000000000000003));
    const real_type beta_s = dust2::r::read_real(parameters, "beta_s", static_cast<real_type>(0.0066));
    const real_type gamma_r = dust2::r::read_real(parameters, "gamma_r", 1 / 21);
    const real_type gamma_s = dust2::r::read_real(parameters, "gamma_s", 1 / 14);
    const real_type lsr = dust2::r::read_real(parameters, "lsr", static_cast<real_type>(0.01));
    const real_type lrs = dust2::r::read_real(parameters, "lrs", static_cast<real_type>(0.0050000000000000001));
    const real_type delta_sr = dust2::r::read_real(parameters, "delta_sr", static_cast<real_type>(0.0050000000000000001));
    const real_type delta_rs = dust2::r::read_real(parameters, "delta_rs", static_cast<real_type>(0.0050000000000000001));
    const real_type m = dust2::r::read_real(parameters, "m", 2);
    const real_type alpha_r = dust2::r::read_real(parameters, "alpha_r", static_cast<real_type>(0.0044000000000000003));
    const real_type alpha_s = dust2::r::read_real(parameters, "alpha_s", static_cast<real_type>(0.0061999999999999998));
    const real_type eta = dust2::r::read_real(parameters, "eta", 1 / 15);
    const real_type c = dust2::r::read_real(parameters, "c", static_cast<real_type>(0.5));
    const real_type Nh0 = dust2::r::read_real(parameters, "Nh0", 1e+06);
    const real_type Nv0 = dust2::r::read_real(parameters, "Nv0", 2e+06);
    shared_state::offset_type offset;
    offset.state.Sr = 0;
    offset.state.Ss = 1;
    offset.state.Ir = 2;
    offset.state.Is = 3;
    offset.state.R = 4;
    offset.state.X = 5;
    offset.state.Y = 6;
    return shared_state{offset, mu, omega, rho, beta_r, beta_s, gamma_r, gamma_s, lsr, lrs, delta_sr, delta_rs, m, alpha_r, alpha_s, eta, c, Nh0, Nv0};
  }
  static internal_state build_internal(const shared_state& shared) {
    return internal_state{};
  }
  static void update_shared(cpp11::list parameters, shared_state& shared) {
    shared.mu = dust2::r::read_real(parameters, "mu", shared.mu);
    shared.omega = dust2::r::read_real(parameters, "omega", shared.omega);
    shared.rho = dust2::r::read_real(parameters, "rho", shared.rho);
    shared.beta_r = dust2::r::read_real(parameters, "beta_r", shared.beta_r);
    shared.beta_s = dust2::r::read_real(parameters, "beta_s", shared.beta_s);
    shared.gamma_r = dust2::r::read_real(parameters, "gamma_r", shared.gamma_r);
    shared.gamma_s = dust2::r::read_real(parameters, "gamma_s", shared.gamma_s);
    shared.lsr = dust2::r::read_real(parameters, "lsr", shared.lsr);
    shared.lrs = dust2::r::read_real(parameters, "lrs", shared.lrs);
    shared.delta_sr = dust2::r::read_real(parameters, "delta_sr", shared.delta_sr);
    shared.delta_rs = dust2::r::read_real(parameters, "delta_rs", shared.delta_rs);
    shared.m = dust2::r::read_real(parameters, "m", shared.m);
    shared.alpha_r = dust2::r::read_real(parameters, "alpha_r", shared.alpha_r);
    shared.alpha_s = dust2::r::read_real(parameters, "alpha_s", shared.alpha_s);
    shared.eta = dust2::r::read_real(parameters, "eta", shared.eta);
    shared.c = dust2::r::read_real(parameters, "c", shared.c);
    shared.Nh0 = dust2::r::read_real(parameters, "Nh0", shared.Nh0);
    shared.Nv0 = dust2::r::read_real(parameters, "Nv0", shared.Nv0);
  }
  static void update_internal(const shared_state& shared, internal_state& internal) {
  }
  static void initial(real_type time, const shared_state& shared, internal_state& internal, rng_state_type& rng_state, real_type* state) {
    state[0] = static_cast<real_type>(0.69999999999999996) * shared.Nh0;
    state[1] = static_cast<real_type>(0.20000000000000001) * shared.Nh0;
    state[2] = static_cast<real_type>(0.050000000000000003) * shared.Nh0;
    state[3] = static_cast<real_type>(0.050000000000000003) * shared.Nh0;
    state[4] = 0;
    state[5] = static_cast<real_type>(0.5) * shared.Nv0;
    state[6] = static_cast<real_type>(0.5) * shared.Nv0;
  }
  static void update(real_type time, real_type dt, const real_type* state, const shared_state& shared, internal_state& internal, rng_state_type& rng_state, real_type* state_next) {
    const auto Sr = state[0];
    const auto Ss = state[1];
    const auto Ir = state[2];
    const auto Is = state[3];
    const auto R = state[4];
    const auto X = state[5];
    const auto Y = state[6];
    const real_type Nh = Sr + Ss + Ir + Is + R;
    const real_type Nv = X + Y;
    state_next[0] = shared.rho * shared.mu * Nh - (1 - shared.c) * shared.m * shared.beta_r * Sr * Y / Nv - shared.mu * Sr + shared.lsr * Ss - shared.lrs * Sr + shared.rho * shared.omega * R;
    state_next[1] = (1 - shared.rho) * shared.mu * Nh - (1 - shared.c) * shared.m * shared.beta_s * Ss * Y / Nv - shared.mu * Ss + shared.lrs * Sr - shared.lsr * Ss + (1 - shared.rho) * shared.omega * R;
    state_next[2] = (1 - shared.c) * shared.m * shared.beta_r * Sr * Y / Nv - (shared.gamma_r + shared.mu) * Ir + shared.delta_sr * Is - shared.delta_rs * Ir;
    state_next[3] = (1 - shared.c) * shared.m * shared.beta_s * Ss * Y / Nv - (shared.gamma_s + shared.mu) * Is + shared.delta_rs * Ir - shared.delta_sr * Is;
    state_next[4] = shared.gamma_r * Ir + shared.gamma_s * Is - (shared.omega + shared.mu) * R;
    state_next[5] = shared.eta * Nv - (1 - shared.c) * shared.alpha_r * X * Ir / Nh - (1 - shared.c) * shared.alpha_s * X * Is / Nh - shared.eta * X;
    state_next[6] = (1 - shared.c) * shared.alpha_r * X * Ir / Nh + (1 - shared.c) * shared.alpha_s * X * Is / Nh - shared.eta * Y;
  }
  static auto zero_every(const shared_state& shared) {
    return dust2::zero_every_type<real_type>();
  }
};

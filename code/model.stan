data {
  int<lower=0> J;
  vector[J] x;
  vector[J] y;
}
parameters {
  real b0;
  real b1;
  real<lower=0> sigma;
}
model {
  // Priors
  b0 ~ normal(0, 100);
  b1 ~ normal(1, 0.1);
  sigma ~ exponential(1/3.0);
  
  // Likelihood
  y ~ normal(b0 + b1*x, sigma);
}
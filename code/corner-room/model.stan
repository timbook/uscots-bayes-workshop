data {
  int<lower=0> J;
  int eggs[J];
}

parameters {
  real<lower=0, upper=1> p;
}

model {
  // Priors
  p ~ beta(2, 10);
  
  // Likelihood
  eggs ~ binomial(12, p);
}
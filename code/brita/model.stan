data {
  int J;
  int filters[J];
}

parameters {
  real lambda;
}

model {
  lambda ~ exponential(1/6.0);
  filters ~ poisson(lambda);
}
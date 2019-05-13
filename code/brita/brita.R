library(rstan)

data <- list(
  J = 6,
  filters = c(4, 7, 8, 6, 5, 5)
)

model <- stan_model('model.stan')
model_fit <- sampling(
  model,
  data = data,
  iter = 10000,
  cores = 4
)

post = extract(model_fit)
lambda_post = post[['lambda']]

traceplot(model_fit)

mean(lambda_post <= 6.5 & lambda_post >= 5.5)

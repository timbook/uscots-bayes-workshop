library(rstan)

eggs <- c(0, 1, 1, 2, 0,
          3, 2, 3, 2, 0)

model_data <- list(
  J = length(eggs),
  eggs = eggs
)

model <- stan_model('model.stan')
fit <- sampling(model, data = model_data, iter = 10000, cores = 4)

post <- as.data.frame(fit)
p_post <- mean(post$p)

dbinom(0, 12, p_post)
# These packages must be installed for this program to run:

# RStan - R's implementation of Stan.
# install.packages("rstan")

# We'll get data from here, a package associated with a popular statistics
# textbook "Applied Linear Regression, 3rd ed." by Weisberg.
# install.packages("alr3")

library(rstan)
library(alr3)
library(ggplot2)

# Import data - mothers' vs daughters' heights.
data(heights)
head(heights)

# Model input.
model_data <- list(
  J = nrow(heights),
  x = heights$Mheight,
  y = heights$Dheight
)

# This is the model fitting phase.
# First line reads model from separate file.
# Second line samples 2000 observations from the posterior,
# including 1000 burnout samples. (This is default)
# Also samples on 4 cores. Weaker computers may want to reduce this.
model <- stan_model("model.stan")
model_fit <- sampling(model, data = model_data, cores = 4)

summary(model_fit)$summary

# Can compare to OLS results.
ols <- lm(Dheight ~ Mheight, data = heights)
summary(ols)

png("output/trace.png", res = 192, height = 4, width = 12, units = "in")
traceplot(model_fit, lwd = 0.1, ncol = 2) + 
  theme(legend.position = "none")
dev.off()

head(as.data.frame(model_fit))

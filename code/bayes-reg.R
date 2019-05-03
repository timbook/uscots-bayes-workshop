# These packages must be installed for this program to run:

# RStan - R's implementation of Stan.
# install.packages("rstan")

# We'll get data from here, a package associated with a popular statistics
# textbook "Applied Linear Regression, 3rd ed." by Weisberg.
# install.packages("alr3")

library(rstan)
library(alr3)

# Import data - mothers' vs daughters' heights.
data(heights)
head(heights)


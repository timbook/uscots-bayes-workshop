library(ggplot2)

BLUE <- '#204A87'
GREEN <- '#4E9A06'
ORANGE <- '#CE5C00'

makeDf <- function(x, y) data.frame(x = x, y = y)

# Uniform
x <- seq(0, 1, length.out = 100)
y <- rep(1, 100)
df <- makeDf(x, y)
df_edges <- data.frame(
  x = c(0, 1),
  y = c(0, 0),
  xend = c(0, 1),
  yend = c(1, 1)
)

plot_uniform <- ggplot(df, aes(x, y)) +
  geom_line(color = BLUE, size = 1.5) +
  geom_segment(data = df_edges,
               aes(x = x, y = y, xend = xend, yend = yend)) +
  theme_bw() +
  labs(x = '', y = '') +
  scale_x_continuous(breaks = (0:5)/5, limits = c(-0.2, 1.2)) +
  scale_y_continuous(breaks = (0:6)/5, limits = c(0, 1.1))

ggsave('output/uniform.png',
       plot = plot_uniform,
       dpi = 192,
       width = 7,
       height = 7/3,
       units = 'in'
)

# Normal
x <- seq(-10, 10, length.out = 500)
y1 <- dnorm(x)
y2 <- dnorm(x, sd = 2)
y05 <- dnorm(x, sd = 0.5)
df <- data.frame(x = x, y1 = y1, y2 = y2, y05 = y05)

plot_normal <- ggplot(df, aes(x)) +
  geom_line(aes(y = y1), color = BLUE, size = 1) +
  geom_line(aes(y = y2), color = GREEN, size = 1) +
  geom_line(aes(y = y05), color = ORANGE, size = 1) +
  theme_bw() + 
  labs(x = '', y = '') +
  xlim(-7, 7)

ggsave('output/normal.png',
       plot = plot_normal,
       dpi = 192,
       width = 7,
       height = 7/3,
       units = 'in'
)

# Exponential
x <- seq(0, 15, length.out = 500)
y1 <- dexp(x, rate = 1)
y2 <- dexp(x, rate = 2)
y3 <- dexp(x, rate = 3)
df <- data.frame(x = x, y1 = y1, y2 = y2, y3 = y3)

plot_exp <- ggplot(df, aes(x)) +
  geom_line(aes(y = y1), color = BLUE, size = 1) +
  geom_line(aes(y = y2), color = GREEN, size = 1) +
  geom_line(aes(y = y3), color = ORANGE, size = 1) +
  theme_bw() + 
  labs(x = '', y = '') +
  xlim(0, 4)

ggsave('output/exponential.png',
       plot = plot_exp,
       dpi = 192,
       width = 7,
       height = 7/3,
       units = 'in'
)

# Binomial
x <- 0:10
y <- dbinom(x, 10, 0.7)
df <- makeDf(x, y)

plot_bin <- ggplot(df, aes(x, y)) +
  geom_col(fill = BLUE) +
  theme_bw() +
  scale_x_continuous(breaks = 0:10) +
  scale_y_continuous(limits = c(0, 0.3), expand = c(0, 0)) +
  theme(axis.ticks.x = element_blank()) +
  labs(x = '', y = '')
  
ggsave('output/binomial.png',
       plot = plot_bin,
       dpi = 192,
       width = 7,
       height = 7/3,
       units = 'in'
)

# Poisson
x <- 0:12
y <- dpois(x, 4)
df <- makeDf(x, y)

plot_poi <- ggplot(df, aes(x, y)) +
  geom_col(fill = BLUE) + 
  theme_bw() +
  scale_x_continuous(breaks = 0:12) +
  scale_y_continuous(limits = c(0, 0.3), expand = c(0, 0)) +
  theme(axis.ticks.x = element_blank()) +
  labs(x = '', y = '')

ggsave('output/poisson.png',
       plot = plot_poi,
       dpi = 192,
       width = 7,
       height = 7/3,
       units = 'in'
)

# Gamma
x <- seq(0, 18, length.out = 200)
y1 <- dgamma(x, 1, scale = 2)
y2 <- dgamma(x, 2, scale = 2)
y3 <- dgamma(x, 7.5, scale = 1)
df <- data.frame(x = x, y1 = y1, y2 = y2, y3 = y3)

plot_gamma <- ggplot(df, aes(x)) +
  geom_line(aes(y = y1), color = BLUE) +
  geom_line(aes(y = y2), color = GREEN) +
  geom_line(aes(y = y3), color = ORANGE) +
  theme_bw() +
  labs(x = '', y = '')
  
ggsave('output/gamma.png',
       plot = plot_gamma,
       dpi = 192,
       width = 7,
       height = 7/3,
       units = 'in'
)

# Beta
x <- seq(0, 1, length.out = 200)
y1 <- dbeta(x, 3, 3)
y2 <- dbeta(x, 2, 2)
y3 <- dbeta(x, 1.2, 1.2)
df <- data.frame(x = x, y1 = y1, y2 = y2, y3 = y3)

plot_beta <- ggplot(df, aes(x)) +
  geom_line(aes(y = y1), color = BLUE) +
  geom_line(aes(y = y2), color = GREEN) +
  geom_line(aes(y = y3), color = ORANGE) +
  theme_bw() +
  ylim(0, 2.5) +
  labs(x = '', y = '')
plot_beta
  
ggsave('output/beta.png',
       plot = plot_beta,
       dpi = 192,
       width = 4,
       height = 4,
       units = 'in'
)

# Slide 19 Beta
x <- seq(0, 1, length.out = 200)
y19 <- dbeta(x, 5, 5)
df <- makeDf(x, y19)

plot_slide19 <- ggplot(df, aes(x, y)) +
  geom_line(color = BLUE) +
  theme_bw() +
  labs(x = '', y = '')

ggsave('output/slide19.png',
       plot = plot_slide19,
       dpi = 192,
       width = 4,
       height = 4,
       units = 'in'
)

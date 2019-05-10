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
  geom_line(color = "red", size = 1.5) +
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
  geom_line(aes(y = y1), color = "red", size = 1) +
  geom_line(aes(y = y2), color = "blue", size = 1) +
  geom_line(aes(y = y05), color = "green", size = 1) +
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

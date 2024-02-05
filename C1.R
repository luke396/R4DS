library(tidyverse)

library(palmerpenguins)
library(ggthemes)

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(aes(color = species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind()

# Exercise 1
# Row and col number in `penguins`
nrow(penguins)
ncol(penguins)

# Exercise 2
# `bill_depth_mm` - a number denoting bill depth (millimeters)
?penguins

# Exercise 3
ggplot(
  data = penguins,
  mapping = aes(x = bill_length_mm, y = bill_depth_mm)
) +
  geom_point(aes(color = species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Bill length and bill depth",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Bill length (mm)", y = "Bill depth (mm)",
    color = "Species", shape = "Species"
  )
# The relationship between bill length and bill depth is not as strong as the relationship between flipper length and body mass.
# And approximately, the relationship between bill length and bill depth is positive linear.

# Exercise 4
ggplot(
  data = penguins,
  mapping = aes(x = species, y = bill_depth_mm)
) +
  geom_point()

# Because the species is a categorical variable, we can use a boxplot to visualize the distribution of bill depth for each species.
ggplot(data = penguins, mapping = aes(x = species, y = bill_depth_mm)) +
  geom_boxplot() +
  labs(
    title = "Bill depth by species",
    subtitle = "Distribution of bill depth for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Species", y = "Bill depth (mm)"
  )

# Exercise 5
# There is an error in provided code. func::`geom_point` need argument `x` and `y`.
# The correct code is:
ggplot(data = penguins) +
  geom_point(
    mapping = aes(x = bill_length_mm, y = bill_depth_mm, color = species, shape = species)
  )

# Exercise 6
# argument `na.rm` is how to remove missing values. If set it to TRUE, the missing values will be removed, and the wraning message will be suppressed.
ggplot(data = penguins) +
  geom_point(
    mapping = aes(x = bill_length_mm, y = bill_depth_mm, color = species, shape = species), na.rm = TRUE
  )

# Exercise 7
ggplot(data = penguins) +
  geom_point(
    mapping = aes(x = bill_length_mm, y = bill_depth_mm, color = species, shape = species)
  ) +
  labs(caption = "Data come from the palmerpenguins package.")

# Exercise 8
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(
    mapping = aes(color = bill_depth_mm), na.rm = TRUE, shape = 19
  ) +
  geom_smooth(method = "gam")
# method = "gam" is generalized additive model

# Exercise 9
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
  geom_point() +
  geom_smooth(se = FALSE)
# The location of `color` in global or local, decice whether the line of `geom_smooth` is colored or not.

# Exercise 10
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
  geom_smooth(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  )
# The two plots are the same. The first plot is set by `ggplot()` - global level, it will apply for all following layers.
# The second plot is set by `geom_point()` and `geom_smooth()` - local level, it will apply for only these layers.
# But, in the second plot, the `data` and `mapping` are set for each layer, so the two plots are the same.

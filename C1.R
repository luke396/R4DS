library(tidyverse)

library(palmerpenguins)
library(ggthemes)

# C1.2
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

# C1.4
# When variable's hist chat is too difficult to determine the `binwidth`,we draw density (a smoothed-out version of a histogram, especially for continues data comes from an underlying smooth distribution) plot instead.

# Exercise 1
# Use `y = species` will draw a bar plot with horizontal bars.
ggplot(
  data = penguins,
  mapping = aes(y = species)
) +
  geom_bar()

# Exercise 2
# `color` is used for the border of the bars,
# and `fill` is used for the inside of the bars.
ggplot(penguins, aes(x = species)) +
  geom_bar(color = "red")

ggplot(penguins, aes(x = species)) +
  geom_bar(fill = "red")

# Exercise 3
# Note the difference between `geom_histogram` and `geom_bar`.
# `geom_histogram` is used for continues data, and `geom_bar` is used for discrete data.
# But, in my view, they are the same especially for continues data
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram()
ggplot(penguins, aes(x = body_mass_g)) +
  geom_bar()
# argument `bins` used to set the number of bins in the histogram.
# it's another way to get the same effect of `binwidth` in `geom_histogram`.
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(bins = 30)

# Exercise 4
ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 20)
ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 5)
ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 1)
ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 0.5)
ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 0.1)
ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 0.005)
# The different `binwidth` will lead to different number of bins in the histogram.
# The interesting pattern is that the `carat` peaks and troughs with a certain period, more significant when `binwidth` is smaller.


# C1.5
# numerical vs categorical - boxplot
ggplot(penguins, aes(x = body_mass_g, color = species, fill = species)) +
  geom_density(alpha = 0.5)

# categoral vs categoral
# `position = "fill"` to compare the proportion of each species on each island.
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill")

# numerical vs numerical
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species)) +
  facet_wrap(~island) # create a separate plot for each island

# Exercise 1
# ?mpg
view(mpg)
# check the type of variable in `mpg`
# Loop through all variables in the mpg dataset
for (col_name in names(mpg)) {
  # Get the type of each variable and print it
  cat("Variable:", col_name, "\tType:", class(mpg[[col_name]]), "\n")
}

# Exercise 2
# displ - engine displacement (liters)
# hwy - highway miles per gallon
# cyl - number of cylinders
# drv - the type of drive train
# class - the type of car
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = year))

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(size = cyl))

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(size = cyl, color = year))

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(shape = drv))

ggplot(mpg, aes(y = displ, x = hwy)) +
  geom_point(aes(shape = drv, color = year, size = cyl)) +
  facet_wrap(~class) +
  labs(title = "Highway miles per gallon by engine displacement") +
  theme_minimal()

# Exercise 3
ggplot(mpg, aes(y = hwy, x = displ)) +
  geom_point(aes(linewitdth = cyl))
# There is no `linewitdth` in `aes` of `geom_point` - scatter plot.

# Exercise 4
# If I am not misunderstanding, when using same variable in `aes` of `ggplot` and `geom_point`, it's also the problem of local and global level.
# For this case, the global level is set by `ggplot` and should be shown in the plot.
ggplot(mpg, aes(y = hwy, x = displ)) +
  geom_point(aes(x = displ, y = hwy))

# Exercise 5
ggplot(penguins, aes(y = bill_depth_mm, x = bill_length_mm)) +
  geom_point(aes(color = species))
# The plot shows that the relationship between bill length and bill depth is positive linear, and different species have different bill length and bill depth(can be divided by color).

# Exercise 6
ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm, y = bill_depth_mm,
    color = species, shape = species
  )
) +
  geom_point() +
  labs(color = "Species")
# The reason why chat above show two legend is `labs(color = "Species")`. Below is the correct code:
ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm, y = bill_depth_mm,
    color = species, shape = species
  )
) +
  geom_point()

# Exercise 7
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill")

ggplot(penguins, aes(x = species, fill = island)) +
  geom_bar(position = "fill")

# The two chats above is concerning the dependent variable and independent variable.
# The first chat is the proportion of each species on each island, and the second chat is the proportion of each island for each species.

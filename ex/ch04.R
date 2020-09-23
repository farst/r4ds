# 4.4 exercises
#1
my_variable <- 10
my_varıable
# on this machine works since I don't have the other keyboard, but there is a typo
# in the variable, `i` doesn't have a point

#2
library(tidyverse)
# NOT dota but data
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
# not fliter but filter and `=` is assignment but `==` is logical
filter(mpg, cyl == 8)
# not diamond but diamonds
filter(diamonds, carat > 3)

#3
# Help -> keyboardshortcuts help

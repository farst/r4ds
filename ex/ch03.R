# 3.2.4 exercises ----
#1
ggplot(data = mpg)
# you won't see anything because we didn't define any layer / mapping

#2
nrow(mpg)

#3
?mpg

#4
ggplot(data=mpg)+geom_point(aes(x=cyl, y=hwy))

#5
ggplot(data=mpg)+geom_point(aes(x=drv, y=class))
# it is a why question so difficult to answer but one could say because of 
# limited number of data-points and no literal relationship implied in the visualization

# 3.3.1 exercises ----
#1
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
# static color allocation has to happen out of the aes call
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

#2
mpg
# by just printing `mpg` in the console you could read types in the header of the
# data.frame. the typeof() function is also useful

#3
# color
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = cty))
# distribute the range of cont. variable over tones

# shape
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = cty))
# needs a level variable (discrete)

# size
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = cty))
# the radius of the blob changes over the range of cty

#4
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = hwy))
# aestically looks fine but technically it's redundancy and not recommended

#5
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, stroke = cyl))
# stroke controles the stroke size but without legend, similar to size but less useful

# 6
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))
# makes a separation according to the threshold, actually turns it to a logical

# 3.5.1 exercises
#1
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ cty, nrow = 2)
# might be too many levels nad break the limits or just be extremely fine-grained
# and not useful at all

#2
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl)) + facet_grid(drv ~ cyl)
# no data-point in that sub-group (combination)

#3
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
# `.` is a shortcut that prevents a subgrouping on the `.`-ed variable, if we do:
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ cyl, ncol = 4)
# we would plot the same, but we should now the number 4 before hand

#4
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
# when the data points are not supposed to be seen next to eachother and there 
# is a clean cut between certain groups in our probelm formulation it's good
# to use facet and see each group in it' own clean sheet, color is nice to put
# different groups together. also if the number of unique levels are limted faceting
# otherwise it's less useful

#5
# ncol and nrow conrol number of columns and rows in the faceted plot,
# in facet_grid() rows and columns aerr mapped to 2 different variables

#6
# because it determines the number of cols and we use a wide screen normally

# 3.6.1 exercises
#1
geom_line(); geom_boxplot(); geom_histogram(); geom_area()

#2
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

#3
# hides legend

#4
# presents se represents standard error

#5
# they share the exact same data and mapping, also the order of layers are same

#6
p1 <- ggplot(mpg, aes(x=displ, y=hwy))
p1+geom_point()+geom_smooth(se=F, color="blue")
p1+geom_point()+geom_smooth(aes(group=drv),se=F,color="blue")
p1+geom_point(aes(color=drv))+geom_smooth(aes(group=drv,color=drv),se=F)
p1+geom_point(aes(color=drv))+geom_smooth(color="blue",se=F)
p1+geom_point(aes(color=drv))+geom_smooth(aes(group=drv,linetype=drv),se=F)
p1+geom_point(color="white", size=4)+geom_point(aes(color=drv))

# 3.8.1 exercises
#1
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point(position = "jitter")
# the problem has been noted in the previous paragraph. some data points are on top
# eachother

#2
?geom_jitter
# read `hight` and `width`

#3
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_jitter()
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_count()
# geom count is a shortcut to use the frequency as size so `stat` is not identity

#4
?geom_boxplot
# the default is `dodge`
ggplot(data = mpg, mapping = aes(x = cty, y =hwy)) + 
  geom_boxplot(aes(group = drv))

#3.9.1 exercises
#1
ggplot(data = mpg, mapping = aes(x = cty, y = hwy))+
  geom_col(aes(group=drv), position = "stack")+
  coord_polar()

#2
?labs

#3
?coord_quickmap
# quick is faster by cutting the corners
fr <- map_data("france")
ggplot(data = fr, aes(x= long, y=lat, group= group))+
  geom_polygon(color="red", fill="blue")+
  coord_quickmap()+theme_bw()

#4
#coord_fixed() keeps the aspect ration fixed
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  coord_fixed()
# geom_abline() fits a straght line between points

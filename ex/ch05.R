library(tidyverse)
library(nycflights13)
View(flights)

# 5.2.4 exercises
#1
filter(flights, arr_delay >= 120)
filter(flights, dest %in% c("IAH", "HOU"))
filter(flights, carrier %in% c("UA", "DL"))
filter(flights, month %in% c(7,8,9))
filter(flights, arr_delay > 120 & dep_delay <= 0)
filter(flights, arr_delay < 30 & dep_delay >= 60)
filter(flights, dep_time >= 0 & dep_time <= 600)

#2
?between
filter(flights, between(dep_time, 0, 600))

#3
filter(flights, is.na(dep_time))
# they are canceled flighta

#4
# NA^0 is 1 by mathematical defenition
# NA | TRUE = (TRUE | TRUE) | (FALSE | TRUE) which is always TRUE
# FALSE & NA = (FALSE & FALSE) | (TRUE | FALSE) which is always FALSE
# it goes back to calculus -> limits (in the case of NA * 0, NA might represent inf)

# 5.3.1 exercises
#1
df <- tibble(x = c(5, 2, NA))
arrange(df, desc(is.na(x)))

#2
arrange(flights, desc(dep_delay), dep_time)

#3
arrange(flights, desc(distance), air_time)

#4
arrange(flights, desc(distance))
arrange(flights, distance)

# 5.4.1 exercises
#1
select(flights, dep_time, dep_delay, arr_time, arr_delay)

#2
select(flights, dep_time, dep_delay,dep_delay, arr_time, arr_delay)
#noting

#3
?one_of
vars <- c("year", "month", "day", "dep_delay", "arr_delay")
select(flights, one_of(vars))
# it helps when the tibble doesn't have one of vars then the code can continue

#4
select(flights, contains("TIME"))
select(flights, contains("TIME", ignore.case = FALSE))

# 5.5.2 exercises
#1
flightsSmall <- select(flights, dep_time, sched_dep_time)
mutate(flightsSmall,
       dep_time_min = (dep_time %/% 100) * 60 + (dep_time %% 100),
       sched_dep_time_min = (sched_dep_time %/% 100) * 60 + (sched_dep_time %% 100)
         )

#2
flightsSmall <- select(flights, dep_time, arr_time, air_time)
mutate(flightsSmall,
       dep_time_min = (dep_time %/% 100) * 60 + (dep_time %% 100),
       arr_time_min = (arr_time %/% 100) * 60 + (arr_time %% 100),
       air_time_calc = arr_time_min - dep_time_min
       )
#3
flightsSmall <- select(flights, dep_time, sched_dep_time, dep_delay)
mutate(flightsSmall,
       dep_time_min = (dep_time %/% 100) * 60 + (dep_time %% 100),
       sched_dep_time_min = (sched_dep_time %/% 100) * 60 + (sched_dep_time %% 100),
       dep_delay_calc = dep_time_min - sched_dep_time_min
)

#4
?min_rank

delayRankedFlights <- mutate(flights,
       dep_delay_rank =min_rank(desc(dep_delay)),
       arr_delay_rank =min_rank(desc(arr_delay))
       )
arrange(delayRankedFlights, arr_delay_rank, dep_delay_rank)

#5
1:3 + 1:10
# an error because `+` is valid for vectors of the same lenghts or a vector of the
# length 1 and an arnitarary vector

#6
?Trig



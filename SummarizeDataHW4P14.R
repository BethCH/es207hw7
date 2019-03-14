# Elizabeth Clifton Holcomb
# March 13, 2019
# ES 207
# HW4 P14


## 14. Write a function to calculate the ANNUAL (calendar year) mean, 
## median, max and min of all sites that have “San” or “Santa” in their name.

# combines daily data by site
colnames(loc)[1] <- "site"
daily.site <- daily %>%
  left_join(loc, by = "site")
daily.site

# finds all the San and Santa s
San1 <- c("Santa", "San")
San_tas1 <- str_c(San1, collapse = "|")
AllSans1 <- str_subset(daily.site$'Site Name', San_tas1)
AllSans1
unique(AllSans1)

# daily data >> pick all the San and Santa >> to feed into actual analysis 
# apply mean, median, max, min

P14 <- function(x) {
  library(tidyverse)
  library(readxl)
  loc <- read_excel("data/ca_ozone/location.xls")
  loc
  colnames(loc)[1] <- "site"
  daily.site <- daily %>%
    left_join(loc, by = "site")
  daily.site
  P14annual <- filter(x, str_detect('Site Name', "San|Santa")) 
  # filter by site name
  P14annual %>%
    group_by(Year = str_sub( as.factor(date), start = 1, end = 4), 'Site Name', site) %>%
    summarize (o3_mean = mean(o3, na.rm = TRUE), o3_median = median(o3, na.rm = TRUE), o3_max = max(o3, na.rm = TRUE), o3_min = min(o3, na.rm = TRUE))
}
# take P14annual and filter, group, filter, summarize(do mean, median, min, and max)
P14a <- P14(daily.site)
```





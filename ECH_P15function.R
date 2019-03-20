library(data.table)
daily4 <- o3.filelist %>%
  rbindlist() %>%
  group_by(site = as.factor(site), date) %>%
  summarize(o3 = mean(obs, na.rm = TRUE))
daily4
loc1 <- read_excel("data/ca_ozone/location.xls")
colnames(loc1)[1] <- "site"
daily.site1 <- daily4 %>%
  left_join(loc1, by = "site")
daily.site1
P15 <- function(x,y) {
  county <- as.character(y)
  data <- filter(x, str_detect('County Name', county)) 
  data %>%
    group_by(year = str_sub(as.factor(date), start = 1, end = 4)) %>%
    summarize(An_o3_mean = mean(o3, na.rm = TRUE))
}
I do not have many comments, except you could probably omit the str_sub(as.factor(date)....part of the function to just group by year(date).
I really like the x,y, component of this function and I think it is well written to use with any data set. 
P15a <- P15(daily.site1, 'Merced')
#ggplot(data=P15a) + geom_histogram(aes(An_o3_mean, group=year, #colour=StationCode), , subset = .(StationCode %in% c('Merced')), na.rm = TRUE)
```

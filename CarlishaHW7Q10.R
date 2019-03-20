
## title: "HW Question #10"
## author: "Carlisha Hall"
## date: "March 12, 2019"
## output: github_document
  
  ###HW Question #10. Identify the number of sites that do not have a complete address 
## (full street address and zip code).

# i wish you had included the asignment of 'loc' so i could plug in a new csv without 
# creating any new variables or questioning what 'loc2' was selecting from
loc2<- select(loc, Address, `Zip Code`) 
str_subset(loc2$Address, "^[ABCDEFGHIJKLMNOQRSTUVWXYZP]") 
str_subset(loc2$`Zip Code`, "(^..$)|(^.$)|(^...$)|(^....$)")


# This is a really cool way to look for incomplete addresses!
  
# the only thing i think could improve on this is when i did it, 
# i created a function that pulled out all the addresses that didn't 
# start with a digit (str_detect(loc$Address, "^\\d") which may help in 
# not having to make sure you type each letter out (i do wonder if it's case sensitive, too).

# I also only counted the zip codes that only had 5 digits (loc$`Zip Code`,"\\d{5}")) 
# which is only a bit shorter than yours so it's not a huge difference. 
# though i do wonder if making the '5' a variable that could be assigned at the beginning of 
# the function would make it more useful!

## I'm not sure if this follows all the rules from the blog we read but it was really clear
## what your function is doing and i was able to understand it without notes

LocAddress <- length(loc$Address) - sum(str_detect(loc$Address, "^\\d") & str_detect(loc$`Zip Code`,"\\d{5}"), na.rm = TRUE)
# define LocAddress to take the Address variable in the loc (assigned above) and remove any address that doesn't start with a number (looking for ones without house numbers) and those that don't have 5 digits in the Zip Code variable (incomplete zip codes)
LocAddress
# show me what results


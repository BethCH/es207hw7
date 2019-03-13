# Elizabeth Clifton Holcomb
# March 13, 2019
# ES 207
# HW9 P10

# Find addresses that are incomplete
# Find street address rows that don't start with a number
# Find zip codes that have less than 5 rows


LocAddress <- length(loc$Address) - sum(str_detect(loc$Address, "^\\d") & str_detect(loc$`Zip Code`,"\\d{5}"), na.rm = TRUE)
# define LocAddress to take the Address variable in the loc (assigned above) and remove any address that doesn't start with a number (looking for ones without house numbers) and those that don't have 5 digits in the Zip Code variable (incomplete zip codes)
LocAddress
# show me what results


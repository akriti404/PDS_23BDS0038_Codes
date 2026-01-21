# Function to check whether a given year is a leap year
is_leap_year <- function(year) {
  if ((year %% 4 == 0 && year %% 100 != 0) || (year %% 400 == 0)) {
    return("The year is a leap year.")
  } else {
    return("The year is not a leap year.")
  }
}

# Test the function
print(is_leap_year(2024))  # Test with a leap year
print(is_leap_year(2023))  # Test with a common year
print(is_leap_year(2000))  # Test with a leap year divisible by 400
print(is_leap_year(1900))  # Test with a common year divisible by 100

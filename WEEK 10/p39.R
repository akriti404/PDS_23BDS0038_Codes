# Load the necessary library
library(dplyr)

# Create the Donors dataset
donors <- data.frame(
  DonorName = c("Alice Walton", "Jacqueline Mars", "Maria Franca Fissolo", 
                "Susanne Klatten", "Laurene Powell Jobs", "Francoise Bettencourt Meyers"),
  Email = c("alice.walton@gmail.com", "jacqueline.mars@gmail.com", "maria.franca.fissolo@gmail.com",
            "susanne.klatten@gmail.com", "laurene.powell.jobs@gmail.com", 
            "francoise.bettencourt.meyers@gmail.com")
)

# Create the Donations dataset
donations <- data.frame(
  DonorName = c("Maria Franca Fissolo", "Yang Huiyan", "Maria Franca Fissolo", 
                "Alice Walton", "Susanne Klatten", "Yang Huiyan"),
  Amount = c(100, 50, 75, 25, 100, 150),
  Date = as.Date(c("2018-02-15", "2018-02-15", "2018-02-15", 
                   "2018-02-16", "2018-02-17", "2018-02-18"))
)

# Perform Left Join
left_join_result <- left_join(donors, donations, by = "DonorName")
print("Left Join Result:")
print(left_join_result)

# Perform Right Join
right_join_result <- right_join(donors, donations, by = "DonorName")
print("Right Join Result:")
print(right_join_result)

# Perform Inner Join
inner_join_result <- inner_join(donors, donations, by = "DonorName")
print("Inner Join Result:")
print(inner_join_result)

# Perform Outer Join (Full Join)
outer_join_result <- full_join(donors, donations, by = "DonorName")
print("Outer Join Result:")
print(outer_join_result)

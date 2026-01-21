# Create vectors representing sensor readings for 60 minutes
temperature <- c(28, 29, 30, 31, 32, 33, 31, 30, 29, 28,
                 27, 28, 29, 30, 31, 32, 33, 34, 35, 34,
                 33, 32, 31, 30, 29, 28, 27, 26, 27, 28,
                 29, 30, 31, 32, 33, 34, 35, 36, 35, 34,
                 33, 32, 31, 30, 29, 28, 27, 26, 27, 28,
                 29, 30, 31, 32, 33, 34, 35, 34, 33, 32)

humidity <- c(45, 44, 43, 42, 41, 40, 39, 38, 37, 36,
              35, 36, 37, 38, 39, 40, 41, 42, 43, 44,
              45, 46, 47, 48, 49, 50, 49, 48, 47, 46,
              45, 44, 43, 42, 41, 40, 39, 38, 37, 36,
              35, 36, 37, 38, 39, 40, 41, 42, 43, 44,
              45, 46, 47, 48, 49, 50, 49, 48, 47, 46)

pressure <- c(1012, 1013, 1012, 1011, 1010, 1009, 1010, 1011, 1012, 1013,
              1014, 1015, 1014, 1013, 1012, 1011, 1010, 1009, 1008, 1009,
              1010, 1011, 1012, 1013, 1014, 1015, 1016, 1015, 1014, 1013,
              1012, 1011, 1010, 1009, 1008, 1007, 1008, 1009, 1010, 1011,
              1012, 1013, 1014, 1015, 1016, 1015, 1014, 1013, 1012, 1011,
              1010, 1009, 1008, 1007, 1008, 1009, 1010, 1011, 1012, 1013)

# Create time vector (minutes)
time <- 1:60

# 1. Calculate average reading for each sensor
avg_temperature <- mean(temperature)
avg_humidity <- mean(humidity)
avg_pressure <- mean(pressure)

cat("Average Temperature:", avg_temperature, "°C\n")
cat("Average Humidity:", avg_humidity, "%\n")
cat("Average Pressure:", avg_pressure, "hPa\n\n")

# 2. Identify time intervals where temperature > 30 and humidity < 40
condition_indices <- which(temperature > 30 & humidity < 40)

cat("Time intervals (minutes) where temperature > 30°C and humidity < 40%:\n")
print(condition_indices)

# 3. Plot sensor readings over time
plot(time, temperature, type = "l",
     xlab = "Time (minutes)", ylab = "Sensor Readings",
     main = "Sensor Readings Over Time")

lines(time, humidity)
lines(time, pressure)

legend("topright",
       legend = c("Temperature (°C)", "Humidity (%)", "Pressure (hPa)"),
       lty = 1)

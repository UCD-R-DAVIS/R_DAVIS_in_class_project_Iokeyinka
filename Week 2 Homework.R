set.seed(15) #computer pulls a number based on seed instead of randomly
hw2 <- runif(50, 4, 50) #numbers in total=50, min=4, max=50
hw2 <- replace(hw2, c(4,12,22,27), NA) #replaces vector values with NA
hw2 #makes the data appear


prob1 <- hw2[!is.na(hw2)]

prob1 <- prob1[prob1 > 14 & prob1 < 38]

times3 <- prob1*3

times3

plus10 <- times3+10

plus10

final <- plus10[c(TRUE, FALSE)]

final

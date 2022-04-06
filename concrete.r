library(class)
library(neuralnet)

set.seed(12345)

xor_dataframe <- data.frame(c(), c(), c())
xor_dataframe = rbind(xor_dataframe, c(0, 0, 0))
xor_dataframe = rbind(xor_dataframe, c(1, 0, 1))
xor_dataframe = rbind(xor_dataframe, c(0, 1, 1))
xor_dataframe = rbind(xor_dataframe, c(1, 1, 0))

names(xor_dataframe)[1]<-paste("input_a")
names(xor_dataframe)[2]<-paste("input_b")
names(xor_dataframe)[3]<-paste("output")

xor_model <- neuralnet(output ~ input_a + input_b, hidden = 5, data = xor_dataframe)

 # Use columns 1 through 2 (in other words, ignore the 3rd column)
model_results <- compute(xor_model, xor_dataframe[1:2])

predicted_strength <- model_results$net.result

predicted_strength

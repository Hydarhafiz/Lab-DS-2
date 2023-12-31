Churn_data = read.csv("C:/Users/hydar/Documents/Churn_Train.csv");
Churn_data

head(Churn_data)

# View the entire dataset in a data viewer
#View(Churn_data)

describe(Churn_data)

class(Churn_data$Total.Charges)

# Check for missing values in a specific column (e.g., column_name)
missing_values <- is.na(Churn_data$Total.Charges)

# Count the number of missing values in a specific column
sum(missing_values)

# Count the number of missing values in each column
colSums(is.na(Churn_data))

# Impute missing values in 'column_name' with the mean
Churn_data$Total.Charges[missing_values] <- mean(Churn_data$Total.Charges, na.rm = TRUE)


colSums(is.na(Churn_data))

#1. PERFORM UNIVAR ANALYSIS
#desc
describe(Churn_data)
describe(Churn_data, Internet.Service, Contract, Total.Charges)
describe(Churn_data, Internet.Service:Churn) #from internet service to churn
describe(Churn_data,(Internet.Service:Churn))

#normality
normality(Churn_data)
normality(Churn_data, Internet.Service, Contract, Total.Charges)
normality(Churn_data, Internet.Service:Churn) #from internet service to churn
normality(Churn_data,(Internet.Service:Churn))


#plot data
plot_normality(Churn_data, Internet.Service, Contract, Total.Charges)

#2. PERFORM DI/MULTIVAR ANALYSIS
#calc using corr
correlate(Churn_data)
correlate(Churn_data, Internet.Service, Contract, Total.Charges)
correlate(Churn_data, Internet.Service:Churn) #from internet service to churn
correlate(Churn_data,(Internet.Service:Churn))

#plot corr
Churn_data %>%
  correlate() %>%
  plot()

correlate(Churn_data, Internet.Service, Contract, Total.Charges) %>%
  plot()

#3. Perform EDA based on target variable

#when our target var is categ
categ <- target_by(Churn_data, Churn)

#EDA when target var is categ, predictor is num
cat_num <- relate(categ, Total.Charges)
cat_num
summary(cat_num)
plot(cat_num)

#EDA when target var is categ, predictor is categ
cat_cat = relate(categ, Payment.Method)
cat_cat
summary(cat_cat)
plot(cat_cat)

#EDA when target var is num, predictor is num
num <- target_by(Churn_data, Total.Charges)
num_num <- relate(num, Monthly.Charges)
num_num
summary(num_num)
plot(num_num)



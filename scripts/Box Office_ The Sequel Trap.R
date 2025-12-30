# Install ggplot2 package (used for plotting graphs)
install.packages("ggplot2")

# Load ggplot2 library into R session
library(ggplot2)

# -------------------- Data Architecture(Yash Raut) --------------------

getwd()

#Set working directory to folder where dataset is stored
setwd("/cloud/project/movies dataset")

data <- read.csv("IMDB-Top-250-Movies.csv")

#verify whether data loaded or not
View(data)
head(data)
str(data)

#Count missing (NA) values in each column
colSums(is.na(data))

# Show number of rows and columns in dataset
dim(data)

#Remove rows where budget or box_office is missing
data_clean <- data[!is.na(data$budget) & !is.na(data$box_office), ]

# Check dataset size after cleaning
dim(data_clean)

# Check remaining missing values after cleaning
colSums(is.na(data_clean))

# Count duplicate rows in original dataset
sum(duplicated(data))

# Create new column to identify sequels based on movie name
data_clean$is_sequel <- ifelse(grepl("2|II|III|IV|V|Part", data_clean$name),"Sequel", "Original")

# -------------------- Exploratory Insights(Anjali Yadav) --------------------
library(ggplot2) #Box plot

# Create boxplot comparing box office of Originals vs Sequels
ggplot(data_clean, aes(x = is_sequel, y = box_office, fill = is_sequel)) +
  geom_boxplot() +
  labs(
    title = "Box Office Performance: Originals vs Sequels",
    x = "Movie Type",
    y = "Box Office Collection"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

ggsave("budget_vs_box_office.png", width = 8, height = 5, dpi = 300)


# -------------------- Modeling Approach(Pragati Yadav) --------------------

# Install Random Forest package
install.packages("randomForest")

# Install caret package (used for data splitting and evaluation)
install.packages("caret")

library(randomForest)
library(caret)

colnames(data)

# Create sequel indicator again for modeling dataset
data$is_sequel <- ifelse(
  grepl("2|II|III|IV|V|Part", data$name, ignore.case = TRUE),
  "Sequel",
  "Original"
)

# Convert sequel variable into factor
data$is_sequel <- as.factor(data$is_sequel)

# Check count of sequels vs originals
table(data$is_sequel)

# Calculate median rating of movies
median_rating <- median(data$rating, na.rm = TRUE)

# Create target variable: High or Low rating based on median
data$rating_level <- ifelse(
  data$rating >= median_rating,
  "High",
  "Low"
)

# Convert target variable to factor
data$rating_level <- as.factor(data$rating_level)

# Select only required columns for modeling
model_data <- data[, c(
  "rating",
  "year",
  "budget",
  "box_office",
  "is_sequel",
  "rating_level"
)]

#already did above again did as a best Practice
model_data <- na.omit(model_data)
dim(model_data)

# -------------------- Train-Test Split --------------------
library(caret)

# Set seed for reproducibility
set.seed(123)

# Split data into 70% training and 30% testing
train_index <- createDataPartition(
  model_data$rating_level,
  p = 0.7,
  list = FALSE
)

# Create training dataset
train_data <- model_data[train_index, ]
test_data  <- model_data[-train_index, ]

# -------------------- Random Forest Model(Yash Telge) --------------------
library(randomForest)

# Train Random Forest model using training data
rf_model <- randomForest(
  rating_level ~ .,        # Predict rating level using all features
  data = train_data,
  ntree = 300,             # Number of trees
  importance = TRUE        # Enable feature importance
)

# -------------------- Model Evaluation(Rajnish Yadav) --------------------

# Predict rating level for test data
predictions <- predict(rf_model, test_data)

# Create confusion matrix to evaluate model performance
confusionMatrix(predictions, test_data$rating_level)

# Plot feature importance from Random Forest
varImpPlot(rf_model) #RF model plotted

# View cleaned dataset
View(data_clean)








read_file <- function(file)
{
  df <- read.csv(file)
  df <- df[, c("Date", "Adj.Close")]                      # grab Date & Adj.Close
  df <- df[df$Adj.Close != "null", ]                      # remove null values
  df$Date <- as.Date(df$Date)
  rownames(df) <- df$Date
  df$Adj.Close <- as.numeric(as.character(df$Adj.Close))  # values to numeric
  df_count = nrow(df)
  df$Return <- c(df$Adj.Close[2:df_count]/df$Adj.Close[1:df_count-1] - 1, 0)
  df <- head(df, -1)
}

file_names <- dir(path = paste(getwd(), "/assets", sep=""), full.names = TRUE, pattern = "*.csv")

assets <- dir(path = paste(getwd(), "/assets", sep=""), full.names = FALSE, pattern = "*.csv")

length_assets = length(assets)

df_corr <- data.frame(matrix(ncol=length_assets, nrow=length_assets))

colnames(df_corr) <- assets
rownames(df_corr) <- assets

df_beta <- df_corr

for (i in 1:length(file_names))
{
  for (j in 1:length(file_names))
  {
    file_a <- file_names[i]
    file_b <- file_names[j]
    df_a <- read_file(file_a)
    df_b <- read_file(file_b)
    merged <- merge(x = df_a, y = df_b, by="row.names")
    merged <- tail(merged, 60)
    model <- lm(merged$Return.x ~ merged$Return.y)
    summary <- summary(model)
    p = summary$coefficients[2, 4]
    corr = cor(merged$Return.x, merged$Return.y)
    df_corr[i, j] <- round(corr, 2)
  }
  
  file_b <- file_names[2]
  df_b <- read_file(file_b)
  
  merged <- merge(x = df_a, y = df_b, by="row.names")
  merged <- tail(merged, 60)
  
  model <- lm(merged$Return.x ~ merged$Return.y)
  summary <- summary(model)
  beta = summary$coefficients[2, 1]
  df_beta[i, 2] <- round(beta, 2)
}

print (df_corr)

print (df_beta)



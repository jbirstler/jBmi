#' Calculate Z-score of BMI or weight-for-age
#'
#' @param age Age in months. Must be integer-values from 0 to 240.
#' @param sex Sex. Must be "Male"/"Female"
#' @param bmi BMI in kg/m^2 or weight-for-age in kg.
#' @return A vector of Z-Scores.
#' @seealso \code{\link{chart}} for information about how Z-Scores and percentiles are calculated.
#' @export
#' @examples
#' data(nhanes)
#' nhanes$bmi <- with(nhanes, calcBMI(height, weight, age))
#' with(nhanes, calcZScore(age, sex, bmi))

# age in months, height m, weight kg, sex Male/Female
# use conv_unit if your data is otherwise
calcZScore <- function(age, sex, bmi) {
  if (length(unique(sapply(X = as.list(environment()), FUN = length))) != 1) {
    warning("Arguments must be the same length.")
  }
  
  if (max(age) > 20*12) {
    message("Z-Scores not meaningful for adults - returning NAs.")
  }
  
  # this function works for under 20yr
  age <- ifelse(age < 0 | age > 20*12,
                NA,
                age)
  
  # get the L, M, S values for each child in our data
  these <- match(x = interaction(age, sex), table = interaction(chart$Agemos, chart$Sex))
  # simple match example:
  # match(x = c(0:4, 3), table = 1:10) 
  
  # calculate Z
  with(chart[these,],
       ((bmi/M)^L - 1)/(L*S))
}
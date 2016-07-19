#' Validate data 
#' 
#' The function returns `FALSE` when:
#' \itemize{
#'   \item Age is 24 months or greater and BMI is less than 6 or greater than 100
#'   \item Age is between 24 and 240 months inclusively, and Z-Score is less than -4 or greater than 5
#'   \item Age is less than 24 months and Z-Score is less than -6 or greater than 5
#' }
#' 
#' @param age Age in months
#' @param bmi BMI in kg/m^2 or weight-for-age in kg
#' @param zscore Z-Score of BMI or weight-for-age
#' @return A logical vector that answers the question, are the data validated?
#' @export
#' @examples
#' data(nhanes)
#' nhanes$bmi <- with(nhanes, calcBMI(height, weight, age))
#' nhanes$zscore <- with(nhanes, calcZScore(age, sex, bmi))
#' nhanes$valid <- with(nhanes, isValid(age, bmi, zscore))
#' table(nhanes$valid)
#' nhanes[!nhanes$valid,]

isValid <- function(age, bmi, zscore) {
  if (length(unique(sapply(X = as.list(environment()), FUN = length))) != 1) {
    warning("Arguments must be the same length.")
  }
  
  # innocent until proven guilty
  valid <- rep(TRUE, length(bmi))
  
  valid[which((age >=24) & (bmi < 6 | bmi > 100))] <- FALSE
  valid[which((age >=24 & age <= 240) & (zscore < -4 | zscore > 5))] <- FALSE
  valid[which((age < 24) & (zscore < -6 | zscore > 5))] <- FALSE
  
  valid
}
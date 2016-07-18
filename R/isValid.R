#' Validate weight measurements by common protocols
#' 
#' @param height Height in meters
#' @param weight Weight in kilograms
#' @param age Age in months
#' @param sex Sex
#' @return A logical vectore
#' @export
#' @examples
#' data(nhanes)
#' with(nhanes, calcBMI(height, weight, age))

# height m, weight kg, age in months
isValid <- function(height, weight, age, sex) {
  if (length(unique(sapply(X = as.list(environment()), FUN = length))) != 1) {
    warning("Arguments must be the same length.")
  }
  
  bmi <- calcBMI(height, weight, age)
  zscore <- calcZScore(age, sex, bmi)
  
  # innocent until proven guilty
  valid <- rep(TRUE, length(bmi))
  
  valid[which((age >=24) & (bmi < 6 | bmi > 100))] <- FALSE
  valid[which((age >=24 & age <= 240) & (zscore < -4 | zscore > 5))] <- FALSE
  valid[which((age < 24) & (zscore < -6 | zscore > 5))] <- FALSE
  
  valid
}
#' Calculate BMI
#'
#' \code{height} and \code{weight} are required arguments. If \code{age} is supplied,
#' then weight-for-age will be calculated for ages less than 24 months.
#' 
#' @param height Height in meters
#' @param weight Weight in kilograms
#' @param age Age in months
#' @return A vector with BMI in kg/m^2 or weight-for-age in kg.
#' @export
#' @examples
#' data(nhanes)
#' with(nhanes, calcBMI(height, weight, age))

# age in months, height m, weight kg
calcBMI <- function(height, weight, age = rep(NA, length = length(height))) {
  if (length(unique(sapply(X = as.list(environment()), FUN = length))) != 1) {
    warning("Arguments must be the same length.")
  }
  
  ifelse((age >= 24) | (is.na(age)), weight/height^2, weight)
}
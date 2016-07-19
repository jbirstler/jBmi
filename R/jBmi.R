#' jBmi: Calculate BMI and Z-Scores based on CDC growth charts
#'
#' jBmi makes it easy to compare weights between children.
#' Measurements of weight such as weight-for-age and BMI are not standardized. 
#' For example, a BMI of 23 for a 10 year old male is in the obese category
#' while the same BMI for a 15 year old male is in the healthy weight category.
#' Therefore, BMI cannot be compared across ages.
#' Additionally, BMI is not meaningful for children under 24 months; weight-for-age is used instead. 
#' Since the interpretation of BMI varies by age and sex, the CDC recommends using BMI percentiles.
#' 
#' This package includes the functions necessary to translate height, weight, age and sex data to
#' meaningful and interpretable percentiles.
#' 
#' For more information about child and teen BMI, please visit
#' \href{http://www.cdc.gov/healthyweight/assessing/bmi/childrens_bmi/about_childrens_bmi.html}{CDC: About Child & Teen BMI}
#' 
#' To learn more about jBmi, start with the vignette:
#' \code{vignette(topic = "introduction", package = "jBmi")}
#'
#' @docType package
#' @name jBmi
NULL
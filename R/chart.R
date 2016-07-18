#' Growth chart for ages 0 to 20 (0 to 240 months)
#' 
#' This chart contains the BMI charts for ages 2 to 20 years (24 months to 240 months) and
#' the weight-for-age charts for ages 0 to 2 (0 months to 23 months).
#' The chart includes L, M, and S parameter values used to calculate the Z-Scores.
#' Information about these values can be found on the CDC web page,
#' \href{http://www.cdc.gov/growthcharts/percentile_data_files.htm}{Percentile Data Files with LMS Values}.
#'
#' These are the growth charts released on May 30, 2000.
#' 
#' @format
#' \describe{
#'  \item{Sex}{Sex}
#'  \item{Agemos}{Age in months}
#'  \item{L}{power in the Box-Cox transformation}
#'  \item{M}{median}
#'  \item{S}{generalized coefficient of variation}
#' }
"chart"
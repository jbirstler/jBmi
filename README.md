
<!-- README.md is generated from README.Rmd. Please edit that file -->
jBmi
====

jBmi makes it easy to compare weights between children. Measurements of weight such as weight-for-age and BMI are not standardized. For example, a BMI of 23 for a 10 year old male is in the obese category while the same BMI for a 15 year old male is in the healthy weight category. Therefore, BMI cannot be compared across ages. Additionally, BMI is not meaningful for children under 24 months; weight-for-age is used instead. Since the interpretation of BMI varies by age and sex, the CDC recommends using BMI percentiles.

This package includes the functions necessary to translate height, weight, age and sex data to meaningful and interpretable percentiles.

For more information about child and teen BMI, please visit [CDC: About Child & Teen BMI](http://www.cdc.gov/healthyweight/assessing/bmi/childrens_bmi/about_childrens_bmi.html).

Install
-------

You can install the latest development version from github:

``` r
devtools::install_github("jbirstler/jBmi")
```

By default, vignettes are not created. If you'd like to view vignettes, install with:

``` r
devtools::install_github("jbirstler/jBmi", build_vignettes = TRUE)
```

To learn more about jBmi, start with the vignette:

``` r
vignette(topic = "introduction", package = "jBmi")
```

Example
-------

What is the BMI, Z-Score, and BMI-percentile for a 13 yr old female weighing 112 lbs with height 5'4"?

jBmi uses metric units and age in months. If your data are in other units, I recommend using `conv_unit()` in the `birk` package.

``` r
(bmi <- calcBMI(height = 1.63, weight = 50.8, age = 156))
#> [1] 19.12003
(zscore <- calcZScore(age = 156, sex = "Female", bmi = bmi))
#> [1] 0.1318479
(percentle <- pnorm(zscore))
#> [1] 0.5524477
```

Etymology
---------

My name is **J**en. This package is about body mass index, **BMI**. The first programming language I used was JavaScript, in which I primarily used the **jQ**uery library. Everything I write is **jBirscript**.

\[\text{jBmi} = \text{lowerCamelCase}(\text{Jen} + \text{BMI})\]

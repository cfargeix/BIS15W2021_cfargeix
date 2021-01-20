---
title: "Lab 3 Homework"
author: "Claire Fargeix"
date: "2021-01-19"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---

## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the tidyverse

```r
library(tidyverse)
```

## Mammals Sleep
1. For this assignment, we are going to use built-in data on mammal sleep patterns. From which publication are these data taken from? Since the data are built-in you can use the help function in R.
_The data are taken from A quantitative, theoretical framework for understanding mammalian sleep by V. M. Savage and G. B. West._

```r
?msleep
```

```
## starting httpd help server ... done
```

2. Store these data into a new data frame `sleep`.

```r
sleep <- data.frame(msleep)
```

3. What are the dimensions of this data frame (variables and observations)? How do you know? Please show the *code* that you used to determine this below.
_The dimensions are 83 x 11._

```r
dim(sleep)
```

```
## [1] 83 11
```

4. Are there any NAs in the data? How did you determine this? Please show your code. 
_Yes there's at least 1 NA in the data. I found this by using the anyNA command._

```r
anyNA(sleep)
```

```
## [1] TRUE
```

5. Show a list of the column names is this data frame.

```r
names(sleep)
```

```
##  [1] "name"         "genus"        "vore"         "order"        "conservation"
##  [6] "sleep_total"  "sleep_rem"    "sleep_cycle"  "awake"        "brainwt"     
## [11] "bodywt"
```

6. How many herbivores are represented in the data?  
_There are 32 herbivores represented in the data._

```r
table(sleep$vore)
```

```
## 
##   carni   herbi insecti    omni 
##      19      32       5      20
```

7. We are interested in two groups; small and large mammals. Let's define small as less than or equal to 1kg body weight and large as greater than or equal to 200kg body weight. Make two new dataframes (large and small) based on these parameters.

```r
large <- subset(sleep, bodywt >= 200)
small <- subset(sleep, bodywt <= 1)
```

8. What is the mean weight for both the small and large mammals?
_The mean weight for the large animals is 1747 kg and for the small ones is 0.26 kg._

```r
mean(large$bodywt)
```

```
## [1] 1747.071
```


```r
mean(small$bodywt)
```

```
## [1] 0.2596667
```

9. Using a similar approach as above, do large or small animals sleep longer on average?  
_On average, the smaller animals sleep for longer._

```r
mean(large$sleep_total)
```

```
## [1] 3.3
```


```r
mean(small$sleep_total)
```

```
## [1] 12.65833
```

10. Which animal is the sleepiest among the entire dataframe?
_The sleepiest animal in the entire dataframe is the little brown bat._

```r
table(sleep$sleep_total)
```

```
## 
##  1.9  2.7  2.9    3  3.1  3.3  3.5  3.8  3.9    4  4.4  5.2  5.3  5.4  5.6  6.2 
##    1    1    1    1    1    1    1    1    1    1    1    1    2    1    1    1 
##  6.3    7  7.7    8  8.3  8.4  8.6  8.7  8.9  9.1  9.4  9.5  9.6  9.7  9.8   10 
##    2    1    1    1    1    2    1    2    1    2    2    1    1    1    2    1 
## 10.1 10.3 10.4 10.6 10.9   11 11.1 11.3 11.5 12.1 12.5 12.8   13 13.5 13.7 13.8 
##    3    2    1    1    1    2    1    1    1    1    4    2    1    1    1    1 
## 14.2 14.3 14.4 14.5 14.6 14.9 15.6 15.8 15.9 16.6   17 17.4   18 18.1 19.4 19.7 
##    1    1    2    1    1    2    1    2    1    1    1    1    1    1    1    1 
## 19.9 
##    1
```


```r
sleepiest <- subset(sleep, sleep$sleep_total >= 19.9)
sleepiest
```

```
##                name  genus    vore      order conservation sleep_total
## 43 Little brown bat Myotis insecti Chiroptera         <NA>        19.9
##    sleep_rem sleep_cycle awake brainwt bodywt
## 43         2         0.2   4.1 0.00025   0.01
```

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.   

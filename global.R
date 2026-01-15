library(ggplot2)
library(shiny)
library(plotly)
library(stargazer)
library(compare)
library(rms)

#######################################################
#### Before publishing your dynamic nomogram:
####
#### - You may need to edit the following lines if
#### data or model objects are not defined correctly
#### - You could modify ui.R or server.R for
#### making any required changes to your app
#######################################################

load('data.RData')
source('functions.R')
mydata=data
t.dist <- datadist(mydata)
options(datadist = 't.dist')
m.summary <- 'raw'
covariate <- 'slider'
clevel <- 0.95

### Please cite the package if used in publication. Use:
# Jalali A, Alvarez-Iglesias A, Roshan D, Newell J (2019) Visualising statistical models using dynamic nomograms. PLOS ONE 14(11): e0225253. https://doi.org/10.1371/journal.pone.0225253


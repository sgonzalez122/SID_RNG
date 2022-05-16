#File: SID_RNG.R
#Programer: Stephen A. Gonzalez
#Date Created: 10/18/2019
#Purpose: This program will read in excisting subject ID's (SID) for an existing project and generate a new randomly generated unique SID,
##         based on the SID's that are already currently in use for a particular project. 


rm(list = ls())  #Clear workspace

#Read in Data
library(readxl)
Data <- read_excel("/Users/sgonzalez/Documents/a_Tasks_Experiments/aDDM_win_loss_lottery/Excel_Sheets/subject_demographics.xlsx")
#Data <- read_excel("/Volumes/SAG/aDDM_win_loss_lottery/Excel_Sheets/subject_demographics.xlsx")
attach(Data)


Data_ID <- data.frame(na.omit(Data[,1]))          #Remove NA whitespace from vector and formats into a data frame
Data_ID <- data.frame(sort(Data_ID[,1]))          #Sorts SID in order of lowest to highest  
colnames(Data_ID) <- "Demo_ID"                     #Resets the Column name to whatever you want


x <- sample(1000:9999,1)                            #Randomly sample an integer between 1000 and 9999
y <- Data_ID                                       #Set SID's to y variable
i = 1                                               #Initialize i = 1
j = 1                                               #Initialize j = 1
double_check <- cbind(1:length(Data_ID[,1]))       #Initialize variable: create a vector the size of the SID vector

for(j in 1:length(y[,1])){
  repeat{                                           #Repeat RNG if X is present in Y, break is X is not present in Y
      for(i in 1:length(y[,1])){
        if (x == y[i,1]){                           #Evaluate if X equals Y at each element of Y
          x <- sample(1000:9999,1)                  #If TRUE, then re-run the RNG
        } 
      }
    if (x != y[j,1]){                               #Evaluate if X IS NOT equal to Y at each element of Y
      break                                         #If TRUE, then break the repeat loop
    }
  }
  double_check[j,1] <- x == y[j,1]                  #Evaluate if X equals Y at each element of Y and assign it to double_check
}

x #New SID
sum(double_check) #Double Check                     #Checks TRUE/FALSE statments
                                                    #Use this as a double check that the RGN is indeed a unique integer
                                                    #If sum(a) = 0 than RNG is unique /// If sum(a) = 1 than RNG is not unique
                                                    #printing double_check will show a vecotor of TRUE/FALSE statements.
                                                    #1's will appear where X is equivalent to Y
                                                  

  
  



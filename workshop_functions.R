# Package names
packages <- c("tidyverse", 
              "janitor", 
              "lubridate")

# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# Packages loading
invisible(lapply(packages,
                 library,
                 character.only = TRUE))

### Functions ###

# Creates a ymdh column from the storms dataset
storms_ymdh <- function(DATA){
  DATA %>%
    unite("ymd", c(year, month, day), sep = "-", remove = FALSE) %>%
    unite("ymdh", c(ymd, hour), sep = "T", remove = FALSE) %>%
    mutate(ymdh = ymd_h(ymdh),
           year = factor(year))%>%
    mutate(month_word = case_when(month == 1 ~ "January", 
                             month == 2 ~ "February", 
                             month == 3 ~ "March", 
                             month == 4 ~ "April", 
                             month == 5 ~ "May", 
                             month == 6 ~ "June", 
                             month == 7 ~ "July", 
                             month == 8 ~ "August", 
                             month == 9 ~ "September", 
                             month == 10 ~ "October", 
                             month == 11 ~ "November", 
                             month == 12 ~ "December"),
           month_word = factor(month_word,
                          levels = c("December",
                                     "November",
                                     "October",
                                     "September",
                                     "August",
                                     "July",
                                     "June",
                                     "May",
                                     "April",
                                     "March",
                                     "February",
                                     "January")))
}

# Function to plot PSMC using .psmc output
# Modified from https://github.com/elhumble/SHO_analysis_2020/blob/master/scripts/plot_psmc.R

psmc.result<-function(file,i.iteration=25,mu=1e-8,s=100,g=4)
{
  X<-scan(file=file,what="",sep="\n",quiet=TRUE)
  
  # extract data for each iteration (30)
  
  START<-grep("^RD",X) # line numbers
  END<-grep("^//",X) # line numbers
  
  X<-X[START[i.iteration+1]:END[i.iteration+1]]
  
  TR<-grep("^TR",X,value=TRUE) # \theta_0 \rho_0
  RS<-grep("^RS",X,value=TRUE) # k t_k \lambda_k \pi_k \sum_{l\not=k}A_{kl} A_{kk}
  
  write(TR,"temp.psmc.result")
  theta0<-as.numeric(read.table("temp.psmc.result")[1,2])
  N0<-theta0/(4*mu)/s # scale 
  
  write(RS,"temp.psmc.result")
  a<-read.table("temp.psmc.result")
  Generation<-as.numeric(2*N0*a[,3])
  Ne<-as.numeric(N0*a[,4])
  
  a$Generation<-as.numeric(2*N0*a[,3])
  a$Ne<-as.numeric(N0*a[,4])
  
  file.remove("temp.psmc.result")
  
  n.points<-length(Ne)
  
  YearsAgo<-c(as.numeric(rbind(Generation[-n.points],Generation[-1])),
              Generation[n.points])*g
  Ne<-c(as.numeric(rbind(Ne[-n.points],Ne[-n.points])),
        Ne[n.points])
  
  data.frame(YearsAgo,Ne,mu,g)
  #plot(Ne~YearsAgo)
}


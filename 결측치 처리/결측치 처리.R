data("airquality")

## 결측치가 가장 많은 관측지의 해당 변수를 0으로 채워주기
df<-airquality
str(df)
head(df)
summary(df)
df$Ozone_new<-ifelse(is.na(df$Ozone),0,df$Ozone)
summary(df)

#1. 평균간의 차이구하기
mean_Ozone<-mean(df$Ozone, na.rm=TRUE)
mean_Ozonw_new<-mean(df$Ozone_new)
print(mean_Ozone - mean_Ozonw_new)

#2. x변수를 minmax 정규화, z정규화를 하고 둘의 평균차 비교
#minmax정규화
s1<-(df$Wind - min(df$Wind))/(max(df$Wind) - min(df$Wind))
#z정규화
s2<-(df$Wind - mean(df$Wind))/sd(df$Wind)

df_new<-transform(df,minmax=s1, z=s2)
head(df_new)
print(mean(df_new$minmax)-mean(df_new$z))


#3.월 평균 기온구하기
install.packages('magrittr')
library(magrittr)
install.packages('plyr')
library(plyr)
install.packages('dplyr')
library(dplyr)
monthy_mean<-df %>% group_by(Month = df$Month) %>% summarise(Temp =mean(Temp))
print(monthy_mean)
monthy_mean          






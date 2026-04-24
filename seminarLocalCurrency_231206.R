library(car)
library(dplyr)
library(ggplot2)
library(plm)
library(stargazer)

##데이터 불러오기
d7 = read.csv('C:/Users/HOME/Desktop/경제문제세미나/df.csv', 
              fileEncoding = "euc-kr")

##시점 숫자형->문자형 변환
d7$시점 = as.character(d7$시점)
d7$시점 = ifelse(d7$시점 == '2019.1','2019.10',d7$시점)
d7$시점 = ifelse(d7$시점 == '2020.1','2020.10',d7$시점)
d7$시점 = ifelse(d7$시점 == '2021.1','2021.10',d7$시점)
d7$시점 = ifelse(d7$시점 == '2022.1','2022.10',d7$시점)

##패널 데이터 형태로 변환
p_d7 = pdata.frame(d7, index=c("시도","시점"))
p_d7_2 = pdata.frame(d7[d7$시도!="대전",], index=c("시도","시점")) #대전 제외

write.csv(p_d7_2, 'C:/Users/HOME/Desktop/경제문제세미나/final_df.csv', row.names = F)

cor22 = cor(p_d7_2[,c(5,2,6,7,8,12,13)])

hist(p_d7_2$체감BSI, xlab="소상공인 체감 BSI", main="Histogram")
qqnorm(p_d7_2$체감BSI)

shapiro.test(p_d7_2$체감BSI)
shapiro.test(p_d7_2$사용액)
shapiro.test(p_d7_2$대형소매점판매지수) #정규성 따름
shapiro.test(p_d7_2$소비자물가지수)
shapiro.test(p_d7_2$동행종합지수)
shapiro.test(p_d7_2$인구대비업체수)
shapiro.test(p_d7_2$소비자심리지수)

###기술통계

d7_2 = d7[d7$시도!="대전",]
summary_pay = d7_2 %>% 
  group_by(시도) %>% 
  summarise(N=n(),
            Min=min(시점),
            Max=max(시점))

stargazer(summary_pay, summary=F, type="html", out="기초통계1.doc")
stargazer(p_d7_2, type="html", out="기초통계2.doc")
stargazer(vif22, summary=F, type="html", out="다중공선.doc")
stargazer(cor22, summary=F, type="html", out="상관분석.doc")

###################
##임의효과, 고정효과 모형 설계
plm_rd = plm(체감BSI~log(사용액) + 대형소매점판매지수 + 소비자심리지수 + 
              소비자물가지수 + 동행종합지수 + 인구대비업체수, 
            data=p_d7_2, model = "random") #random
plm_wi = plm(체감BSI~log(사용액) + 대형소매점판매지수 + 소비자심리지수 + 
              소비자물가지수 + 동행종합지수 + 인구대비업체수, 
            data=p_d7_2, model = "within") #within

plm_fd = plm(체감BSI~log(사용액) + 대형소매점판매지수 + 소비자심리지수 + 
              소비자물가지수 + 동행종합지수 + 인구대비업체수, 
            data=p_d7_2, model = "fd") #fd

plm = plm(체감BSI~log(사용액) + 소비자심리지수 + 
            소비자물가지수 + 인구대비업체수 + as.factor(시점), 
          data=p_d7_2, model = "within")
summary(plm)

summary(step(plm_fd, direction="forward"))

##하우스만 검정 - H0: 임의효과 모형이 적절하다 -> 기각: 고정효과 모형이 적절
phtest(plm_rd, plm_wi)
phtest(plm_rd, plm_fd)

stargazer(plm_fd_22, type="html", out="패널비교2.doc")

plm_fd_22 = plm(체감BSI~log(사용액) + 대형소매점판매지수 + 소비자심리지수, 
    data=p_d7_2, model = "fd")

##고정효과 모형
summary(plm_wi)
summary(plm_fd) #within모다 fd 결과가 더 좋음

vif(plm_fd) #다중공선성 모두 괜찮음
vif22 = as.data.frame(vif(plm_fd))
colnames(vif22)="vif"

##fd 모형 중 모든 회귀계수가 유의한 경우
summary(plm(체감BSI~log(사용액) + 대형소매점판매지수 + 소비자심리지수, 
            data=p_d7_2, model = "fd"))

#############pgls 모형
pggls_fd = pggls(체감BSI~log(사용액) + 대형소매점판매지수 + 소비자심리지수 + 
        소비자물가지수 + 동행종합지수 + 인구대비업체수, 
      data=p_d7_2, model = "fd")

summary(pggls_fd)
pggls_fd$coefficients

vif(pggls_fd)
residualPlots(plm_fd)
pbgtest(plm_wi)
print(shapiro.test(resid(pggls_fd)))
print(shapiro.test(resid(pggls_wi)))
print(durbinWatsonTest(as.vector(resid(pggls_fd))))
print(durbinWatsonTest(as.vector(resid(pggls_wi))))

vif(plm_fd)

pggls_wi = pggls(체감BSI~log(사용액) + 대형소매점판매지수 + 소비자심리지수 + 
                소비자물가지수 + 동행종합지수 + 인구대비업체수, 
              data=p_d7_2, model = "within") 
summary(pggls_wi) #사용액 회귀계수가 음수.

pggls_wi$coefficients


stargazer(pggls_wi, pggls_fd, type="html", out="패널비교2.doc")

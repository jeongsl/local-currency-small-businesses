# local-currency-small-businesses
[2023 경제문제세미나] 지역화폐 정책이 소상공인에게 미치는 영향 분석


## 분석 목적
지역화폐 정책이 소상공인에게 긍정적인 영향을 미치는지, 실질적으로 경제적 효과를 창출하고 있는지 알아보기 위함


## 분석 데이터
|출처|데이터 명|데이터 정의|
|------|---|---|
|KOSIS 국가통계포털|[소상공인 지역별 실적 및 전망](https://kosis.kr/statHtml/statHtml.do?orgId=142&tblId=DT_S0001N_005&conn_path=I2)|인천, 경기, 세종, 전북, 경남 소상공인 체감 BSI|
|KOSIS 국가통계포털|[17개 시도별 대형소매점 판매액지수(2020=100.0)](https://kosis.kr/statHtml/statHtml.do?orgId=101&tblId=DT_1K41015&conn_path=I2)|대형소매점 판매지수 - 불변|
|KOSIS 국가통계포털|[소비자동향조사(지역, 월)](https://kosis.kr/statHtml/statHtml.do?orgId=301&tblId=DT_511Y004&conn_path=I2)|소비자 심리지수|
|KOSIS 국가통계포털|[소비자물가지수(2020=100)](https://kosis.kr/statHtml/statHtml.do?orgId=101&tblId=DT_1J22003&conn_path=I2)|소비자 물가지수|
|KOSIS 국가통계포털|[인천광역시 경기종합지수](https://kosis.kr/statHtml/statHtml.do?orgId=204&tblId=DT_204N_K002&conn_path=I2)|인천 동행종합지수 순환변동치|
|KOSIS 국가통계포털|[경기동행종합지수 및 순환변동치](https://kosis.kr/statHtml/statHtml.do?orgId=210&tblId=DT_2020037_005&conn_path=I2)|경기 동행종합지수 순환변동치|
|KOSIS 국가통계포털|[경기종합지수(2020=100)](https://kosis.kr/statHtml/statHtml.do?orgId=213&tblId=DT_213N_CN01001E&conn_path=I2)|세종 동행종합지수 순환변동치|
|KOSIS 국가통계포털|[경기동행지수](https://kosis.kr/statHtml/statHtml.do?orgId=214&tblId=DT_214N_Z01900&conn_path=I2)|전북 동행종합지수 순환변동치|
|KOSIS 국가통계포털|[경남 경기동행종합지수](https://kosis.kr/statHtml/statHtml.do?orgId=217&tblId=DT_217J00010&conn_path=I2)|경남 동행종합지수 순환변동치|
|KOSIS 국가통계포털|[행정구역(시군구)별/1세별 주민등록인구](https://kosis.kr/statHtml/statHtml.do?orgId=101&tblId=DT_1B04006&conn_path=I2)|인구 수|
|공공데이터포털|[소상공인시장진흥공단_상가(상권)정보](https://www.data.go.kr/data/15083033/fileData.do#layer_data_infomation)|소상공인 사업체 수|
|공공데이터포털|[인천광역시_인천e음 군구별 업종별 일별(월단위) 결제금액](https://www.data.go.kr/data/15067973/fileData.do)|인천 지역화폐 결제금액|
|공공데이터포털|[경기도 파주시_지역화폐 발행및이용현황](https://www.data.go.kr/data/15049050/fileData.do)|파주 지역화폐 결제금액|
|공공데이터포털|[경기도 시흥시_지역화폐 이용현황](https://www.data.go.kr/data/15090662/fileData.do)|시흥 지역화폐 결제금액|
|공공데이터포털|[경기도_평택시_지역화폐발행및이용현황](https://www.data.go.kr/data/15039663/fileData.do)|평택 지역화폐 결제금액|
|공공데이터포털|[세종특별자치시_여민전 월별 결제 현황](https://www.data.go.kr/data/15100010/fileData.do)|세종 지역화폐 결제금액|
|공공데이터포털|[전북특별자치도 전주시_지역화폐발행 및 이용현황](https://www.data.go.kr/data/15100894/fileData.do)|전주 지역화폐 결제금액|
|공공데이터포털|[전북특별자치도 무주군_지역화폐업종별이용현황](https://www.data.go.kr/data/15101940/fileData.do)|무주 지역화폐 결제금액|
|공공데이터포털|[경상남도 통영시_지역화폐이용현황](https://www.data.go.kr/data/15079693/fileData.do)|통영 지역화폐 결제금액|



## 분석 방법
* R-studio : Panel Regression
단위: 월별


## 분석 결과
![image](https://github.com/user-attachments/assets/10aa1e37-646e-469c-b6c9-009911690649)


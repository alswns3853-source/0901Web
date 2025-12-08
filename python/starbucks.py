from selenium import webdriver
# selenium을 통해 특정 태그를 찾을 때 필요한 라이브러리
from selenium.webdriver.common.by import By
from bs4 import BeautifulSoup
import pandas as pd
import time

# 크롬으로 실행하도록 설정
wd = webdriver.Chrome()
# 결과를 저장할 리스트 변수 선언
result = []
# 크롬 브라우저를 열어주는 코드
wd.get("https://www.starbucks.co.kr/store/store_map.do")
# 페이지 로딩 시간을 기다리는 코드
time.sleep(1)
# 눌러야 하는 버튼 찾기
# a태그 안에 value값으로 '지역 검색'이 있는 태그를 저장
button = wd.find_element(By.XPATH, "//a[contains(text(), '지역 검색')]")
# button안에 있는 태그의 자바스크립트 onclick을 실행하는 코드
wd.execute_script("arguments[0].click();", button)
time.sleep(1)
# 지역검색 버튼을 누른 후 나오는 부산 버튼을 선택
button = wd.find_element(By.XPATH, "//a[contains(text(), '부산')]")
wd.execute_script("arguments[0].click();", button)
time.sleep(1)
# 부산 선택 후 나오는 전체 버튼 클릭
button = wd.find_element(By.XPATH, "//a[@class='set_gugun_cd_btn' and @data-sidocd='05' and text()='전체']")
wd.execute_script("arguments[0].click();", button)
time.sleep(1)
# 모든 버튼 클릭 후 결과를 html로 받아 저장
html = wd.page_source
# html 파싱
soup = BeautifulSoup(html, 'html.parser')
# 목표 태그 전체를 반복
for store in soup.select("li.quickResultLstCon"):
    name = store.find('strong').string
    # <br>태그가 있으면 .string으로 저장하는게 불가능
    # get_text()를 이용하여 <br>태그를 \n으로 변경 후 저장
    addressAndTel = store.find('p').get_text("\n", strip=True).split("\n")
    address = addressAndTel[0]
    tel = addressAndTel[1]
    result.append([name]+[address]+[tel])

tbl = pd.DataFrame(result, columns=('name','address','tel'))
tbl.to_csv("starbucks.csv", encoding="utf-8", mode="w", index=True)

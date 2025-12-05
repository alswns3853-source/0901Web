from selenium import webdriver
from bs4 import BeautifulSoup
import pandas as pd
import datetime
import time
# 크롬으로 실행하도록 설정
wd = webdriver.Chrome()
# 결과를 저장할 리스트 변수 선언
result = []
for i in range(1,32):
    # 매개변수 url로 크롬 브라우저를 열어주는 코드
    wd.get("https://www.coffeebeankorea.com/store/store.asp")
    # 페이지 로딩 시간을 기다리는 코드
    time.sleep(1)
    try:
        # 자바스크립트 실행
        wd.execute_script(f"storePop2({i})")
        # 자바스크립트 로딩 시간 기다림
        time.sleep(1)
        # 페이지의 html코드를 변수에 저장
        html = wd.page_source
        # html의 태그들을 사용할 수 있도록 변경
        soupCB = BeautifulSoup(html, 'html.parser')
        # 가게 이름 태그를 찾기
        store_name_h2 = soupCB.select("div.store_txt>h2")
        # 가게 이름 저장
        store_name = store_name_h2[0].string
        print(store_name_h2)
        # 가게 정보가 들어있는 태그 찾기
        store_info = soupCB.select("div.store_txt>table.store_table>tbody>tr>td")
        # 주소 저장
        store_address_list = list(store_info[2])
        store_address = store_address_list[0]
        # 전화번호 저장
        store_phone = store_info[3].string
        # 리스트에 매장정보 저장
        result.append([i]+[store_name]+[store_address]+[store_phone])
    except:
        continue

# pandas를 사용한 csv저장
CB_tbl = pd.DataFrame(result, columns=('no','store','address','phone'))
CB_tbl.to_csv("CoffeeBean.csv", encoding="utf-8", mode="w", index=True)

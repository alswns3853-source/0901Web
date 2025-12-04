from selenium import webdriver
from bs4 import BeautifulSoup
import pandas as pd
import datetime
import time
# 크롬으로 실행하도록 설정
wd = webdriver.Chrome()
# 웹 페이지 실행
# wd.get("https://www.coffeebeankorea.com/store/store.asp")
result = []
for i in range(1,10+1):
    wd.get("https://www.coffeebeankorea.com/store/store.asp")
    time.sleep(1)
    try:
        wd.execute_script(f"storePop2{i}")
        html = wd.page_source
        soupCB = BeautifulSoup(html, 'html.parse')
        store_name_h2 = soupCB.select("div.store_txt>h2")
        store_name = store_name_h2[0].string
        print(store_name)
        store_info = soupCB.select("div.store_txt>table.store_table>tbody>tr>td")
        store_address_list = list(store_info[2])
        store_address = store_address_list[0]
        store_phone = store_info[3].string
        result.append([store_name],[store_address],[store_phone])
    except:
        continue
CB_tbl = pd.DataFrame(result, columns=('store','address','phone'))
CB_tbl.to_csv("CoffeeBean.csv", encoding="cp949", mode="w", index=True)

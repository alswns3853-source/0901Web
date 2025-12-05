from selenium import webdriver
from bs4 import BeautifulSoup
import pandas as pd
import datetime
import time
wd = webdriver.Chrome()
result = []
for i in range(133,141):
    wd.get("https://ssaltongdak.com/bbs/board.php?bo_table=store")
    time.sleep(1)
    try:
        wd.execute_script(f"layer_popup({i})")
        time.sleep(1)
        html = wd.page_source
        chBro = BeautifulSoup(html, 'html.parser')
        store_name_h2 = chBro.select("p.map_view_title")
        store_name = store_name_h2[0].string
        print(store_name_h2)
        store_address = chBro.select("p.map_view_addr")[0].string
        store_phone = chBro.select("p.map_view_tel")[0].string
        result.append([i]+[store_name]+[store_address]+[store_phone])
    except:
        continue

CB_tbl = pd.DataFrame(result, columns=('no','store','address','phone'))
CB_tbl.to_csv("ch.csv", encoding="utf-8", mode="w", index=True)
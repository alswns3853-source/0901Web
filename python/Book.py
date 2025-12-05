# 필요한 라이브러리 추가
from bs4 import BeautifulSoup
import urllib.request
# 결과를 저장할 변수 선언
result = []
for pageNo in range(1,5+1):
    # 데이터를 가져올 url 설정
    url = f"https://books.toscrape.com/catalogue/category/books_1/page-{pageNo}.html"
    # url을 이용하여 html코드 저장
    html = urllib.request.urlopen(url)
    # html 파싱
    soup = BeautifulSoup(html,'html.parser')
    # 데이터가 들어있는 태그를 저장
    tag_ol = soup.find('ol')
    # 반복이 가능한 태그 설정
    for tag_li in tag_ol.find_all("li"):
        # img태그에서 이미지 주소 저장
        img_url = tag_li.select('div.image_container>a>img')[0]['src']
        # ../../../ 부분을 주소로 변경
        img_url = img_url.replace('../../../','https://books.toscrape.com/')
        title = tag_li.select('h3>a')[0]['title']
        price = tag_li.select('div.product_price>p')[0].string
        result.append([title]+[price]+[img_url])

import pandas as pd
book_tbl = pd.DataFrame(result, columns=('title','price','img'))
book_tbl.to_csv("book.csv", encoding="utf-8", mode="w", index=True)

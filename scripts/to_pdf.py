import pdfkit
import sys
import requests
from bs4 import BeautifulSoup as bs
from transliterate import translit

import secret
from send_email import send_email


def get_page_name(url):
    r = requests.get(url)
    soup = bs(r.content, 'lxml')
    res = soup.select_one('title').text \
        .replace('/', '_').replace(',', '_').replace(' ', '_').replace("\"", "_").replace("«", "_").replace("»", "_")
    print(res)
    #return translit(res, reversed=True)
    return res


name = get_page_name(sys.argv[1])
pdf = '/home/alx/pdf_web_pages/' + name + '.pdf'
pdfkit.from_url(sys.argv[1], pdf)
print(pdf)

import pdfkit
import sys
import secret
import requests
from bs4 import BeautifulSoup as bs

from send_email import send_email


def get_page_name(url):
    r = requests.get(url)
    soup = bs(r.content, 'lxml')
    return soup.select_one('title').text.replace('/', '_').replace(',', '_').replace('.', '_').replace(' ', '_')


name = get_page_name(sys.argv[1])
print(name)
pdf = '/home/alx/' + name + '.pdf'
pdfkit.from_url(sys.argv[1], pdf)
send_email(secret.pb_email, '', '', pdf)

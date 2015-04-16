from bs4 import BeautifulSoup
import urllib.request

# turn webpage into beautiful soup object
url = 'http://evergreen.edu/faculty/index'
response = urllib.request.urlopen(url, data=None)
html = response.read()
soup = BeautifulSoup(html)

#f = open('page.html', 'w')

#f.write(soup.prettify())

print(soup.body)
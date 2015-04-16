from bs4 import BeautifulSoup
import urllib.request

# turn webpage into beautiful soup object
url = 'http://evergreen.edu/faculty/index'
response = urllib.request.urlopen(url, data=None)
html = response.read()
soup = BeautifulSoup(html)

f = open('derp.html', 'w')

# f.write(soup.tbody.prettify())
soup_faculty_table = soup.tbody
faculty_box = soup_faculty_table.find_all('tr')

for i in faculty_box:
	print(i.id)
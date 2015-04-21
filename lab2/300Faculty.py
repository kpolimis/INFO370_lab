# Rohan Aras


from bs4 import BeautifulSoup
import urllib.request

# save file name
save_file = open('faculty.csv', 'w')

# turn webpage into beautiful soup object
def url_to_beautifulsoup(url):
	response = urllib.request.urlopen(url, data=None)
	html = response.read()
	soup = BeautifulSoup(html)
	return soup

# get soup for main page
main_url = 'http://evergreen.edu/faculty/index' 
main_soup = url_to_beautifulsoup(main_url)

# navigate toward faculty table
soup_faculty_table = main_soup.tbody
soup_faculty_box = soup_faculty_table.find_all('tr')

# generic faculty page
faculty_url = 'http://evergreen.edu/faculty/instructor/'

no_name_count = 0 # debug

# extract bio from faculty page 
for i in soup_faculty_box:
	current_faculty_url = faculty_url + i['id']
	faculty_soup = url_to_beautifulsoup(current_faculty_url)
	soup_bio = faculty_soup.find('p', {'class' : 'bio'})
	try:
		str_bio = soup_bio.contents[0]
		split_str_bio = str_bio.split('Ph.D., ')
		print(split_str_bio[1] + '\n') # debug
	except AttributeError:
		print(i['id'] + ' does not have a bio.\n')
		no_name_count += 1
	except IndexError:
		print(i['id'] + ' does not have a phd\n')
		no_name_count += 1

print(no_name_count)
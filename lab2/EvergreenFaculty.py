# lab 2
# Rohan Aras
# 4/23/15

# notes: Scrapes the Evergreen faculty directory for full name, and
# university that the faculty member obtained phd from. Exports information
# to a csv file that includes Last Name | First Name | University | Department
# | Ph.D. from School
# Has trouble with the variations in formatting for universities that have
# multiple branches

from bs4 import BeautifulSoup
import urllib.request

# save file name
save_file = open('faculty.csv', 'w')
save_file.write(
	'Last Name | First Name | University | Department | Ph.D. from School\n')

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

no_info_count = 0 # debug

# for every faculty member listed
for i in soup_faculty_box:
	# extract name from faculty page
	str_faculty_name = i.find_all('a')[1].contents[0].strip()
	print(str_faculty_name) # debug
	str_faculty_name = ' | '.join(str_faculty_name.split(', '))

	# get faculty web page
	current_faculty_url = faculty_url + i['id']
	faculty_soup = url_to_beautifulsoup(current_faculty_url)

	# extract bio element from faculty page 
	soup_bio = faculty_soup.find('p', {'class' : 'bio'})
	try:
		# get phd university
		phd_info = soup_bio.contents[0].split('Ph.D., ')[1].split(')')[-1]
		phd_info = phd_info.split(', ')
		str_phd_univ = phd_info[1]
		print(str_phd_univ + '\n') # debug'

		# if nothing fails write all info to file
		save_file.write(str_faculty_name + 
			' | Evergreen University | not applicable | ' + str_phd_univ + 
			'\n')

	# if faculty page has no bio element
	except AttributeError:
		print(i['id'] + ' does not have a bio.\n')
		no_info_count += 1

	# if faculty member doesn't have phd
	except IndexError:
		print(i['id'] + ' does not have a phd\n')
		no_info_count += 1

# debug prints number of faculty members who do not qualify
print(no_info_count)
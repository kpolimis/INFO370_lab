# Rohan Aras


from bs4 import BeautifulSoup
import urllib.request
import re

# save file name
save_file = open('faculty.csv', 'a')

# turn main page into beautiful soup object
html = open('Whitworth University Faculty_Staff Directory.html', 'r')
main_soup = BeautifulSoup(html)

# navigate toward faculty table
soup_faculty_box = main_soup.find_all(class_ = 'PersonResults')


no_info_count = 0 # debug

# for every faculty member listed
for i in soup_faculty_box:
	
	try:
		soup_box_info = i.find_all('td')

		# get phd info
		current_faculty_url = i.find_all('a')[1]['href'].split('\'')[1]
		print(current_faculty_url) # debug
		response = urllib.request.urlopen(current_faculty_url, data=None)
		faculty_html = response.read()
		faculty_soup = BeautifulSoup(faculty_html)
		soup_education = faculty_soup.find_all('span', id = 'lblEducation')
		print(soup_education[0].p.contents[0])
		# the problem now is that some of the pages wrap the education information in <p>
		# while some don't. Need to create a try block to fix for that

		# get name
		str_full_name = soup_box_info[0].strong.contents[0]
		print(str_full_name) # debug
		full_name_list = str_full_name.split(' ')
		str_last_name = full_name_list[-1]
		str_first_name = ''.join(full_name_list[0:len(full_name_list) - 1])

		# get department
		str_department = soup_box_info[2].br.contents[0].strip()
		print(str_department + '\n') # debug

		# if nothing fails write all info to file
		# save_file.write(str_last_name + ', ' + str_first_name + 
		# 	', Whitworth University, ' + str_department + str_phd_univ + 
		# 	'\n')


	except IndexError:
		print('No Faculty Page' + '\n') # debug
		no_info_count += 1

# debug prints number of faculty members who do not qualify
print(no_info_count)

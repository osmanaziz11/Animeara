# ****************************
# This file contains scraping code
# ****************************

# import modules
import requests
from bs4 import  BeautifulSoup
import constants 

class Scrape:
    baseURL=constants.LOCAL
    filePath=constants.FILEPATH
    fileInstanse=None

    def __init__(self):
        self.fileInstanse= open(self.filePath, "w")
    
    def getHTML(self):
        try:
            r=requests.get(self.baseURL)
            soup = BeautifulSoup(r.content, 'lxml')
            return soup
        except:
            return 0

    def dumpIDs(self):
        try:
            print("****** Start Dumping URL into file ******")
            HTML=self.getHTML()
            rows=HTML.find('table').findAll('tr')
            for row in rows:
                counter=-1
                col=row.findAll('td')
                for column in col:
                    counter=counter+1
                    # Date 
                    if counter==2:
                        date=column.text
                        idd=column.find_next_sibling("td").text
                        if int(date[0:4])  >= constants.INITIAL_DATE:
                            self.fileInstanse.write(f"http://www.getchu.com/soft.phtml?id={idd}\n")
                    else:
                        continue
            print("****** URL dumped into file successfully ******")
            self.fileInstanse.close()   
        except Exception as e:
            print("****** Dumping Failed ******")
            print(f"Error: e")
            return 0


    def downloadImages(self):
        pass

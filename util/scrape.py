# ****************************
# This file contains scraping code
# ****************************

# import modules
import requests
from bs4 import  BeautifulSoup
import constants 
from googletrans import Translator
import os

translater=Translator()
            
class Scrape:
    baseURL=constants.LOCAL
    filePath=constants.FILEPATH
    fileInstanse=None
    imageFilePath=constants.IMAGEFILEPATH
    error404=constants.ERROR404
    error403=constants.ERROR403
    HEADERS=None

    def __init__(self):
        pass

    def getHTML(self,url):
        try:
            r=requests.get(url,headers=self.HEADERS)
            soup = BeautifulSoup(r.content, 'lxml')
            return soup
        except:
            return 0

    def dumpIDs(self):
        try:
            self.openFile(self.filePath,'a')
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

    def downloadAndDump(self,images,baseURL):
        print(f"Start Downloading...") 
        u=baseURL.replace('\n','')
        HEADERS=({"Referer": f"{u}&gc=gc"})
        for image in images:
            print(f"Headers: {HEADERS}")
            try:
                HTML=requests.get(image,headers=HEADERS)
                lst = os.listdir(self.imageFilePath) 
                self.openFile(f"{self.imageFilePath}{len(lst)}.jpg",'wb')
                self.fileInstanse.write(HTML.content)
            except Exception as e:
                 print(f"Fail to download: {image}") 
                 print(f"Error: {e}") 
                 continue
        print(f"End Downloading\n\n")
        
    
    def openFile(self,path,mode):
        self.fileInstanse=open(path,mode)


    # Get URL from url.txt file then retreive HTML content which contains images of respective URL
    def fetchImages(self):
        self.openFile(self.filePath,'r')
        lines=self.fileInstanse.readlines()
        for url in lines:
            imgSrcArr=[]
            container=None
            print(f"\n{url}")
            try:
                HTML=self.getHTML(f"{url}&gc=gc")    
                check=HTML.findAll('div',class_='tabletitle')  
                for i in check: 
                    trans=translater.translate(i.text,dest="en").text
                    if trans == ' character':
                        table=i.findNext()
                        container=table.findAll('tr')
                    else:
                        continue
            except Exception as e:
                print(f"Failed to fetch. Check Error.txt file")
                open(self.error403, 'a').write(url)
                continue
           
           
            try:
                for item in container:
                    if item.find('img'):
                        imgSrcArr.append(f"http://www.getchu.com{item.find('img')['src'][1:]}")
            except:
                print(f"No image to fetch. Check 404.txt file")
                open(self.error404, 'a').write(url)
                continue
            print(f"\n imgSrcArr Length: {len(imgSrcArr)}") 
            if len(imgSrcArr) > 0:    
                self.downloadAndDump(imgSrcArr,url)   
        print("\n\n Process Ends")   

    def driver(self):
        print(f"======= Starting Process ========\n")
        self.fetchImages()


Scrape().driver()
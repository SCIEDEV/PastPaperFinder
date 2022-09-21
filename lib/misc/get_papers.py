from bs4 import BeautifulSoup
import requests as r
import json
from tqdm import tqdm

syllabus = "A Level"
# syllabus = "A Level"


if syllabus == "IGCSE":
    url = "https://papers.gceguide.com/Cambridge%20IGCSE/"
    filename = 'igcse.json'
else:
    url = "https://papers.gceguide.com/A%20Levels/"
    filename = 'alevel.json'

result = {}

try:
    with open(filename, 'r') as f:
        result = json.load(f)
except FileNotFoundError:
    print("[WARN] No previous data found. Creating new file.")
    with open(filename, 'w') as f:
        f.write('{}')
    pass

startingfrom = len(result)

strhtml = r.get(url)
soup = BeautifulSoup(strhtml.text, 'lxml')
data = soup.select('#paperslist > li > a')
for i in tqdm(data[startingfrom:]):
    subject = i.get('href')
    result[subject] = {}
    url2 = url + subject + '/'
    strhtml2 = r.get(url2)
    soup2 = BeautifulSoup(strhtml2.text, 'lxml')
    data2 = soup2.select('#paperslist > li > a')
    for j in tqdm(data2, leave=False):
        year = j.get('href')
        if '.' in year:
            result[subject][year] = []
        else:
            result[subject][year] = []
            url3 = url2 + year + '/'
            strhtml3 = r.get(url3)
            soup3 = BeautifulSoup(strhtml3.text, 'lxml')
            data3 = soup3.select('#paperslist > li > a')
            result[subject][year] = [k.get('href') for k in data3]
    with open(filename, 'w') as f:
        f.write(json.dumps(result))

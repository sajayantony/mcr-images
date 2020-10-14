
import requests 
import json

BASE_URL = "https://mcr.microsoft.com/v2/"


def getRepositories(filename):
    r = requests.get(BASE_URL + "_catalog")
    data = r.json()

    with open(filename, 'w') as outfile:
        json.dump(data, outfile)


def getTags(repo, base_dir):
    url = BASE_URL + repo + "/tags/list" 
    print("Getting Tags from : " + url)
    r = requests.get(url)

    data = r.json()
    print(data['name'])

    filename = base_dir + "/" + data['name'].replace("/", "__") + ".md"
    file = open(filename, "w");
    file.write("---\n")
    file.write("title: " + data['name'] + "\n")
    file.write("---" + "\n")

    for tag in data['tags']:
        file.write("- " + tag + "\n")
    
    file.close()


#repo = "cosmosdb/winsrv2019/azure-cosmos-emulator";
#getTags(repo, "site/content")
#quit()

BASE_DIR = 'site/content'
filename = BASE_DIR + "/" + "repositories.json"
getRepositories(filename)

with open(filename, 'r') as outfile:
    data = json.load(outfile)
    for repo in data['repositories']: 
        try:
            getTags(repo, "site/content")
        except Exception: 
            pass
        

import requests

url = "https://dummyjson.com/comments"
response = requests.get(url)

if response.status_code == 200:
    data = response.json()
    for comment in data['comments'][:5]: # Print first 5
        print(f"{comment['user']['username']}: {comment['likes']}")
else:
    print("Failed to fetch data")

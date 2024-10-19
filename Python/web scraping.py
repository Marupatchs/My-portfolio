## API

from requests import get
from time import sleep
import csv
import pandas as pd

## check status code
base_url = "https://pokeapi.co/api/v2/pokemon/"
response = get(base_url)

response.status_code

# check key
response = get(base_url + "1")
for key in response.json():
    print(key)

## get data from 1-20
pokemon_list = []

for i in range(1,21):
    api_url = base_url + str(i)
    response = get(api_url)
    response_js = response.json()
    name = response_js["name"]
    height = response_js["height"]
    weight = response_js["weight"]
    abilities = response_js["abilities"]
    stats = response_js["stats"]
    types = response_js["types"]
    result = [name, height, weight, abilities, stats, types]
    pokemon_list.append(result)
    sleep(2)

print(pokemon_list)

## build table
header = ["name", "height", "weight", "abilities", "stats", "types"]
with open("pokemon.csv", "w") as file:
    writer = csv.writer(file)
    writer.writerow(header)
    writer.writerows(pokemon_list)

!cat pokemon.csv

## read CSV
df = pd.read_csv("pokemon.csv")
df

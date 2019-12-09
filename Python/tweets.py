#!/usr/bin/env python
# -*- coding: utf-8 -*-
import tweepy
from tweepy import OAuthHandler
import pandas as pd
import csv
import re 										# Regular expression
import json										# For parsing data
import sched, time
import threading

# Tweepy API object that will be used to query for data from Twitter
credentials = {}
credentials['CONSUMER_KEY'] =  "j8nSCDVFGVBW756Oo2Ce0EcHP"
credentials['CONSUMER_SECRET'] = "8hPUVyeeOaK0dBhPb3PjaTox2x1MYdYvTLNYqXZrI7bDluMrRF"
credentials['ACCESS_TOKEN'] = "918368475902562305-qKrRDmO31OIXZNmrBLEYM8vFzkBeuC4"
credentials['ACCESS_SECRET'] = "3p5q2X3yUWAAvqONwojCI3F02xS9xkFi9JUbfUe1Qvgku"

# Save the credentials object to file
with open("twitter_credentials.json", "w") as file:
    json.dump(credentials, file)

# Load credentials from json file
with open("twitter_credentials.json", "r") as file:
    creds = json.load(file)

# 
auth = tweepy.OAuthHandler(creds['CONSUMER_KEY'], creds['CONSUMER_SECRET'])
auth.set_access_token(creds['ACCESS_TOKEN'], creds['ACCESS_SECRET'])
api = tweepy.API(auth)

i = 0
while True:
	start = time.time()
	
	search = tweepy.Cursor(api.search, q="bitcoin OR crypto", lang="en").items(10)  


	for tweet in search:
		i+=1
		print i, tweet.user.name, tweet.text

	
	time.sleep(60.0 -((time.time() - start)%60.0 ))


	# 	print sum(1 for _ in search) # To check if len(search) is fine
# Shiny-Web-Application-for-Sentiment-Analysis-on-Twitter

Shiny web application for twitter sentiment analysis has been created. The aim of this web application :
1. Shows the data in the form of a table that provides sentiment information based on the  emotional intent of the word in each tweet.
2. Classify the word based on the sentiment and shows its visualization.

<img width="797" alt="UI (2)" src="https://user-images.githubusercontent.com/78721761/128868749-b5153ead-bbad-4233-953e-3bab7642963b.PNG">




                                            Figure 1. Sentiment Analysis on Twitter User Interface

The user of this application can input any number of tweets and any hashtag that they want, (for example : on the user interface 200 has been used as the number of tweets and children as the hashtag), then the next step is click Get Data. After the user has finished click the Get Data button (the data that will be generated is the last 200 tweets by Twitter's users) then each window will show its results. On the web user interface that has been shown on fig.1 there are 3 windows such as : 
1. Data   
The Data Window will have shown a table (figure 2) that consists of each sentiment based on the  emotional intent of the word in each tweet (line number). The data that has been shown in this window is the data that has been extracted from Twitter API then has been through some process including tokenization, removing stop words, lexicons (get_sentiments(“bing”)),etc.

<img width="934" alt="tabel_2" src="https://user-images.githubusercontent.com/78721761/128862063-c112ac61-9d62-442c-9f87-d9c7ef051e53.PNG">

                                            Figure 2. Data with linenumber, word and sentiment columns
2. Positive Sentiment   
After the word that has emotional intent has been classified in order to know the sentiment either positive or negative. Then it's important to group based on these sentiments and do a visualization used wordcloud based on group result. Figure 3 has shown the visualization of the positive sentiment on #children data with 200 number of tweets.



<img width="835" alt="sentiment positive (2)" src="https://user-images.githubusercontent.com/78721761/128868901-9ae2aa16-be0b-4c63-be31-f7f8cccee8cc.PNG">


                                            Figure 3. Positive Sentiment Visualization
3. Negative Sentiment  
On the other hand it is also important to know the data and vizualisation of the negative sentiment. Figure 4 has  shown  the visualization of the negative sentiment on #children data with 200 number of tweets.


<img width="790" alt="negative (2)" src="https://user-images.githubusercontent.com/78721761/128868940-d9029061-fafa-44b5-aece-6ecdb06df25d.PNG">

                                            Figure 4. Negative Sentiment Visualization                      

I hope this application will be useful for those people who are interest onSentiment Analysis on Twitter :) 

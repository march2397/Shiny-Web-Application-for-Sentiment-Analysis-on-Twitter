# Shiny-Web-Application-for-Sentiment-Analysis-on-Twitter

Shiny web application for twitter sentiment analysis has been created. The aim of this web application :
1. Shows the data in the form of a table that provides sentiment information based on the  emotional intent of the word in each tweet.
2. Classify the word based on the sentiment and shows its visualization.

<img width="813" alt="UI" src="https://user-images.githubusercontent.com/78721761/128866367-858832b6-d827-403f-bc69-7462481c6d67.PNG">



                                            Figure 1. Sentiment Analysis on Twitter User Interface

The user of this application can input any number of tweets and any hashtag that they want, (for example : on the user interface 200 has been used as the number of tweets and children as the hashtag), then the next step is click Get Data. After the user has finished click the Get Data button then each window will show its results. On the web user interface that has been shown on fig.1 there are 3 windows such are 
1. Data Window  
The Data Window will have shown a table (figure 2) that consists of each sentiment based on the  emotional intent of the word in each tweet (line number). The data that has been shown in this window is the data that has been extracted from Twitter API then has been through some process including tokenization, removing stop words, lexicons (get_sentiments(“bing”)),etc.

<img width="934" alt="tabel_2" src="https://user-images.githubusercontent.com/78721761/128862063-c112ac61-9d62-442c-9f87-d9c7ef051e53.PNG">

                                            Figure 2. Data 
                                        
2. Positive Sentiment Window
After the word that has emotional intent has been classified in order to know the sentiment either positive or negative. Then it's important to group based on these sentiments and do a visualization used wordcloud based on group result. Figure 3 has shown the visualization of the positive sentiment on #children data with 200 number of tweets.


<img width="846" alt="sentiment positive" src="https://user-images.githubusercontent.com/78721761/128865288-226d5f15-0487-48e4-8733-4e0572e80714.PNG">

                                            Figure 3. Positive Sentiment Visualization
                                          
3. Positive Sentiment Window
On the other hand it is also important to know the data and vizualisation of the negative sentiment. Figure 4 has  shown  the visualization of the negative sentiment on #children data with 200 number of tweets.


<img width="805" alt="negative" src="https://user-images.githubusercontent.com/78721761/128865786-15eb473c-76e0-46b9-928b-032697a77c0c.PNG">

                                            Figure 4. Negative Sentiment Visualization                      

I hope this application will be useful for those people who are interest onSentiment Analysis on Twitter :) 

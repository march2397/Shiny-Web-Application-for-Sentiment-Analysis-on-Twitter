library(shiny)
library(rtweet)
library(reactable)
library(tidyverse)
library(tm)
library(stringr)
library(tidytext)
library(stopwords)
library(wordcloud)
library(twitteR)
library(SnowballC)


authenticateAPI <- function() {
  creds <- read.csv(file='twitter_creds.csv')

  # Key auth Twitter API
  consumer.api_key <- creds$api_key
  consumer.api_secret_key <- creds$api_secret
  access.token <- creds$access_token
  access.token_secret <- creds$access_token_secret
  
  # Start authentication with OAuth
  setup_twitter_oauth(consumer.api_key, consumer.api_secret_key, access.token, access.token_secret)
}

authenticateAPI()


ui <- fluidPage(
  # Application title
  titlePanel("Sentiment Analysis on Twitter"),
  
  # Sidebar 
  sidebarLayout(
    sidebarPanel(
      style = "background-color: #1DA1F2;",
      numericInput("num_tweets_to_download",
                   "Number of tweets :",
                   min = 100,
                   max = 18000,
                   value = 50,
                   step = 100),
      textInput("hashtag_to_search",
                "Hashtag to search :",
                value = "# "),
      actionButton("get_data", "Get data")
    ),
    
    # Show results
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Data",reactableOutput("tweet_table"),icon = icon("table")),
                  tabPanel("Positive Sentiment", plotOutput("WordCloudPlot"),icon = icon("smile")),
                  tabPanel("Negative Sentiment", plotOutput("WordCloud"),icon = icon("frown"))
      )

    )
  )
)

# Define server logic 
server <- function(input, output) {
  
  tweet_df <- eventReactive(input$get_data,{
    search_tweets(input$hashtag_to_search, n = input$num_tweets_to_download, type = "mixed", include_rts = FALSE, lang="en")
  })

  tweet_df_new <- reactive({
    req(tweet_df())
    tweet_df() %>%
      select(text) %>%
      mutate(text = gsub(" ?(f|ht)(tp)(s?)(://)(.*)[.|/](.*)", "",tweet_df()$text),
             linenumber = row_number()) %>%
      unnest_tokens(word, text,token = "ngrams", n=1)%>%
      mutate(word = wordStem(word)) %>%
      anti_join(stop_words)%>% 
      left_join(get_sentiments("bing")) %>% 
      filter(!is.na(sentiment),
           sentiment %in% c('positive','negative')) 
  })
  
  tweet_df_positive <- reactive({
    req(tweet_df())
    tweet_df() %>%
      select(text) %>%
      mutate(text = gsub(" ?(f|ht)(tp)(s?)(://)(.*)[.|/](.*)", "", tweet_df()$text),
             linenumber = row_number()) %>%
      unnest_tokens(word, text,token = "ngrams", n=1 )%>% 
      mutate(word = wordStem(word)) %>%
      anti_join(stop_words)%>% 
      left_join(get_sentiments("bing")) %>% 
      filter(!is.na(sentiment),
             sentiment =='positive') 
  })
  
  tweet_df_negative <- reactive({
    req(tweet_df())
    tweet_df() %>%
      select(text) %>%
      mutate(text = gsub(" ?(f|ht)(tp)(s?)(://)(.*)[.|/](.*)", "", tweet_df()$text),
             linenumber = row_number()) %>%
      unnest_tokens(word,text,token = "ngrams", n=1)%>% 
      mutate(word = wordStem(word)) %>%
      anti_join(stop_words)%>% 
      left_join(get_sentiments("bing")) %>% 
      filter(!is.na(sentiment),
             sentiment =='negative') 
  })
  
  
  output$tweet_table <- renderReactable({
    reactable::reactable(tweet_df_new(), 
                         filterable = TRUE, searchable = TRUE, bordered = TRUE, striped = TRUE, highlight = TRUE,
                         showSortable = TRUE, defaultSortOrder = "desc", defaultPageSize = 25, showPageSizeOptions = TRUE, pageSizeOptions = c(25, 50, 75, 100, 200))
  })
  
  
  output$WordCloudPlot <- renderPlot({
    wordcloud(tweet_df_positive()$word, random.order = FALSE,  scale=c(4,.2), colors=brewer.pal(6, "Dark2"))
  })
  
  output$WordCloud <- renderPlot({
    wordcloud(tweet_df_negative()$word, random.order = FALSE,scale=c(4,.2), colors=brewer.pal(6, "Dark2"))
  })
  

}

# Run the application 
shinyApp(ui = ui, server = server)
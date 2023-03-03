# How to call the new (as of 2023-03-01) ChatGTP API from R
# Get your API key over here: https://platform.openai.com/
api_key <- "sk-5-your-actual-api-key-Fvau6" # Don't share this! 😅

library(httr)
library(stringr)

# Calls the ChatGTP API with the given promps and returns the answer
ask_chatgtp <- function(prompt) {
  response <- POST(
    url = "https://api.openai.com/v1/chat/completions", 
    add_headers(Authorization = paste("Bearer", api_key)),
    content_type_json(),
    encode = "json",
    body = list(
      model = "gpt-3.5-turbo",
      messages = list(list(
        role = "user", 
        content = prompt
      ))
    )
  )
  str_trim(content(response)$choices[[1]]$message$content)
}


# For example: 
ask_chatgtp("What function makes a histogram in R?")
## "The `hist()` function makes a histogram in R."
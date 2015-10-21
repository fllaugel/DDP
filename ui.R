library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("BDA Bank Credit Scoring Calculator"),
  sidebarPanel(
      h2('Applicant data:'),
      numericInput('age', 'Age :',18,min=18, max=65, step=1),
      radioButtons('sex', "Sex: ", c("Male"="1","Female"="0")),
      radioButtons('married', "Married: ", c("Yes"="1","No"="0")),
      numericInput('income', 'Year Income:',15000,min=15000, max=120000, step=1000),
      numericInput('creditcard', 'How many credit cards have:',0,min=0, max=6, step=1),
      numericInput('expenses', 'Monthly current expenses:',0,min=0, max=60000, step=500),
      numericInput('loan', 'Loan amount requested:',15000,min=1000, max=1200000, step=1000),
      numericInput('term', 'Loan Term in Months:',12,min=12, max=120, step=12),
      numericInput('rate', 'Year Interest rate:',4.5,min=4.5, max=12, step=0.05),
      

      submitButton("Score")
      
  ),
  mainPanel(
      h2('Credit Score is'),
      verbatimTextOutput('score'),
      h3('Loan Amount granted'),
      verbatimTextOutput('oloan'),
      h3('Interest rate:'),
      verbatimTextOutput('orate'),
      h3('Monthly payment:'),
      verbatimTextOutput('opayment'),
      h2('INSTRUCTIONS'),
      h4('Enter in the left panel the requested information about the loan applicant. 
        Upon completing the information, press the Score button to get the credit 
        score and the general conditions of the loan.
         The higher the score (range 150-990, minimum accepted 600) more likely to get back the capital. 
         The monthly payment may not be larger than the 40% of the net income after
         substracting the monthly expenses, So, the loan amount will be adjusted accordingly. ')
  )
))

library(shiny)



shinyServer(
  function(input, output) {
    output$score <- renderText({ creditscore(input$age, input$sex,input$married,input$income,
                                              input$creditcard,input$expenses) })
    output$oloan <- renderText({computeloan(input$age, input$sex,input$married,input$income,
                input$creditcard,input$expenses, input$rate, input$term,input$loan,1)})
    output$orate <- renderText({input$rate})
   output$opayment <- renderText({computeloan(input$age, input$sex,input$married,input$income,
                input$creditcard,input$expenses, input$rate, input$term,input$loan,0)})
    
  }
)

computeloan <- function(age,sex,married,income,creditcard,expenses, rate,term, loan, flag){
    mp <- monthlypay(rate,term,loan,990)
    margin <- 0.4*(income/12-expenses)
    rate <- rate/12/100
    score <- creditscore(age,sex,married,income,creditcard,expenses)
    if (flag == 1 ){
        if (score < 600) { return(0) }
        if (mp < margin) { return(loan)}
        loan <- margin*(1-(1+rate)^(-term))/rate
        return(loan)
    }
    if (mp > margin) loan <- margin*(1-(1+rate)^(-term))/rate
    return(monthlypay(rate,term,loan,score))
}


creditscore <- function(age,sex,married,income,creditcard,expenses) { 
    sex <- as.numeric(sex)
    married <- as.numeric(married)
    score <- (age*90+sex*10+married*600+income*15-creditcard*5-expenses*5)/500
    
    if (score < 150) { score <- 150 }
    if (score > 990) {score <- 990 }
    if ((age < 18 )|| (income < 15000)) { score<- 150 }
    return(as.integer(score))
}

monthlypay <- function(rate, term, amount,score) {
 rate <- rate/12/100
     mp <-  (rate*amount)/(1-(1+rate)^(-term))
    if (score < 600) { mp <- 0 }
return(mp)

}
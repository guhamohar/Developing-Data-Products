library(shiny)
library(datasets)

data(mtcars)

model<-lm(mpg~as.numeric(wt)+as.factor(am)+as.factor(cyl)+as.factor(gear)+hp,data=mtcars)
shinyServer(
  function(input, output) {
    output$wt <- renderText({
      input$goButton
      isolate(paste("Weight: ",input$wt, "lbs/1000"))
    })
    output$am <- renderText({
      input$goButton
      isolate(paste("Transmission: ",if(input$am==0){"Automatic"}else{"Manual"}))
    })
    output$cyl <- renderText({
      input$goButton
      isolate(paste("Number of Cylinders: ",input$cyl))
    })
    output$gear <- renderText({
      input$goButton
      isolate(paste("Number of gears: ",input$gear))
    })
    output$hp <- renderText({
      input$goButton
      isolate(paste("Gross Horsepower: ",input$hp))
    })
    output$prediction <- renderText({
      input$goButton
      isolate(predict(model,data.frame(wt=input$wt,am=input$am,cyl=input$cyl,gear=input$gear,hp=input$hp)))
      })
  }
)
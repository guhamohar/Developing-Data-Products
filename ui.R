

shinyUI(
  fluidPage(
    # Application title
    titlePanel("Mileage Prediction"),
    p('Instructions: To predict the mileage of a car, enter weight, transmission,
       number of cylinders, number of gears and gross horsepower in the left
       side panel windows. There are 5 windows: weight in short ton (lbs/1000) ranging between 1 - 6
       , transmission (automatic or manual), number of cylinders (4, 6, 8), number of gears (3,4,5)
       and horsepower ranging 50 - 350. After entering your information, press the Go! button at the bottom. 
      The default values of the calculator are 1 short ton weight, automatic transmission,4 cylinders, 3 gears and 150 gross horsepower.'),
    br(),
    sidebarLayout(position="left",
    sidebarPanel(
      numericInput('wt', 'Weight in lbs/1000: (enter a number between 1 - 6)',1,min=1,max=6),
      selectInput('am','Transmission Type:',choices=list("Automatic"="0","Manual"="1"),selected="0"),
      radioButtons('cyl','Number of Cylinders:', c("4"=4,"6"=6,"8"=8),selected=4),
      radioButtons('gear','Number of Gears:', c("3"=3,"4"=4,"5"=5),selected=3),
      sliderInput("hp", 'Horsepower', min = 50, max = 350, value = 150),
      actionButton("goButton", "Go!")
         ),
    
    mainPanel(
      h3('You entered the following information:'),
      h4(textOutput("wt")),
      h4(textOutput("am")),
      h4(textOutput("cyl")),
      h4(textOutput("gear")),
      h4(textOutput("hp")),
      br(),
      h3('The predicted miles per gallon for your car is:'),
      h4(textOutput("prediction"))
    )
  )
))
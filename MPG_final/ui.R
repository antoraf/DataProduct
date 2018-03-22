library(shiny)

shinyUI(
  navbarPage("Data Product Assignment",
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("The relationship between mtcars dataset variables and miles per gallon (MPG)"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Number of cylinders" = "cyl",
                                          "Displacement (cu.in.)" = "disp",
                                          "Gross horsepower" = "hp",
                                          "Rear axle ratio" = "drat",
                                          "Weight (lb/1000)" = "wt",
                                          "1/4 mile time" = "qsec",
                                          "V/S" = "vs",
                                          "Transmission" = "am",
                                          "Number of forward gears" = "gear",
                                          "Number of carburators" = "carb"
                                        )),
                            
                            checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "pills", 
                                      tabPanel("BoxPlot", plotOutput("mpgBoxPlot"),
                                        helpText("This part of the app allows to create Boxplot of the relation between mtcars dataset variables (User could select which variable on the dropdown box) and MPG")),
                                      tabPanel("Regression model", 
                                        helpText("This part of the app allows to create regression models of the mtcars dataset variables vs MPG and see the related model summary"),
                                                 plotOutput("mpgPlot"),
                                                 verbatimTextOutput("fit")),
                                      tabPanel("Documentation",helpText("See Main Tabs above : More Data Details or Shiny Present."))
                                      ))))),
             tabPanel("The Shiny Presentation",
                      a("<http://rpubs.com/antoraf/MPG>"),
                      hr(),
                      h2("Final Peer Assessments Course Project"),
                      helpText("Manual transmission has better MPG then Automatic. Myth or fact ? here our attempt to find 
                               some facts."),
                      hr(),
                      helpText("Considering that in an automatic transmission there are more pieces and equipments that need power to move, ",
                               "automaticaly, it seems obviuos that installing an automatic transmission will result in less miles per gallon (MPG). ",
                               "Does data from 'mtcars' databases confirm this assumption? Based on the results of the below analysis we can conclude that" ,
                               "indeed manual transmission has better GPM, though if compare with other factors, like weight, hP, # of cylinder, the impact of ",
                               "transission type on total MPG is minimal.")             ),
             tabPanel("More Data Detail",
                      h2("Motor Trend Car Road Tests"),
                      hr(),
                      h3("Description"),
                      helpText("The data was extracted from the 1974 Motor Trend US magazine,",
                               " and comprises fuel consumption and 10 aspects of automobile design and performance",
                               " for 32 automobiles (1973-74 models)."),
                      h3("Format"),
                      p("A data frame with 32 observations on 11 variables."),
                      
                      p("  [, 1]   mpg         Miles/(US) gallon"),
                      p("  [, 2]	 cyl	 Number of cylinders"),
                      p("  [, 3]	 disp	 Displacement (cu.in.)"),
                      p("  [, 4]	 hp	 Gross horsepower"),
                      p("  [, 5]	 drat	 Rear axle ratio"),
                      p("  [, 6]	 wt	 Weight (lb/1000)"),
                      p("  [, 7]	 qsec	 1/4 mile time"),
                      p("  [, 8]	 vs	 V/S"),
                      p("  [, 9]	 am	 Transmission (0 = automatic, 1 = manual)"),
                      p("  [,10]	 gear	 Number of forward gears"),
                      p("  [,11]	 carb	 Number of carburators"),
                      
                      h3("Source"),
                      
                      p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391_411.")
             ),
             tabPanel("Go back to my Github repository",
                      a("https://github.com/antoraf/DataProduct/tree/week4"),
                      hr(),
                      h2("I hope you like this my little effort ")
                  
             )
  )
)
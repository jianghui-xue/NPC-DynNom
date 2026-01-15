ui = bootstrapPage(fluidPage(
      titlePanel('Dynamic Nomogram'),
           sidebarLayout(sidebarPanel(uiOutput('manySliders'),
           checkboxInput('trans', 'Alpha blending (transparency)', value = TRUE),
           actionButton('add', 'Predict'),
           br(), br(),
           helpText('Press Quit to exit the application'),
           actionButton('quit', 'Quit')
           ),
           mainPanel(tabsetPanel(id = 'tabs',
           tabPanel('Survival plot', plotOutput('plot')),
           tabPanel('Predicted Survival', plotlyOutput('plot2')),
           tabPanel('Numerical Summary', verbatimTextOutput('data.pred')),
           tabPanel('Model Summary', verbatimTextOutput('summary'))
           )
           )
           )))

library(shiny)

# Définir l'interface utilisateur de l'application
ui <- fluidPage(
  
  # Titre de l'application
  titlePanel("Données du Geyser"),
  
  # Entrée numérique
  numericInput(inputId = "bins",
               label = "Sélectionnez un seuil de temps d'attente (en minutes) :",
               value = 70,
               min = 43,
               max = 100, # Valeur maximale par défaut
               step = 1),
  
  # Bouton pour changer la couleur du graphique
  actionButton("changeColor", "Changer la couleur du graphique"),
  
  # Sortie : Graphique de l'histogramme
  plotOutput("distPlot")
)

# Définir la logique du serveur
server <- function(input, output) {
  
  # Charger les données 'faithful'
  data("faithful")
  
  # Rendre le graphique de l'histogramme
  output$distPlot <- renderPlot({
    # Filtrer les données en fonction du seuil de temps d'attente
    donnees_filtrees <- subset(faithful, waiting <= input$bins)
    
    # Tracer l'histogramme
    hist(donnees_filtrees$waiting, 
         col = "darkgray", 
         border = "white",
         xlab = "Temps d'attente jusqu'à la prochaine éruption (en minutes)",
         main = "Histogramme des temps d'attente")
  })
  
  # Changer la couleur du graphique à chaque clic sur le bouton
  observeEvent(input$changeColor, {
    output$distPlot <- renderPlot({
      # Filtrer les données en fonction du seuil de temps d'attente
      donnees_filtrees <- subset(faithful, waiting <= input$bins)
      
      # Tracer l'histogramme avec une couleur différente
      hist(donnees_filtrees$waiting, 
           col = sample(colors(), 1), 
  # Choisir aléatoirement une couleur parmi la liste des couleurs disponibles
           border = "white",
           xlab = "Temps d'attente jusqu'à la prochaine éruption (en minutes)",
           main = "Histogramme des tempsgit d'attente")
    })
  })
}

# Lancer l'application
shinyApp(ui = ui, server = server)

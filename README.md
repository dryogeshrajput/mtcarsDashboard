# R Shiny Dashboard for exploring the mtcars dataset

[MTCARS.webm](https://user-images.githubusercontent.com/94129924/233295443-c46bd128-aa90-436f-88fa-551b8de43dfc.webm)

# This code is a Shiny application that creates a dashboard for exploring the mtcars dataset. 
The Shiny package is used to create a web application, dplyr package is used for data manipulation, and ggplot2 package is used for data visualization.

# The UI of the app is defined using fluidPage function from Shiny. 
The theme of the app is set to 'darkly', and a title panel is added to the top of the page. The layout of the app is defined with a sidebar panel and a main panel. The sidebar panel contains input controls such as a drop-down menu for selecting cylinder, a slider for selecting horsepower range, and another drop-down menu for selecting gear. The main panel contains the output plots and tables.

# The server logic of the app is defined using a server function from Shiny. 
A reactive data frame called "filtered_mtcars" is created based on the input values provided by the user. The data frame is filtered based on the selected cylinder, horsepower range, and gear. Then, three output plots and a table are created based on the filtered data frame. The first two plots are scatterplots of mpg vs. wt and mpg vs. hp, respectively. The third plot is a bar chart of cars by gear. The table displays mtcars data, but only for the filtered data frame columns.

# Finally, the shinyApp function is used to run the app. 
When run, the user can interact with the input controls on the sidebar panel, and the output plots and table will update accordingly based on the selected input values.




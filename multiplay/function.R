library("stringr")
library("purrr")
# Plot all lines in one graphs
add_plot <- function(fig, frame, variable, seria, vessel){
  i = 1
  for (var in variable){
    for (ser in seria) {
      for (ves in vesel){
        df <- frame %>% filter(series %in% ser)
        df <- df %>% filter(vessel %in% ves)
        df <-df[order(df$one_timediff),]
        fig <- add_trace(fig,
                         data = df, 
                         yaxis = paste0("y", i),
                         x = ~one_timediff,
                         y = as.formula(paste0("~", var)),
                         type = 'scatter',
                         mode = 'lines+markers',
                         hovertemplate =map(1:nrow(df), ~paste(
                           "Sample Name: ", df[.,'sample_id'],
                           "<br>Sample Time:", df[.,'file_time'],
                           "<br>Sample Value:", df[.,var])),
                         name = df$seriavessel[1])
      }
    }
    i = i + 1
  }
  
  return(fig)
}

# Plot graphs if line one
one_graph <- function(fig, frame, variable, seria, vessel){
  # Axis label
  ay <- list(position = 0.05 * (1 + 0.01),
             overlaying = 'y',
             side = "left",
             title = paste0("", variable[1]))
  # Plot graphs
  fig <- add_plot(fig, frame, variable, seria, vessel)
  # Plot axis label
  fig <- fig %>% layout(title = 'Mulptiple-axes graph',
                        yaxis = ay,
                        xaxis = list(title="Time"))
  return(fig)
}

# Plot graphs if line two
two_graph <- function(fig, frame, variable, seria, vessel){
  # Axis label
  ay <- list(position = 0.05 * (1 + 0.01),
             overlaying = 'y',
             side = "left",
             title = paste0("", variable[1]))
  ay2 <- list(position = 0.05 * (2 + 0.01),
             overlaying = 'y',
             side = "left",
             title = paste0("", variable[2]))
  # Plot graphs
  fig <- add_plot(fig, frame, variable, seria, vessel)
  # Plot axis label
  fig <- fig %>% layout(title = 'Mulptiple-axes graph',
                        yaxis1 = ay,
                        yaxis2 = ay2,
                        xaxis = list(title = 'Time'))
  
  return(fig)
}

# Plot graphs if line three
three_graph <- function(fig, frame, variable, seria, vessel){
  # Axis label
  ay <- list(position = 0.05 * (1 + 0.01),
             overlaying = 'y',
             side = "left",
             title = paste0("", variable[1]))
  ay2 <- list(position = 0.05 * (2 + 0.01),
              overlaying = 'y',
              side = "left",
              title = paste0("", variable[2]))
  ay3 <- list(position = 0.05 * (3 + 0.01),
              overlaying = 'y',
              side = "left",
              title = paste0("", variable[3]))
  # Plot graphs
  fig <- add_plot(fig, frame, variable, seria, vessel)
  # Plot axis label
  fig <- fig %>% layout(title = 'Mulptiple-axes graph',
                        yaxis1 = ay,
                        yaxis2 = ay2,
                        yaxis3 = ay3,
                        xaxis = list(title = 'Time'))
  
  return(fig)
}

# Plot graphs if line four
four_graph <- function(fig, frame, variable, seria, vessel){
  # Axis label
  ay <- list(position = 0.05 * (1 + 0.01),
             overlaying = 'y',
             side = "left",
             title = paste0("", variable[1]))
  ay2 <- list(position = 0.05 * (2 + 0.01),
              overlaying = 'y',
              side = "left",
              title = paste0("", variable[2]))
  ay3 <- list(position = 0.05 * (3 + 0.01),
              overlaying = 'y',
              side = "left",
              title = paste0("", variable[3]))
  ay4 <- list(position = 0.05 * (4 + 0.01),
              overlaying = 'y',
              side = "left",
              title = paste0("", variable[4]))
  # Plot graphs
  fig <- add_plot(fig, frame, variable, seria, vessel)
  # Plot axis label
  fig <- fig %>% layout(title = 'Mulptiple-axes graph',
                        yaxis1 = ay,
                        yaxis2 = ay2,
                        yaxis3 = ay3,
                        yaxis4 = ay4,
                        xaxis = list(title = 'Time'))
  
  return(fig)
}

# Plot graphs if line five
five_graph <- function(fig, frame, variable, seria, vessel){
  # Axis label
  ay <- list(position = 0.05 * (1 + 0.01),
             overlaying = 'y',
             side = "left",
             title = paste0("", variable[1]))
  ay2 <- list(position = 0.05 * (2 + 0.01),
              overlaying = 'y',
              side = "left",
              title = paste0("", variable[2]))
  ay3 <- list(position = 0.05 * (3 + 0.01),
              overlaying = 'y',
              side = "left",
              title = paste0("", variable[3]))
  ay4 <- list(position = 0.05 * (4 + 0.01),
              overlaying = 'y',
              side = "left",
              title = paste0("", variable[4]))
  ay5 <- list(position = 0.05 * (5 + 0.01),
              overlaying = 'y',
              side = "left",
              title = paste0("", variable[5]))
  # Plot graphs
  fig <- add_plot(fig, frame, variable, seria, vessel)
  # Plot axis label
  fig <- fig %>% layout(title = 'Mulptiple-axes graph',
                        yaxis1 = ay,
                        yaxis2 = ay2,
                        yaxis3 = ay3,
                        yaxis4 = ay4,
                        yaxis5 = ay5,
                        xaxis = list(title = 'Time'))
  
  return(fig)
}

# Plot graphs if line six
six_graph <- function(fig, frame, variable, seria, vessel){
  # Axis label
  ay <- list(position = 0.05 * (1 + 0.01),
             overlaying = 'y',
             side = "left",
             title = paste0("", variable[1]))
  ay2 <- list(position = 0.05 * (2 + 0.01),
              overlaying = 'y',
              side = "left",
              title = paste0("", variable[2]))
  ay3 <- list(position = 0.05 * (3 + 0.01),
              overlaying = 'y',
              side = "left",
              title = paste0("", variable[3]))
  ay4 <- list(position = 0.05 * (4 + 0.01),
              overlaying = 'y',
              side = "left",
              title = paste0("", variable[4]))
  ay5 <- list(position = 0.05 * (5 + 0.01),
              overlaying = 'y',
              side = "left",
              title = paste0("", variable[5]))
  ay6 <- list(position = 0.05 * (6 + 0.01),
              overlaying = 'y',
              side = "left",
              title = paste0("", variable[6]))
  # Plot graphs
  fig <- add_plot(fig, frame, variable, seria, vessel)
  # Plot axis label
  fig <- fig %>% layout(title = 'Mulptiple-axes graph',
                        yaxis1 = ay,
                        yaxis2 = ay2,
                        yaxis3 = ay3,
                        yaxis4 = ay4,
                        yaxis5 = ay5,
                        yaxis6 = ay6,
                        xaxis = list(title = 'Time'))
  
  return(fig)
}

# Plot graphs if line seven
seven_graph <- function(fig, frame, variable, seria, vessel){
  # Axis label
  ay <- list(position = 0.05 * (1 + 0.01),
             overlaying = 'y',
             side = "left",
             title = paste0("", variable[1]))
  ay2 <- list(position = 0.05 * (2 + 0.01),
              overlaying = 'y',
              side = "left",
              title = paste0("", variable[2]))
  ay3 <- list(position = 0.05 * (3 + 0.01),
              overlaying = 'y',
              side = "left",
              title = paste0("", variable[3]))
  ay4 <- list(position = 0.05 * (4 + 0.01),
              overlaying = 'y',
              side = "left",
              title = paste0("", variable[4]))
  ay5 <- list(position = 0.05 * (5 + 0.01),
              overlaying = 'y',
              side = "left",
              title = paste0("", variable[5]))
  ay6 <- list(position = 0.05 * (6 + 0.01),
              overlaying = 'y',
              side = "left",
              title = paste0("", variable[6]))
  ay7 <- list(position = 0.05 * (7 + 0.01),
              overlaying = 'y',
              side = "left",
              title = paste0("", variable[7]))
  # Plot graphs
  fig <- add_plot(fig, frame, variable, seria, vessel)
  # Plot axis label
  fig <- fig %>% layout(title = 'Mulptiple-axes graph',
                        yaxis1 = ay,
                        yaxis2 = ay2,
                        yaxis3 = ay3,
                        yaxis4 = ay4,
                        yaxis5 = ay5,
                        yaxis6 = ay6,
                        yaxis7 = ay7,
                        xaxis = list(title = 'Time'))
  
  return(fig)
}
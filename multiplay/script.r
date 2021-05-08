source('./r_files/flatten_HTML.r')

############### Library Declarations ###############
libraryRequireInstall("XML");
libraryRequireInstall("magrittr");
libraryRequireInstall("ggplot2");
libraryRequireInstall("plotly");
libraryRequireInstall("purrr");
libraryRequireInstall("stringr");
source("function.R");
####################################################

################### Actual code ####################
# Load data
Values <- as.data.frame(Values)
ser <- Values$series
ves <- Values$vessel
seria <- as.list(unique(ser))
vesel <- as.list(unique(ves))

temp_df <- Values[, colSums(is.na(Values)) != nrow(Values)]

variable <- as.list(setdiff(names(temp_df),list('file_time','sample_id','seriavessel',
                                                'series','vessel','timediff')))
df <- data.frame(matrix(ncol = length(names(temp_df)) + 1, nrow = 0))
# Creating a relative time for each process
for (ser in seria){
  temp_ <- temp_df %>% filter(series %in% ser)
  vector_time <- temp_$file_time
  start_time <- min(as.Date(vector_time))
  one_timediff <- difftime(time1 = as.Date(vector_time),
                           time2 = start_time,
                           units = "hour")
  temp_ <- cbind(temp_, one_timediff)
  colnames(df) <- names(temp_)
  df <- rbind(df, temp_)
}
# Plot graphs
fig <- plot_ly()

if (length(variable) == 1){
  fig <- one_graph(fig = fig, frame = df, variable = variable, seria = seria,
                   vessel = vesel)
} else if (length(variable) == 2){
  fig <- two_graph(fig = fig, frame = df, variable = variable, seria = seria,
                   vessel = vesel)
}else if (length(variable) == 3){
  fig <- three_graph(fig = fig, frame = df, variable = variable, seria = seria,
                   vessel = vesel)
}else if (length(variable) == 4){
  fig <- four_graph(fig = fig, frame = df, variable = variable, seria = seria,
                   vessel = vesel)
}else if (length(variable) == 5){
  fig <- five_graph(fig = fig, frame = df, variable = variable, seria = seria,
                    vessel = vesel)
}else if (length(variable) == 6){
  fig <- six_graph(fig = fig, frame = df, variable = variable, seria = seria,
                    vessel = vesel)
}else if (length(variable) == 7){
  fig <- seven_graph(fig = fig, frame = df, variable = variable, seria = seria,
                     vessel = vesel)
}
####################################################

############# Create and save widget ###############
p = ggplotly(fig);
internalSaveWidget(p, 'out.html')
####################################################

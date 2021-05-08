source('./r_files/flatten_HTML.r')

############### Library Declarations ###############
libraryRequireInstall("XML");
libraryRequireInstall("magrittr");
libraryRequireInstall("ggplot2");
libraryRequireInstall("plotly");
libraryRequireInstall("purrr");
libraryRequireInstall("stringr");
####################################################

################### Actual code ####################
# Load data
ser <- Values$series
ves <- Values$vessel
seria <- as.list(unique(ser))
vesel <- as.list(unique(ves))

df <- Values[, colSums(is.na(Values)) != nrow(Values)]

variable <- as.list(setdiff(names(df),list('file_time','sample_id','seriavessel',
                                           'series','vessel','timediff')))
# Plot sub graphs
list_fig = list()

for (var in variable){
  fig <- plot_ly()
  for (ser in seria) {
    for (ves in vesel){
      df <- Values %>% filter(series %in% ser)
      df <- df %>% filter(vessel %in% ves)
      df <-df[order(df$timediff),]
      fig <- add_trace(fig,
                       data = df, 
                       x = ~timediff,
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
  list_fig <- append(list_fig,list(fig))
}
# Count graph in 1 lane
if (length(list_fig) == 1){
  row = length(list_fig)
} else {
  row = floor(length(list_fig) / 2)
}
# Plot graphs
fig_sub <- subplot(list_fig, nrows = row, titleY = TRUE) %>% layout(title="Subplot graph")
####################################################

############# Create and save widget ###############
p = ggplotly(fig_sub);
internalSaveWidget(p, 'out.html')
####################################################

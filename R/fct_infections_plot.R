#' infections_plot 
#'
#' @description A fct function
#'
#' @return The return value, if any, from executing the function.
#'
#' @noRd
NULL
infections_plot <- function(dataset, plot_choice, states){
  View(dataset)
  if (plot_choice == "Overall infections over 2 week periods"){
    plotly::ggplotly(ggplot2::ggplot(
      dataset[dataset$State %in% states,],
      ggplot2::aes(x = date, y = overall, group = State, color = State))+
        ggplot2::geom_line() +
        ggplot2::labs(color = "STATES:  ") +
        ggplot2::ylab("Overall CoVid-19 infections") +
        ggplot2::xlab("Date")+
        ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, size = 16),
                       axis.title.x = ggplot2::element_text(size = 25, face = "bold"),
                       axis.text.y = ggplot2::element_text(size = 16, angle = 45),
                       axis.title.y = ggplot2::element_text(size = 25, face = "bold"),
                       legend.key.size = ggplot2::unit(1,"cm"),
                       legend.text = ggplot2::element_text(size = 14),
                       legend.position = "bottom",
                       legend.box = "vertical",
                       legend.title = ggplot2::element_text(color = "black", size = 20, face = "bold")) +
        ggplot2::scale_x_date(date_breaks = 'month' , date_labels = "%b-%y") +
        ggplot2::guides(size = "none"))
  }
  else if (plot_choice == "Overall infections per 100,000 population over 2 week periods") {
    plotly::ggplotly(ggplot2::ggplot(
      dataset[dataset$State %in% states,],
      ggplot2::aes(x = date, y = per_hundred_thousand, group = State, color = State))+
        ggplot2::geom_line() +
        ggplot2::ylab("Overall CoVid-19 infections per 100,000 population") +
        ggplot2::xlab("Date")+
        ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, size = 16),
                       axis.title.x = ggplot2::element_text(size = 20, face = "bold"),
                       axis.text.y = ggplot2::element_text(size = 16, angle = 45),
                       axis.title.y = ggplot2::element_text(size = 20, face = "bold"),
                       legend.key.size = ggplot2::unit(1,"cm"),
                       legend.text = ggplot2::element_text(size = 14),
                       legend.position = "bottom",
                       legend.box = "vertical",
                       legend.title = ggplot2::element_text(color = "black", size = 20, face = "bold")) +
        ggplot2::scale_x_date(date_breaks = 'month' , date_labels = "%b-%y") +
        ggplot2::guides(size = "none"))
  }
}
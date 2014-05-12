namelength_png <- function(filename) {
  names <- read.table(file=filename, 
                         sep=",", 
                         col.names=c("State", "Gender", "Year", "Name", "Count"),
                         colClasses=c("character", "factor", "numeric", "character", "numeric")
  )
  
  names$Length <- nchar(names$Name)
  
  boys_names <- subset(names, Gender == "M")
  girls_names <- subset(names, Gender == "F")
  
  length_list_m <- with(boys_names, tapply(Length, Year, mean))
  length_list_f <- with(girls_names, tapply(Length, Year, mean))
  
  png(filename = "namelength.png")
  plot(length_list_m, 
       type="l",
       xlab="", 
       ylab="Avg. number of letters", 
       main="Average Length of Names in Alabama",
       ylim=c(5.5,6.3),
       xaxt="n", 
       col="blue")
  lines(length_list_f, type="l", col="pink")
  axis(1, at=1:length(names(length_list_f)), labels=names(length_list_f))
  legend("topright", lty="solid", col=c("blue", "pink"), legend=c("Boys", "Girls"))
  dev.off()
}
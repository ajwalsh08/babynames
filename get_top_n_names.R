get_top <- function(filename, yr, num) {
  names <- read.table(file=filename, 
                         sep=",", 
                         col.names=c("State", "Gender", "Year", "Name", "Count"),
                         colClasses=c("character", "factor", "numeric", "character", "numeric")
  )
  year_names <- subset(names, Year == yr)
  yr_name_rk <- year_names[order(-year_names$Count),]
  
  boys_names <- subset(yr_name_rk, Gender == "M")
  girls_names <- subset(yr_name_rk, Gender == "F")
  
  write.csv(head(boys_names, n = num), 
            file=paste("top_boy_names",yr,".csv",sep=""),
            row.names = FALSE)
  write.csv(head(girls_names, n = num), 
            file=paste("top_girl_names",yr,".csv",sep=""),
            row.names = FALSE)
}
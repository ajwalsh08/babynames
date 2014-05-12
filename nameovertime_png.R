nameovertime_png <- function(filename, babyname, gender) {
  names <- read.table(file=filename, 
                         sep=",", 
                         col.names=c("State", "Gender", "Year", "Name", "Count"),
                         colClasses=c("character", "factor", "numeric", "character", "numeric")
  )
  
  one_name <- subset(names, Name == babyname & Gender == gender)
  
  png(filename = paste("popularity of ",babyname,".png", sep=""))
  plot(one_name$Year, one_name$Count, 
       type="l",
       xlab="", 
       ylab="Name count per year", 
       main=paste("Popularity of ",babyname," in Alabama", sep="")
       )
  dev.off()
}
# Name file probably stored at "~/Google Drive/Alabama Media Group/1 Data Projects/Baby Names/Names By State 2012/AL.TXT"
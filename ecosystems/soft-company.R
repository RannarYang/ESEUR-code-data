#
# soft-company.R, 22 May 20
# Data from:
# OpenCorporates.org
#
# Example from:
# Evidence-based Software Engineering: based on the publicly available data
# Derek M. Jones
#
# TAG company_software company_hardware company_UK


source("ESEUR_config.r")


library("lubridate")

pal_col=rainbow(2)

ch=read.csv(paste0(ESEUR_dir, "ecosystems/uk-soft-comp.csv.xz"), as.is=TRUE)

ch$IncorporationDate=as.Date(ch$IncorporationDate, format="%d/%m/%Y")
ch$Incorporation_M_Y=round_date(ch$IncorporationDate, "month")

# Assume anything before 1946 matches because SIC description has changed
# Post 2014 counts currently iffy
ch=subset(ch, Incorporation_M_Y > "1946-01-01"&
              Incorporation_M_Y < "2014-01-01")

# DissolutionDate column was empty; need to get the data again :-(

soft=subset(ch, grepl("*software*", SICCode.SicText, ignore.case=TRUE))
comp=subset(ch, grepl("*computer*", SICCode.SicText, ignore.case=TRUE))

t=as.data.frame(table(soft$Incorporation_M_Y))
t$Date=as.Date(t$Var1, format="%Y-%m-%d")

plot(t$Date, t$Freq, log="y", col=pal_col[1],
	xlim=range(ch$IncorporationDate),
	xlab="Date", ylab="New company registrations\n")

t=as.data.frame(table(comp$Incorporation_M_Y))
t$Date=as.Date(t$Var1, format="%Y-%m-%d")

points(t$Date, t$Freq, log="y", col=pal_col[2])

legend(x="topleft", legend=c("Software", "Computer"), bty="n", fill=pal_col, cex=1.2)


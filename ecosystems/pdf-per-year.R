#
# pdf-per-year.R, 23 May 20
#
# Data from:
# Formats over Time: Exploring UK Web History
#
# Example from:
# Evidence-based Software Engineering: based on the publicly available data
# Derek M. Jones
#
# TAG files_pdf pdf_evolution


source("ESEUR_config.r")

library("plyr")


plot_pdf=function(df)
{
lines(df$year, df$occurrences, col=pal_col[as.numeric(df$version[1])])
}


pdf_occur=read.csv(paste0(ESEUR_dir, "ecosystems/pdf-per-year.csv.xz"), as.is=TRUE)

pdf_occur=pdf_occur[order(pdf_occur$year), ]
pdf_occur$version=as.factor(pdf_occur$version)

pal_col=rainbow(length(unique(pdf_occur$version)))

plot(1, type="n", log="y",
	xlim=c(1996, 2010), ylim=c(1e1, 2e6),
	xlab="Year", ylab="Pdf files\n")
d_ply(pdf_occur, .(version), plot_pdf)

legend(x="bottomright", legend=unique(pdf_occur$version),
				bty="n", fill=pal_col, cex=1.2)


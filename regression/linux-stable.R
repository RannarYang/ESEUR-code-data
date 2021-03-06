#
# linux-stable.R, 22 Apr 20
#
# Data from:
# Linux Kernel development: How fast it is going, who is doing it, what they are doing, and who is sponsoring it (Mar 2012)
# Jonathan Corbet and Greg Kroah-Hartman and Amanda McPherson
#
# Example from:
# Evidence-based Software Engineering: based on the publicly available data
# Derek M. Jones
#
# TAG Linux_updates LOC evolution developers Linux_2012

source("ESEUR_config.r")


patches=read.csv(paste0(ESEUR_dir, "regression/linux-patch-fix.csv.xz"), as.is=TRUE)

pal_col=rainbow(3)

# plot(patches$Total.Updates, patches$Fixes,
# 	xlim=c(0, 60), ylim=c(0, 1000))
# 
# p_mod=glm(Fixes ~ Total.Updates, data=patches)

cleaned=subset(patches, Total.Updates < 40)

c_mod=glm(Fixes ~ Total.Updates, data=cleaned)

plot(cleaned$Total.Updates, cleaned$Fixes, col=pal_col[2],
	xaxs="i", yaxs="i",
	xlab="Number of updates", ylab="Number of fixes\n",
	xlim=c(0, 25), ylim=c(0, 900))

pred=predict(c_mod, newdata=data.frame(Total.Updates=1:25), type="response", se.fit=TRUE)

lines(pred$fit, col=pal_col[1])
lines(pred$fit+1.96*pred$se.fit, col=pal_col[3])
lines(pred$fit-1.96*pred$se.fit, col=pal_col[3])

# t=loess(Fixes ~ Total.Updates, data=cleaned, span=0.3)
# q=predict(t, newdata=data.frame(Total.Updates=1:30))
# lines(q, col="red")

# summary(c_mod)


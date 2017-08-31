eurex.plot.timeseries.days = function(daybins) {
		x = as.numeric(as.Date(daybins[,'execution_date']))
		y_high = daybins[,'high']
		y_low = daybins[,'low']
		xlim1 = range(as.Date(daybins[,'execution_date']))
		ylim1 = range(c(y_low,y_high),na.rm=TRUE)		
		par(mar=c(2.5,4.5,1,1))
		layout(c(1,1,1,2))
		plot(0,0,col='white',ylim=ylim1,xlim=xlim1,las=1,frame.plot=0,xlab="",ylab="",xaxt='n')
		rect(x,y_low,x+0.9,y_high,border="#000099")
		securityIdList = sort(unique(daybins[,'securityId']))
		for(i in 1:length(securityIdList)) {
				u = which(daybins[,'securityId']==securityIdList[i])
				rect(x[u],y_low[u],x[u]+0.9,y_high[u],border=c("#000099","#8cd2ff","#0099ff","#5fbeff")[i%%3+1])
			}
		xticks = seq(xlim1[1],xlim1[2],,7)
		axis(1,xticks,as.Date(xticks,origin='1970-01-01'))
		y_vol = daybins[,'numberofcontracts']
		ylim2 = range(y_vol,na.rm=TRUE)
		plot(0,0,col='white',ylim=ylim2,xlim=xlim1,las=1,frame.plot=0,xlab="",ylab="",xaxt='n')
		for(i in 1:length(securityIdList)) {
				u = which(daybins[,'securityId']==securityIdList[i])
				lines(x[u],y_vol[u],type='h',col=c("#000099","#8cd2ff","#0099ff","#5fbeff")[i%%3+1])
			}
		axis(1,xticks,as.Date(xticks,origin='1970-01-01'))
	}

eurex.plot.intraday = function(intradaybins) {
		securityIdList = sort(unique(intradaybins[,'securityId']))
		ylim1 = range(c(intradaybins[,'low'],intradaybins[,'high']),na.rm=TRUE)	
		xlim1 = range(as.numeric(substr(intradaybins[,'execution_time'],1,2))*60 + as.numeric(substr(intradaybins[,'execution_time'],4,5))) + c(0,1)
		par(mar=c(2.5,4.5,1,1))
		layout(c(1,1,1,2))				
		plot(0,0,col='white',ylim=ylim1,xlim=xlim1,las=1,frame.plot=0,xlab="",ylab="",xaxt='n')
		for(i in 1:length(securityIdList)) {		
				u = which(intradaybins[,'securityId']==securityIdList[i])
				x = as.numeric(substr(intradaybins[u,'execution_time'],1,2))*60 + as.numeric(substr(intradaybins[u,'execution_time'],4,5))
				y_open = intradaybins[u,'open']
				y_high = intradaybins[u,'high']
				y_low = intradaybins[u,'low']
				y_close = intradaybins[u,'close']
				t3 = cbind(c(x+0.1,x+0.9),c(y_open,y_close))
				t3 = t3[order(t3[,1]),]
				rect(x+0.2,y_low,x+0.8,y_high,border=c("#000099","#8cd2ff","#0099ff","#5fbeff")[i%%3+1])
			}
		xticks = seq(xlim1[1],xlim1[2],,7)
		xlabs = paste0(substr(100+floor(xticks/60),2,3),':',substr(100+xticks%%60,2,3))
		axis(1,xticks,xlabs)
		ylim2 = range(intradaybins[,'numberofcontracts'],na.rm=TRUE)
		plot(0,0,col='white',ylim=ylim2,xlim=xlim1,las=1,frame.plot=0,xlab="",ylab="",xaxt='n')			
		for(i in 1:length(securityIdList)) {		
				u = which(intradaybins[,'securityId']==securityIdList[i])	
				x = as.numeric(substr(intradaybins[u,'execution_time'],1,2))*60 + as.numeric(substr(intradaybins[u,'execution_time'],4,5))				
				y_vol = intradaybins[u,'numberofcontracts']
				lines(x,y_vol,type='h',col=c("#000099","#8cd2ff","#0099ff","#5fbeff")[i%%3+1])
			}
		axis(1,xticks,xlabs)		
	}
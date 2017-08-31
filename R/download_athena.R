get.future.timeseries.days = function(ProductName) {
		sqlQuery = paste0("SELECT securityId, execution_date, max(high) as high, min(low) as low, sum(numberofcontracts) as numberofcontracts 
				FROM dbg_pds_test.trades where ProductName='",ProductName,"' and Instrument='FUT'
				group by securityid, execution_date
				order by securityid, execution_date")
		AthenaQuery(sqlQuery)
	}

get.future.timeseries.intraday = function(ProductName,Date) {
		sqlQuery = paste0("SELECT securityId, execution_time, open, high, low, close, numberofcontracts 
						FROM dbg_pds_test.trades 
						where ProductName='",ProductName,"' and Instrument='FUT'
						and execution_date BETWEEN date '",Date,"' AND date '",Date,"'
						order by securityid, execution_time")
		AthenaQuery(sqlQuery)
	}
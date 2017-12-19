select allreturns.date, allreturns.securityid, allreturns.description, allreturns.percentchange 

from (

    select xetra1.date, max((xetra2.close - xetra1.open) / xetra1.open) as percentchange

    from (

        select securityid, min(time) as mintime, max(time) as maxtime, date from xetra 
        group by securityid, date
    ) as timestamps

    left join xetra as xetra1
    on xetra1.securityid = timestamps.securityid and xetra1.date = timestamps.date and xetra1.time = timestamps.mintime

    left join xetra as xetra2
    on xetra2.securityid = timestamps.securityid and xetra2.date = timestamps.date and xetra2.time = timestamps.maxtime

    group by xetra1.date
) as maxreturns

left join (
    select xetra1.securityid, xetra1.description, xetra1.date, (xetra2.close - xetra1.open) / xetra1.open as percentchange
    
    from (

        select securityid, min(time) as mintime, max(time) as maxtime, date from xetra 
        group by securityid, date
    ) as timestamps

    left join xetra as xetra1
    on xetra1.securityid = timestamps.securityid and xetra1.date = timestamps.date and xetra1.time = timestamps.mintime

    left join xetra as xetra2
    on xetra2.securityid = timestamps.securityid and xetra2.date = timestamps.date and xetra2.time = timestamps.maxtime
) as allreturns 

on maxreturns.percentchange = allreturns.percentchange and maxreturns.date = allreturns.date

order by allreturns.date

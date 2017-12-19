select sumtable.date, sumtable.securityid, sumtable.description, maxtable.maxamount

from (
    select date, max(tradeamountmm) as maxamount

    from (

        select securityid, description, date, sum(open * tradedvolume) / 1e6 as tradeamountmm
        from xetra 
        where currency = 'EUR'
        group by securityid, description, date
        order by date asc, tradeamountmm desc
    )

    group by date
) as maxtable

left join (
    select securityid, description, date, sum(open * tradedvolume) / 1e6 as tradeamountmm
    from xetra 
    where currency = 'EUR'
    group by securityid, description, date
    order by date asc, tradeamountmm desc
) as sumtable 

on sumtable.tradeamountmm = maxtable.maxamount and sumtable.date = maxtable.date

order by sumtable.date asc, maxtable.maxamount desc

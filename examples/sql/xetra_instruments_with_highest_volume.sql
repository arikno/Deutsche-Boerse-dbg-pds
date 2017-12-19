select description, securityid, avg((high - low) / low) as implied_vol from xetra
group by description, securityid
order by implied_vol desc

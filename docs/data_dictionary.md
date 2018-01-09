# DBG PDS Data Dictionary

The Deutsche Börse Public Dataset is actually comprised of two sets datas, representing source data from the XETRA and EUREX trading engines.

## XETRA

The XETRA dataset contains trade data relating to stock market trades dating from Jun-26-2016 onwards. Each row represents an aggregate of one-minute of trade activity for each security, following the Open/High/Low/Close (OHLC) format, with the number of trades and traded contracts also provided.

The dataset contains the following fields:

| Column Name | Data Description | Data Dictionary |
|-------------|------------------|-----------------|
|ISIN|ISIN of the security|string|
|Mnemonic|Stock exchange ticker symbol |string|
|SecurityDesc|Description of the security|string|
|SecurityType|Type of security|string|
|SecurityID|Unique identifier for each contract|int|
|Date |Date of trading period |date |
|Time |Hour and Minute of Trading Activity |time |
|Currency|Currency in which the product is traded|string - GBP (British Pounds Sterling); USD (US Dollar) TWD (Taiwan Dollar); CHF (Swiss franc); GBX (British Pence Sterling); EUR (Euro); KRW (Korean Won)|
|StartPrice|Trading price at the start of period|float|
|MaxPrice|Maximum price over the period|float|
|MinPrice|Minimum price over the period|float|
|EndPrice|Trading price at the end of the period|float|
|TradedVolume|Total value traded|float|
|NumberOfTrades|Number of distinct transactions during the period|int|

## EUREX

The EUREX dataset contains trade data relating to derivative (a product whose price is derived from one or more underlying assets, such as a commodity, currency, or security) security trades dating from 2014-01-02 onwards. Each row represents an aggregate of one-minute of trade activity for each security, following the Open/High/Low/Close (OHLC) format, with the number of trades and traded contracts also provided.

The dataset contains the following fields:

| Column Name | Data Description | Data Dictionary |
|-------------|------------------|-----------------|
|ISIN|ISIN of the security|string|
|MarketSegment|The product market segment, following the convention on http://www.eurexchange.com|string|
|UnderlyingSymbol|The underlying security|string|
|UnderlyingISIN|ISIN of the underlying security|string|
|SecurityType|Type of instrument|string - OPT (option), FUT (future)|
|MaturityDate|Maturity date of the security|date|
|StrikePrice|Strike price|float|
|PutOrCall|Type of option|string - PUT, CALL|
|MLEG|Identifies multi-leg options|string|
|ContractGenerationNumber|The contract generation number, which allows one to specify the contract on EUREX|int|
|SecurityID|Unique identifier for each contract|int|
|Date|Date of trading period |date |
|Time|Hour and Minute of Trading Activity|time (hh:mm)|
|Currency|Currency in which the product is traded|string - GBP (British Pounds Sterling); USD (US Dollar) TWD (Taiwan Dollar); CHF (Swiss franc); GBX (British Pence Sterling); EUR (Euro); KRW (Korean Won)|
|StartPrice|Trading price at the start of period|float|
|MaxPrice|Maximum price over the period|float|
|MinPrice|Minimum price over the period|float|
|EndPrice|Trading price at the end of the period|float|
|NumberOfContracts|Number of contracts traded during the period|in|
|NumberOfTrades|Number of distinct transactions during the period|int|

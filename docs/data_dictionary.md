# DBG PDS Data Dictionary

The Deutsche Börse Public Dataset is actually comprised of two sets datas, representing source data from the XETRA and EUREX trading engines.

## XETRA

The XETRA dataset contains trade data relating to stock market trades dating from Jun-26-2016 onwards. Each row represents an aggregate of one-minute of trade activity for each security, following the Open/High/Low/Close (OHLC) format, with the number of trades and traded contracts also provided.

The dataset contains the following fields:

| Column Name | Data Description | Data Dictionary |
|-------------|------------------|-----------------|
|isin|ISIN of the security|string|
|description|Description of the security|string|
|stocktype|Type of security|string|
|currency|Currency in which the product is traded|string - GBP (British Pounds Sterling); USD (US Dollar) TWD (Taiwan Dollar); CHF (Swiss franc); GBX (British Pence Sterling); EUR (Euro); KRW (Korean Won)|
|securityid|Unique identifier for each contract|int|
|date |Date of trading period |date |
|time |Hour and Minute of Trading Activity |time |
|open|Trading price at the start of period|float|
|high|Maximum price over the period|float|
|low|Minimum price over the period|float|
|close|Trading price at the end of the period|float|
|tradedvolume|Total value traded|float|
|numberoftrades|Number of distinct transactions during the period|int|

## EUREX

The EUREX dataset contains trade data relating to derivative (a product whose price is derived from one or more underlying assets, such as a commodity, currency, or security) security trades dating from 2014-01-02 onwards. Each row represents an aggregate of one-minute of trade activity for each security, following the Open/High/Low/Close (OHLC) format, with the number of trades and traded contracts also provided.

The dataset contains the following fields:

| Column Name | Data Description | Data Dictionary |
|-------------|------------------|-----------------|
|productname|The product name, following the convention on http://www.eurexchange.com|string|
|underlying|The underlying security|string|
|underlyingisin|ISIN of the underlying security|string|
|currency|Currency in which the product is traded|string - GBP (British Pounds Sterling); USD (US Dollar) TWD (Taiwan Dollar); CHF (Swiss franc); GBX (British Pence Sterling); EUR (Euro); KRW (Korean Won)|
|instrument|Type of instrument|string - OPT (option), FUT (future)|
|maturity|Maturity date of the security|date|
|strike|Strike price|float|
|putorcall|Type of option|string - PUT, CALL|
|version|The contract generation number, which allows one to specify the contract on EUREX|int|
|securityid|Unique identifier for each contract|int|
|execution date |Date of trading period |date |
|execution time |Hour and Minute of Trading Activity|time (hh:mm)|
|open|Trading price at the start of period|float|
|high|Maximum price over the period|float|
|low|Minimum price over the period|float|
|close|Trading price at the end of the period|float|
|numberofcontracts|Number of contracts traded during the period|in|
|numberoftrades|Number of distinct transactions during the period|int|
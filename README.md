#  Deutsche Börse Public Dataset (DBG PDS)

## Introduction

The Deutsche Börse Public Dataset (PDS) project makes real-time data derived from Deutsche Börse's trading market systems available to the public for free. This is the first instance that such detailed financial market data has been shared freely and continually from the source provider. 

This data is provided on a minute-by-minute basis and aggregated and processed from the [XETRA](http://www.xetra.com) and [EUREX](http://www.eurex.com/) engines, which comprise a variety of equities, funds and derivative securities. The PDS contains details for on a per security level, detailing trading activity by minute including the high, low, first and last prices within the time period. The PDS created using the cloud provider's infrastructure continually and made available through their public data repository initiatives, such as the [AWS Public Dataset project](https://aws.amazon.com/public-datasets/).

Deutsche Boerse Group believes that freely available, high quality data fosters innovation and creates business opportunities. The financial community, academic researchers, data scientists and others can explore the possibilities of the data to open up new analysis and product possibilities.

## Data Dictionary

The Deutsche Börse Public Dataset is actually comprised of two sets datas, representing source data from the XETRA and EUREX trading engines.

### XETRA

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

### EUREX

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

## Calendar

Trading data is available historically. Refer to the [EUREX calendar](eurex_calendar.csv) attached to know the dates when EUREX was trading. Also, there is currently a couple of days with technical issues being under investigation. Those are also mentioned in the calendar.

## Use cases

A couple of exemplary use cases are provided in Python (not yet avilable) and R. Please refer to the corresponding directories in this folder.

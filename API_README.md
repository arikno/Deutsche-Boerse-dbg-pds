PDS API
=======
This API provides access to the Deutsche Boerse Public Data Set, which consists of Xetra and Eurex trade data aggregated to one minute intervals. It provides the initial price, lowest price, highest price and final price for every minute of the trading day, and for every tradeable security. If you need higher resolution data, including untraded price movements, please refer to our historical market data product.

**Version:** 1

**License:** [Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html)

### EXAMPLE: `curl -H "X-DBP-APIKEY: <INSERT YOUR API KEY HERE>" https://api.developer.deutsche-boerse.com/prod/eurex-public-data-set/1.0.0/eurex?date=2018-06-28`
---
##### ***GET***
**Summary:** Get small sample of Eurex trading data

**Description:** Get Eurex data from the PDS data set.

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| limit | query | Number of data points to be returned in a query. Maximum is 1000, Minimum is 1, Default is 100. | No | integer |
| date | query | Date to query in YYYY-MM-DD format. Default is 2014-03-21. | No | date |
| securityid | query | SecurityID to query EUREX data by. Omitting securityID will return data points with any ID. | No | long |
| isin | query | ISIN to query XETRA data by, which identifies instrument. Omitting ISIN will return data points with any ISIN. | No | string |
| offset | query | Starting point in date to query data from. Default is 0. | No | integer |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Successful query | [ [Eurex](#eurex) ] |
| 400 | Bad request - If a bad parameter is passed in, API will return a 400 Bad Request error, with the following message: "Illegal parameter passed in"|
| 500 | Internal server error |

### EXAMPLE: `curl -H "X-DBP-APIKEY: <INSERT YOUR API KEY HERE>" https://api.developer.deutsche-boerse.com/prod/xetra-public-data-set/1.0.0/xetra?date=2018-06-28`
---
##### ***GET***
**Summary:** Get small sample of Xetra trading data

**Description:** Get Xetra data from the PDS data set.

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| limit | query | Number of data points to be returned in a query. Maximum is 1000, Minimum is 1, Default is 100. | No | integer |
| date | query | Date to query in YYYY-MM-DD format. Default is 2017-09-20. | No | date |
| securityid | query | SecurityID to query EUREX data by. Omitting securityID will return data points with any ID. | No | long |
| isin | query | ISIN to query XETRA data by, which identifies instrument. Omitting ISIN will return data points with any ISIN. | No | string |
| offset | query | Starting point in date to query data from. Default is 0. | No | integer |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Successful query | [ [Xetra](#xetra) ] |
| 400 | Bad request - If a bad parameter is passed in, API will return a 400 Bad Request error, with the following message: "Illegal parameter passed in" |
| 500 | Internal server error |

### Models
---

### Eurex  

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| isin | string |  | No |
| marketSegment | string |  | No |
| underlyingSymbol | string |  | No |
| underlyingIsin | string |  | No |
| currency | string |  | No |
| securityType | string |  | No |
| maturityDate | date |  | No |
| strikePrice | float |  | No |
| putOrCall | string |  | No |
| mleg | string |  | No |
| contractGenerationNumber | long |  | No |
| securityID | long |  | No |
| date | date |  | No |
| time | string |  | No |
| startPrice | float |  | No |
| maxPrice | float |  | No |
| minPrice | float |  | No |
| endPrice | float |  | No |
| numberOfContracts | long |  | No |
| numberOfTrades | long |  | No |

### Xetra  

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| isin | string |  | No |
| mnemonic | string |  | No |
| securityDesc | string |  | No |
| securityType | string |  | No |
| currency | string |  | No |
| securityID | long |  | No |
| date | date |  | No |
| time | string |  | No |
| startPrice | float |  | No |
| maxPrice | float |  | No |
| minPrice | float |  | No |
| endPrice | float |  | No |
| tradedVolume | float |  | No |
| numberOfTrades | integer |  | No |

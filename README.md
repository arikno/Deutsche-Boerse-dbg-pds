# TryDBAG-PDS

This repository contains examplary use cases for the Deutsche Börse Public Dataset.

## Deutsche Börse Public Dataset

Deutsche Börse Public Dataset is currently avalaible for EUREX, XETRA to be added later.

### EUREX

The EUREX dataset contains trade data since the 2014-01-02 aggregated into one-minute time bins following the Open/High/Low/Close (OHLC) format. Additional number of trades and the number of traded contracts are provided.

The dataset contains a couple of fields to identfy the contract traded:
* **ProductName** follows the naming convention on http://www.eurexchange.com (sometimes also called MarketSegment).
*	**Underlying** is the short name of the underlying, if this an an existing index or traded product, otherwise empty.
* **UnderlyingIsin** is the ISIN of the underlying, if the underlying is a traded product, otherwise empty.
* Currency            Currency of the traded derivative
* Instrument          Type of instrument (FUT future, OPT option, MLEG calendar spread, other complex instruments are excluded)
* Maturity
* Strike/PutOrCall
* MLEG
* version
* SecurityId

### XETRA

XETRA data will be added in a later stage.

## Execptions

## Get connected

Go to https://docs.aws.amazon.com/athena/latest/ug/connect-with-jdbc.html to find information on connecting your computer to Athena.

The given R and Python examples required a JDBC connection.


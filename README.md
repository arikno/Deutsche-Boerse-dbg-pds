# TryDBAG-PDS

This repository contains a description and examplary use cases for the Deutsche Börse Public Dataset.

## Deutsche Börse Public Dataset

Deutsche Börse Public Dataset is currently avalaible for EUREX, XETRA to be added later.

### EUREX

The EUREX dataset contains trade data since the 2014-01-02 aggregated into one-minute time bins following the Open/High/Low/Close (OHLC) format. Additional number of trades and the number of traded contracts are provided.

The dataset contains a couple of fields to describe the derivatives:
* **ProductName** follows the naming convention on http://www.eurexchange.com (sometimes also called MarketSegment).
*	**Underlying** is the short name of the underlying, if this an an existing index or traded product, otherwise empty.
* **UnderlyingIsin** is the ISIN of the underlying, if the underlying is a traded product, otherwise empty.
* **Currency** is the currency in which the derivative trades and so the currency the OHLC prices refer to.
* **Instrument** is the type of instrument (FUT future, OPT option, MLEG calendar spread, all other complex instruments are excluded).
* **Maturity** is the maturity of the given derivative.
* **Strike**/**PutOrCall** only exist for options and define the respective option contract parameters.
* **MLEG** is the description available only for calendar spreads, only available for calendar spreads.
* **Version** is the contract version, also called contract generation number, that helps to uniquely describe the contract on EUREX, only available where applicable.
* **SecurityId** is the unique identfier for the contract taken from EUREX's market data interface.

### XETRA

XETRA data will be added in a later stage.

## Calendar

Trading data is available historically. Refer to the EUREX calendar file attached in this folder to know the dates when EUREX was trading. Also, there is currently a couple of days with technical issues being under investigation.

## Connection

Go to https://docs.aws.amazon.com/athena/latest/ug/connect-with-jdbc.html to find information on connecting your computer to Athena.

The given R and Python examples required a JDBC connection.


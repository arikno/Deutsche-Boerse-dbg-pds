#  Deutsche Börse Public Dataset (DBG PDS)

## Introduction

The Deutsche Börse Public Dataset (PDS) project makes near-time data derived from Deutsche Börse's trading systems available to the public for free. This is the first time that such detailed financial market data has been shared freely and continually from the source provider.

This data is provided on a minute-by-minute basis and aggregated from the [Xetra](http://www.xetra.com) and [Eurex](http://www.eurexchange.com/) engines, which comprise a variety of equities, funds and derivative securities. The PDS contains details for on a per security level, detailing trading activity by minute including the high, low, first and last prices within the time period.

The PDS is created using a cloud provider's infrastructure and made available through their public data repository initiatives, such as the [AWS Public Dataset project](https://aws.amazon.com/public-datasets/).

Deutsche Boerse Group believes that freely available, high quality data fosters innovation and creates business opportunities. The financial community, academic researchers, data scientists and others can explore the possibilities of the data to open up new analysis and product possibilities.

## Location(s)

The data is uploaded into two Amazon S3 Buckets in the EU Central (Frankfurt) region:

* [s3://deutsche-boerse-xetra-pds](https://s3.eu-central-1.amazonaws.com/deutsche-boerse-xetra-pds) (for Xetra data)
* [s3://deutsche-boerse-eurex-pds](https://s3.eu-central-1.amazonaws.com/deutsche-boerse-eurex-pds) (for Eurex data)


## Naming Convention

Each bucket contains a directory for each available date, named in the ISO 8601 format `YYYY-MM-DD`.

For dates other than the current trading day in Frankfurt time, where the exchanges live, a file exists for each hour of the trading day.  These files are named `YYYY-MM-DD_BINS_mrkthh.csv`, where `mkrt` is either XEUR or XETR (ISO 10383 Market Identification Codes) and `hh` is the two digit hour indicating which hour of trading the file contains, in 24 hour format. Time is in UTC  (both for file names as well as for the content).

For example:
```
$ aws s3 ls deutsche-boerse-xetra-pds/2017-08-01/ --no-sign-request
2018-04-04 12:58:38        136 2017-08-01_BINS_XETR00.csv
2018-04-04 12:58:38        136 2017-08-01_BINS_XETR01.csv
2018-04-04 12:58:38        136 2017-08-01_BINS_XETR02.csv
2018-04-04 12:58:38        136 2017-08-01_BINS_XETR03.csv
2018-04-04 12:58:38        136 2017-08-01_BINS_XETR04.csv
2018-04-04 12:58:38        136 2017-08-01_BINS_XETR05.csv
2018-04-04 12:58:38        136 2017-08-01_BINS_XETR06.csv
2018-04-04 12:58:38    1016188 2017-08-01_BINS_XETR07.csv
2018-04-04 12:58:39     934078 2017-08-01_BINS_XETR08.csv
2018-04-04 12:58:38     863130 2017-08-01_BINS_XETR09.csv
2018-04-04 12:58:41     805186 2017-08-01_BINS_XETR10.csv
2018-04-04 12:58:38     749942 2017-08-01_BINS_XETR11.csv
2018-04-04 12:58:40     788177 2017-08-01_BINS_XETR12.csv
2018-04-04 12:58:40    1054569 2017-08-01_BINS_XETR13.csv
2018-04-04 12:58:39    1145654 2017-08-01_BINS_XETR14.csv
2018-04-04 12:58:41     712217 2017-08-01_BINS_XETR15.csv
2018-04-04 12:58:41        136 2017-08-01_BINS_XETR16.csv
2018-04-04 12:58:41        136 2017-08-01_BINS_XETR17.csv
2018-04-04 12:58:41        136 2017-08-01_BINS_XETR18.csv
2018-04-04 12:58:40        886 2017-08-01_BINS_XETR19.csv
2018-04-04 12:58:41        136 2017-08-01_BINS_XETR20.csv
2018-04-04 12:58:41        136 2017-08-01_BINS_XETR21.csv
2018-04-04 12:58:41        136 2017-08-01_BINS_XETR22.csv
2018-04-04 12:58:41        136 2017-08-01_BINS_XETR23.csv
$ 
```

For technical reasons relating to the eventual consistency model of S3, each intra-day file contains data relating to a single *minute* instead of an hour.  These files are collapsed into the hourly files some time after the end of each trading day.

The naming convention for intra-day files is the same as above, but with the addition of the minute to which the file relates, so the `hh` component becomes `hhmm`.

For example:
```
$ aws s3 ls deutsche-boerse-xetra-pds/2018-06-19/ --no-sign-request
2018-06-18 19:15:04        136 2018-06-19_BINS_XETR0000.csv
2018-06-18 19:15:08        136 2018-06-19_BINS_XETR0001.csv
2018-06-18 19:15:06        136 2018-06-19_BINS_XETR0002.csv
2018-06-18 19:15:08        136 2018-06-19_BINS_XETR0003.csv
[...]
2018-06-19 02:15:06       4228 2018-06-19_BINS_XETR0700.csv
2018-06-19 02:15:07       3601 2018-06-19_BINS_XETR0701.csv
2018-06-19 02:15:08      17917 2018-06-19_BINS_XETR0702.csv
2018-06-19 02:15:09      15483 2018-06-19_BINS_XETR0703.csv
2018-06-19 02:15:09      29281 2018-06-19_BINS_XETR0704.csv
[...]
```

# Non-trading Hours vs. Missing Data
Neither Eurex nor Xetra are 24 hour trading venues, so there will be hours during the day when there is simply no trading activity.  To help data consumers distinguish between what may be missing data and normal non-trading conditions, CSV files containing only headers are emitted to positively identify normal, non-trading conditions.

We are aware that this causes problems for some tools that are incapable of identifying these header-only files and apologise for that.  Changing to a new methodolgy has been considered, but the volume of historical data and doing so in a way that doesn't affect existing consumer pipelines is difficult and not something we plan to tackle any time soon.

All we can currently suggest is that you either use a different tool or apply some pre-filtering to the data.  

These empty files are a consistent size (136 bytes for Xetra and 230 bytes for Eurex) so even a simple size filter would suffice.

## Data Dictionary

The contents of the Deutsche Börse Public Dataset, from the Xetra and Eurex trading engines, are defined in the [data dictionary](docs/data_dictionary.md).

## Calendar

Trading data is currently available as far back as June 26th 2017 for Xetra, and May 29th 2017 for Eurex.  Additional historical data may be made available in the future, depending on demand.

## Example Use Cases

Exemplary use cases are provided in SQL for Xetra data in the [examples](examples/) folder.  There's also a TensorFlow [demonstration project](https://github.com/Originate/dbg-pds-tensorflow-demo).

## Terms and Conditions

License: Non-commercial (NC) - licensees may copy, distribute, display, and perform the work and make derivative works and remixes based on it only for non-commercial purposes.


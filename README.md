# WeatherDemo

This is demo Power BI report based on Weather Data.

Solution contains a Power BI Weather report and all BI components that were used to load and organize data.

Weather data was downloaded using this API:
https://www.worldweatheronline.com/

Solution is based on following components:
* Disk storage area for downloaded JSONs from API
* Sql Server database that is used for creating final data model - Data Mart
* Sql Server Integration Services for whole loading and orchestration process
* Sql Server Analysis Services for Tabular Model.
* Power BI Report

Remarks - General:
* Data is limited to 10 Cities in Poland
* Report is very basic and limited to simple measures with two "Over a Month" measures.

Remarks - ETL/Integration:
* Incremental load was configured for weather histor. It means that process will automatically load data for missing days.
* API Key is kept inside database (not in SSIS)
* Data is downloaded as separate JSON for each Day and each City. This generates many requests and may quickly reach to limit.
* ETL processes are fully restartable - there is no need to clean up when process fails in specific place.
* JSON is loaded into SQL Server and is parsed using JSON support feature for SQL Server 2016+
* ETL configuration/runtime parameters are stored inside database

Remarks - DB:
* Most of the logic is in views as this simplifies maintanance and improves flexibility
* All ETL configuration is kept on config schema
* All interfaces to ETL are created as stored procedures
* Database model is kept in Visual Studio DB Project

Remarks - Tabular:
* SSAS connects to DB via named user.


Pictures:

![Data Model](https://raw.githubusercontent.com/arcit/WeatherDemo/master/Images/DataModel.png)

![Report](https://raw.githubusercontent.com/arcit/WeatherDemo/master/Images/Report.png)

![Orchestration](https://raw.githubusercontent.com/arcit/WeatherDemo/master/Images/Orchestration.PNG)

![Schedule](https://raw.githubusercontent.com/arcit/WeatherDemo/master/Images/Schedule.PNG)





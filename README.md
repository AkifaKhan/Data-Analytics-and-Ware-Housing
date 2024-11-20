## Data-Analytics-and-Ware-Housing
This repository contains an end-to-end data warehousing pipeline and BI dashboard for analyzing declined transactions from ATM of a bank located at different places. It includes OLTP database creation, ETL processes to transform data into a star schema OLAP database, and Power BI visualization including trend comparison.
## Overview: 
This project involves the creation of a comprehensive end-to-end data warehousing pipeline and a business intelligence (BI) dashboard for analyzing declined transaction by the bank through ATM. The project begins with designing and implementing an Online Transaction Processing (OLTP) database for the ATM database, where test data is taken. The OLTP database serves as the primary data source for the data warehousing pipeline.

The pipeline is developed using Python, which performs various Extract, Transform, Load (ETL) processes. These processes include connecting to the data source, ingesting data into a staging area, cleaning the data to handle missing values, and creating new attributes necessary for the star schema in the Online Analytical Processing (OLAP) database. The OLAP database is designed with a star schema, including dimension tables and a fact table that captures key attributes for analysis.

Once the OLAP database is populated, the ETL pipeline generates a fact table snapshot by joining the fact table with relevant dimension tables. This snapshot is then imported into Power BI, where an interactive dashboard is created to visualize key insights related to ATM transactions. The dashboard provides a comprehensive view of trends and patterns, allowing users to explore reasons behind transactions across different regions and time periods.

The project also incorporates automation features, including the use of a data gateway to refresh the dashboard every day with new data. This ensures that the BI dashboard remains up-to-date and reflects the latest information. 
The repository contains all the necessary components, including the MySQL OLTP database, Python scripts for the ETL processes, the Excel template detailing the data warehouse design, and the Power BI dashboard hosted on the web. This project demonstrates the practical application of data warehousing and BI techniques to provide actionable insights for strategic and tactical decision-making in the airline industry.

## Project Structure 
- Python Scripts/: Contains Python scripts for the ETL process and pipeline automation.
- ATM_DB_Scipt/: Contains MySQL scripts for creating the OLTP databases.
- ATM_DBStar_Scipt/: Contains MySQL scripts for creating OLAP databases.
- Excel Template/: Contains the Excel template used for DWH design.
- Dashboards/: Contains Power BI dashboard files.
- Project Report/: Includes a detailed and comprehensive project report and business process explanation.
- OLD_ATM_DB/: Picture of Dashboard before updation

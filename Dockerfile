FROM mcr.microsoft.com/mssql/server:2019-latest

# Configure environment variables
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=yourStr0ngP4ssword!

# Copy SQL scripts to the container
COPY ./scripts/ /scripts/

# Execute SQL scripts (SCHEMA)
RUN /opt/mssql/bin/sqlservr & sleep 15 \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$SA_PASSWORD" -i /scripts/Init/00-Create-Database.sql \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$SA_PASSWORD" -d DemoDB -i /scripts/Init/01-Apply-Basic-Schema.sql

# Execute SQL scripts (DATA)
RUN /opt/mssql/bin/sqlservr & sleep 15 \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$SA_PASSWORD" -d DemoDB -i /scripts/Init/02-Pre-Data.sql \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$SA_PASSWORD" -d DemoDB -i /scripts/Tables-With-Inserts/dbo.Categories.Table.sql \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$SA_PASSWORD" -d DemoDB -i /scripts/Tables-With-Inserts/dbo.Products.Table.sql \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$SA_PASSWORD" -d DemoDB -i /scripts/00-Additional-Data.sql \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$SA_PASSWORD" -d DemoDB -i /scripts/Init/03-Post-Data.sql

# Expose the SQL Server port
EXPOSE 1433

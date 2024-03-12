Covid  Data Exploration 


1. Global Covid numbers since 2020 till 2024

SELECT SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(New_Cases)*100 as DeathPercentage
FROM portfolio.covid_cases_csv
WHERE length(continent)>0
ORDER BY 1,2;


Outcome:
total_cases|total_deaths|DeathPercentage   |
-----------+------------+------------------+
  774766789|   7037357.0|0.9083193936440144|


2 Total Death by continent

SELECT continent, SUM(new_deaths) as TotalDeathCount
FROM portfolio.covid_cases_csv
WHERE LENGTH(continent)>0 
GROUP BY continent
ORDER BY TotalDeathCount DESC;


Outcome:
continent    |TotalDeathCount|
-------------+---------------+
Europe       |      2098464.0|
North America|      1654898.0|
Asia         |      1636732.0|
South America|      1356087.0|
Africa       |       259089.0|
Oceania      |        32087.0|


3. People infected and percentage infected per country

SELECT Location, Population, MAX(total_cases) as PeopleInfected,  Max((total_cases/population))*100 as PercentPopulationInfected
FROM portfolio.covid_cases_csv
WHERE LENGTH(continent)>0
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC

Outcome is over 200 rows

4. People infected per day

SELECT Location, Population, date, MAX(total_cases) as PeopleInfected,  Max((total_cases/population))*100 as PercentPopulationInfected
FROM portfolio.covid_cases_csv
WHERE LENGTH(continent)>0
GROUP BY Location, Population, date
ORDER BY PercentPopulationInfected DESC


Outcome is over 362 thousand rows.

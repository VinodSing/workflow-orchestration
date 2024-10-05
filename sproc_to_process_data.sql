CREATE OR REPLACE PROCEDURE test.covid_ind_analysis() OPTIONS(strict_mode=false)

BEGIN

  TRUNCATE TABLE `pure-quasar-319704.test.covid_ind_analysis`;

  INSERT INTO `pure-quasar-319704.test.covid_ind_analysis`

  select 
      
      CAST(date as STRING) as date,
      max(population) as population,
      max(population_male) as population_male,
      max(population_female) as population_female,
      max(cumulative_tested) as total_tested,
      max(cumulative_confirmed) as total_confirmed,
      max(cumulative_persons_fully_vaccinated) as total_fully_vacinated,
      max(cumulative_recovered) as total_recovered,
      max(cumulative_deceased) as total_deceased
    FROM `bigquery-public-data.covid19_open_data.covid19_open_data`
    WHERE country_name = 'Bosnia and Herzegovina' AND CAST(date as STRING) = '2021-07-14'
    GROUP BY date
  
  UNION ALL

  select 
      CAST(date as STRING) as date,
      max(population) as population,
      max(population_male) as population_male,
      max(population_female) as population_female,
      max(cumulative_tested) as total_tested,
      max(cumulative_confirmed) as total_confirmed,
      max(cumulative_persons_fully_vaccinated) as total_fully_vacinated,
      max(cumulative_recovered) as total_recovered,
      max(cumulative_deceased) as total_deceased
    FROM `bigquery-public-data.covid19_open_data.covid19_open_data`
    WHERE country_name = 'Bosnia and Herzegovina' AND CAST(date as STRING) = '2021-08-23'
    GROUP BY date;

END
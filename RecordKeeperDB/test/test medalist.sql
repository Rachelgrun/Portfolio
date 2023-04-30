--YP Great Job!! 100% 
--test for Medalists

--Test for null
insert Medalist (OlympicYear, Season, OlympicLocation, Sport, SportSubcategory, Medal, FirstName, LastName, Country, YearBorn)
select null, 'Summer', 'Athens, Greece', 'Athletics', 'Discus Throw', 'Gold', 'Robert', 'Garrett', 'United States', 1875

--test for The year born must be before olympic year.

insert Medalist (OlympicYear, Season, OlympicLocation, Sport, SportSubcategory, Medal, FirstName, LastName, Country, YearBorn)
select 1897, 'Summer', 'Athens, Greece', 'Athletics', 'Discus Throw', 'Gold', 'Robert', 'Garrett', 'United States', 1900
--test for   The first olympic games happened in 1896. No data is allowed to be inserted before that.
insert Medalist (OlympicYear, Season, OlympicLocation, Sport, SportSubcategory, Medal, FirstName, LastName, Country, YearBorn)
select 1896, 'Summer', 'Athens, Greece', 'Athletics', 'Discus Throw', 'Silver', 'Robert', 'Garrett', 'United States', 1875
--
insert Medalist (OlympicYear, Season, OlympicLocation, Sport, SportSubcategory, Medal, FirstName, LastName, Country, YearBorn)
select 1895, 'Summer', 'Athens, Greece', 'Athletics', 'Discus Throw', 'Gold', 'Robert', 'Garrett', 'United States', 1875
--test for Columns should not allow blank data, zeros or negative numbers to be inserted. 
insert Medalist (OlympicYear, Season, OlympicLocation, Sport, SportSubcategory, Medal, FirstName, LastName, Country, YearBorn)
select 1896, '', 'Athens, Greece', 'Athletics', 'Discus Throw', 'Gold', 'Robert', 'Garrett', 'United States', 1875
--
insert Medalist (OlympicYear, Season, OlympicLocation, Sport, SportSubcategory, Medal, FirstName, LastName, Country, YearBorn)
select 1896, 'summer', 'Athens, Greece', 'Athletics', 'Discus Throw', 'Gold', 'Robert', 'Garrett', 'United States', -12
--    Gymnasts must be at least 14 years old in order to compete.
insert Medalist (OlympicYear, Season, OlympicLocation, Sport, SportSubcategory, Medal, FirstName, LastName, Country, YearBorn)
select 1896, 'summer', 'Athens, Greece', 'Gymnastics', 'Discus Throw', 'Gold', 'Robert', 'Garrett', 'United States', 1890
--Boxers must be between 18 and 40 years old in order to compete.under 18
insert Medalist (OlympicYear, Season, OlympicLocation, Sport, SportSubcategory, Medal, FirstName, LastName, Country, YearBorn)
select 1896, 'summer', 'Athens, Greece', 'Boxing', 'Discus Throw', 'Gold', 'Robert', 'Garrett', 'United States', 1890
--over 40
insert Medalist (OlympicYear, Season, OlympicLocation, Sport, SportSubcategory, Medal, FirstName, LastName, Country, YearBorn)
select 1941, 'summer', 'Athens, Greece', 'Boxing', 'Discus Throw', 'Gold', 'Robert', 'Garrett', 'United States', 1900
--between 18 and 40 
insert Medalist (OlympicYear, Season, OlympicLocation, Sport, SportSubcategory, Medal, FirstName, LastName, Country, YearBorn)
select 1919, 'summer', 'Athens, Greece', 'Boxing', 'Discus Throw', 'Gold', 'Robert', 'Garrett', 'United States', 1900
-- Each olympic year can only have one of each medal for each sport and its sport subcategory.
insert Medalist (OlympicYear, Season, OlympicLocation, Sport, SportSubcategory, Medal, FirstName, LastName, Country, YearBorn)
select 1896, 'Summer', 'Athens, Greece', 'Athletics', 'Discus Throw', 'Silver', 'Panagiotis', 'Paraskevopoulos', 'Greece', 1875
union select 1896, 'Summer', 'Athens, Greece', 'Athletics', 'Discus Throw', 'silver', 'Sotirios', 'Versis', 'Greece', 1879

/*Q.1 Weekday Vs Weekend total flights statistics*/

with t1 as(
select FLIGHT_NUMBER,
CASE 
when DAY_OF_WEEK<6 then 'WEEKDAY'
else 'WEEKEND'
end
as Type_of_Day
from dbo.flights)
select Type_of_Day,COUNT(FLIGHT_NUMBER) as Flights_Stats from t1
group by Type_of_Day;


/*Q.2 Total number of cancelled flights for JetBlue Airways on first date of every month.*/

select count(CANCELLED) as Number_of_Cancelled_Flights
from dbo.flights
inner join
dbo.airlines
on dbo.flights.AIRLINE=dbo.airlines.IATA_CODE
WHERE DAY='1' and dbo.airlines.AIRLINE='JetBlue Airways';

/*Q.3 Week wise, State wise and City wise statistics of delay of flights with airline details*/

with t1 as(
select DAY_OF_WEEK,STATE,CITY,AIRLINE_DELAY from flights
inner join 
airports on 
flights.ORIGIN_AIRPORT=airports.IATA_CODE
)
select DAY_OF_WEEK,STATE,CITY,count(AIRLINE_DELAY) as DELAY_STATS from t1
group by DAY_OF_WEEK,STATE,CITY
order by DAY_OF_WEEK;

/*Q.4 Number of airlines with No departure/arrival delay with distance covered between 2500 and 3000*/

select count(AIRLINE) from dbo.flights
where DEPARTURE_DELAY <= '0' and ARRIVAL_DELAY <='0' and DISTANCE between 2500 and 3000


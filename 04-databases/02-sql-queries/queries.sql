---------------------------------------
-- [THE BASICS]
---------------------------------------

-- Get all sites
select * from sites

-- Get all sites sorted by name
select * from sites order by name asc

-- Gett all activity names sorted by name
select name from activities order by name asc

-- Get all "Sport" activities
select * from activities where category = 'Sport'
-- Expected result: 8 rows

-- Get all Escape Games in Nantes
select * from activities where name like '%Escape Game%' and city = 'Nantes'
-- Expected result: 3 rows

---------------------------------------
-- [AGGREGATES]
---------------------------------------

-- Count all the activities
select count(*) from activities
-- Expected result: 44

-- Count all "Adventure" activities
select count(*) from activities where category = 'Adventure'
-- Expected result: 13

-- Count the number of activities per category
select count(*) as total, category from activities group by category
-- Expected result:
-- category    total
-- ----------  ----------
-- Adventure   13
-- Cultural    6
-- Food        6
-- Sport       8
-- Visits      5
-- Workshops   6

-- Get the 3 category names with the biggest number of activities
select category, count(*) as total from activities group by category order by total desc limit 3
-- Expected result:
-- category    total
-- ----------  ----------
-- Adventure   13
-- Sport       8
-- Cultural    6

---------------------------------------
-- [JOINS]
---------------------------------------

-- Get all employee names working from site ile de Nantes sorted by first name
select last_name, first_name from employees join sites on sites.id = employees.site_id where sites.name = 'Ile de Nantes'
-- Expected result: 53 rows

-- Get all the activity names where you have been to, sorted by name
select activities.name from participations
join team_building_sessions on team_building_sessions.id = participations.team_building_session_id
join employees on participations.employee_id = employees.id
join activities on activities.id = team_building_sessions.activity_id
where employees.last_name = 'Minvielle'
-- Expected result: well, it depends on who you are :)

-- [NEW KEYWORD] Get all the team names that have done an Adventure activity, sorted by names
select teams.name from team_building_sessions
join teams on teams.id = team_building_sessions.team_id
join activities on activities.id = team_building_sessions.activity_id
where activities.category = 'Adventure' group by teams.name order by teams.name asc -- Expected result:
-- name
-- --------------------
-- Business Development
-- Product Owner
-- R&D

-- Get the team names and total number of team building sessions done, sorted by top teams
select teams.name, count(*) as total_sessions
from team_building_sessions
join teams on teams.id = team_building_sessions.team_id
group by teams.name order by total_sessions desc
-- Expected result:
-- name        total_sessions
-- ----------  --------------
-- R&D         7
-- Marketing   4
-- Business D  3
-- Product Ow  3
-- Finance &   2
-- UI / UX     2
-- Customer S  1

-- Get all the employee names, team names and site names that have never attended a team building session
select employees.first_name, employees.last_name, teams.name team, sites.name site
from employees
join teams on teams.id = employees.team_id
join sites on sites.id = employees.site_id
left outer join participations on participations.employee_id = employees.id
where participations.employee_id is null
-- Expected result:
-- first_name  last_name   team        site
-- ----------  ----------  ----------  -----------
-- Harmony     Florin      Channels    Paris 13ème
-- Julia       Ivanets     Channels    Paris 13ème
-- Pierre      Pellan      Channels    Paris 13ème

-- [NEW AGGREGATE] Get the budget spent on team building sessions per team, sorted by most expensive to leASt expensive
select teams.name, sum(activities.price) total_price from activities
join team_building_sessions on team_building_sessions.activity_id = activities.id
join teams on teams.id = team_building_sessions.team_id
group by teams.name
order by total_price desc-- Expected result:
-- name          total_price
-- ------------  -----------
-- Finance & RH  1620
-- Business Dev  1446
-- R&D           1140
-- Marketing     445
-- Customer Suc  360
-- Product Owne  267
-- UI / UX       240

-- Get the site names and total number of team building sessions done, sorted by top sites
select sites.name, COUNT(DISTINCT team_building_sessions.id) total_sessions from sites
join employees on employees.site_id = sites.id
join participations on participations.employee_id = employees.id
join team_building_sessions on team_building_sessions.id = participations.team_building_session_id
GROUP by sites.name
-- Expected result:
-- name           total_sessions
-- -------------  --------------
-- Ile de Nantes  12
-- Paris 13ème    10

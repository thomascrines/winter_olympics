# winter_olympics
project 1

2018 Winter Olympics

Brief:

The 2018 Winter Olympics are set to take place in South Korea. The organising body want you to help them out with an important feature for their website. They are looking for an app that will track the nations, athletes and results of events.

They would like to make it possible to add an athlete, which will have an associated nation. Event results should keep track of the athlete who got gold, silver and bronze as well as the event they participated in.

As an MVP they would ideally like:

Nation medal results table with gold, silver and bronze count for each nation total points for each nation (5 for gold, 3 for silver, and 1 for bronze).

Be able to add an athlete, nation and event result.

Further functionality would be CRUD actions for athlete, nation and event results, listing each event with the medalists

Requirements:
Ruby with Sinatra and PG Gems.
PostgreSQL

Installation and running instructions:
1. Create database:
Input ‘psql' in terminal, then ‘create database winter_olympics’.
2. Create database tables:
Input ‘psql -d winter_olympics -f db/winter_olympics.sql’ from ‘winter_olympics’ folder.
3 Add seed data:
Input ‘ruby db/seed_data.rb’ from ‘winter_olympics’ folder.
4. Start server: 
Input ‘ruby controller.rb’ from ‘winter_olympics’ folder. 
5. View:
View on browser at ‘localhost:4567’.

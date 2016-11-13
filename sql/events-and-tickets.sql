select to_char( e.start_date_time, 'YYYY-MM-DD' ) event_date, to_char( e.start_date_time, 'HH24:MI' ) start_time,
e.sold_out, e.sport_type_name, l.name event_location, l.city event_city, l.seating_capacity,
hteam.name home_team, hl.name home_field, hl.city home_city,
ateam.name away_team, al.name away_field, al.city away_city,
sum( t.ticket_price ) total_ticket_price, avg( t.ticket_price ) average_ticket_price,
min ( t.ticket_price ) cheapest_ticket, max( t.ticket_price ) most_expensive_ticket,
count(*) num_tickets

from ticketing.sporting_event_ticket t, sourcemysql.sporting_event e, sourcemysql.sport_location l,
sourcemysql.sport_team hteam, sourcemysql.sport_team ateam, sourcemysql.sport_location hl, sourcemysql.sport_location al

where t.sporting_event_id = e.id
and t.sport_location_id = l.id
and e.home_team_id = hteam.id
and e.away_team_id = ateam.id
and hteam.home_field_id = hl.id
and ateam.home_field_id = al.id
group by to_char( e.start_date_time, 'YYYY-MM-DD' ), to_char( e.start_date_time, 'HH24:MI' ),
e.start_date_time, e.sold_out, e.sport_type_name, l.name, l.city, l.seating_capacity, hteam.name, ateam.name,
hl.name, hl.city, al.name, al.city;

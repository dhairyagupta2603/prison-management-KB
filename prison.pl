% warning suppression
:- discontiguous(job_category/1).
:- discontiguous(job/1).
:- discontiguous(lockdown/1).
:- discontiguous(location/2).
:- discontiguous(do/1).
:- discontiguous(person/1).
:- discontiguous(item/2).
:- discontiguous(generator/1).
:- discontiguous(not/1).

% data
person('Inmate').
person('Guard').
person('Warden').
person('Transporter').
person('Visitor').

staff('Guard').
staff('Guard_Dog').
staff('Warden').

security('Guard').
security('Guard_Dog').


job('Cook').
job('Inventory_Management').
job('Dishwasher').
job('Janitor').
job('Trash_Collector').
job('Laundry_Worker').
job('Tailor').
job('Metal_Work').
job('Wood_Work').
job('Quality_Inspection').
job('Librarian').
job('Guard_Duty').

job_category('Kitchen').
job_category('Sanitation').
job_category('Fabric').
job_category('Workshop').
job_category('Library').
job_category('Security').

location('Kitchen', 'inside').
location('Dining_Area', 'inside').
location('Gym', 'inside').
location('Cell', 'inside').
location('Courtyard', 'inside').
location('Washing_Area', 'inside').
location('Library', 'inside').
location('Bath_Area', 'inside').
location('Toilets', 'inside').
location('Workshop', 'inside').
location('Visiting_Area', 'inside').
location('Generator_Room', 'inside').
location('Activity_Area', 'inside').
location('Sweatshop', 'inside').
location('Garage', 'inside').
location('Infirmary', 'inside').
location('Shop', 'inside').
location('Solitary_Confinement', 'inside').
location('Warden_Office', 'inside').
location('Sniper_Post', 'inside').
location('Forest', 'outside').
location('Dirt_road', 'outside').
location('Sea', 'outside').
location('Cliff', 'outside').
location('Parking', 'outside').

hasDoor('Activity_Area').
hasDoor('Garage').

schedule('Morning_Roll_Call', 0730, 'mandatory').
schedule('Shower', 0800, 'optional').
schedule('Breakfast', 0900, 'optional').
schedule('Job_Period', 1000, 'mandatory').
schedule('Lunch', 1330, 'optional').
schedule('Job_Period', 1430, 'mandatory').
schedule('Free_Period', 1630, 'optional').
schedule('Exercise', 1800, 'optional').
schedule('Shower', 1900, 'optional').
schedule('Dinner', 1930, 'optional').
schedule('Free_Period', 2030, 'optional').
schedule('Evening_Roll_Call', 2130, 'mandatory').
schedule('Lights_Out', 2200, 'optional').

day('Weekday').
day('Weekend').

item('Toiletries', 'not_contraband').
item('Inmate_Uniform', 'not_contraband').
item('Job_Uniform', 'not_contraband').
item('Shoes', 'not_contraband').
item('Soap', 'not_contraband').
item('Snacks', 'not_contraband').
item('Flashlight', 'not_contraband').
item('Wood_piece', 'contraband').
item('Metal_sheet', 'contraband').
item('Wire_Cutters', 'contraband').
item('Pick_Axe', 'contraband').
item('Showel', 'contraband').
item('Gun', 'contraband').
item('Baton', 'contraband').
item('Guard_Uniform', 'contraband').
item('Cell_Key', 'contraband').
item('Generator_Key', 'contraband').
item('Compound_Key', 'contraband').

generator('On').
seen_escaping('No').

% do('escapes').
lockdown('yes').

job_category('Kitchen') 
	:- (job('Cook'); job('Inventory_Management'); job('Dishwasher')),
	person('Inmate').

job_category('Sanitation') 
	:- (job('Dishwasher'); job('Janitor'); job('Trash_Collector')),
	person('Inmate').

job_category('Fabric') 
	:- (job('Laundry_Worker'); job('Tailor')),
	person('Inmate').

job_category('Workshop') 
	:- (job('Metal_Work'); job('Wood_Work')),
	person('Inmate').


job_category('Kitchen')
	:- job('Quality_Inspection'), (person('Inmate'); person('Guard')).
job_category('Sanitation')
	:- job('Quality_Inspection'), (person('Inmate'); person('Guard')).
job_category('Fabric')
	:- job('Quality_Inspection'), (person('Inmate'); person('Guard')).
job_category('Workshop')
	:- job('Quality_Inspection'), (person('Inmate'); person('Guard')).
job_category('Library')
	:- job('Quality_Inspection'), (person('Inmate'); person('Guard')).

job_category('Library') 
	:- job('Librarian'), person('Inmate').

job_category('Security')
	:- job('Guard_Duty'), person('Guard').


location('Kitchen', 'inside') 
	:- (job('Cook'); job('Inventory_Management'); job('Dishwasher')), 
	person('Inmate').

location('Kitchen', 'inside')
	:- (job('Janitor'); job('Trash_Collector'); job('Quality_Inspection')), (person('Inmate'); person('Guard')).
location('Dining_Area', 'inside')
	:- (job('Janitor'); job('Trash_Collector'); job('Quality_Inspection')), (person('Inmate'); person('Guard')).
location('Cell', 'inside')
	:- (job('Janitor'); job('Trash_Collector'); job('Quality_Inspection')), (person('Inmate'); person('Guard')).
location('Courtyard', 'inside')
	:- (job('Janitor'); job('Trash_Collector'); job('Quality_Inspection')), (person('Inmate'); person('Guard')).
location('Washing_Area', 'inside')
	:- (job('Janitor'); job('Trash_Collector'); job('Quality_Inspection')), (person('Inmate'); person('Guard')).
location('Library', 'inside')
	:- (job('Janitor'); job('Trash_Collector'); job('Quality_Inspection')), (person('Inmate'); person('Guard')).
location('Bath_Area', 'inside')
	:- (job('Janitor'); job('Trash_Collector'); job('Quality_Inspection')), (person('Inmate'); person('Guard')).
location('Toilets', 'inside')
	:- (job('Janitor'); job('Trash_Collector'); job('Quality_Inspection')), (person('Inmate'); person('Guard')).
location('Workshop', 'inside')
	:- (job('Janitor'); job('Trash_Collector'); job('Quality_Inspection')), (person('Inmate'); person('Guard')).
location('Visiting_Area', 'inside')
	:- (job('Janitor'); job('Trash_Collector'); job('Quality_Inspection')), (person('Inmate'); person('Guard')).
location('Activity_Area', 'inside')
	:- (job('Janitor'); job('Trash_Collector'); job('Quality_Inspection')), (person('Inmate'); person('Guard')).
location('Sweatshop', 'inside')
	:- (job('Janitor'); job('Trash_Collector'); job('Quality_Inspection')), (person('Inmate'); person('Guard')).
location('Infirmary', 'inside')
	:- (job('Janitor'); job('Trash_Collector'); job('Quality_Inspection')), (person('Inmate'); person('Guard')).
location('Solitary_Confinement', 'inside')
	:- (job('Janitor'); job('Trash_Collector'); job('Quality_Inspection')), (person('Inmate'); person('Guard')).

location('Washing_Area', 'inside')
	:- job('Laundry_Worker'), person('Inmate').

location('Sweatshop', 'inside')
	:- job('Tailor'), person('Inmate').

location('Workshop', 'inside')
	:- (job('Metal_Work'); job('Wood_Work')), person('Inmate').

location('Library', 'inside')
	:- job('Librarian'), person('Inmate').

location('Kitchen', 'inside')
	:- job('Guard_Duty'), person('Guard').
location('Dining_Area', 'inside')
	:- job('Guard_Duty'), person('Guard').
location('Gym', 'inside')
	:- job('Guard_Duty'), person('Guard').
location('Cell', 'inside')
	:- job('Guard_Duty'), person('Guard').
location('Courtyard', 'inside')
	:- job('Guard_Duty'), person('Guard').
location('Washing_Area', 'inside')
	:- job('Guard_Duty'), person('Guard').
location('Library', 'inside')
	:- job('Guard_Duty'), person('Guard').
location('Bath_Area', 'inside')
	:- job('Guard_Duty'), person('Guard').
location('Toilets', 'inside')
	:- job('Guard_Duty'), person('Guard').
location('Workshop', 'inside')
	:- job('Guard_Duty'), person('Guard').
location('Visiting_Area', 'inside')
	:- job('Guard_Duty'), person('Guard').
location('Generator_Room', 'inside')
	:- job('Guard_Duty'), person('Guard').
location('Activity_Area', 'inside')
	:- job('Guard_Duty'), person('Guard').
location('Sweatshop', 'inside')
	:- job('Guard_Duty'), person('Guard').
location('Garage', 'inside')
	:- job('Guard_Duty'), person('Guard').
location('Infirmary', 'inside')
	:- job('Guard_Duty'), person('Guard').
location('Shop', 'inside')
	:- job('Guard_Duty'), person('Guard').
location('Solitary_Confinement', 'inside')
	:- job('Guard_Duty'), person('Guard').
location('Sniper_Post', 'inside')
	:- job('Guard_Duty'), person('Guard').
location('Dirt_road', 'outside')
	:- job('Guard_Duty'), person('Guard').
location('Parking', 'outside')
	:- job('Guard_Duty'), person('Guard').


delivery('yes') :- day('Weekend').
delivery('No') :- day('Weekday').

location('Solitary_Confinement', 'inside')
	:- item(X, 'contraband'), person('Inmate').

location('Visiting_Area', 'inside')
	:- person('Inmate'), person('Visitor').


% relations
do(job(X)) 
	:- person('Inmate'), job(X), schedule('Job_Period', Y, 'mandatory').

has_to_work_as(X, Y) :- person(X), job(Y).
accompanies(X, Y) :- staff(X), staff(Y), X\==Y.

lockdown('yes') :- schedule(X, Y, 'mandatory').
lockdown('yes') :- person('Inmate'), location(X, 'outside').

person('Guard') :- hasDoor(X), person('Inmate').
location(X, inside) :- hasDoor(X), person('Inmate').
job('Guard_Duty') :- hasDoor(X), person('Inmate').


change_job(X, Y) :- job(X), job(Y), X\==Y.
job(Y) :- change_job(X, Y), job(X), X\==Y.

do('eat') 
	:- person(X), 
	(schedule('Breakfast', 0900, 'optional'); 
	schedule('Lunch', 1330, 'optional');
	schedule('Dinner', 1930, 'optional')).

item('Wire_Cutters', 'contraband') :- job('Metal_Work').
item('Pick_Axe', 'contraband') :- job('Wood_Work').
item('Guard_Uniform', 'contraband'):- job('Tailor'); job('Laundry_Worker').

do('get_out_of_cell')
	:- item('Cell_Key', 'contraband'),
	schedule('Lights_Out', 2200, 'optional'),
	seen_escaping('No').

generator('Off') 
	:- item('Generator_Key', 'contraband'),
	generator('On'), 
	seen_escaping('No'),
	do('get_out_of_cell').

do('Cuts_Fence') 
	:- item('Wire_Cutters', 'contraband'),
	item('Guard_Uniform', 'contraband'),
	schedule('Lights_Out', 2200, 'optional'),
	seen_escaping('No'),
	generator('Off').

not(do('Cuts_Fence'))
	:- not(schedule('Lights_Out', 2200, 'optional'));
	seen_escaping('Yes').

do('digs')
	:- item('Showel', 'contraband'),
	item('Guard_Uniform', 'contraband'),
	schedule('Lights_Out', 2200, 'optional'),
	seen_escaping('No').

do('escapes') :- do('digs'), do('Cuts_Fence').
not(do('escapes')) :- not(do('digs')); not(do('Cuts_Fence')).

location('Solitary_Confinement', 'inside') 
	:- not(do('escapes')),
	seen_escaping('Yes'),
	person('Guard'),
	not(location('Sniper_Post', 'inside')).

not(do('dies'))
	:- not(do('escapes')),
	seen_escaping('Yes'),
	person('Guard'),
	location('Sniper_Post', 'inside').

not(do('dies'))
	:- do('Cuts_Fence'), generator('On').



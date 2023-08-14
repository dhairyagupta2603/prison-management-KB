// people in prison
create (inmate:PERSON {name:"Inmate"}) return inmate;
create (guard:PERSON:STAFF:SECURITY {name:"Guard"}) return guard;
create (dog:STAFF:SECURITY {name:"Guard_Dog"}) return dog;
create (warden:PERSON:STAFF {name:"Warden"}) return warden;
create (transporter:PERSON:JOB {name:"Transporter"}) return transporter;
create (visitor:PERSON {name:"Visitor"}) return n;


// jobs
create (n:JOB:KITCHEN {name:"Cook"}) return n;
create (n:JOB:KITCHEN {name:"Inventory_Management"}) return n;
create (n:JOB:SANITATION:KITCHEN {name:"Dishwasher"}) return n;
create (n:JOB:SANITATION {name:"Janitor"}) return n;
create (n:JOB:SANITATION {name:"Trash_Collector"}) return n;
create (n:JOB:SANITATION:FABRIC {name:"Laundry_Worker"}) return n;
create (n:JOB:FABRIC {name:"Tailor"}) return n;
create (n:JOB:WORKSHOP {name:"Metal_Work"}) return n;
create (n:JOB:WORKSHOP {name:"Wood_Work"}) return n;
create (n:JOB {name:"Quality_Inspection"}) return n;
create (n:JOB:LIBRARY {name:"Librarian"}) return n;
create (n:JOB:SECURITY {name:"Guard_Duty"}) return n;


// location
create (n:LOCATION {name:"Kitchen", in_compound:true}) return n;
create (n:LOCATION {name:"Dining_Area", in_compound:true}) return n;
create (n:LOCATION {name:"Gym", in_compound:true}) return n;
create (n:LOCATION {name:"Cell", in_compound:true}) return n;
create (n:LOCATION {name:"Courtyard", in_compound:true}) return n;
create (n:LOCATION {name:"Washing_Area", in_compound:true}) return n;
create (n:LOCATION {name:"Library", in_compound:true}) return n;
create (n:LOCATION {name:"Bath_Area", in_compound:true}) return n;
create (n:LOCATION {name:"Toilets", in_compound:true}) return n;
create (n:LOCATION {name:"Workshop", in_compound:true}) return n;
create (n:LOCATION {name:"Visiting_Area", in_compound:true}) return n;
create (n:LOCATION {name:"Generator_Room", in_compound:true}) return n;
create (n:LOCATION {name:"Activity_Area", in_compound:true}) return n;
create (n:LOCATION {name:"Sweatshop", in_compound:true}) return n;
create (n:LOCATION {name:"Garage", in_compound:true}) return n;
create (n:LOCATION {name:"Infirmary", in_compound:true}) return n;
create (n:LOCATION {name:"Shop", in_compound:true}) return n;
create (n:LOCATION {name:"Solitary_Confinement", in_compound:true}) return n;

create (n:LOCATION {name:"Warden_Office", in_compound:true}) return n;
create (n:LOCATION {name:"Sniper_Post", in_compound:true}) return n;
create (n:LOCATION {name:"Forest", in_compound:false}) return n;
create (n:LOCATION {name:"Dirt_road", in_compound:false}) return n;
create (n:LOCATION {name:"Sea", in_compound:false}) return n;
create (n:LOCATION {name:"Cliff", in_compound:false}) return n;
create (n:LOCATION {name:"Parking", in_compound:false}) return n;

match (n {name:"Activity_Area"}) match (m {name:"Garage"})
set n:HAS_DOOR;

// Outdoor Elements
create (n:TEMPRATURE {name: "Hot"}) return n;
create (n:TEMPRATURE {name: "Normal"}) return n;
create (n:TEMPRATURE {name: "Cold"}) return n;

create (n:WEATHER {name: "Snowing"}) return n;
create (n:WEATHER {name: "Raining"}) return n;
create (n:WEATHER {name: "Windy"}) return n;
create (n:WEATHER {name: "Sunny"}) return n;
create (n:WEATHER {name: "Cloudy"}) return n;

// Schedule
create (n:SCHEDULE {name:"Morning_Roll_Call", time:730, mandatory:true}) return n;
create (n:SCHEDULE {name:"Shower", time:800}) return n;
create (n:SCHEDULE {name:"Breakfast", time:900}) return n;
create (n:SCHEDULE {name:"Job_Period", time:1000, mandatory:true}) return n;
create (n:SCHEDULE {name:"Lunch", time:1330}) return n;
create (n:SCHEDULE {name:"Job_Period", time:1430, mandatory:true}) return n;
create (n:SCHEDULE {name:"Free_Period", time:1630}) return n;
create (n:SCHEDULE {name:"Exercise", time:1800}) return n;
create (n:SCHEDULE {name:"Shower", time:1900}) return n;
create (n:SCHEDULE {name:"Dinner", time:1930}) return n;
create (n:SCHEDULE {name:"Free_Period", time:2030}) return n;
create (n:SCHEDULE {name:"Evening_Roll_Call", time:2130, mandatory:true}) return n;
create (n:SCHEDULE {name:"Lights_Out", time:2200}) return n;

create (n:DAY {name:"Weekday"}) return n;
create (n:DAY {name:"Weekend"}) return n;


// items
create (n:ITEM {name:"Toiletries", is_contraband:false}) return n;
create (n:ITEM {name:"Inmate_Uniform", is_contraband:false}) return n;
create (n:ITEM {name:"Job_Uniform", is_contraband:false}) return n;
create (n:ITEM {name:"Shoes", is_contraband:false}) return n;
create (n:ITEM {name:"Soap", is_contraband:false}) return n;
create (n:ITEM {name:"Snacks", is_contraband:false}) return n;
create (n:ITEM {name:"Flashlight", is_contraband:true}) return n;

create (n:ITEM {name:"Wood_piece", is_contraband:true}) return n;
create (n:ITEM {name:"Metal_sheet", is_contraband:true}) return n;
create (n:ITEM {name:"Gun", is_contraband:true}) return n;
create (n:ITEM {name:"Baton", is_contraband:true}) return n;
create (n:ITEM {name:"Guard_Uniform", is_contraband:true}) return n;
create (n:ITEM {name:"Cell_Key", is_contraband:true}) return n;
create (n:ITEM {name:"Generator_Key", is_contraband:true}) return n;
create (n:ITEM {name:"Compound_Key", is_contraband:true}) return n;


// relations
match (n:PERSON {name:"Inmate"}) match (m:JOB)
create (n)-[:HAS_TO_WORK_AS]->(m);

match (n:PERSON:STAFF:SECURITY) match (m:JOB:SECURITY)
create (n)-[k:HAS_TO_WORK_AS]->(m);

match (n {name:"Guard_Dog"}) match (m {name:"Guard"})
create (n)-[k:ACCOMPANIES]->(m);

match (n {name:"Guard"}) match (m {name:"Warden"})
create (n)-[k:ACCOMPANIES]->(m);

match (n)-[k]->(m {name:"Transporter"})
detach delete k;

match (m {name:"Transporter"})
remove m:JOB 

match (n {name:"Visitor"}) match (m {name:"Dirt_road"})
create (n)-[:USES]->(m);


match (n {name:"Morning_Roll_Call"}) 
match (m {name:"Shower", time:800})
create (n)-[:NEXT_PERIOD]->(m);

match (n {name:"Shower", time:800}) 
match (m {name:"Breakfast"})
create (n)-[:NEXT_PERIOD]->(m);

match (n {name:"Breakfast"})
match (m {name:"Job_Period", time:1000}) 
create (n)-[:NEXT_PERIOD]->(m);

match (n {name:"Job_Period", time:1000})
match (m {name:"Lunch"}) 
create (n)-[:NEXT_PERIOD]->(m);

match (n {name:"Lunch"}) 
match (m {name:"Job_Period", time:1430})
create (n)-[:NEXT_PERIOD]->(m);

match (n {name:"Job_Period", time:1430})
match (m {name:"Free_Period", time:1630}) 
create (n)-[:NEXT_PERIOD]->(m);

match (n {name:"Free_Period", time:1630}) 
match (m {name:"Exercise"}) 
create (n)-[:NEXT_PERIOD]->(m);

match (n {name:"Exercise"}) 
match (m {name:"Shower", time:1900}) 
create (n)-[:NEXT_PERIOD]->(m);

match (n {name:"Shower", time:1900}) 
match (m {name:"Dinner"}) 
create (n)-[:NEXT_PERIOD]->(m);

match (n {name:"Dinner"}) 
match (m {name:"Free_Period", time:2030}) 
create (n)-[:NEXT_PERIOD]->(m);

match (n {name:"Free_Period", time:2030}) 
match (m {name:"Evening_Roll_Call"}) 
create (n)-[:NEXT_PERIOD]->(m);

match (n {name:"Evening_Roll_Call"}) 
match (m {name:"Lights_Out"}) 
create (n)-[:NEXT_PERIOD]->(m);

match (n {name:"Lights_Out"}) 
match (m {name:"Morning_Roll_Call"}) 
create (n)-[:NEXT_PERIOD]->(m);

match (n {name:"Inmate"})
match (m:ITEM {is_contraband:false})
create (n)-[:CAN_HAVE]->(m);

match (n {name:"Inmate"})
match (m:ITEM {is_contraband:true})
create (n)-[:CANNOT_HAVE]->(m);

match (n:JOB:KITCHEN) match (m:LOCATION {name:"Kitchen"})
create (n)-[:CAN_ACCESS]->(m);

match (n:JOB:SANITATION) match (m:LOCATION {in_compound:true})
create (n)-[:CAN_ACCESS]->(m);

match (n {name:"Laundry_Worker"})-[k:CAN_ACCESS]->(m) delete k;

match (n {name:"Dishwasher"})-[k:CAN_ACCESS]->(m) delete k;

match (n {name:"Dishwasher"}) match (n {name:"Kitchen"}) create (n)-[:CAN_ACCESS]->(m);

match (n:JOB:SANITATION)-[k:CAN_ACCESS]->(m:LOCATION)
where (n.name="Trash_Collector" or n.name="Janitor") and (m.name="Warden_Office" or m.name="Sniper_Post" or m.name="Generator_Room")
delete k;

match (n:JOB:FABRIC {name:"Laundry_Worker"}) match (m:LOCATION {name:"Washing_Area"})
create (n)-[:CAN_ACCESS]->(m);

match (n:JOB:FABRIC {name:"Tailor"}) match (m:LOCATION {name:"Sweatshop"})
create (n)-[:CAN_ACCESS]->(m);

match (n:JOB:LIBRARY) match (m:LOCATION {name:"Library"})
create (n)-[:CAN_ACCESS]->(m);

match (n:JOB:WORKSHOP) match (m:LOCATION {name:"Workshop"})
create (n)-[:CAN_ACCESS]->(m);

match (n:JOB {name:"Quality_Inspection"}) match (m:JOB)
where m.name <> "Quality_Inspection"
create (n)-[:WATCHES_OVER]->(m);

match (n:JOB) match (m:SCHEDULE {name:"Job_Period"})
where n.name<>"Guard_Duty"
create (n)-[:DONE_DURING]->(m);

match (n:JOB {name:"Guard_Duty"}) match (m:SCHEDULE)
create (n)-[:DONE_DURING]->(m);

match (n {name:"Transporter"}) match (m {name:"Garage"})
create (n)-[:DELIVERS_TO]->(m);

match (n:STAFF) match (m:LOCATION)
where m.name <> "Warden_Office"
create (n)-[:CAN_ACCESS]->(m);

match (n:STAFF {name:"Warden"}) match (m:LOCATION)
where m.name = "Warden_Office"
create (n)-[:CAN_ACCESS]->(m);

match(n:STAFF {name:"Guard_Dog"})-[k:CAN_ACCESS]-(m:LOCATION) delete k;

match (n {name:"Visitor"}) match (m {name:"Visiting_Area"}) 
create (n)-[:GOES_TO]->(m);

match (n {name:"Inmate"}) match (m:LOCATION {in_compound:true})
where 
	m.name <> "Warden_Office" and m.name <> "Sniper_Post" and m.name <> "Kitchen" and m.name <> "Workshop" and m.name <> "Generator_Room" and m.name <> "Visiting_Area" and m.name <> "Solitary_Confinement"
create (n)-[:CAN_ACCESS]->(m);

match (n {name:"Inmate"}) match (m:LOCATION)
where m.name = "Visiting_Area" or m.name = "Solitary_Confinement" or m.name = "Infirmary"
create (n)-[:TAKEN_TO]->(m);

match (n {name:"Guard"}) match (m:ITEM)
where 
	m.name = "Flashlight" or m.name = "Gun" or m.name= "Baton" or m.name="Guard_Uniform" or m.name="Cell_Key" or m.name="Generator_Key" or m.name="Compound_Key"
create (n)-[:CAN_HAVE]->(m);

match (n:PERSON) match (m)
where (m:WEATHER or m:TEMPRATURE) and 
(n.name="Inmate" or n.name="Guard")
create (n)-[:FEELS_EFFECT_OF]->(m);

match(n) match (m {name:"Activity_Area"})
where n.name = "Morning_Roll_Call" or n.name = "Evening_Roll_Call"
create (n)-[:DONE_AT]->(m);

match(n {name:"Shower"}) match (m {name:"Bath_Area"})
create (n)-[:DONE_AT]->(m);

match(n) match (m {name:"Dining_Area"})
where n.name="Breakfast" or n.name="Lunch" or n.name="Dinner"
create (n)-[:DONE_AT]->(m);

match(n {name:"Exercise"}) match (m {name:"Gym"})
create (n)-[:DONE_AT]->(m);

match(n {name:"Lights_Out"}) match (m {name:"Cell"})
create (n)-[:DONE_AT]->(m);


// visualization
match (n) return n;

match(n {name:"Inmate"})-[k]->(m:JOB) 
return m, k, n;

match(n {name:"Inmate"})-[k]->(m:ITEM) 
return m, k, n;

match(n {name:"Inmate"})-[k]->(m:LOCATION) 
return m, k, n;

match(n)-[k]->(m)
where m:WEATHER or m:TEMPRATURE
return m, k, n;

match (n:SCHEDULE) return n;

match (n:PERSON)-[k]->(m:ITEM) 
return n, k, m;

match(n:JOB)-[k]->(m:LOCATION) 
return n, m, k;

match (n:PERSON)-[k]->(m:LOCATION) 
return n, k, m;

match (p:LOCATION)<-[:DONE_AT]-(n:SCHEDULE) return n, p;

match(n {name:"Inmate"})-[:HAS_TO_WORK_AS]->(m:JOB)-[:CAN_ACCESS]-(p:LOCATION) 
return n, m, p;

match(n:PERSON)-[:HAS_TO_WORK_AS]->(m:JOB)-[:DONE_DURING]-(p:SCHEDULE) 
return n, m, p;
-- Staff_Table
create table staff (
  staff_id int primary key,
  staff_name text,
  position text,
  salary real 
);

insert into staff values
  (1, 'Maruko' , 'Manager', 50000),
  (2, 'Aux' , 'Server', 45000),
  (3, 'Ploy' , 'Server', 48000);

-- Menu_Table
create table menu (
  menu_id int primary key,
  menu_name text,
  category text,
  price real
);

insert into menu values
  (1, 'Hawaiian pizza', 'Pizza', 100),
  (2, 'Double cheese pizza', 'Pizza', 120),
  (3, 'Spicy BBQ pizza', 'Pizza', 120),
  (4, 'Corn Soup', 'Soup', 50),
  (5, 'Masharoom Soup', 'Soup', 60),
  (6, 'French fries', 'Side dish', 75),
  (7, 'Onion rings', 'Side dish', 80),
  (8, 'Watermelon', 'Drink', 55),
  (9, 'Coke', 'Drink', 35);

-- membership_Table
create table membership (
  membership_id int primary key,
  membership_name text,
  age int,
  discount real,
  country text
);

insert into membership values
  (001, 'DK', 36, 8, 'South Korea'),
  (002, 'Dino', 13, 10, 'South Korea'),
  (003, 'Mingyu', 27, 8, 'Thailand'),
  (004, 'The 8', 21, 5, 'China'),
  (005, 'Jeonghan', 45, 8, 'South Korea'),
  (006, 'Hoshi', 18, 5, 'South Korea'),
  (007, 'Jun', 25, 10, 'China'),
  (008, 'Wonwoo', 28, 10, 'South Korea'),
  (009, 'Vernon', 34, 5, 'USA'),
  (010, 'S.coups', 51, 8, 'South Korea'),
  (011, 'Joshua', 49, 5, 'USA'),
  (012, 'Seungkwan', 23, 5, 'South Korea'),
  (013, 'Woozi', 42, 8, 'South Korea');

-- order_detail_table
create table order_detail (
  order_id int primary key,
  membership_id int,
  order_date text,
  total_price real,
  staff_id int
);

insert into order_detail values
  (1, 004, '2022-12-01', 135, 2),
  (2, 001, '2022-12-02', 155, 2),
  (3, 008, '2022-12-03', 120, 3),
  (4, 009, '2022-12-04', 125, 1),
  (5, 010, '2022-12-05', 60, 1),
  (6, 007, '2022-12-06', 75, 3),
  (7, 011, '2022-12-07', 350, 1),
  (8, 012, '2022-12-08', 155, 2),
  (9, 006, '2022-12-09', 240, 2),
  (10, 005, '2022-12-10', 100, 1),
  (11, 002, '2022-12-11', 120, 1),
  (12, 013, '2022-12-12', 180, 3),
  (13, 003, '2022-12-13', 510, 3);

--==========--
.mode table
.header on
--==========--

-- 1.Aggregrate funtion & group by
select 
  stf.staff_id as ID,
  stf.staff_name as Staff,
  count(stf.staff_id) as amount_customer
from order_detail as ord, staff as stf
where ord.staff_id = stf.staff_id
group by stf.staff_id
order by 3 desc;

-- 2. subquary
select 
  membership_id,
  membership_name,
  age
from (
    select * from membership
    where country = 'South Korea');

-- 3. with clause
with KR_membership as (
  select * from membership
  where country = 'South Korea'
),
     Manager_staff as (
  select * from staff
  where position = 'Manager'
),
     Last_week as (
  select * from order_detail
  where order_date between '2022-12-06' and '2022-12-13'
)

  select 
  Kr.membership_id as KR_ID,
  Kr.membership_name as KR_Name,
  Lw.total_price as bill
from KR_membership as Kr
join Last_week as Lw
  on Kr.membership_id = Lw.membership_id 
group by 1
order by 3 desc;

select name
from
(
select name, p1.salary "Salary", p2.salary "FSalary"
from students s
inner join friends f
on s.id = f.id
inner join packages p1
on s.id = p1.id
inner join packages p2
on f.friend_id = p2.id
)a
where a."FSalary" > a."Salary"
order by a."FSalary";
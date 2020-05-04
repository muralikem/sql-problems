select  a.company_code, 
        a.founder, 
        count(distinct b.lead_manager_code),
        count(distinct c.senior_manager_code),
        count(distinct d.manager_code),
        count(distinct e.employee_code)
from company a
inner join lead_manager b
on a.company_code = b.company_code
inner join senior_manager c
on b.lead_manager_code = c.lead_manager_code
inner join manager d
on c.senior_manager_code = d.senior_manager_code
inner join employee e
on d.manager_code = e.manager_code
group by a.company_code, a.founder
--order by cast(right(a.company_code, len(a.company_code) - 1) as int)
order by a.company_code

select c.contest_id, c.hacker_id, c.name, 
        sum(total_submissions) sum1, sum(total_accepted_submissions) sum2, sum(total_views) sum3,                         sum(total_unique_views) sum4
from contests c
inner join colleges co
on c.contest_id = co.contest_id
inner join challenges ch
on co.college_id = ch.college_id
left join 
(
    select challenge_id, sum(total_views) total_views, sum(total_unique_views) total_unique_views
    from view_stats
    group by challenge_id
)vs
on ch.challenge_id = vs.challenge_id
left join 
(
    select challenge_id, sum(total_submissions) total_submissions, sum(total_accepted_submissions)    total_accepted_submissions
    from submission_stats
    group by challenge_id
)ss
on ch.challenge_id = ss.challenge_id
group by c.contest_id, c.hacker_id, c.name
having sum(total_submissions) + sum(total_accepted_submissions) + sum(total_views) + sum(total_unique_views) <> 0
order by c.contest_id
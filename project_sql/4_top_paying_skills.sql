/*
Answer: What ared the top skills based on salary? 
- Look at the average salary associated with each skill for Data Analyst Positions 
- Focuses on roles with specified salaries, regardless of location 
- Why? it reveals how different skills impact smpact salary levels for Data Analysts an dhlep identify the most financially rewarding skills to acquire or improve 
*/

select 
    skills,
    Round(avg(salary_year_avg), 0) as avg_salary
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg is not NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills
order BY
    avg_salary DESC
limit 25
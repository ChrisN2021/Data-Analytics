/*
Question: What are the top-paying data analyst jobs? 
- Identify the top 10 highest-paying Data Analyst roles that are available remotely. 
- Focuses on job postings with specified salaries (remove nulls)
- Why? Highlight the top-pyaing opportunities for Data Analysts, offering insights into employment opportunities 
 (second query ) helping job seekers understand which skills to develop that align with top salaries



notes
The Left Join lets us bring in the Company Name and that tables are connected by the company_id. The code from problem 1 we are making it into a cte 

top_paying_jobs.* selects all the colums from the top paying jobs table
*/


with top_paying_jobs as (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name as company_name
    FROM
        job_postings_fact
    left JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
    where
        job_title_short = 'Data Analyst'
        and job_location = 'Anywhere'
        and salary_year_avg is not null 
    order BY
        salary_year_avg desc
    limit 10
)

select 
    top_paying_jobs.*,
    skills
from top_paying_jobs
inner join skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
order BY
    salary_year_avg desc
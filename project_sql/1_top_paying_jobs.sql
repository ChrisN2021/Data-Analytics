/* (First Query)
Question: What are the top-paying data analyst jobs? 
- Identify the top 10 highest-paying Data Analyst roles that are available remotely. 
- Focuses on job postings with specified salaries (remove nulls)
- Why? Highlight the top-pyaing opportunities for Data Analysts, offering insights into employment opportunities 
- The Left Join lets us bring in the Company Name 
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    job_title_short,
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

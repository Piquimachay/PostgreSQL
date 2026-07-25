WITH top_paying_jobs AS (
    SELECT
    jb.job_id,
    jb.job_title,
    jb.salary_year_avg,
    cd.name AS company_name
FROM job_postings_fact AS jb
LEFT JOIN company_dim AS cd ON jb.company_id = cd.company_id
WHERE
    jb.job_title_short = 'Data Analyst' AND
    jb.job_location = 'Anywhere' AND
    jb.salary_year_avg IS NOT NULL
ORDER BY jb.salary_year_avg DESC
LIMIT 10)

SELECT
    t10.*,
    sd.skills
FROM top_paying_jobs AS t10
INNER JOIN skills_job_dim AS sjd ON t10.job_id = sjd.job_id
INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
ORDER BY t10.salary_year_avg DESC
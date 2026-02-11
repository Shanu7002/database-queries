-- count how many students exist at each status --
SELECT e.status, COUNT(*) AS total_students 
FROM enrollments e
GROUP BY e.status
ORDER BY total_students DESC;
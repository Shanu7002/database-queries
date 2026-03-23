SELECT DISTINCT s.first_name
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
WHERE p.amount > 2.99;

-- escolhi join pela praticidade de escrita nesse caso e o DISTINCT para nao aparecer varias vezes o mesmo staff
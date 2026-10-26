SELECT
    d.name AS department,
    e.name AS employee,
    e.salary
FROM employee e
JOIN department d
    ON e.departmentid = d.id
WHERE (
    SELECT COUNT(DISTINCT e2.salary)
    FROM employee e2
    WHERE e2.departmentid = e.departmentid
      AND e2.salary > e.salary
) < 3
ORDER BY department, salary DESC;
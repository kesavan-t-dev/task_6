--USE DATABASE
use kesavan_db
GO

/*
Create Crud using User Defined Functions

1. Do The CRUD Operations to Insert, Update, Delete, Select the Data in Task Table.
*/

--display task table;  
select * from task

--INSERT 

drop procedure sp_insert_task
--in insert we use system procedure to create/insert the values to the system procedures

CREATE PROCEDURE sp_insert_task
    @task_name VARCHAR(150),
    @descriptions VARCHAR(245),
    @starts_date DATE,
    @due_date DATE,
    @prioritys VARCHAR(150),
    @statuss VARCHAR(70),
    @project_id INT
AS
BEGIN
    INSERT INTO task (task_name, descriptions, starts_date, due_date, prioritys, statuss, project_id)
    VALUES (@task_name, @descriptions, @starts_date, @due_date, @prioritys, @statuss, @project_id);
END
GO

exec sp_insert_task 'New Task', 'Description here', '2025-08-01', '2025-08-15', 'High', 'Pending', 4


select * from task
select * from project

--DELETE FROM task 
--WHERE task_name = 'New Task'


--Read function
-- we use use defined function for to show the data it can only readable only 

CREATE FUNCTION project_details(@project_id INT)
RETURNS TABLE
AS
RETURN
(
    SELECT * 
    FROM task
    WHERE project_id = @project_id
);

SELECT * FROM project_details(4)



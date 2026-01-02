--USE DATABASE
use kesavan_db
GO

--INSERT 

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS dbo.sp_insert_task;
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


-- we use use defined function for to show the data it can only readable only 

--UPDATE

-- Drop the procedure if it already exists
--DROP PROCEDURE IF EXISTS dbo.sp_update_task_status;

CREATE PROCEDURE sp_update_task_status
    @task_id INT,
    @statuss VARCHAR(70)
AS
BEGIN
    UPDATE task
    SET statuss = @statuss
    WHERE task_id = @task_id;
END
GO

--Before
select * from task;
--execute the update task status
EXEC sp_update_task_status 3, 'in progress';

--After
select * from task;
-- Drop if already exists
DROP PROCEDURE IF EXISTS dbo.sp_delete_task;
--DELETE 
CREATE PROCEDURE sp_delete_task
    @task_id INT

AS
BEGIN 
    DELETE 
    FROM task
    WHERE task_id = @task_id
END
GO

--execute the delete task using id
EXEC sp_delete_task 3;

select * from task

--SELECT
-- Drop function is already exists

--DROP FUNCTION IF EXISTS dbo.project_details;

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

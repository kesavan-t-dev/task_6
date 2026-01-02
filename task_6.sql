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

--system procedures for insertion 

CREATE PROCEDURE sp_insert_task
    @task_name VARCHAR(150),
    @descriptions VARCHAR(255),
    @starts_date DATE,
    @due_date DATE,
    @prioritys VARCHAR(150),
    @statuss VARCHAR(70),
    @project_id INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO task (task_name, descriptions, starts_date, due_date, prioritys, statuss, project_id)
    VALUES (@task_name, @descriptions, @starts_date, @due_date, @prioritys, @statuss, @project_id);
END
GO

exec sp_insert_task 'New Task', 'Description here', '2025-08-01', '2025-08-15', 'High', 'Pending', 1


select * from task
create procedure get_employee_info @empid int, @info varchar(100) OUT AS

Begin
Select @info = firstname + ' ' + lastname + ', ' + CAST(salary AS VARCHAR(10)) from employees where empid = @empid
END 

Declare @employeeinfo varchar(100)
execute get_employee_info @empid=11, @info = @employeeinfo OUT
Select @employeeinfo

drop procedure get_employee_info 

create procedure flight_ratings AS

Declare @flight varchar(4)
Declare @cost int

Select @flight = min(fno) from flights

While @flight is NOT NULL
Begin
	Select @cost = price from flights where fno = @flight
	IF(@cost is NOT NULL)
	Begin
		SELECT CASE
		WHEN @cost <=500 THEN @flight + ': ' + CAST(@cost AS VARCHAR(12)) + ' - �����'
		WHEN @cost <=1500 THEN @flight + ': ' + CAST(@cost AS VARCHAR(12)) + ' - ��������'
		ELSE @flight+': '+CAST(@cost AS VARCHAR(12)) + ' - ������'
		END
	END
Select @flight = min(fno) from flights where @flight < fno
END

execute flight_ratings;

drop procedure flight_ratings;

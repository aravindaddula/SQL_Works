
declare @num int=2
while(@num<=1000)
begin
declare @i int =2;
declare @cout int=0;
declare @res int=0;
	while( @i<=@num/2)
		begin
			set @cout = CASE WHEN @num%@i=0 THEN @cout+1 END
			set @i=@i+1;
		end
set @res=case when @cout<1 then @num end
set @num=@num+1;
print @res
end

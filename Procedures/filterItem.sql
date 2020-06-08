drop procedure Pizaria.filterItem;
go

go
create procedure Pizaria.filterItem 
	@price 			DECIMAL(19,4) = 99999,
	@name			varchar(30) = '',
	@item_type		varchar(30)
as
	begin
		if (@item_type = 'Piza')
			begin
					select nome, preco, PizaView.ID as ID, pic
					from Pizaria.PizaView
					where preco<=@price and nome like '%'+@name+'%'
			end

		else if (@item_type = 'Bebida')
			begin
				
					select nome, preco, quantidade_disponivel
					from  Pizaria.BebidaView
					where preco<=@price and nome like '%'+@name+'%'
					order by preco
			end

		else if (@item_type = 'Menu')
			begin
					select nome, preco, MenuView.ID as ID
					from  Pizaria.MenuView 
					where preco<=@price and nome like '%'+@name+'%'
					order by preco
			end

		else if (@item_type = 'Ingredientes')
			begin
				
					select nome, preco, quantidade_disponivel
					from  Pizaria.IngredienteView
					where preco<=@price and nome like '%'+@name+'%'
					order by preco
			end
	end
go


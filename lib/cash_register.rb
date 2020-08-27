class CashRegister
    attr_accessor :total
    attr_reader :discount, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = nil
        @last_transaction_name = nil
    end


    def add_item(title, price, quantity = 1)
        quantity.times do
            @items << title
            @last_transaction = price * quantity
            @last_transaction_name = title
        end
        @total += price * quantity
    end

    def apply_discount
        @total -= (@total * (@discount/100.0)).to_i
        if @discount == 0
            return "There is no discount to apply."
        else
            return "After the discount, the total comes to $#{@total}."
        end
    end

    def void_last_transaction
        items.delete(@last_transaction_name)
        if items.empty?
            @total = 0
        else
            @total -= @last_transaction
        end
    end
end


require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items

    def initialize(*discount)
        @total = 0
        @discount = discount[0]
        @items = []
    end

    def add_item(title, price, *amount)
        @previous_total = @total
        amount[0] ||= 1
        self.total += (amount[0] * price)
        amount[0].times do 
            @items << title
        end
    end

    def apply_discount
        if @discount == nil
            return "There is no discount to apply."
        else
            @total = @total * (100-@discount)/100
            p "After the discount, the total comes to $#{@total}."
        end
    end

    def void_last_transaction
        self.total = @previous_total
    end
end


require 'pry'

class CashRegister
    
    attr_reader :items
    attr_accessor :discount, :total, :prices, :total

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @prices = []
    end

    def items=(item)
        @items << item
    end

    def add_item(item, price, quantity = 1)
        quantity.times {self.items = item}
        self.prices << (price * quantity)
        self.total += (price * quantity)
    end

    def apply_discount
        if self.discount == 0
            return "There is no discount to apply."
        else
            self.total *= (((100 - self.discount.to_f)/100))
            return "After the discount, the total comes to $#{self.total.round}."
        end
    end

    def void_last_transaction
        self.total = self.total - self.prices.pop
    end

end

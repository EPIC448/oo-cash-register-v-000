require 'pry'
class CashRegister
   attr_accessor :total, :discount, :items, :transaction

       def initialize(discount = 0)
           @total = 0
           @discount = discount
           @items = []
       end

    def add_item(title, price, quantity = 1)  # order is important.
                                              # quantity = minium  1 so it could be multipled
         self.total = price * quantity + total

         quantity.times do
           self.items << title
         end
         # keep track of that last transaction amount somehow. 
         self.transaction = price * quantity
    end

    def apply_discount
      if discount == 0
        # cash register was not initialized with an employee discount
           "There is no discount to apply."
       else
         discount_percentage = @discount/ 100.0 # make a float by adding .0 at the end of the number
         discount_value = discount_percentage * total

         @total = total - discount_value
        "After the discount, the total comes to $#{@total.round}."

      end
    end


       def void_last_transaction
         #recall the last transaction using the class method.
         # we already have self.total on line 13  - self.transaction on line 19
          self.total = self.total - self.transaction
        # somthing  would remove the last transaction form the total.

       end
end

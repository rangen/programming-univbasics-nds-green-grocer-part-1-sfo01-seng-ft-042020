def find_item_by_name_in_collection(name, collection)
  index = 0
  while index < collection.length
    if collection[index][:item] == name
      return collection[index]
    end
    index += 1
  end
  nil
end

def consolidate_cart(cart)
  consolidated_cart = []
  index = 0
  added_items = []  #this array will keep track of if an item is already conslidated to avoid duplicates in the consolidated cart

  while index < cart.length
    current_item = cart[index]
    if !added_items.index(current_item[:item])              #will result in true when item is not included in added_items
      added_items << current_item[:item]                    #signifies we have processed the first instance of a cart item
      current_item[:count] = count_num_in_cart(current_item[:item], cart) #add a key to existing item hash of total num in cart
      consolidated_cart << current_item                     #finally, add the consolidated item to the new cart
    end
    index += 1
  end
  consolidated_cart
end

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
  i = 0
    result = []

    while i < cart.count do
      item_name = cart[i][:item]
      sought_item = find_item_by_name_in_collection(item_name, result)
      if sought_item
        sought_item[:count] += 1
      else
        cart[i][:count] = 1
        result << cart[i]
      end
      i += 1
    end

    result
end

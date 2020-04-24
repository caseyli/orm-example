require './product.rb'

#########
#
#
# WARNING: This is for teaching purposes and is VULNERABLE TO SQL INJECTION!!!!
#
#
#########

# ORM Examples: Uncomment the ones you want to try out

# product.save Examples ----------------------------------

# product = Product.new(2, "iPhone 11", 1399.99, "IP11")
# product.save()
# product = Product.new(3, "iPhone SE", 399.99, "IPSE")
# product.save()
# product = Product.new(4, "iPad Pro 11", 1399.99, "IPPro11")
# product.save()
# product = Product.new(5, "iPad Pro 13", 1699.99, "IPPro13")
# product.save()

# Product.find Examples -------------------------------

# product = Product.find(2)
# puts product.get_name
# puts product.get_price

# Product.all Examples ------------------------------

# products = Product.all
# products.each do |product|
# 	puts(product.get_name() + ": " + product.get_price().to_s)
# end

# product.delete Examples ----------------------------
# product = Product.find(3)
# product.delete()


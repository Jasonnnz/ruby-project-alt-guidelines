#Create Users #
u1 = User.create(name: "Eric", username: "eric", password: "abc123") 
u2 = User.create(name: "Peepo", username: "ppGod", password: "MVP")
u3 = User.create(name: "Jason", username: "jason", password: "1")
u4 = User.create(name: "Erwin", username: "monke", password: "monkas")
u5 = User.create(name: "Jaime", username: "jaimedavid01", password: "1")

#Create Pairings#
vegetables = Pairing.create(name: "Vegetables")
beef = Pairing.create(name: "Beef")
poultry = Pairing.create(name: "Poultry")
pork = Pairing.create(name: "Pork")
seafood = Pairing.create(name: "Seafood")


#Create Products#
#HERBS
rosemary = Product.create(name: "Rosemary", price: 475, description: "Like pine, faintly lemony.", pairing_id: beef.id)
basil = Product.create(name: "Basil", price: 500, description: "Minty and slightly peppery, with a touch of sweetness.", pairing_id: vegetables.id)
cilantro = Product.create(name: "Cilantro", price: 375, description:"Bright, and citrusy. Some say it can taste a little soapy.", pairing_id: seafood.id)
parsley = Product.create(name: "Parsley", price: 345, description: "Grassy, mild, slightly peppery.", pairing_id: poultry.id)
dill = Product.create(name: "Dill", price: 450, description: "Sweet, grassy.", pairing_id: seafood.id)
thyme = Product.create(name: "Thyme", price: 475, description: "Lemony, slightly peppery and minty.".blue, pairing_id: beef.id)
oregano = Product.create(name: "Oregano", price: 300, description: "Lemony, minty, peppery.", pairing_id: pork.id)

#SPICES
cumin = Product.create(name: "Cumin", price: 325, description: "Its natural oils to add rich, earthiness.", pairing_id: vegetables.id)
mustard_seed = Product.create(name: "Mustard Seed", price: 400, description: "Zippy, hot Flavor.", pairing_id: beef.id)
red_pepper = Product.create(name: "Red Pepper Flakes", price: 275, description:"Earthy, savory. Spice flavor.", pairing_id: seafood.id)
smoked_paprika = Product.create(name: "Smoked Paprika", price: 400, description: "Rich, sweet & smokey", pairing_id: poultry.id)
bay_leaves = Product.create(name: "Bay Leaves", price: 325, description: "Mysterious umami flavor.", pairing_id: beef.id)
black_pepper = Product.create(name: "Black Pepper", price: 200, description: "Savory mild spice.", pairing_id: pork.id)
turmeric = Product.create(name: "Turmeric", price: 245, description: "Bright, Floral & mild taste.", pairing_id: poultry.id)

#Create Reviews#
r1 = Review.create(rating: 4, description: "The best with Steak!", product_id: rosemary.id, user_id: u1.id)
r2 = Review.create(rating: 2, description: "Too much will make it taste weird.", product_id: rosemary.id, user_id: u2.id)
r3 = Review.create(rating: 3, description: "Great for pasta!", product_id: basil.id, user_id: u3.id)
r4 = Review.create(rating: 4, description: "Fresh just taste better!", product_id: basil.id, user_id: u4.id)
r5 = Review.create(rating: 5, description: "This is the best ever!", product_id: basil.id, user_id: u5.id)
r6 = Review.create(rating: 5, description: "Mexican food staple.", product_id: cilantro.id, user_id: u1.id)
r7 = Review.create(rating: 5, description: "Not soapy at all!", product_id: cilantro.id, user_id: u2.id)
r8 = Review.create(rating: 4, description: "Adds freshness to chicken!", product_id: parsley.id, user_id: u3.id)
r9 = Review.create(rating: 2, description: "Not what I wanted.", product_id: parsley.id, user_id: u4.id)
r10 = Review.create(rating: 3, description: "Perfect with salmon", product_id: dill.id, user_id: u5.id)
r11 = Review.create(rating: 4, description: "A must for Tahini sauce.", product_id: dill.id, user_id: u2.id)
r12 = Review.create(rating: 3, description: "Works with pork too!", product_id: thyme.id, user_id: u4.id)
r13 = Review.create(rating: 5, description: "Classic steak ingredient", product_id: thyme.id, user_id: u3.id)
r14 = Review.create(rating: 5, description: "Blend it with sauces!", product_id: thyme.id, user_id: u2.id)
r15 = Review.create(rating: 4, description: "Makes pork delicious", product_id: oregano.id, user_id: u1.id)
r16 = Review.create(rating: 2, description: "Browns very easily", product_id: oregano.id, user_id: u1.id)
r17 = Review.create(rating: 3, description: "Great to balance the spice", product_id: oregano.id, user_id: u2.id)
r18 = Review.create(rating: 4, description: "Necessary for Curry", product_id: cumin.id, user_id: u3.id)
r19 = Review.create(rating: 3, description: "Smells exotic", product_id: cumin.id, user_id: u4.id)
r20 = Review.create(rating: 5, description: "Best for BBQ rubs.", product_id: mustard_seed.id, user_id: u5.id)
r21 = Review.create(rating: 5, description: "Incredible when toasted!", product_id: mustard_seed.id, user_id: u1.id)
r22 = Review.create(rating: 5, description: "I put this on everything", product_id: red_pepper.id, user_id: u2.id)
r23 = Review.create(rating: 4, description: "Right amount of spice every time!", product_id: red_pepper.id, user_id: u3.id)
r24 = Review.create(rating: 2, description: "Not like regular paprika", product_id: smoked_paprika.id, user_id: u4.id)
r25 = Review.create(rating: 3, description: "The best with home fries!", product_id: smoked_paprika.id, user_id: u5.id)
r26 = Review.create(rating: 4, description: "The secret weapon.", product_id: bay_leaves.id, user_id: u2.id)
r27 = Review.create(rating: 3, description: "Aromatic", product_id: bay_leaves.id, user_id: u3.id)
r28 = Review.create(rating: 5, description: "A must have!", product_id: black_pepper.id, user_id: u4.id)
r29 = Review.create(rating: 5, description: "Perfect for everything!", product_id: black_pepper.id, user_id: u5.id)
r30 = Review.create(rating: 5, description: "Makes the best rice!", product_id: turmeric.id, user_id: u2.id)
r31 = Review.create(rating: 5, description: "Add it to your tea!", product_id: turmeric.id, user_id: u3.id)
r32 = Review.create(rating: 4, description: "Goes well with anything", product_id: black_pepper.id, user_id: u4.id)
r33 = Review.create(rating: 1, description: "Too spicy!", product_id: red_pepper.id, user_id: u1.id)

#Create ProductOrder#
c1 = ProductOrder.create(product_id: thyme.id, order_id: u1.id)
c2 = ProductOrder.create(product_id: basil.id, order_id: u2.id)
c3 = ProductOrder.create(product_id: cilantro.id, order_id: u3.id)
c4 = ProductOrder.create(product_id: oregano.id, order_id: u1.id)
c5 = ProductOrder.create(product_id: cumin.id, order_id: u2.id)
c6 = ProductOrder.create(product_id: turmeric.id, order_id: u3.id)

#Create Order#
order1 = Order.create(user_id: u1.id, product_order_id: c1.id)
order2 = Order.create(user_id: u2.id, product_order_id: c2.id)
order3 = Order.create(user_id: u3.id, product_order_id: c3.id)


puts "Data seeded!"
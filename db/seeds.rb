#  ROLLBACK YOUR DATABASE TO NOTHING...
        # rake db:migrate VERSION=0  # => this will rollback everything
        # rake db:migrate
        # rake db:seed

### THIS IS THE NECESSARY WAY :)

require 'faker'

# -------------------USER SEEDS------------------------------------

user = User.create(
    "email": "ogroetz@gmail.com",
    "password": "hello1",
    "encrypted_password": "hello1",
    "username": "osha7", 
    "first_name": "Osha",
    "last_name": "Groetz",
    "street_address": "2336 W Iowa St", 
    "street_address_2": "Apt 3F", 
    "city": "Chicago", 
    "state": "IL", 
    "zip": "60622", 
    "country": "USA", 
    "phone_number": "917-477-9485", 
    "private": true, 
    "facebook": "jenniferosha.groetz", 
    "instagram": "@disparatepatterns", 
    "twitter": "@OshaG10", 
    "seller_account": false
)

10.times do 

    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name

    User.create(
        "email": "#{first_name}.#{last_name}@gmail.com",
        "password": "hello1",
        "encrypted_password": "hello1",
        "username": "#{first_name}7", 
        "first_name": first_name,
        "last_name": last_name,
        "street_address": Faker::Address.street_address, 
        "street_address_2": Faker::Address.secondary_address, 
        "city": Faker::Address.city, 
        "state": Faker::Address.state_abbr, 
        "zip": Faker::Address.zip, 
        "country": "USA", 
        "phone_number": Faker::PhoneNumber.cell_phone, 
        "private": true, 
        "facebook": "#{first_name}.#{last_name}", 
        "instagram": "#{first_name[0]}#{last_name}", 
        "twitter": "#{first_name}#{last_name[0]}", 
        "seller_account": false
    )

end

# -------------------USER SEEDS--above----------------------------------

# -------------------STORE SEEDS------------------------------------

store = Store.create(
    "store_name": "Rose Apothocary",
    "admin_name": "David",
    "bio": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi condimentum condimentum pharetra. Integer varius sem ut justo consectetur finibus. Nulla eget elit ante. Pellentesque porta leo id dictum ultrices.",
    "facebook": "Rose.Apothocary",
    "instagram": "@rose_apothocary",
    "twitter": "@rose_apothocary",
    "retailer": false,
    "user_id": 1,
)

count = 5
5.times do 

    faker_store_name = Faker::Commerce.vendor
    faker_admin_name = Faker::Name.name

    Store.create(
        "store_name": "#{faker_store_name}",
        "admin_name": "#{faker_admin_name}",
        "bio": "Morbi condimentum condimentum pharetra. Integer varius sem ut justo consectetur finibus. Nulla eget elit ante. Pellentesque porta leo id dictum ultrices.",
        "facebook": "#{faker_store_name}",
        "instagram": "@#{faker_store_name}",
        "twitter": "@#{faker_store_name}",
        "retailer": false,
        "user_id": count
    )

    count += 1
end

# -------------------STORE SEEDS--above----------------------------------

# -------------------LISTING SEEDS------------------------------------

listing = Listing.create(
    "name": "T Shirt", 
    "quantity": 1,
    "price": 29.99,
    "size": "small",
    "condition": "used",
    "description": "oversized t-shirt",
    "material": "cotton",
    "color": "white",
    "gender": "womens",
    "brand": "The Row",
    "product_code": "abcd-1234",
    "weight": 1.0,
    "weight_unit": "lb",
    "shipping_cost": 8.99,
    "offers_accepted": false,
    "tailoring_offered": false,
    "store_id": 1
)
#  buyer_id                    :bigint
#  order_id                    :bigint
#  type_id                     :bigint

10.times do 

    faker_name = Faker::Commerce.product_name
    faker_price = Faker::Commerce.price
    size_sample = ["x-small", "small", "medium", "large", "x-large", "2x", "3x"].sample
    faker_description = Faker::Lorem.sentence()
    faker_material = Faker::Commerce.material
    faker_color = Faker::Color.color_name
    gender_sample = ["womens", "mens", "unisex"].sample
    faker_brand = Faker::Commerce.brand
    faker_code = Faker::Code.isbn
    weight_sample = rand(0.5...9.0).round(2)
    faker_shipping_cost = Faker::Commerce.price(range: 0..10.0)
    offers_sample = [true, false].sample
    store_id_sample = rand(1...5)

    Listing.create(
        "name": "#{faker_name}", 
        "quantity": 1,
        "price": faker_price,
        "size": "#{size_sample}",
        "condition": "used",
        "description": "#{faker_description}",
        "material": "#{faker_material}",
        "color": "#{faker_color}",
        "gender": "#{gender_sample}",
        "brand": "#{faker_brand}",
        "product_code": "#{faker_code}",
        "weight": weight_sample,
        "weight_unit": "lb",
        "shipping_cost": faker_shipping_cost,
        "offers_accepted": offers_sample,
        "tailoring_offered": false,
        "store_id": store_id_sample
    )
    #  buyer_id                    :bigint
    #  order_id                    :bigint
    #  type_id                     :bigint

end

# -------------------LISTING SEEDS--above----------------------------------

# -------------------IMAGE SEEDS------------------------------------

image_user_id_starting = 1
11.times do
    Image.create(
        user_id: image_user_id_starting
    )
    image_user_id_starting += 1
end 

image_store_id_starting = 1
6.times do
    Image.create(
        store_id: image_store_id_starting
    )
    image_store_id_starting += 1
end 

image_listing_id_starting = 1
11.times do
    Image.create(
        listing_id: image_listing_id_starting
    )
    image_listing_id_starting += 1
end 

# -------------------IMAGE SEEDS--above----------------------------------

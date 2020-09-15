# README

## Overview
This project is a basic sample of an stroller's ecommerce built in Ruby On Rails.

Check on https://gravata-marketplace-sample.herokuapp.com/.


### Specifications bellow:

* **Rails (rails 6.0.3.2)**;
* **Ruby (ruby 2.6.6)**
* **psql (PostgreSQL 12.4)** - database;
* **devise (4.7.2)** - for user authentication;
* **pg_search (2.3.0)** - for seach engine;

### Configuration
#### Cloning repository:
```
git clone git@github.com:ygravata/ecommerce-sample.git --origin ecommerce-sample your-project-name
cd your-project-name
```
#### Create your repository:
```
git init .
git add .
git commit
hub create
````
#### Install all the dependencies:
```
bundle install
```

```
yarn install
```

       
### Functionalities of the project:

#### Tools:

* It is a simple marketplace (with low scalability)with the main functions necessary to operate:
  * An admin user to access the marketplace's management tools;
  * Products CRUD functions:
    * You can create through a YAML file upload or by manually creating a product item;
    * The YAML file structure should be like bellow:
    ```
    - name: 'XXXXX'
      brand: 'XXXXX'
      category: 'XXXXXX'
      image_url: https://www.xxxxxxx.com
      for: 'XXXXX'
      desc1: 'XXXXX'
      desc2: 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    ```
  * Cart checkout:
    * The user can add items, modify the quantity and empty the cart; 
  * Coupon discount:
    * Admins can create (in a exclusive section) series of discount coupons and choose between a range of 4 options of discount (5%, 10%, 15%, 20%);
    * All coupons can be used only one time;
  * Orders management:
    * Admins can keep track of all clients orders already billed;
  * Client orders:
    * Clients can have access to their orders;

#### Next steps:

* Implement Pundit gem and user policies, and give each user type a proper authorization;
* Write tests;
* Implement Stripes to enable payments;
* Increment user checkout journey;
* Implement active storage, to upload photos;
* Implement customer reviews;


## Thank you!

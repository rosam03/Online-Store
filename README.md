# Online-Store

* Fully supports CRUD operations for shops, orders, products, and line items. You can find API documentation and examples of interacting with the endpoints <a href="https://documenter.getpostman.com/view/5664312/RWguxcHq" >here</a>. Please see the Future Improvements section below. :)

* Ruby version 2.5.1, Rails version  5.2.1

## Setup
- run ```bundle install```

## Configuration
- add database credentials for user ```shopify_client``` to config/database.yml

## Database creation and configuration
- ```CREATE DATABASE shopify_backend_demo_development;```
- ```GRANT ALL PRIVILEGES ON * . * TO 'shopify_client'@'localhost';```
- ```FLUSH PRIVILEGES;```

## Database initialization
- ```rails db:reset db:seed```

## Deployment instructions
- run ```rails s``` in the root directory to start the application on localhost port 3000

## Future Improvements
- Encrypt communication with server using https
- Use globally unique ID's for shops, products, orders, and line items to support scaling the application in a distributed manner
- Add e-commerce features such as support for various currencies, customer billing/shipping addresses, and order status
- Add quantities to products and ensure line items cannot be created when the products quantity is 0
- Ensure operations are transactional and atomic when making changes to multiple objects
- Pass in port and database credentials via environment variable
- Add more exception handling :)
- Add API versioning
- Add testing: unit, functional, integration, performance/load, concurrency

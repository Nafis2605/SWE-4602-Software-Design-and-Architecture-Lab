# 1. Product Service



## Installation

Please install the following package manager to run the product service.

```bash
npm init -y
npm install express
npm install nodemon
npm install uuid
```

## How to test (Task 1)

* Open Postman
* Select POST request
* In the HEADER section, please add a constant 'Content-Type' and its value will be 'application/json'
* Please type "http://localhost:5000/product/add"
* In the BODY section, select 'raw'
* A JSON can be added to test the service. Example:
```bash
{
      "name": "shirt",
      "categoryId": 1
}
```
```bash
{
      "name": "pant",
      "categoryId": 1
}
```
```bash
{
      "name": "saree",
      "categoryId": 2
}
```
* Please click 'SEND' button and it will get added, HTTP status code 201 will be returned and the JSON file will be displayed

```bash
{
      "name": "shirt",
      "categoryId": 1
}
```
* Please click 'SEND' button and it will not get added, HTTP status code 400 will be returned because of the duplicate input

```bash
{
      "name": "shirt"
}
```
* Please click 'SEND' button and HTTP status code 500 will be returned because of the missing data.


## How to test (Task 2)

* Open Postman
* Select DELETE request
* Please type "http://localhost:5000//product/remove/<id>", As the IDs are UUID, providing accurate example is not possible

Demo Example:
```bash
http://localhost:5000//product/remove/62a73ddc-98da-455d-b7c6-e4038c787243

```
Demo Output:
```bash
{
    "msg": "Product is deleted",
    "products": [
        {
            "id": "3f6d316a-5d81-4a36-aa3d-bc73b255316e",
            "name": "shirt",
            "categoryId": 1300
        },
        {
            "id": "03a48c59-41b1-4ba7-8579-be94629cce02",
            "name": "sweater",
            "categoryId": 10
        }
    ]
}
```

## How to test (Task 3)

* Open Postman
* Select GET request
* Please type "http://localhost:5000/product/list"
* It will show id, name, categoryId, categoryName, averageRating, numberOfRaters of all the products individually


## How to test (Task 4)

* Open Postman
* Select POST request
* In the HEADER section, please add a constant 'Content-Type' and its value will be 'application/json'
* Please type "http://localhost:5000/product/updateCategory"
* In the BODY section, select 'raw'
* A JSON can be added to test the service. Example:
```bash
{
      "name": "shirt",
      "categoryId": 10
}
```
```bash
{
      "name": "pant",
      "categoryId": 100
}
```
* Product categories will be updated after every request.

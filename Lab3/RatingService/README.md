# 2. Rating Service


## Installation

Please install the following package manager to run the rating service.

```bash
npm init -y
npm install express
npm install nodemon
npm install uuid
```

## How to test

* Open Postman
* Select POST request
* In the HEADER section, please add a constant 'Content-Type' and its value will be 'application/json'
* Please type "http://localhost:5000/rate"
* In the BODY section, select 'raw'
* A JSON can be added to test the service. Example:
```bash
{
      "productID": 1,
      "rating": 5,
      "raterID": 1
}
```
* Please click 'SEND' button and it will get added, HTTP status code 200 will be returned and the JSON file will be displayed.

```bash
{
      "productID": 2,
      "rating": 5,
      "raterID": 1
}
```
* Please click 'SEND' button and it will also get added, HTTP status code 200 will be returned and the JSON file will be displayed.

```bash
{
      "productID": 1,
      "rating": 1,
      "raterID": 1
}
```
* Please click 'SEND' button and the rating will be updated.
HTTP status code 200 will be returned and the JSON file will be displayed.


```bash
{
      "productID": 1,
      "rating": 1
}
```
* Please click 'SEND' button and it will show an error code of 400 for the missing data.

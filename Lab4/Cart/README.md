# Lab task - Session State


Group ID: 04_49_77

Group Members:
* Fahim Arsad Nafis (170042004)
* Maysha Afrin Munia (170042049)
* Syeda Mishra Saiara (170042077)


## Dependencies

Please run the following commands in the console to install to dependencies of the project.
```bash
npm init -y
npm install express
npm install nodemon
npm install chalk
npm install uuid
```

## Task 1 | Add an Item

* **'nodemon start'** in the terminal in order to start the localhost server.
* Please open **Postman**.
* Choose a **Post** request.
* Please enter the following address in the address bar.

```bash
http://localhost:5000/cart/add/ball

or 

http://localhost:5000/cart/add/:name

Please fill the variable name according to your favourite product. 
(Example: name = ball)
```

* Click **Send**
* After clicking the first time, it will return a **Session ID** and the product cart as well.
```bash
{
    "session_id": [
        {
            "id": "5211bb82-fe11-4312-911e-556622776c7a"
        }
    ],
    "result": [
        {
            "name": "ball",
            "quantity": 1
        }
    ]
}
```

* From the next attempts, it will use previous Session ID and new Session ID won't be generated.
```bash
[
    {
        "name": "ball",
        "quantity": 3
    },
    {
        "name": "bat",
        "quantity": 1
    },
    {
        "name": "hat",
        "quantity": 4
    }
]
```

## Task 2 | Remove an item


* **'nodemon start'** in the terminal in order to start the localhost server.
* Please open **Postman**.
* Choose a **DELETE** request.
* Please enter the following address in the address bar.

```bash
http://localhost:5000/cart/remove/ball

or 

http://localhost:5000/cart/remove/:name

Please fill the variable name according to your favourite product. 
(Example: name = ball)
```
* Click **Send**
* After clicking the first time, it will remove the item.
```bash
[
    {
        "name": "bat",
        "quantity": 1
    },
    {
        "name": "hat",
        "quantity": 4
    }
]
```
## Task 3 | Decrease an item
* **'nodemon start'** in the terminal in order to start the localhost server.
* Please open **Postman**.
* Choose a **DELETE** request.
* Please enter the following address in the address bar.

```bash
http://localhost:5000/cart/decrease/hat

or 

http://localhost:5000/cart/decrease/:name

Please fill the variable name according to your favourite product. 
(Example: name = hat)
```
* Click **Send**
* After clicking the first time, it will reduce the quantity of the item.
```bash
[
    {
        "name": "bat",
        "quantity": 1
    },
    {
        "name": "hat",
        "quantity": 3
    }
]
```
## Task 4 | Get the cart
* **'nodemon start'** in the terminal in order to start the localhost server.
* Please open **Postman**.
* Choose a **GET** request.
* Please enter the following address in the address bar.

```bash
http://localhost:5000/cart
```
* Click **Send**
* After clicking the **SEND** button, it will always show the current cart.
```bash
[
    {
        "name": "bat",
        "quantity": 1
    },
    {
        "name": "hat",
        "quantity": 3
    }
]
```
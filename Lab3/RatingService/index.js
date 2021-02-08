const express = require("express")
const app = express()

const ratings = require("./ratings")
const { push } = require("./ratings");

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => console.log("Server has started"))


//Body parser Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: false }))


app.post('/rate', (req, res) => {
    const addRating = {
        productID: req.body.productID,
        rating: req.body.rating,
        raterID: req.body.raterID
    }

    if (!addRating.productID || !addRating.rating || !addRating.raterID) {
        return res.status(400).json({ msg: 'Please include data' })
    }

    const duplicate = ratings.some(rating => rating.productID === parseInt(req.body.productID) && rating.raterID === parseInt(req.body.raterID));
    if (duplicate) {
        const updateRating = req.body;
        ratings.forEach((rating) => {
            if (rating.productID === parseInt(req.body.productID) && rating.raterID === parseInt(req.body.raterID)) {
                rating.rating = req.body.rating
            }
        })
    }
    else {
        ratings.push(addRating)
    }
    res.json(ratings)
});







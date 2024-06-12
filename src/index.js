const express = require('express');
const publicRouter = require('./route/public-api');
const userRouter = require('./route/api.js');



require('dotenv').config();

const app = express();
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
const port = process.env.PORT
app.use(publicRouter);
app.use(userRouter);

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});

// sequelize.sync({ force: true }).then(() => {
//     app.listen(port, () => {
//         console.log(`Server is running on port ${port}`);
//     });
// }).catch(err => {
//     console.error('Unable to sync the database:', err);
// });
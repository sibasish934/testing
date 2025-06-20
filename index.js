import express from 'express';

const app = express();
const PORT = process.env.PORT || 3000;

// const environment = process.env.NODE_ENV || 'development';

app.get('/', (req, res) => {
  res.send('Hello, World!');
});

// app.get('/env', (req, res) => {
//   res.json({
//     environment: environment,
//     message: `You are running in ${environment} mode`
//   });
// });

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});


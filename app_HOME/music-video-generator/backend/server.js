const express = require('express');
const bodyParser = require('body-parser');
const OpenAI = require('openai-api');
const cors = require('cors');

const app = express();
const openai = new OpenAI('YOUR_OPENAI_API_KEY'); // Replace with your OpenAI API key

app.use(cors());
app.use(bodyParser.json());

app.post('/generate-lyrics', async (req, res) => {
  const { theme } = req.body;
  const gptResponse = await openai.complete({
    engine: 'text-davinci-002',
    prompt: `Write a song about ${theme}`,
    maxTokens: 100,
  });
  res.json({ lyrics: gptResponse.data.choices[0].text });
});

app.listen(3000, () => {
  console.log('Server is running on port 3000');
});

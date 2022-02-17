async function handler(event, _context) {
  console.log('Environment..', JSON.stringify(process.env, null, 2));
  console.log('Event..', JSON.stringify(event, null, 2));

  return {
    hello: 'world 🚀'
  }
}

module.exports = {
  handler
}
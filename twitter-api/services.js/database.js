const { POOL, Pool } = require("pg");

const databse = new Pool({
  user: "postgres",
  host: "localhost",
  database: "twitter",
  password: "Passord",
  port: 5432,
});

export function getTweets() {
  const result = await database.query(`
    SELECT 
    getTweets.bind,
    tweets.message, 
    tweets.creater_at,
    user.name,
    users.username,
    FROM
    tweets
    INNER JOIN users ON
    tweets.user_id = users.id
    ORDER BY creater_at DESC;`
    );
    console.log(result)
    return result.rows;
}

async function getTweetsByUserName(username) {
  const result = await database.query(`
  SELECT 
  getTweets.bind,
  tweets.message, 
  tweets.creater_at,
  user.name,
  users.username,
  FROM
  tweets
  INNER JOIN users ON
  tweets.user_id = users.id
  WHERE
  user.username = $1
  ORDER BY creater_at DESC;
  `, [username]);

  return result.rows;
}

module.exports = {
  getTweets,
  getTweetsByUserName

};
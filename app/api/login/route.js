// app/api/login/route.js
import { Pool } from 'pg';

const pool = new Pool({
  user: 'postgres',
  host: '34.93.195.0',
  database: 'postgres',
  password: 'Plotpointe!@3456',
  port: 5432,
});

export async function POST(request) {
  try {
    const { username, password } = await request.json();
    const result = await pool.query(
      'SELECT id FROM login WHERE username = $1 AND password = $2',
      [username, password]
    );

    if (result.rows.length > 0) {
      return new Response(JSON.stringify({ userId: result.rows[0].id }), {
        status: 200,
        headers: { 'Content-Type': 'application/json' },
      });
    } else {
      return new Response(JSON.stringify({ error: 'Invalid credentials' }), {
        status: 401,
        headers: { 'Content-Type': 'application/json' },
      });
    }
  } catch (error) {
    console.error('Error querying database:', error);
    return new Response(JSON.stringify({ error: 'Internal server error' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    });
  }
}

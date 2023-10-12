const mysql = require('mysql2')
const pool = require('../sql/connection')
const { handleSQLError } = require('../sql/error')

const getAllAlbums = (req, res) => {
  pool.query("SELECT * FROM albums", (err, rows) => {
    if (err) return handleSQLError(res, err)
    return res.json(rows);
  })
}

const getAlbumById = (req, res) => {
  let sql = "SELECT * FROM ?? WHERE ?? = ?"
  sql = mysql.format(sql, ["albums", "album_id", req.params.album_id])

  pool.query(sql, (err, rows) => {
    if (err) return handleSQLError(res, err)
    return res.json(rows);
  })
}

const createAlbum = (req, res) => {
  let sql = "INSERT INTO ?? (??, ??, ??, ??, ??, ??, ??) VALUES (?, ?, ?, ?, ?, ?, ?)"
  sql = mysql.format(sql, ["albums", "album_id", "artist_id", "album_title", "artist", "release_year", "genre",
   "cover_art", req.body.album_id, req.body.artist_id, req.body.album_title, req.body.artist, req.body.release_year,
    req.body.genre, req.body.cover_art])

  pool.query(sql, (err, results) => {
    if (err) return handleSQLError(res, err)
    return res.json({ newId: results.insertId });
  })
}

const updateAlbumById = (req, res) => {
  let sql = "UPDATE ?? SET ?? = ?, ?? = ?, ?? = ?, ?? = ?, ?? = ?, ?? = ? WHERE ?? = ?"
  sql = mysql.format(sql, ["albums", "artist_id", req.body.artist_id, "album_title", req.body.album_title, "artist",
   req.body.artist, "release_year", req.body.release_year, "genre", req.body.genre, "cover_art", req.body.cover_art,
    "album_id", req.params.album_id])

  pool.query(sql, (err, results) => {
    if (err) return handleSQLError(res, err)
    return res.status(204).json();
  })
}

const deleteAlbumById = (req, res) => {
  let sql = "DELETE FROM ?? WHERE ?? = ?"
  sql = mysql.format(sql, ["albums", "album_id", req.params.album_id])

  pool.query(sql, (err, results) => {
    if (err) return handleSQLError(res, err)
    return res.json({ message: `Deleted ${results.affectedRows} album(s)` });
  })
}

module.exports = {
  getAllAlbums,
  getAlbumById,
  createAlbum,
  updateAlbumById,
  deleteAlbumById
}
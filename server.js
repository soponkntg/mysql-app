const express = require('express');
const app = express();
const port = 3000;
const mysql = require('mysql');
const bodyParser = require('body-parser')

app.set('view engine', 'pug');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: 'password',
	database: 'newschema'
});

connection.connect(function (err) {
	if (err) throw err;
	console.log("Connected!");
});

//app.get('/',(req,res) => res.send('hello world'));
app.get('/', (req, res) => {
	if (req.query.id != null) {
		connection.query("SELECT * FROM takes WHERE student_id LIKE '%" + req.query.id + "%'", (err, result) => {
			res.render('index', {
				takes: result
			});
		})
		console.log("Search!");
	} else {
		connection.query('SELECT * FROM takes', (err, result) => {
			res.render('index', {
				takes: result
			});
		})
		console.log("Query!");
	}


});

app.get('/add', (req, res) => {
	res.render('add');
});

app.post('/add', (req, res) => {
	const student_id = req.body.student_id;
	const cid = req.body.cid;
	const sect_id = req.body.sect_id;
	const semester = req.body.semester
	const year = req.body.year
	const grade = req.body.grade
	const post = {
		student_id,
		cid,
		sect_id,
		semester,
		year,
		grade
	}
	connection.query('INSERT INTO takes SET ?', post, (err) => {
		console.log('Student Inserted');
		return res.redirect('/');
	});
});

app.get('/edit/:id', (req, res) => {

	const edit_postID = req.params.id;

	connection.query('SELECT * FROM takes WHERE student_id=?', [edit_postID], (err, results) => {
		if (results) {
			res.render('edit', {
				takes: results[0]
			});
		}
	});
});

app.post('/edit/:id', (req, res) => {
	const update_cid = req.body.cid;
	const update_sect_id = req.body.sect_id;
	const update_semester = req.body.semester;
	const update_year = req.body.year;
	const update_grade = req.body.grade;
	const userId = req.params.id;
	connection.query('UPDATE `takes` SET cid = ?, sect_id = ?, semester = ?, year = ?, grade = ? WHERE student_id = ?', [update_cid, update_sect_id, update_semester, update_year, update_grade, userId], (err, results) => {
		if (results.changedRows === 1) {
			console.log('Student Updated');
		}
		return res.redirect('/');
	});
});

app.get('/delete/:id', (req, res) => {
	connection.query('DELETE FROM `takes` WHERE student_id = ?', [req.params.id], (err, results) => {
		return res.redirect('/');
	});
});


app.listen(port, () => console.log(`Example app listening on port ${port}!`))
<?php
session_start();
?>
<!DOCTYPE html>
<html>
<head>
	<title>Login Page</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>

<div class="container">
	<div class="row">
		<div style="width: 40%; margin: 25px auto;">
		<h3 style="text-align: center;">Login Page</h3>
		<form action="/creds.php" method="POST">
			<div class="form-group">
				<label>UserName:</label><input type="text" id="uname" name="uname" class="form-control" autofocus placeholder="username" required>
			</div>
			<div class="form-group">
				<label>Password:</label><input type="Password" id="pass" name="pass" class="form-control" autofocus placeholder="Password" required>
			</div>

			<label>Enter Captcha:</label>
			<div class="form-group col-md-6">
					<input type="text" class="form-control" name="ucaptcha" id="ucaptcha" required>
			</div>
			<img src="/captcha.php">

			<div class="form-group mt-3">
					<button type="submit" class="btn btn-lg btn-success btn-block">submit</button>
			</div>
		</form>
		
	</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</html>
<!doctype html>
<html lang="IS">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="/static/style.css">
    <title>Login</title>
</head>
<body>
    <form action="/login" method="POST">
        <p>Username</p>
        <div class='abc'><input type="text" name="username"></div>
        <p>Password</p>
        <div class="abc"><input type="password" name="password"></div>
        <div class="abc"><input type="submit" value="LogIn"></div>

    </form>
</body>
</html>
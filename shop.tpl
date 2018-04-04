<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="/static/style.css">
    <title>Vefverslun</title>
</head>
<body>
 <h2>Velduvörur</h2>
    <table border="1">
        <tr>
            <th>Vöruheiti</th>
            <th>Verð</th>
        </tr>
        % for p in products:
            <tr>
                <td><a href="/cart/add/{{p['pid']}}">{{p['name']}}</a></td>
                <td>{{p['price']}}</td>
            </tr>
        % end
    </table>

</body>
</html>
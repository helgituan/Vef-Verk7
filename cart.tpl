<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="/static/style.css">
    <title>Karfan Þín</title>
</head>
<body>

    <h2>Karfa þín:</h2>

    % if len(karfa) <= 0:
        <p>karfan er tóm.</p>
        <p><a href="/shop"> Aftur í verslun</a></p>
    % else:
    %   for i in karfa:
            <p>{{i}}</p>
    %   end
        <p><a href="/shop"> Aftur í verslun</a></p>
    % end

    <p><a href="/cart/remove"> Tæma körfu</a></p>

</body>
</html>
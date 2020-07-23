<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
    <link rel="stylesheet" href="../../style.css">
    <link rel="shortcut icon" href="img/book.svg" type="image/x-icon">
</head>
<body>

    <div class="tab_bar margin_bottom100px">
        <div class="tab_bar_hello float_left margin_left100px">Hello，欢迎来到华迪图书！</div>
        <ul class="tabBar float_right margin_right100px">
        </ul>
    </div>
    <div style="clear: both;"></div>

    <div class="box margin_center">
        <form action="/home" method="post" class="height450px">
            <div class="main_title_middle">华迪图书管理系统</div>
            <input type="text" class="form-control" name="username" id="username" placeholder="Username">
            <input type="password" class="form-control" name="password" id="password" placeholder="Password">
            <input type="text" class="form-control" name="age" id="age" placeholder="Age">
            <input type="text" class="form-control" name="classname" id="classname" placeholder="ClassName">
            <button type="submit" class="btn btn-default" id="submit">Submit</button>
        </form>
    </div>
<%
    /**
     * 存一个验证token 用来验证是否是从注册页面到达home页面
     */
    session.setAttribute("token_login","1");
    session.setAttribute("username",request.getParameter("username"));
%>

</body>
</html>
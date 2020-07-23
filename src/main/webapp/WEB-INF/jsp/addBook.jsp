<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加书籍</title>
    <link rel="stylesheet" href="../../style.css">
    <link rel="shortcut icon" href="img/book.svg" type="image/x-icon">
    <script src="/webjars/jquery/3.1.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
</head>

<body>
    <div class="tab_bar margin_bottom85px">
        <div class="tab_bar_hello float_left margin_left100px">Hello，欢迎来到华迪图书！</div>
        <ul class="tabBar float_right margin_right100px">
            <li class="tab_bar_register">欢迎，${username}</li>
            <li class="tab_bar_logout" onclick="logout()">注销</li>
        </ul>
    </div>
    <div style="clear: both;"></div>
    <div class="color_white h w text_align_center float_left margin_left150px">
        <div class="book_management">添加书籍</div>
        <table class="color_white book_table margin_left8l/" id="table_addBook">
            <tr class="book_table_title">
                <td>序号</td>
                <td>书名</td>
                <td>作者</td>
                <td>出版社</td>
                <td>种类</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${allBook}" var="books">
                <tr>
                    <td>${books.book_id}</td>
                    <td>${books.book_name}</td>
                    <td>${books.book_author}</td>
                    <td>${books.book_pub}</td>
                    <td>${books.book_sort}</td>
                    <td><span onclick="addBook_new('${books.book_id}')" id="addBook">添加</span></td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <%
        session.setAttribute("token_login","2");
    %>


    <script>
        function
        addBook_new(id) {
            var j;
            var i = 2 + j;
            var param = {};
            var id = id;
            var username = "${username}";
            param.username = username;
            param.id = id;
            param.i = i;
            $.ajax({
                url: "http://localhost:8080/addBook_replace",
                data: JSON.stringify(param),
                type: "POST",
                dataType: 'json',
                contentType: 'application/json',
                success: function (data) {
                    if (data.msg = "succes") {
                        window.location.href = '/home';
                        j = j + 2;
                    }
                },
                error: function (data) {
                    alert("出错：" + data.code);
                },
            });
        }
    </script>

    <script>
        function logout() {
            if (confirm("是否确定注销该用户") == true) {
                window.location.href = "/logout"
            }
        }
    </script>
</body>
</html>
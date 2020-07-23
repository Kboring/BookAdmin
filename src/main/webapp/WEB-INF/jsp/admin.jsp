<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员界面</title>
    <link rel="stylesheet" href="../../style.css" />
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

    <div class="list list_user z_index200 color_white h width55 text_align_center" id="list_user">
        <div class="book_management">用户信息列表</div>
        <table class="book_table">
            <tr class="book_table_title">
                <td>用户名</td>
                <td>年龄</td>
                <td>班级</td>
                <td>密码</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${users}" var="users">
                <tr>
                    <td>${users.username}</td>
                    <td>${users.age}</td>
                    <td>${users.classname}</td>
                    <td>${users.password}</td>
                    <td><span onclick="delUser('${users.username}' )" class="del">删除</span></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <!-- 删除用户-->
    <script>
        function delUser(username) {
            if (confirm("是否确定删除该用户?") == true) {
                var username = username;
                var param = {};
                param.username = username;
                $.ajax({
                    url: "http://localhost:8080/delUser",
                    data: JSON.stringify(param),
                    type: "POST",
                    dataType: 'json',
                    contentType: 'application/json',
                    success: function (data) // data后台给前台的数据
                    {
                        if (data.msg = "succes") {
                            window.location.href = '/admin';
                        }
                    },
                    error: function (data) {
                        alert("出错：" + data.code);
                    },
                });
            }

        }
    </script>
    <div class="list list_book z_index100 color_white h width55 text_align_center" id="list_book">
        <div class="book_management">图书信息列表</div>
        <table class="book_table">
            <tr class="book_table_title">
                <td>书名</td>
                <td>作者</td>
                <td>出版社</td>
                <td>类型</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${books}" var="books">
                <tr>
                    <td>${books.book_name}</td>
                    <td>${books.book_author}</td>
                    <td>${books.book_pub}</td>
                    <td>${books.book_sort}</td>
                    <td><span onclick="delBook('${books.book_name}')" class="color_gray del">删除</span></td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <script>
        var list_user = document.getElementById('list_user');
        var list_book = document.getElementById('list_book');
        list_user.onclick = function () {
            this.style.zIndex = "200";
            list_book.style.zIndex = "100";
            // this.style.top = "180px";
            // this.style.left = "250px";
            // list_book.style.top = "100px";
            // list_book.style.left = "400px";
            list_book.style.backgroundColor = "rgba(157, 166, 173, 0.7)";
            this.style.backgroundColor = "rgb(59, 60, 61, 0.98)";
        }

        list_book.onclick = function () {
            this.style.zIndex = "200";
            list_user.style.zIndex = "100";
            // this.style.top = "180px";
            // this.style.left = "250px";
            // list_user.style.top = "100px";
            // list_user.style.left = "400px";
            list_user.style.backgroundColor = "rgba(157, 166, 173, 0.7)";
            this.style.backgroundColor = "rgb(59, 60, 61, 0.98)";
        }

        function delBook(bookname) {
            if (confirm("是否确定删除该书籍?") == true) {
                var bookname = bookname;
                var param = {};
                param.bookname = bookname;
                $.ajax({
                    url: "http://localhost:8080/delBook",
                    data: JSON.stringify(param),
                    type: "POST",
                    dataType: 'json',
                    contentType: 'application/json',
                    success: function (data) // data后台给前台的数据
                    {
                        if (data.msg = "succes") {
                            window.location.href = '/admin';
                        }
                    },
                    error: function (data) {
                        alert("出错：" + data.code);
                    },
                });
            }
        };

        function logout() {
            if (confirm("是否确定注销该用户") == true) {
                window.location.href = "/logout"
            }
        }
    </script>

</body>
</html>
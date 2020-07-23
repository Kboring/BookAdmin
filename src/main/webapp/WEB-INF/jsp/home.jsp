<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人中心</title>
    <link rel="stylesheet" href="../../style.css">
    <link rel="shortcut icon" href="img/book.svg" type="image/x-icon">
    <script src="/webjars/jquery/3.1.1/jquery.min.js"></script>
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
    <ul class="personal float_left color_white margin_left100px h">
        <!-- <li>userName</li>
        <li>age</li>
        <li>class</li> -->
        <li>姓名:${userByName.get(0).username}</li>
        <li>年龄:${userByName.get(0).age}</li>
        <li>班级:${userByName.get(0).classname}</li>
    </ul>
    <div class="color_white h width55 text_align_center float_left margin_left150px">
        <div class="book_management">书籍管理</div>
        <c:if test="${token_book==1}">
            <table class="book_table">
                <tr class="book_table_title">
                    <td>书籍号</td>
                    <td>书名</td>
                    <td>作者</td>
                    <td>出版社</td>
                    <td>种类</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${book}" var="book">
                    <tr>
                        <td>${book.book_id}</td>
                        <td>${book.book_name}</td>
                        <td>${book.book_author}</td>
                        <td>${book.book_pub}</td>
                        <td>${book.book_sort}</td>
                        <td><span onclick="del_new('${book.book_id}')" class="del">删除</span></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <c:if test="${token_book==0}">
            <c:out value="尚未添加书籍"></c:out>
        </c:if>
        <ul>
            <li class="turn_page float_left margin_left100px" onclick="previousPage()">上一页</li>
            <li class="turn_page float_right margin_right100px" onclick="nextPage()">下一页</li>
        </ul>
        <div style="clear: both;"></div>
        <button type="submit" value="添加书籍" onclick="addBook()" id="add">添加书籍</button>
    </div>
    <script>
        function del_new(id) {
            if (confirm("是否确定删除该本书籍") == true) {
                var param = {};
                var id = id
                var username = "${username}";
                param.username = username;
                param.id = id;
                $.ajax({
                    url: "http://localhost:8080/del",
                    data: JSON.stringify(param),
                    type: "POST",
                    dataType: 'json',
                    contentType: 'application/json',
                    success: function (data) // data后台给前台的数据
                    {
                        if (data.msg = "succes") {
                            window.location.href = '/home';
                        }

                    },
                    error: function (data) {
                        alert("出错：" + data.code);
                    },
                });
            }

        }
    </script>
    <!-- 添加书籍-->
    <script>
        function addBook() {
            window.location.href = "/addBook"
        }
    </script>
    <!-- 注销用户-->
    <script>
        function logout() {
            if (confirm("是否确定注销该用户") == true) {
                window.location.href = "/logout"
            }
        }
    </script>

    <!-- 下一页查询-->
    <script>
        function nextPage() {
            var username = '${username}';
            var params = {};
            params.username = username;
            $.ajax({
                url: "http://localhost:8080/replace_home_next",
                data: JSON.stringify(params),
                type: "POST",
                dataType:'json',
                contentType: 'application/json',
                success: function(data) // data后台给前台的数据
                {
                    if(data.msg == "success"){
                        window.location.href = '/home';
                    }
                    else if (data.msg == "fail") {
                        alert("用户名或密码错误！");
                    }else if (data.msg == "admin") {
                        window.location.href = '/admin';
                    }else if (data.msg == "已经到头!") {
                        alert("已经到头!")
                    }
                },
                error : function(data) {
                    alert("出错：" + data.code);
                },
            });
        }
    </script>

    <!-- 上一页查询-->
    <script>
        function previousPage() {
            var username = '${username}';
            var params = {};
            params.username = username;
            $.ajax({
                url: "http://localhost:8080/replace_home_pre",
                data: JSON.stringify(params),
                type: "POST",
                dataType:'json',
                contentType: 'application/json',
                success: function(data) // data后台给前台的数据
                {
                    if(data.msg == "success"){
                        window.location.href = '/home';
                    }
                    else if (data.msg == "fail") {
                        alert("用户名或密码错误！");
                    }else if (data.msg == "admin") {
                        window.location.href = '/admin';
                    }else if (data.msg == "已经到头!") {
                        alert("已经到头!")
                    }
                },
                error : function(data) {
                    alert("出错：" + data.code);
                },
            });
        }
    </script>
</body>
</html>
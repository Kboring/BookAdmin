<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>首页</title>
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
    </script>
    <link rel="shortcut icon" href="/springboot/springwebapp/src/main/webapp/img/book.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="../../style.css">
</head>
<body>
    <div class="tab_bar margin_bottom160px">
        <div class="tab_bar_hello float_left margin_left100px">Hello，欢迎来到华迪图书！</div>
        <ul class="tabBar float_right margin_right100px">
            <li class="tab_bar_index"><a href="/index">首页</a></li>
        </ul>
    </div>
    <div style="clear: both;"></div>
    <div class="We float_left margin_left200px">
        <div class="height300px">
            <div class="main_title_middle">系统制作人员</div>
            <div class="margin_top20px height300px color_white text_align_center">
                <ul class="flex">
                    <li class="flex1">魏静</li>
                    <li class="flex1">网页设计</li>
                </ul>
                <ul class="flex">
                    <li class="flex1">孙萍</li>
                    <li class="flex1">数据操作师</li>
                </ul>
                <ul class="flex">
                    <li class="flex1">艾辉</li>
                    <li class="flex1">数据清洗师</li>
                </ul>
                <ul class="flex">
                    <li class="flex1">康玻瑞</li>
                    <li class="flex1">后端设计师</li>
                </ul>
                <ul class="flex">
                    <li class="flex1">杨华峰</li>
                    <li class="flex1">系统分析师</li>
                </ul>
                <ul class="flex">
                    <li class="flex1">尚伟维</li>
                    <li class="flex1">前端代码</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="box float_right margin_right200px">
        <form method="post" class="height300px">
            <div class="main_title_middle">华迪图书管理系统</div>
            <input type="text" id="username" placeholder="Username"><br>
            <input type="password" id="password" placeholder="Password">
            <!-- <div class="width150px height120px" id="v_container"></div> -->
            <!-- <input type="text" id="code_input" value="" placeholder="Verification Code" /> -->
            <ul class="flex">
                <li><input type="button" value="Submit" onclick="login_new()" id="login"></li>
                <li><input type="button" value="Register" onclick="regist_new()" id="regist"></li>
            </ul>
        </form>
    </div>

<!-- <script>
        !(function (window, document) {
            var size = 4; //设置验证码长度
            function GVerify(options) { //创建一个图形验证码对象，接收options对象为参数
                this.options = { //默认options参数值
                    id: "", //容器Id
                    canvasId: "verifyCanvas", //canvas的ID
                    width: "500px", //默认canvas宽度
                    height: "100px", //默认canvas高度
                    type: "blend", //图形验证码默认类型blend:数字字母混合类型、number:纯数字、letter:纯字母
                    code: "",
                }
                if (Object.prototype.toString.call(options) == "[object Object]") { //判断传入参数类型
                    for (var i in options) { //根据传入的参数，修改默认参数值
                        this.options[i] = options[i];
                    }
                } else {
                    this.options.id = options;
                }

                this.options.numArr = "0,1,2,3,4,5,6,7,8,9".split(",");
                this.options.letterArr = getAllLetter();

                this._init();
                this.refresh();
            }

            GVerify.prototype = {
                /**版本号**/
                version: '1.0.0',

                /**初始化方法**/
                _init: function () {
                    var con = document.getElementById(this.options.id);
                    var canvas = document.createElement("canvas");
                    this.options.width = con.offsetWidth > 0 ? con.offsetWidth : "100";
                    this.options.height = con.offsetHeight > 0 ? con.offsetHeight : "30";
                    canvas.id = this.options.canvasId;
                    canvas.width = this.options.width;
                    canvas.height = this.options.height;
                    canvas.style.cursor = "pointer";
                    canvas.innerHTML = "您的浏览器版本不支持canvas";
                    con.appendChild(canvas);
                    var parent = this;
                    canvas.onclick = function () {
                        parent.refresh();
                    }
                },

                /**生成验证码**/
                refresh: function () {
                    this.options.code = "";
                    var canvas = document.getElementById(this.options.canvasId);
                    if (canvas.getContext) {
                        var ctx = canvas.getContext('2d');
                    } else {
                        return;
                    }

                    ctx.textBaseline = "middle";

                    ctx.fillStyle = randomColor(180, 240);
                    ctx.fillRect(0, 0, this.options.width, this.options.height);

                    if (this.options.type == "blend") { //判断验证码类型
                        var txtArr = this.options.numArr.concat(this.options.letterArr);
                    } else if (this.options.type == "number") {
                        var txtArr = this.options.numArr;
                    } else {
                        var txtArr = this.options.letterArr;
                    }

                    for (var i = 1; i <= size; i++) {
                        var txt = txtArr[randomNum(0, txtArr.length)];
                        this.options.code += txt;
                        ctx.font = randomNum(this.options.height / 2, this.options.height) +
                            'px SimHei'; //随机生成字体大小
                        ctx.fillStyle = randomColor(50, 160); //随机生成字体颜色        
                        ctx.shadowOffsetX = randomNum(-3, 3);
                        ctx.shadowOffsetY = randomNum(-3, 3);
                        ctx.shadowBlur = randomNum(-3, 3);
                        ctx.shadowColor = "rgba(0, 0, 0, 0.3)";
                        var x = this.options.width / (size + 1) * i;
                        var y = this.options.height / 2;
                        var deg = randomNum(-30, 30);
                        /**设置旋转角度和坐标原点**/
                        ctx.translate(x, y);
                        ctx.rotate(deg * Math.PI / 180);
                        ctx.fillText(txt, 0, 0);
                        /**恢复旋转角度和坐标原点**/
                        ctx.rotate(-deg * Math.PI / 180);
                        ctx.translate(-x, -y);
                    }
                    /**绘制干扰线**/
                    for (var i = 0; i < 4; i++) {
                        ctx.strokeStyle = randomColor(40, 180);
                        ctx.beginPath();
                        ctx.moveTo(randomNum(0, this.options.width), randomNum(0, this.options.height));
                        ctx.lineTo(randomNum(0, this.options.width), randomNum(0, this.options.height));
                        ctx.stroke();
                    }
                    /**绘制干扰点**/
                    for (var i = 0; i < this.options.width / 4; i++) {
                        ctx.fillStyle = randomColor(0, 255);
                        ctx.beginPath();
                        ctx.arc(randomNum(0, this.options.width), randomNum(0, this.options.height), 1, 0,
                            2 * Math.PI);
                        ctx.fill();
                    }
                },

                /**验证验证码**/
                validate: function (code) {
                    var code = code.toLowerCase();
                    var v_code = this.options.code.toLowerCase();
                    if (code == v_code) {
                        return true;
                    } else {
                        this.refresh();
                        return false;
                    }
                }
            }
            /**生成字母数组**/
            function getAllLetter() {
                var letterStr =
                    "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z";
                return letterStr.split(",");
            }
            /**生成一个随机数**/
            function randomNum(min, max) {
                return Math.floor(Math.random() * (max - min) + min);
            }
            /**生成一个随机色**/
            function randomColor(min, max) {
                var r = randomNum(min, max);
                var g = randomNum(min, max);
                var b = randomNum(min, max);
                return "rgb(" + r + "," + g + "," + b + ")";
            }
            window.GVerify = GVerify;
        })(window, document);

        var verifyCode = new GVerify("v_container");
        var code_input = document.getElementById("code_input");
        code_input.onblur = function () {
            var res = verifyCode.validate(code_input.value);
            if (res) {
                alert("验证正确");
            } else {
                alert("验证码错误");
            }
        }
    </script> -->
    <c:if test="${warn == 1}">
        <c:out value="没有权限，请先登录！"></c:out>
    </c:if>
    <script>
        function login_new() {

            var username = $("#username").val();
            var password = $("#password").val();
            var param = {};
            param.username = username;
            param.password = password;
            $.ajax({
                url: "http://localhost:8080/replace",
                data: JSON.stringify(param),
                type: "POST",
                dataType: 'json',
                contentType: 'application/json',
                success: function (data) // data后台给前台的数据
                {
                    if (data.msg == "success") {
                        window.location.href = '/home';
                    } else if (data.msg == "fail") {
                        alert("用户名或密码错误！");
                    } else if (data.msg == "admin") {
                        window.location.href = '/admin';
                    }
                },
                error: function (data) {
                    alert("出错：" + data.code);
                },
            });
        }
    </script>
    <script>
        function regist_new() {
            window.location.href = "/regist";
        }
    </script>
</body>
</html>
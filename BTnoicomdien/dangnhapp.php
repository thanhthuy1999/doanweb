<?php
//Khai báo sử dụng session
session_start();
 
//Khai báo utf-8 để hiển thị được tiếng việt
header('Content-Type: text/html; charset=UTF-8');
 
//Xử lý đăng nhập
if (isset($_POST['webqlncd'])) 
{
    //Kết nối tới database
    include('ketnoi.php');
     
    //Lấy dữ liệu nhập vào
    $username = addslashes($_POST['username']);
    $password = addslashes($_POST['password']);
     
    //Kiểm tra đã nhập đủ tên đăng nhập với mật khẩu chưa
    if (!$username || !$password) {
        echo "Vui lòng nhập đầy đủ tên đăng nhập và mật khẩu. <a href='javascript: history.go(-1)'>Trở lại</a>";
        exit;
    }
     
    $sql_up = "SELECT username, password FROM taikhoan WHERE username='$username'";
    //Kiểm tra tên đăng nhập có tồn tại không
    $query = mysqli_query($con,$sql_up);
    if (mysqli_num_rows($query) == 0) {
        echo "Tên đăng nhập này không tồn tại. Vui lòng kiểm tra lại. <a href='javascript: history.go(-1)'>Trở lại</a>";
        exit;
    }
     
    //Lấy mật khẩu trong database ra
    $row = mysqli_fetch_array($query);
     
    //So sánh 2 mật khẩu có trùng khớp hay không
    if ($password != $row['password']) {
        echo "Mật khẩu không đúng. Vui lòng nhập lại. <a href='javascript: history.go(-1)'>Trở lại</a>";
        exit;
    }
     
    //Lưu tên đăng nhập
    $_SESSION['username'] = $username;
    
    echo "Xin chào " . $username . ". Bạn đã đăng nhập thành công. <a href='trangchucd.php'>Về trang chủ</a>";
    die();
}
?>


<!DOCTYPE html>
<html>
    <head>
        <title>  </title>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="./trangchucd.css"/>
        <link rel="stylesheet" type="text/css" href="./dangnhapp.css">
        <link rel="stylesheet" type="text/css" href="./fontawesome/css/all.css">
        <script src='https://cdn.jsdelivr.net/g/lodash@4(lodash.min.js+lodash.fp.min.js)'></script>
        <script src="./trangchu.js"></script>

    </head>
    <body>
        <form action='dangnhapp.php' method='POST'>
        <div id ="header">
           
            <div class="form-search">
                <input type="text" class="keyword" placeholder="Search" autocomplete="off"/>
                <div class="topbar-btn">
                    <a href="#" class="topbar-iconsearch">
                        <i class="fa fa-search"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <p>Bạn vui lòng đăng nhập để tiếp tục đăng nhập web nồi cơm</p>
    <div class="sign-in">
        <div class="col-md-6">
            <span><a>Tên đăng nhập: </a>
                <span class="input">
                    <br>
                    <input type="text" name="username" id="user" size="60" aria-required="true" aria-invalid="false" placeholder="Vui lòng nhập tên đăng nhập">
                    <span id="user-erro" class="erro"></span>
                </span>
            </span>
        </div>
        <br>
        <div class="col-md-6">
            <span><a>Mật khẩu: </a>
                <span class="input">
                    <br>
                    <input type="password" name="password" id="pass" pattern=".{6,}" size="60" aria-required="true" aria-invalid="false" placeholder="Vui lòng nhập mật khẩu">
                    <span id="pass-erro" class="erro"></span>
                </span>
            </span>
        </div>
        <br>
        <div class="button">
            <input onclick="save()" name="webqlncd" type="submit"  value="Đăng nhập"/>
            <a href='http://localhost:8080/btweb/BTnoicomdien/dangky.php' title='Đăng ký'>Đăng ký tại đây!</a>
        </div>
    </div>
</form>
</body>
</html>
 
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div>
    <ul class="nav justify-content-center">
        <li class="nav-item">
            <a class="nav-link active" href="javascript:void(0);" onclick="loadContent('/trang-chu', 'Trang chủ')">Trang chủ</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="javascript:void(0);" onclick="loadContent('/nhan-vien', 'Nhân viên')">Nhân viên</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="javascript:void(0);" onclick="loadContent('/phong/home', 'Phòng')">Phòng</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="javascript:void(0);" onclick="loadContent('/tien-nghi/home', 'Tiện nghi')">Tiện nghi</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="javascript:void(0);" onclick="loadContent('/khach-hang', 'Khách hàng')">Khách hàng</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="javascript:void(0);" onclick="loadContent('/chi-tiet-hoa-don', 'Chi tiết hóa đơn')">Chi tiết hóa đơn</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="javascript:void(0);" onclick="loadContent('/tai-khoan', 'Tài khoản')">Tài khoản</a>
        </li>
    </ul>
</div>

<div id="content">
    <!-- Nội dung sẽ được tải về và hiển thị ở đây -->
</div>

<script>
    // Hàm tải nội dung và cập nhật URL
    function loadContent(url, title) {
        $.ajax({
            url: url,
            method: 'GET',
            success: function(data) {
                $('#content').html(data);

                // Cập nhật URL và trạng thái lịch sử
                history.pushState({path: url, title: title}, title, url);
                document.title = title; // Cập nhật tiêu đề của trang
            },
            error: function() {
                alert('Đã có lỗi xảy ra khi tải nội dung!');
            }
        });
    }

    // Xử lý sự kiện khi người dùng sử dụng nút Back/Forward của trình duyệt
    window.onpopstate = function(event) {
        if (event.state) {
            // Tải lại nội dung dựa trên trạng thái lịch sử
            $.ajax({
                url: event.state.path,
                method: 'GET',
                success: function(data) {
                    $('#content').html(data);
                    document.title = event.state.title; // Cập nhật tiêu đề của trang
                },
                error: function() {
                    alert('Đã có lỗi xảy ra khi tải nội dung!');
                }
            });
        }
    };

    // Tải nội dung của trang ban đầu khi trang được tải
    $(document).ready(function() {
        // Giữ phần nav bar không bị thay đổi
        var initialUrl = window.location.pathname;
        if (initialUrl) {
            $.ajax({
                url: initialUrl,
                method: 'GET',
                success: function(data) {
                    $('#content').html(data);
                    document.title = 'Trang chủ'; // Cập nhật tiêu đề mặc định
                },
                error: function() {
                    alert('Đã có lỗi xảy ra khi tải nội dung!');
                }
            });
        }
    });
</script>

</body>
</html>

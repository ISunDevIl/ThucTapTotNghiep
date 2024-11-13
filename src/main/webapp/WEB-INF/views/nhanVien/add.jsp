<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Nhân viên</title>
</head>
<body class="container">
<h2 class="text-center">Thêm nhân viên</h2>
<form action="/nhan-vien/add" method="post">
    <div class="mb-3">
        <span>Mã nhân viên:</span>
        <input type="text" class="form-control" name="maNhanVien">
    </div>
    <div class="mb-3">
        <span>Họ và tên:</span>
        <input type="text" class="form-control" name="hoTen">
    </div>
    <div class="mb-3">
        <span>Ngày sinh:</span>
        <input type="date" class="form-control" name="ngaySinh">
    </div>
    <div class="mb-3">
        <span>Giới tính:</span>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="gioiTinh" value="Nam">
            <label class="form-check-label">Nam</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="gioiTinh" value="Nữ">
            <label class="form-check-label">Nữ</label>
        </div>
    </div>
    <div class="mb-3">
        <span>Địa chỉ:</span>
        <input type="text" class="form-control" name="diaChi">
    </div>
    <div class="mb-3">
        <span>Số điện thoại:</span>
        <input type="text" class="form-control" name="sdt">
    </div>
    <div class="mb-3">
        <span>Email:</span>
        <input type="text" class="form-control" name="email">
    </div>
    <div class="mb-3">
        <span>Chức vụ:</span>
        <input type="text" class="form-control" name="chucVu">
    </div>
    <div class="mb-3">
        <span>Trạng thái:</span>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="trangThai" value="Hoạt động">
            <label class="form-check-label">Hoạt động</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="trangThai" value="Ngừng hoạt động">
            <label class="form-check-label">Ngừng hoạt động</label>
        </div>
    </div>
    <div>
        <button class="btn btn-success">Thêm nhân viên</button>
    </div>
</form>

</body>
</html>
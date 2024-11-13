<!doctype html>
<html lang="en" >
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Dịch vụ</title>
</head>
<body>
<div style="flex: 1">


<form action="/tien-nghi/add" method="post">
    <form action="/tien-nghi/update" method="post">
        <div class="mb-3">
            <label>ID:</label>
            <input type="text" class="form-control" name="id" value="${TienNghi.id}" readonly>
        </div>
        <div class="mb-3">
            <label>Mã tiện nghi:</label>
            <input type="text" class="form-control" name="maTienNghi" value="${TienNghi.maTienNghi}">
        </div>

        <div class="mb-3">
            <label>Tên tiện nghi:</label>
            <input type="text" class="form-control" name="tenTienNghi" value="${TienNghi.tenTienNghi}">
        </div>

        <div class="mb-3">
            <label>Số lượng tồn:</label>
            <input type="text" class="form-control" name="soLuongTon" value="${TienNghi.soLuongTon}">
        </div>

        <div class="mb-3">
            <label>Đơn giá:</label>
            <input type="number" class="form-control" name="donGia" value="${TienNghi.donGia}">
        </div>

        <div class="mb-3">
            <label class="form-label">Trạng thái:</label>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="trangThai" id="Active" value="Hoạt động"
                       checked  ${TienNghi.trangThai == 'Hoạt động' ? 'checked' : ''}>
                <label class="form-check-label">Hoạt động</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="trangThai" id="Inactive"
                       value="Ngừng hoạt động" ${TienNghi.trangThai == 'Ngừng hoạt động' ? 'checked' : ''}>
                <label class="form-check-label">Ngừng hoạt động</label>
            </div>
        </div>

        <button type="submit" class="btn btn-success">Lưu</button>
    </form>
</form><br>
<label class="form-check-label">Lọc theo đơn giá</label>
<div class="input-group mb-3 ">
    <span class="input-group-text">Từ</span>
    <input type="text" class="form-control" id="dg1">
    <span class="input-group-text">Đến</span>
    <input type="text" class="form-control" id="dg2">
</div>
<a href="/tien-nghi/filter?dg1=${dg1}?dg2=${dg2}" id="filter-btn" class="btn btn-success">Lọc</a>
<div class="col-md-3 m-3">
<%--    <form class="d-flex" action="/tien-nghi/search" method="Get">&ndash;%&gt;--%>
<%--        <input class="form-control me-2" type="search" id="keyword" name="keyword" placeholder="Tìm kiếm" aria-label="Search">--%>
<%--        <a class="btn btn-outline-success" id="search-btn" >Tìm kiếm</a>--%>
<%--      <button class="btn btn-outline-success" id="search-btn" type="submit" onclick="timkiem()">Tìm kiếm</button>&ndash;%&gt;--%>
<%--    </form>&ndash;%&gt;--%>
    <form class="d-flex" id="search-form" method="get">
        <input class="form-control me-2" type="search" id="keyword" name="keyword" placeholder="Tìm kiếm" aria-label="Search">
        <button class="btn btn-outline-success" id="search-btn" type="button" >Tìm kiếm</button>
    </form>
</div>

<table class="table">
    <thead>
    <tr>
        <th>STT</th>
        <th>ID</th>
        <th>Mã</th>
        <th>Tên tiện nghi</th>
        <th>Số lượng tồn</th>
        <th>Đơn giá</th>
        <th>Trạng thái</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody id="resultsTable" th:fragment="resultsTable">
    <c:forEach items="${listTienNghi}" var="s" varStatus="i">
        <tr>
            <td>${i.index+1}</td>
            <td>${s.id}</td>
            <td>${s.maTienNghi}</td>
            <td>${s.tenTienNghi}</td>
            <td>${s.soLuongTon}</td>
            <td>${s.donGia}</td>
            <td>${s.trangThai}</td>
            <td>
                <a href="/tien-nghi/detail?id=${s.id}" class="btn btn-success">Chi tiết</a>
                <a href="/tien-nghi/delete?id=${s.id}" class="btn btn-danger">Xóa</a>
                <a href="/tien-nghi/update-status?id=${s.id}" class="btn btn-warning">Ngưng hoạt động</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
<script>
    document.getElementById('filter-btn').addEventListener('click', function (event) {
        const dg1 = document.getElementById('dg1').value;
        const dg2 = document.getElementById('dg2').value;
        const url = '/tien-nghi/filter?dg1=' + encodeURIComponent(dg1) + '&dg2=' + encodeURIComponent(dg2);
        this.href = url;
    });



    document.getElementById('search-btn').addEventListener('click', function (event) {
        event.preventDefault(); // Ngăn chặn hành động mặc định (nếu là thẻ <a>)

        const keyword = document.getElementById('keyword').value;
        const xhr = new XMLHttpRequest();

        // Gửi yêu cầu GET đến máy chủ với tham số tìm kiếm
        xhr.open('GET', '/tien-nghi/search?keyword=' + encodeURIComponent(keyword), true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                const parser = new DOMParser();
                const doc = parser.parseFromString(xhr.responseText, 'text/html');

                // Lấy ra phần tbody từ toàn bộ trang trả về
                const newTbody = doc.querySelector('#resultsTable').innerHTML;

                // Cập nhật nội dung của tbody bằng nội dung mới
                document.querySelector('#resultsTable').innerHTML = newTbody;


                // Thay đổi URL mà không tải lại trang
                history.pushState(null, null, '/tien-nghi/search?keyword=' + encodeURIComponent(keyword));
            }
        };
        xhr.send();
    });




</script>
</body>
</html>
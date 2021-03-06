<%-- 
    Document   : add-product
    Created on : Oct 7, 2021, 6:19:27 AM
    Author     : DucAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/common.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <c:if test="${product eq null}">
            <title>Thêm sản phẩm</title>
        </c:if>
        <c:if test="${product ne null}">
            <title>Sửa sản phẩm</title>
        </c:if>

    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div id="main-contain" class="container" style="margin-top: 20px;">
            <div class="row">
                <c:if test="${product eq null}">
                    <h2 class="title text-center" style="margin-top: .7rem;">Thêm sản phẩm</h2>
                    <form action="productservices?service=add" method="POST" enctype="multipart/form-data">
                    </c:if>
                    <c:if test="${product ne null}">
                        <h2 class="title text-center" style="margin-top: .7rem;">Sửa sản phẩm</h2>
                        <form action="productservices?service=update&id=${product.id}" method="POST" enctype="multipart/form-data">
                        </c:if>
                        <p style="text-align: center;">${message}</p>
                        <div class="col-md-6">
                            <div class="img mg-top-15">
                                <label>Photo : ${product.image}</label>
                                <input type="text" name="img_url" value="${product.image}" hidden="">
                                <c:if test="${product ne null}">
                                    <img src="image/${product.image}" width="500" height="500" alt="Lỗi link hình ảnh">
                                </c:if>

                                <input type="file" class="form-control" name="image" placeholder="Enter Image" <c:if test="${product eq null}"> required=""</c:if>>
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-5" style="margin-top: 30px">
                                <table style="border-spacing: .5em; border-collapse: separate">
                                    <tr style="height: 40px">
                                        <th>Tên sản phẩm: &nbsp;</th>
                                        <td><input type="text" maxlength="30" name="name" placeholder="Nhập tên sản phẩm" value="${product.name}" required="" class="form-control"></td>
                                </tr>               
                                <tr style="height: 40px">
                                    <th>Giá: </th>
                                    <td><input type="number" min="1" name="price" placeholder="Nhập giá" value="${product.price}" required="" class="form-control"></td>
                                </tr>
                                <c:if test="${product ne null}">
                                    <tr style="height: 40px">
                                        <th>Số lượng sản phẩm hiện có: </th>
                                        <td><input name="oldQuantity" value="${product.quantity}" hidden=""><b>&nbsp&nbsp${product.quantity}</b></td>
                                    </tr>
                                    <tr style="height: 40px">
                                    <th>Thêm/Bớt sản phẩm: </th>
                                    <td><input type="number" min="-${product.quantity}" name="quantity" placeholder="Nhập số lượng" value="0" required="" class="form-control"></td>
                                </tr>
                                </c:if>
                                <c:if test="${product eq null}">
                                <tr style="height: 40px">
                                    <th>Số lượng sản phẩm: </th>
                                    <td><input type="number" min="0" name="quantity" placeholder="Nhập số lượng" value="0" required="" class="form-control"></td>
                                </tr>
                                </c:if>
                                <tr style="height: 40px">
                                    <th>Danh mục: </th>
                                    <td>
                                        <select name="category_id" required="" class="form-control">
                                            <c:forEach items="${listCategory}" var="c">
                                                <option value="${c.id}" <c:if test="${c.id == product.category_id}">selected=""</c:if>>${c.category}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr style="height: 40px">
                                    <th>Mô tả: </th>
                                    <td><textarea name="description" placeholder="Nhập mô tả" required="" rows="3" cols="30" class="form-control">${product.description}</textarea></td>
                                </tr>
                                <tr style="height: 40px">
                                    <th>Ghi chú: </th>
                                    <td><textarea name="note" placeholder="Nhập ghi chú" rows="1" cols="30" class="form-control">${product.note}</textarea></td>
                                </tr>
                            </table>

                            <c:if test="${product eq null}">
                                <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Thêm sản phẩm</button></div>
                            </c:if>
                            <c:if test="${product ne null}">
                                <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Sửa sản phẩm</button></div>
                            </c:if>
                    </form>
            </div>
        </div>
    </div>
</body>
</html>

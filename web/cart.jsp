<%-- 
    Document   : cart
    Created on : Oct 1, 2021, 10:24:17 PM
    Author     : SANG
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="entity.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Giỏ hàng</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
    </head><!--/head-->

    <body>
        <jsp:include page="header.jsp"/>
        <section id="cart_items">
            <div class="container">
                <div class="breadcrumbs">
                    <ol class="breadcrumb">
                        <li><a href="home">Trang chủ</a></li>
                        <li class="active">Giỏ hàng</li>
                    </ol>
                </div>
                <div class="table-responsive cart_info">
                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Sản phẩm</td>
                                <td class="price">Đơn giá</td>
                                <td class="quantity">Số lượng</td>
                                <td class="total">Số tiền</td>
                                <td>Thao tác</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listCart}" var="l">
                                <tr>
                                    <td class="cart_description">
                                        <h4><a href="productservices?service=details&id=${l.productId}">${l.name}</a></h4>
                                    </td>
                                    <td class="cart_price">
                                        <fmt:formatNumber type="number" value="${l.unitPrice}"/><sup>đ</sup>
                                    </td>
                                    <td class="cart_quantity">
                                        <div class="cart_quantity_button">
                                            <a class="cart_quantity_down" href="calculatorservice?service=1&id=${l.productId}">-</a>
                                            <input class="cart_quantity_input" type="text" name="quantity" value="${l.quantity}" autocomplete="off" size="2">
                                            <a class="cart_quantity_up" href="calculatorservice?service=2&id=${l.productId}"> + </a>
                                        </div>
                                    </td>
                                    <td class="cart_total">
                                        <p class="cart_total_price">
                                            <fmt:formatNumber type="number" value="${l.unitPrice * l.quantity}"/><sup>đ</sup>
                                        </p>
                                    </td>
                                    <td class="cart_delete">
                                        <a class="cart_quantity_delete" href="calculatorservice?service=0&id=${l.productId}"><i class="fa fa-times"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </section> <!--/#cart_items-->

        <section id="do_action">
            <div class="container">
                <div class="heading">
                    <h3>Thanh toán các mặt hàng trong giỏ</h3>
                    <p>Vui lòng điền đầy đủ các thông tin bên dưới để xác nhận đơn hàng, xin cảm ơn!</p>
                </div>
                <div class="row">
                    <form action="checkout" method="post">
                        <div class="col-sm-6">
                            <div class="total_area">
                                <div class="form-group" required style="margin-left: 1rem;">
                                    <label>Tên người nhận</label>
                                    <input name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group" required style="margin-left: 1rem;">
                                    <label>Số điện thoại người nhận</label>
                                    <input name="phone" type="text" class="form-control" required>
                                </div>
                                <div class="form-group" style="margin-left: 1rem;">
                                    <label>Địa chỉ nhận hàng</label>
                                    <input name="address" type="text" class="form-control" required>
                                </div>
                                <div class="form-group" required style="margin-left: 1rem;">
                                    <label>Email người nhận</label>
                                    <input name="email" type="text" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="total_area" >
                                 <div class="form-group" style="margin-left: 1rem;">
                                    <label>Tổng tiền hàng</label>
                                    <input name="totalprice" type="text" class="form-control" readonly="">
                                </div>
                                <div class="form-group" style="margin-left: 1rem;">
                                    <label>Phí vận chuyển</label>
                                    <input name="ship" type="text" class="form-control" placeholder="50,000" readonly="" required >
                                </div>
                                <div class="form-group" style="margin-left: 1rem;">
                                    <label>Tổng số tiền của đơn hàng</label>
                                    <input name="totalpays" type="text" class="form-control" readonly="">
                                </div>
                                <div class="form-group" style="margin-left: 1rem;">
                                    <label>Hình thức thanh toán</label>
                                    <select name="payments">
                                        <option>Trả tiền khi nhận được hàng</option>
                                        <option selected="">Chuyển khoản ngay</option>
                                    </select>
                                </div>
                            </div>
                            <a class="btn btn-default check_out" href=""style="margin-top: 2px; float: right;">Check Out</a>
                        </div>
                    </form>
                </div>
            </div>
        </section><!--/#do_action-->
        <jsp:include page="footer.jsp"/>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<thead>
  <tr >
    <th scope="col" class="dt1">
      <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
    </th>
    <th scope="col">주문번호</th>
    <th scope="col">카테고리</th>
    <th scope="col">펀딩제목</th>
    <th scope="col">주문자</th>
    <th scope="col">결제일</th>
    <th scope="col">택배사</th>
    <th scope="col">운송장 번호</th>

  </tr>
</thead>
<tbody>
<c:if test="${!empty orderList}">
  <c:forEach var="o" items="${orderList}">
      <tr>
          <th scope="row">
            <input class="tList" type="checkbox" value="${o.paymentNo}">
          </th>

          <td>${o.paymentNo}</td>
          <td>${o.fundingCategory}</td>
          
          <td>
            <a href="../detail/${o.paymentNo}">${o.fundingTitle}</a>
          </td>

          <td>${o.recipient}</td>
          <td>${o.payDate}</td>
          
          <td class="parcel">
            <select class="form-select" class="parcelCompany" name="parcelCompany" aria-label="Default select example">
              <option value="CJ대한통운">CJ대한통운</option>
              <option value="롯데택배">롯데택배</option>
              <option value="우체국택배">우체국택배</option>
            </select>
          </td>
          
          <td class="parcel"><input type="text" value="" class="parcelNo" name="parcelNo"></td>

      </tr>
  </c:forEach>
</c:if>
<c:if test="${empty orderList}">
<tr>
<td colspan="8"><h2>배송 준비 중인 주문건이 없습니다.</h2></td>
<tr>
</c:if>
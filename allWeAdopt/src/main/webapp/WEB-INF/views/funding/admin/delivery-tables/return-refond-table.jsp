<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<thead>
<tr>
<th scope="col" class="dt1">
  
</th>
<th scope="col" class="dt2">주문번호</th>
<th scope="col" class="dt3">카테고리</th>
<th scope="col" class="dt4">펀딩제목</th>
<th scope="col" class="dt5">주문자</th>
<th scope="col" class="dt6">주문상태</th>
<th scope="col">결제일</th>
<%-- <th scope="col">사유 입력</th> --%>
</tr>
</thead>
<tbody id="tbody">

<c:if test="${!empty orderList}">
  <c:forEach var="o" items="${orderList}">
      <tr>
          <th scope="row">
            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="${o.paymentNo}">
          </th>

          <td>${o.paymentNo}</td>
          <td>${o.fundingCategory}</td>
          
          <td>
            <a href="../detail/${o.paymentNo}">
              ${o.fundingTitle}
            </a>
          </td>

          <td>${o.recipient}</td>
          <td>${o.orderState}</td>
          <td>${o.payDate}</td>
        
    <%--       <td><button type="button" class="inputReason btn btn-light" onclick="opneInputArea(this)">사유 입력</button></td>         --%>
      </tr>
  </c:forEach>
</c:if>

<c:if test="${empty orderList}">
<tr>
<td colspan="8"><h2>주문건이 없습니다.</h2></td>
<tr>
</c:if><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<thead>
<tr>
<th scope="col" class="dt1">
  
</th>
<th scope="col" class="dt2">주문번호</th>
<th scope="col" class="dt3">카테고리</th>
<th scope="col" class="dt4">펀딩제목</th>
<th scope="col" class="dt5">주문자</th>
<th scope="col" class="dt6">주문상태</th>
<th scope="col">결제일</th>
<%-- <th scope="col">사유 입력</th> --%>
</tr>
</thead>
<tbody id="tbody">

<c:if test="${!empty orderList}">
  <c:forEach var="o" items="${orderList}">
      <tr>
          <th scope="row">
            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="${o.paymentNo}">
          </th>

          <td>${o.paymentNo}</td>
          <td>${o.fundingCategory}</td>
          
          <td>
            <a href="../detail/${o.paymentNo}">
              ${o.fundingTitle}
            </a>
          </td>

          <td>${o.recipient}</td>
          <td>${o.orderState}</td>
          <td>${o.payDate}</td>
        
    <%--       <td><button type="button" class="inputReason btn btn-light" onclick="opneInputArea(this)">사유 입력</button></td>         --%>
      </tr>
  </c:forEach>
</c:if>

<c:if test="${empty orderList}">
<tr>
<td colspan="8"><h2>주문건이 없습니다.</h2></td>
<tr>
</c:if>
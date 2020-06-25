<!-- ���̵�� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "./resources/css/bootstrap.min.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	body{
  		background-color: #333333;
  	}
  	
  	#page-wrapper {
    padding-left: 250px;
  }
  
  #sidebar-wrapper {
    position: fixed;
    width: 200px;
    height: 100%;
    margin-left: -250px;
    background: #82FA58;
    overflow-x: hidden;
    overflow-y: auto;
  }
  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
  }
  /* ���̵�� ��Ÿ�� */
  
  .sidebar-nav {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: #999;
  }
  
  .sidebar-nav li a:hover {
    color: #fff;
    background: rgba(255, 255, 255, 0.2);
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }
</style>

</head>
<body>
<div id="page-wrapper">
  <!-- ���̵�� -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav ">
      <li class="sidebar-brand">
        <h3>�޴�</h3>
      </li>
      <li><a href="./main.jsp" style="color:black;">���� ȭ��</a></li>
      <li><a href="#" style="color:black;">���� ���</a></li>
      <li><a href="./gamestart.jsp" style="color:black;">���� ����</a></li>
      <li><a href="./rank.jsp" style="color:black;">�ְ� ����</a></li>
    </ul>
  </div>
</div>
</body>
</html>
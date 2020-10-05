<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
		  div.item img{
		    width:100%;
			height:100%;
			position: relative;
			  top: -280px;
		   }
		  div#carousel-example-generic{
		    	width:100%;
			  	height: 420px;
		   		margin:0 auto;
			  	position: relative;
			  	overflow: hidden;

  }
</style>
    </head>
    <body>
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="2000">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="5"></li>
		  </ol>
		  <div class="carousel-inner" role="listbox">
		    <div class="item active">
		      <img src="${pageContext.request.contextPath}/images/1.jpeg" >
		    </div>
		    
		    <div class="item">
		            <img src="${pageContext.request.contextPath}/images/2.jpeg" >
		    </div>
		    
		    <div class="item">
		            <img src="${pageContext.request.contextPath}/images/3.jpeg" >
		    </div>
		
		    <div class="item">
		            <img src="${pageContext.request.contextPath}/images/4.jpeg" >
		    </div>
		    
		 	<div class="item">
		            <img src="${pageContext.request.contextPath}/images/5.jpeg" >
		    </div>
		    
		     <div class="item">
		            <img src="${pageContext.request.contextPath}/images/6.jpeg" >
		    </div>
		  </div>
		</div>

 	</body>
</html>
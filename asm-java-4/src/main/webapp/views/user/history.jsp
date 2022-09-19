<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ztube</title>
    <%@include file="/common/head.jsp" %>

<!--

TemplateMo 552 Video Catalog

https://templatemo.com/tm-552-video-catalog

-->
</head>

<body>
  <%@include file="/common/header.jsp" %>

        <div class="container-fluid">
            <div id="content" class="mx-auto tm-content-container">
                <main>
                    <div class="row">
                        <div class="col-12">
                            <h2 class="tm-page-title mb-4">Lịch sữ xem </h2>
                               
                        </div>
                    </div>
                    
                    <div class="row tm-catalog-item-list">
                  	<c:forEach items="${videos}" var="video">
                        <div class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
                       
                             <div class="position-relative tm-thumbnail-container">
                                <img src="<c:url value='${video.poster}'/>" alt="Image" class="img-fluid tm-catalog-item-img"/>    
                                <figcaption>
                                <a href="<c:url value='/video?action=watch&id=${video.href}' />" class="position-absolute tm-img-overlay">
                                    <i class="fas fa-play tm-overlay-icon"></i>
                                </a>
                                </figcaption>
                            </div>
                            <div class="p-4 tm-bg-gray tm-catalog-item-description">
                                <h3 class="tm-text-primary mb-3 tm-catalog-item-title">${video.title}</h3>
                                <p class="tm-catalog-item-text">${video.description} 
                                </p>   
                                    <span class="tm-text-secondary">${video.shares} shares</span>
                          			 <span class="tm-text-secondary">${video.views} views</span>
                            		
                            </div>
                               
                        </div>
                     </c:forEach> 
              
                      
                    </div>

                    <!-- Catalog Paging Buttons -->
                    <div class = "row">
                   
                    <c:if test="${currentPage == 1 }">
                       <a href="#" class="nav-link tm-paging-link disabled"> Pre </a>
                    
                    </c:if>   
                   	<c:if test="${currentPage > 1 }">
                   	   <a href="index?page=${currentPage - 1}" class="nav-link tm-paging-link"> Pre </a>
                   	
                   	</c:if>
                                     
                        <div class="nav tm-paging-links">
                        
                        	<c:forEach varStatus = "i" begin = "1" end = "${maxPage}">
                            <a href="index?page=${i.index}" class="nav-link tm-paging-link ${currentPage == i.index ? 'active': '' }">${i.index}</a>
                            </c:forEach>
                        </div>
                    <c:if test="${currentPage == maxPage }">
                       <a href="#" class="nav-link tm-paging-link disabled"> >> </a>
                    
                    </c:if>   
                   	<c:if test="${currentPage < maxPage }">
                   	   <a href="index?page=${currentPage + 1}" class="nav-link tm-paging-link"> >> </a>
                   	
                   	</c:if>
                        
                    </div>
                </main>

                <!-- Subscribe form and footer links -->
               <%@include file="/common/footer.jsp" %>
</body>

</html>
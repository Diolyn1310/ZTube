<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${video.title}</title>
    <%@include file="/common/head.jsp" %>

<!--

TemplateMo 552 Video Catalog

https://templatemo.com/tm-552-video-catalog

-->
</head>

<body>
  <%@include file="/common/header.jsp" %>

        <div class="container-fluid">
			<div class="mx-auto tm-content-container">
				<main>
					<div class="row mb-5 pb-4">
						<div class="col-12">
							<iframe id="tm-video" src="https://www.youtube.com/embed/${video.href}"
							style="height:500px; margin-bottom: 15px"></iframe>
						
							<!-- Video player 1422x800 -->
							<<!--  <video width="1422" height="800" controls autoplay>
							
							  <source src="<c:url value= '/templates/user/video/wheat-field.mp4" type="video/mp4"'/>">							  
							
							</video> -->
						</div>
						
					</div>
					<div class="row mb-5 pb-5">
						<div class="col-xl-8 col-lg-7">
							<!-- Video description -->
							<div class="tm-video-description-box">
								<h2 class="mb-5 tm-video-title">${video.title}</h2>
								
								<p class="mb-4">${video.description}</p>	
							</div>							
						</div>
						<div class="col-xl-4 col-lg-5">
							<!-- Share box -->
							<div class="tm-bg-gray tm-share-box">
								<h6 class="tm-share-box-title mb-4">Share this video</h6>
								<div class="mb-5 d-flex">
									<a href="" class="tm-bg-white tm-share-button"><i class="fab fa-facebook"></i></a>
									<a href="" class="tm-bg-white tm-share-button"><i class="fab fa-twitter"></i></a>
									<a href="" class="tm-bg-white tm-share-button"><i class="fab fa-pinterest"></i></a>
									<a href="" class="tm-bg-white tm-share-button"><i class="far fa-envelope"></i></a>
								</div>
								<c:if test="${not empty sessionScope.currentUser }">
									<button href="<c:url value='/video?action=like&id=${video.href}'/>" id="likeOrUnlikeBtn" class="btn btn-outline-danger">
								 	<c:choose>
								 		<c:when test = "${flagLikedBtn == true }">
								 		<i class="fas fa-heart mr-3 tm-liked-icon"></i>
										<i class="far fa-heart mr-3 tm-not-liked-icon"></i>
										<span id="tm-likes-count">486 likes</span>

								 		</c:when>
								 		<c:otherwise>
								 		<span>Unlike</span>
								 		
										</c:otherwise>
								 	</c:choose>
								</button>
								</c:if>
								<p class="mb-4"> Thêm vào danh sách yêu thích </p>
								
								<div>
									<button class="btn btn-primary p-0 tm-btn-animate tm-btn-download tm-icon-download"><span>Download Video</span></button>	
								</div>
								<input id="videoIdHdn" type="hidden" value="${video.href}" />								
							</div>
						</div>
					</div>
					
				

                <!-- Subscribe form and footer links -->
               <%@include file="/common/footer.jsp" %>
         <script>
         	$('#likeOrUnlikeBtn').click(function(){
         		var videoId = $('#videoIdHdn').val();
         		$.ajax({
         			
         			url: 'video?action=like&id=' +videoId 
         		}).then(function(data){
         			var text = $('#likeOrUnlikeBtn').text();	
         			if(text.indexOf('Like') != -1){
         				$('#likeOrUnlikeBtn').text('Unlike');	
         			}else{
         				$('#likeOrUnlikeBtn').text('Like');	
         			}
         				
         		}).fail(function(error){
         			alert('Please try again	');
         		});
         		
         	});
         
         </script>
</body>

</html>
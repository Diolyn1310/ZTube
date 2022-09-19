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

        <div class="container-fluid px-0">
				<div class="mx-auto tm-content-container">					
					<div class="row mt-3 mb-5 pb-3">
						<div class="col-12">
							<div class="mx-auto tm-about-text-container px-3">
								<h2 class="tm-page-title mb-4 tm-text-primary">Đăng nhập để được xem miễn phí</h2>
     							</div>							
						</div>						
					</div>
                    <div class="mx-auto pb-3 tm-about-text-container px-3">
                        <div class="row">
                            <div class="col-lg-6 mb-5">
                                <form id="login-form" action="login" method="POST" class="tm-contact-form">
                                  <div class="form-group">
                                    <input type="text" name="username" class="form-control rounded-0" placeholder="Userame" required="" />
                                  </div>
                                  <div class="form-group">
                                    <input type="password" name="password" class="form-control rounded-0" placeholder="Password" required="" />
                                  </div>

                                  <div class="form-group mb-0">
                                    <button type="submit" class="btn btn-primary rounded-0 d-block ml-auto mr-0 tm-btn-animate tm-btn-submit tm-icon-submit"><span>Đăng nhập</span></button>
                                  </div>
                                </form>    
                            </div>
                            <div class="col-lg-6">
                                <div class="mapouter mb-60">
                                    <div class="gmap_canvas">
                                        <iframe width="100%" height="520" id="gmap_canvas"
                                            src="https://maps.google.com/maps?q=Av.+L%C3%BAcio+Costa,+Rio+de+Janeiro+-+RJ,+Brazil&t=&z=13&ie=UTF8&iwloc=&output=embed"
                                            frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                                    </div>
                                </div>
                            </div>
                        </div>  
                    </div>                                      			
				</div>
				<div class="parallax-window parallax-window-2" data-parallax="scroll" data-image>
				<img src="<c:url value="/templates/user/img/contact-2.jpg"/>">
				</div>
				
                <!-- Subscribe form and footer links -->
               <%@include file="/common/footer.jsp" %>
</body>

</html>
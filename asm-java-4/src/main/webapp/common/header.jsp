	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="tm-page-wrap mx-auto">
        <div class="position-relative">
            <div class="position-absolute tm-site-header">
                <div class="container-fluid position-relative">
                    <div class="row">
                        <div class="col-7 col-md-4">
                            <a href="<c:url value='/index'/>" class="tm-bg-black text-center tm-logo-container">
                                <i class="fas fa-video tm-site-logo mb-1"></i>
                                <h1 class="tm-site-name">Ztube</h1>
                            </a>
                        </div>
                        <div class="col-5 col-md-8 ml-auto mr-0">
                            <div class="tm-site-nav">
                                <nav class="navbar navbar-expand-lg mr-0 ml-auto" id="tm-main-nav">
                                    <button class="navbar-toggler tm-bg-black py-2 px-3 mr-0 ml-auto collapsed" type="button"
                                        data-toggle="collapse" data-target="#navbar-nav" aria-controls="navbar-nav"
                                        aria-expanded="false" aria-label="Toggle navigation">
                                        <span>
                                            <i class="fas fa-bars tm-menu-closed-icon"></i>
                                            <i class="fas fa-times tm-menu-opened-icon"></i>
                                        </span>
                                    </button>
                                    <div class="collapse navbar-collapse tm-nav" id="navbar-nav">
                                        <ul class="navbar-nav">
                                        <c:choose>
                                        	<c:when test= "${not empty sessionScope.currentUser}">
                                        	<li class="nav-item active">
                                                <a class="nav-link tm-nav-link active" 
                                                data-toggle="modal" data-target="#changePassModal">
                                      
                                              Chào, ${sessionScope.currentUser.username}</a>
                                            </li>
                                             <li class="nav-item">
                                                <a class="nav-link tm-nav-link" href="favorites">Yêu thích</a>
                                            </li>
                                             <li class="nav-item">
                                                <a class="nav-link tm-nav-link" href="history">Lịch sử</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link tm-nav-link" href="logout">Đăng xuất</a>
                                            </li>
                                        	</c:when>
                                        	<c:otherwise>
                                        	 
                                            <li class="nav-item">
                                                <a class="nav-link tm-nav-link" href="login">Đăng nhập</a>
                                            </li>
                                             <li class="nav-item">
                                                <a class="nav-link tm-nav-link" href="register">Đăng kí</a>
                                            </li>
                                             <li class="nav-item">
                                                <a class="nav-link tm-nav-link" href="forgotPass">Quên mật khẩu</a>
                                            </li>	
                                            
                                        	</c:otherwise>
                                        </c:choose>
                                        
                                        </ul>
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             <div class="tm-welcome-container text-center text-white">
                <div class="tm-welcome-container-inner">
                    <p class="tm-welcome-text mb-1 text-white">Trải nghiệm xem video sắc nét </p>
                    <p class="tm-welcome-text mb-5 text-white">Với nhiều thể loại phong phúc và đa dạng</p>
                    <a href="#content" class="btn tm-btn-animate tm-btn-cta tm-icon-down">
                        <span>Khám phá</span>
                    </a>
                </div>
            </div>


            <div id="tm-video-container">
                <video autoplay muted loop id="tm-video">
                    <!-- <source src="video/sunset-timelapse-video.mp4" type="video/mp4"> -->
                        <source src="<c:url value='/templates/user/video/wheat-field.mp4" type="video/mp4'/>">
                </video>    
            </div>
            
            <i id="tm-video-control-button" class="fas fa-pause"></i>
        </div>
        <div class="modal fade" id="changePassModel" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        	
		 <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel"> Đổi mật khẩu</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true"> &times; </span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <div class="form-group">
                    <input type="password" id="currentPass" name="currentPass" class="form-control rounded-0" placeholder="Nhập mật khẩu cũ" required="" />
        		</div>
        		<div class="form-group">
                    <input type="password" id="newPass" name="newPass" class="form-control rounded-0" placeholder="Nhập mật khẩu mới" required="" />
        		</div>
        		    <h5  style="color: red" id="messageChangePass"> aaaaa </h5>
        		
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="changePassBtn" >Save changes</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		
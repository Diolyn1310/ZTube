<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <div class="row mt-5 pt-3">
                    <div class="col-xl-6 col-lg-12 mb-4">
                        <div class="tm-bg-gray p-5 h-100">
                            <h3 class="tm-text-primary mb-3">Bạn có ý kiến gì cho Ztube?</h3>
                            <p class="mb-5">Mọi ý kiến Ztube đều lắng nghe và giải đáp</p>
                            <form action="" method="GET" class="tm-subscribe-form">
                                <input type="text" name="email" placeholder="Your Email..." required>
                                <button type="submit" class="btn rounded-0 btn-primary tm-btn-small">Gửi</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-12 mb-4">
                        <div class="p-5 tm-bg-gray">
                            <h3 class="tm-text-primary mb-4">Liên hệ</h3>
                            <ul class="list-unstyled tm-footer-links">
                                <li><a href="#">137 Nguyễn Thị Thập, Hòa Minh, Liên Chiểu, Đà Nẵng</a></li>
                                <li><a href="#"> <i class="fa-solid fa-headphones"></i> (+84) (028) 3602 6800</a></li>
                                <li><a href="#"> Ztube@gmail.com</a></li>
                                <li><a href="#"><i class="fa-brands fa-facebook-f"></i><i class="fa-brands fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa-solid fa-envelope"></i><i class="fa-brands fa-telegram"></i></a></li>
                            </ul>    
                        </div>                        
                    </div>
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-12 mb-4">
                        <div class="p-5 tm-bg-gray h-100">
                            <h3 class="tm-text-primary mb-4">Trang của chúng tôi </h3>
                            <ul class="list-unstyled tm-footer-links">
                                <li><a href="#">Videos</a></li>
                                <li><a href="#">License Terms</a></li>
                                <li><a href="#">Giới thiệu</a></li>
                                <li><a href="#">Liên hệ</a></li>
                                <li><a href="#">Hỏi đáp</a></li>
                            </ul>
                        </div>                        
                    </div>
                </div> <!-- row -->

                <footer class="row pt-5">
                    <div class="col-12">
                        <p class="text-center">Copyright By Linhhtdpd04352 - IT16301 
                        </p>
                   
                    </div>
                </footer>
            </div> <!-- tm-content-container -->
        </div>

    </div> <!-- .tm-page-wrap -->

    <script src="<c:url value='/templates/user/js/jquery-3.4.1.min.js'/>"> </script>
    <script src="<c:url value='/templates/user/js/bootstrap.min.js'/>"> </script>
    <script>
        function setVideoSize() {
            const vidWidth = 1920;
            const vidHeight = 1080;
            let windowWidth = window.innerWidth;
            let newVidWidth = windowWidth;
            let newVidHeight = windowWidth * vidHeight / vidWidth;
            let marginLeft = 0;
            let marginTop = 0;

            if (newVidHeight < 500) {
                newVidHeight = 500;
                newVidWidth = newVidHeight * vidWidth / vidHeight;
            }

            if(newVidWidth > windowWidth) {
                marginLeft = -((newVidWidth - windowWidth) / 2);
            }

            if(newVidHeight > 720) {
                marginTop = -((newVidHeight - $('#tm-video-container').height()) / 2);
            }

            const tmVideo = $('#tm-video');

            tmVideo.css('width', newVidWidth);
            tmVideo.css('height', newVidHeight);
            tmVideo.css('margin-left', marginLeft);
            tmVideo.css('margin-top', marginTop);
        }

        $(document).ready(function () {
            /************** Video background *********/

            setVideoSize();

            // Set video background size based on window size
            let timeout;
            window.onresize = function () {
                clearTimeout(timeout);
                timeout = setTimeout(setVideoSize, 100);
            };

            // Play/Pause button for video background      
            const btn = $("#tm-video-control-button");

            btn.on("click", function (e) {
                const video = document.getElementById("tm-video");
                $(this).removeClass();

                if (video.paused) {
                    video.play();
                    $(this).addClass("fas fa-pause");
                } else {
                    video.pause();
                    $(this).addClass("fas fa-play");
                }
            });
        })
    </script>
    		<script>
            	$('#changePassBtn').click(function() {
					$('#messageChangePass').text('');
					var currentPass = $('#currentPass').val();
					var newPass = $('#newPass').val();

					var formData = {'currentPass': currentPass,
									'newPass' : newPass};
					$.ajax({
						url:'changePass',
						type: 'POST',
						data: formData
					}).then(function(data) {
						$('#messageChangePass').text('Da doi mat khau moi!');
						
					}).fail(function(error) {
						$('#messageChangePass').text('thong tin khong chinh xac');

					});
				});
            
            </script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!DOCTYPE html>

<html lang="UTF-8">
<head>

     <style>
        .popup_follow_btn{
            width: 100px;
            height: 30px;
            background-color: black;
            color: whitesmoke;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 15px;
        }


        
        .popup_style{
            display: flex; 
            justify-content: space-between; 
            align-items: center;
            margin-bottom: 10px;
        }
        
        .like{
            color: whitesmoke;
           
        }
        .img{
            width: 35px; 
            height: 35px; 
            border-radius: 50%;
        }
        .close_btn{
            margin-left: 50px;
        }

    </style> 

 
    </head>
        <body>
            <div class="like_btn">
                <div class="like"> 
				</div>
                    <div id="popup" style="display: none; position: absolute;  top: 500px; left: 750px; width: 400px;  background-color: #fff; border: 1px solid #ccc; padding: 10px;">
                        <h3 style="text-align: center;">좋아요</h3>
                        
						<div class="popup_style_wrap">	
					
			
                    	</div>
                   	<div class="close_btn">
                  		<button onclick="closePopup2()" style="border-radius: 10px;   width: 55px; margin-left:120px; background:white;">확인</button>
                    </div>             
                	</div>
                 
            </div>
         </body>
       </html>
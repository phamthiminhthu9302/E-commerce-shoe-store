<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
    <head>
      <meta charset="ISO-8859-1">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Contact Info</title>
    </head>
    <body>
    	<jsp:include page="Menu.jsp"></jsp:include>
        <div id="logreg-forms">
            <form class="form-signin" id="forminformation">
              <a href="managerCart"><button type="button" class="close"  data-dismiss="modal"
							aria-hidden="true">&times;</button></a>
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Contact Info</h1>
                <c:if test="${error!=null }">
                 <div class="alert alert-danger" role="alert">
						 ${error}
				</div>
				</c:if>
				<c:if test="${mess!=null }">
                <div class="alert alert-success" role="alert">
				  	${mess}
				</div>
				</c:if>
					
					<div class="alert alert-danger" style="display: none;" role="alert" id="error1"></div>
				
			
                <label for="name">Name</label>
                <input name="name" type="text" id="name" class="form-control" placeholder="Name" required="" >
 
					<div class="alert alert-danger" id="error2" role="alert"style="display: none;">   </div>
				
                 <label for="phoneNumber">Phone number</label>
                <input name="phoneNumber" type="text" id="phoneNumber" class="form-control" placeholder="Phone number" required="" >
              
					<div class="alert alert-danger" id="error3" role="alert" style="display: none;"></div>
		
                <label for="email">Email</label>
                <input name="email" type="text" id="email" class="form-control"  placeholder="Email" required="" >
              
					<div class="alert alert-danger" id="error4" role="alert" style="display: none;"></div>
				
                <label for="deliveryAddress">Delivery Address</label>
                <input name="deliveryAddress" type="text" id="DeliveryAddress" class="form-control" placeholder="Delivery Address" required="" autofocus="">
               <br>
               <input type="button" class="btn btn-success btn-block" onclick="Value()" value="Order">
                
            </form>

           
            <br>

        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
        function validateEmail() {
        	 var emailID = document.getElementById("email").value;
        	 atpos = emailID.indexOf("@");
             dotpos = emailID.lastIndexOf(".");
    		if (atpos < 1 || (dotpos - atpos < 2)) {

    			return false;
    		}
    		return (true);
    	}
       
        function Phone(){
        	 var ctrl =  document.getElementById("phoneNumber").value;
           var regexr =/^(0|\+84)(\s|\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\d)(\s|\.)?(\d{3})(\s|\.)?(\d{3})$/;
        	   

        	 return regexr.test(ctrl);
        

        }
        function isNumeric() {
    	  
    	    	var ctrl = document.getElementById("name").value;
    	        var regexr =/^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_]+$/;
    	       return regexr.test(ctrl);
    	}
        function Value(){
        	var count=0;
        	
        	if(document.getElementById("DeliveryAddress").value == ""){
        		error4 =  "Địa chỉ không được để trống";
    			document.getElementById("error4").innerHTML = error4;
    			document.getElementById("error4").style.display = "block";
    			count++;
        	}
        	if(document.getElementById("name").value==""){
        		error1 =  "Tên không được để trống";
    			document.getElementById("error1").innerHTML = error1;
    			document.getElementById("error1").style.display = "block";
    			count++;
        	}
    		
    		if(document.getElementById("phoneNumber").value=="") {
    			error2 =  "Số điện thoại không được để trống";
    			document.getElementById("error2").innerHTML = error2;
    			document.getElementById("error2").style.display = "block";
    			count++;
    		}
    		
    		if(document.getElementById("email").value=="" ) {
    			error3 = "Email không được để trống";
    			document.getElementById("error3").innerHTML = error3;
    			document.getElementById("error3").style.display = "block";
    			count++;
    		}
    		
    		if(document.getElementById("phoneNumber").value!=""){
    			if(Phone()==false ||(document.getElementById("phoneNumber").value.length<10 || document.getElementById("phoneNumber").value.length>10)) {
        			error2 =  "Số điện thoại không hợp lệ";
        			document.getElementById("error2").innerHTML = error2;
        			document.getElementById("error2").style.display = "block";
        			count++;
        			
        		}
    		}
    		if(document.getElementById("name").value!=""){
    			if(isNumeric()) {
        			document.getElementById("error1").style.display = "none";
        		}else{
        			error1 =  "Tên không hợp lệ";
        			document.getElementById("error1").innerHTML = error1;
        			document.getElementById("error1").style.display = "block";
        			count++;
        		}
    		}
    		if(document.getElementById("phoneNumber").value!=""){
    		if( Phone() && document.getElementById("phoneNumber").value.length==10) {
    			document.getElementById("error2").style.display = "none";
    			}
    		}
    		if(document.getElementById("email").value!=""){
    			if(validateEmail() ) {
        			document.getElementById("error3").style.display = "none";
        		}else{
        			error3 = "Email không hợp lệ ";
        			document.getElementById("error3").innerHTML = error3;
        			document.getElementById("error3").style.display = "block";
        			count++;
        		}
    		}
    		if(document.getElementById("DeliveryAddress").value!=""){
        		
    			document.getElementById("error4").style.display = "none";
        	}
    		if (count == 0) {
			
				$.ajax({
				    url: "/WebsiteBanGiay/order",
				    type: "POST", // send it through get method
				  
				    data : $("#forminformation").serialize(),

				
				   
				    success: function(responseData) {
				        if (responseData == "Sucess") {
				            window.location.href = "ThongTinDatHang.jsp";
				           
				        }
				        if (responseData == "Faild") {
				        	
				        }
				    }
				});
			}
        }
        
            function toggleResetPswd(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle() // display:block or none
                $('#logreg-forms .form-reset').toggle() // display:block or none
            }

            function toggleSignUp(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle(); // display:block or none
                $('#logreg-forms .form-signup').toggle(); // display:block or none
            }

            $(() => {
                // Login Register Form
                $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
                $('#logreg-forms #cancel_reset').click(toggleResetPswd);
                $('#logreg-forms #btn-signup').click(toggleSignUp);
                $('#logreg-forms #cancel_signup').click(toggleSignUp);
            })
            
            window.addEventListener("load",function loadAmountCart(){
                        	 $.ajax({
                                 url: "/WebsiteBanGiay/loadAllAmountCart",
                                 type: "get", //send it through get method
                                 data: {
                                     
                                 },
                                 success: function (responseData) {
                                     document.getElementById("amountCart").innerHTML = responseData;
                                 }
                             });
                        },false);         
        </script>
    </body>
</html>
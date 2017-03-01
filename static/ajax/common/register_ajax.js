$(function(){
	$("#submit").click(function(){
		username=$("#username").val()
		email=$("#email").val()
		password1=$("#password1").val()
		password2=$("#password2").val()
		$.ajax({
			type:"POST",
			url:"/register_ajax/",
			data:{username:username,email:email,password1:password1,password2:password2},
			dataType:"json",
			success: function(data) {
				alert(data.form_msg)
			}
		});
	})
})
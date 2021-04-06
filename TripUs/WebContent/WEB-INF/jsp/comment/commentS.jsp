<%--
FileName (파일명): commentS.jsp
Explanation (설명): Tour Comment Page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    	 
<% request.setCharacterEncoding("UTF-8"); %>

<script>
	//Executed when clicking the comment registration button (댓글 등록 버튼을 클릭하면 실행)
	$('[name=commentInsertBtn]').click(function() {
   		<%--alert("등록 버튼 클릭");--%>
   		//Get the contents of commentInsertForm (commentInsertForm의 내용을 가져옵니다.)
		var insertData = $('[name=commentInsertForm]').serialize();
			
		<%--$() Is a function that gets an HTML selector.
			That is, it is a selector that gets id, name, and class.
			${} Is a function to get the key value to addObject() of ModelandView of Java Controller
			That is, it gets the value of Java.--%>
			
		if($('[name=commentid]').val() != "" && $('[name=commentcontent]').val()!="") {
			//Insert function call (Insert 함수 호출)
			commentInsert(insertData);
		} else if($('[name=commentcontent]').val()=="") {
			$('#commentContent').val('');
		} else {
			var conStr = confirm(" 로그인 이용자만 댓글 등록이 가능합니다. 로그인하시겠습니까? ");
				if(conStr) {
					location.href='/login/loginPage.do'
				} else {
					$('#commentContent').val('');
				}//End of if block
		}//End of if block	
	});//End of commentInsertBtn click function
 
	//tour comment List
	function commentList() {
		<%--alert("commentS.jsp.commentList() 실행중");--%>
    	var contentid = ${contentid};

    	$.ajax({
       		url : '/comment/toCommentList.to',
        	type : 'get',
        	//Since the value of contentid is required in the where clause in the Mapper,(Mapper에 있는 where절에 contentid의 값이 필요하기 때문에)
        	//the controller must send the corresponding value.(컨트롤러에서는 해당하는 값을 보내야한다.)
        	//If the value of the key sent from data is the same name as the VO value, (만약 data에서 보낸 키 값이 VO값과 똑같은 이름일 경우 )
        	//Even if there is no setVO, the controller automatically puts it in Vo.(컨트롤러에서 따로 setVO를 하지 않아도 자동으로 Vo에 담긴다.)
        	data : {contentid:contentid}, 
        	success : function(data) {
        		console.log("commentS.jsp commentList.data confirm >>> : " , data);
           
	       		var commArea =''; 

	        	//Even if the controller does not contain the VO value as a parameter, (컨트롤러에서 VO값을 파라미터로 담지 않아도) 
	        	//the values corresponding to * received from the mapper are stored as the return value. (맵퍼에서 받은 *에 해당하는 값들이 리턴값으로 담겨진다.)
	        	//This return value is passed as a data value, so it can be used in jsp. (이 리턴값이 data값으로 전달되서 jsp에서 사용이 가능해진다.)
	        	//Therefore, there is no need for a separate VO parameter in the controller. (따라서 컨트롤러에서 따로 VO파라미터는 필요하지 않다.)
	        		
	        	//When you want to print the index in reverse order (인덱스를 역순으로 출력하고자 할때는)
	        	//You can print out the (length of data-index) through the for statement. (데이터전체길이-index)를 for문을 통해서 출력하면 된다.)
	        	$.each(data, function(index, value) {
	        		commArea += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
	        		commArea += '<div class="commentInfo"><em class=commentNumber>'+'No.'+((data.length)-index)+'</em><em class=commentNumber>'+value.commentnick+'</em><span>'+value.commentupdatedate+'</em>';
	        		commArea += '<a class="aBtn" onclick="commentUpdate(\''+value.commentno+'\',\''+value.commentcontent+'\',\''+value.commentid+'\');">&nbsp수정 </a>';
	        		commArea += '<a class="aBtn" onclick="commentDelete(\''+value.commentno+'\',\''+value.commentid+'\');"> 삭제 </a>';
	        		commArea += '<a class="aBtn" onclick="commentList()"> 취소 </a> </div>';
	        		commArea += '<div class="commentContent'+value.commentno+'"> <p>'+value.commentcontent +'</p>';
	        		commArea += '</div></div>';
	            });
	            
    			$(".commentList").html(commArea);
        	},
        	error : function(data) {
            	console.log("commentS.jsp commentList.error html >>> : " + data.statusText);
        	}
    	});//end of ajax block
	}//end of commentList function block
 
	//tour comment Insert 
	function commentInsert(insertData) {
		<%--alert("commentS.jsp.commentInsert().commentnick >>> : " + $("#commentnick").val()); --%>
	    $.ajax({
			url : '/comment/toCommentInsert.to',
		    type : 'get',
		    data : insertData,
		    success : function(data) {
		              	if(data == 1) {
		            		//Print list of comments (댓글 목록 출력)
		                	commentList();
		            		//Automatically delete contents after registering comments (댓글을 등록한 후 자동으로 내용 삭제)
		                	$('[name=commentcontent]').val('');
		            	}
		    },
		   	error : function(request, status, error) {
	        			alert("code : " + request.status + "\n" 
	            			+ "message : " +request.responseText + "\n" 
	            		  	+ "error : " + error);
	          		}
		});
	}//end of commentInsert function block
		 
	//Input form to output comments.(댓글 내용을 출력하는 input 양식 )
	function commentUpdate(commentno, commentcontent,commentid) {
    
		var updateComm ='';
    
		updateComm += '<div class="input-group">';
		updateComm += '<input type="text" class="form-control" name="commentcontentNew" value="'+commentcontent+'"/>';
		updateComm += '<span class="input-group-btn">';
		updateComm += '<button class="btn btn-default" type="button" onclick="commentUpdateBtn(\''+commentno+'\');">수정</button>';
		updateComm += '</span>';
		updateComm += '</div>';

   		if($('[name=commentid]').val() == commentid) {
   			$('.commentContent'+commentno+'').html(updateComm);
    	} else if($('[name=commentid]').val() != commentid && $('[name=commentid]').val() != "") {
      		alert("본인 댓글 외에 타인의 댓글은 수정 불가능 합니다.");
    	} else {
    		var conStr1 = confirm("비로그인 상태입니다. 로그인하시겠습니까? ");
				
    		if(conStr1) {
				location.href='/login/loginPage.do'
			} else {
				window.location.reload();
			}
    	}
	}//end of commentUpdate function block
 
	//tour comment Update
	function commentUpdateBtn(commentno) {

    	var updateContent = $('[name=commentcontentNew]').val();
    		console.log("commentS.jsp commentUpdateBtn.updateContent confirm >>> : " + updateContent);
    		console.log("commentS.jsp commentUpdateBtn.commentno confirm >>> : " + commentno);
    
		$.ajax({
				url : '/comment/toCommentUpdate.to',
		        type : 'post',
		        data : {'commentcontent':updateContent, 'commentno':commentno},
		        success : function(data) {
		            if(data == 1) {
		            	//Print list after editing comments (댓글 수정 후 목록 출력)
		            	commentList();
		            }
		        },
		        error : function(data) {
		    		console.log("commentS.jsp commentUpdateBtn.error html >>> : " + data.statusText);
				}
		});
	}//end of commentUpdateBtn function block
 
	//tour comment Delete
	function commentDelete(commentno, commentid) {
		console.log("commentS.jsp commentDelete.commentno >>> : " + commentno);
		console.log("commentS.jsp commentDelete.commentid >>> : " + commentid);
    
		if($('[name=commentid]').val() == commentid) {
			$.ajax({
					url : '/comment/toCommentDelete.to',
			        type : 'post',
			        data : {'commentno' : commentno},
			        success : function(data) {
			            		if(data == 1) {
			            			//Print list after deleting comment (댓글 삭제 후 목록 출력)
			            			commentList(contentid);
			            		}
			        }
			});
	    } else if($('[name=commentid]').val() != commentid && $('[name=commentid]').val() != "" ) {
	    	alert("본인 댓글 외에 타인의 댓글은 삭제 불가능 합니다.");
	    } else {
	    	var conStr2 = confirm("비로그인 상태입니다. 로그인하시겠습니까? ");
				
	    	if(conStr2) {
				location.href='/login/loginPage.do'
			} else {
				window.location.reload();
			}
	    }
	}//end of commentDelete function block
 
	//Print list of comments when loading page (페이지 로드할때 댓글 목록 출력)
	$(document).ready(function() {
    	commentList();
	});
</script>

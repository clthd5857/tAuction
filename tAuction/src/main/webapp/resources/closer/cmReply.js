//console.log("Reply Module..")

var cmReplyService = (function() {
	//댓글 추가
	function cmReplyInsert(reply, callback) {
		//console.log("add cmReply..");
		
		var contextPath = getContextPath();
		var url = contextPath + "/cmReplies/cmReplyInsert";
		
		//console.log("url : "+url);
		
		$.ajax({
			type : 'post',
			url : url,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			success : function(result, status, xhr) {
				//console.log(result);
				
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		})
	}
	
	//댓글 목록
	function cmReplyGetList(param, callback, error) {
		var bno = param.bno;
		var page = param.page || 1;
		
		var contextPath = getContextPath();
		var url = contextPath + '/cmReplies/cmReplyGetList/' + bno + "/" + page + ".json";
		
		
		$.ajax({
			type : 'get',
			url : url,
			success : function(result, status, xhr) {
				if(callback) {
					callback(result.replyCnt, result.list);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		})
	}
	
	//댓글 삭제
	function cmReplyDelete(rno, replyer, callback, error) {
		
		var contextPath = getContextPath();
		var url = contextPath + '/cmReplies/' + rno;
		
		
		$.ajax({
			type : 'delete',
			url : url,
			data : JSON.stringify({rno:rno, memberId : replyer}),
			contentType : "application/json; charset=utf-8",
			success : function(deleteResult, status, xhr) {
				if(callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		})
	}
	
	//댓글 수정
	function cmReplyModify(cmReply, callback, error) {
		var contextPath = getContextPath();
		var url = contextPath + '/cmReplies/' + cmReply.rno;
		
		$.ajax({
			type : 'put',
			url : url,     
			data : JSON.stringify(cmReply),
			contentType: "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		})
	}
	
	//특정 댓글조회
	function cmReplyRead(rno, callback, error) {
		var contextPath = getContextPath();
		var url = contextPath + '/cmReplies/' + rno + ".json";
		
		$.ajax({
			type : 'get',
			url : url,
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		})
	}
	
	
	//댓글 시간처리
	function cmReplyDisplayTime(timeValue) {
		var today = new Date();
		var gap = today.getTime() - timeValue;
		
		var dateObj = new Date(timeValue);
		var str = "";
		
		if(gap < (1000 * 60 * 60 * 24)) {
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
				':', (ss > 9 ? '' : '0') + ss ].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; //getMonth() is zero-based
			var dd = dateObj.getDate();
			
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
					(dd > 9 ? '' : '0') + dd].join('');
		}
	}
	
		return {
		cmReplyInsert : cmReplyInsert,
		cmReplyGetList : cmReplyGetList,
		cmReplyDelete : cmReplyDelete,
		cmReplyModify : cmReplyModify,
		cmReplyRead : cmReplyRead,
		cmReplyDisplayTime : cmReplyDisplayTime
	};
})();


function getContextPath(){
	
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	
	var contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex+1));
	
	if (contextPath=="/cmBoard"){
		contextPath = "";
	}
	
	return contextPath;
}



//console.log("Reply Module..")

var postReplyService = (function() {
	
	//댓글 추가
	function postReplyInsert(reply, callback) {
		//console.log("add postReply..");
		//console.log(JSON.stringify(reply));
		$.ajax({
			type : 'post',
			url : '/postReplies/postReplyInsert',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
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
	
	//댓글 목록
	function postReplyGetList(param, callback, error) {
		var bno = param.bno;
		var page = param.page || 1;
		
		$.ajax({
			type : 'get',
			url : '/postReplies/postReplyGetList/' + bno + "/" + page + ".json",
			success : function(result, status, xhr) {
				if(callback) {
					//callback(result);
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
	function postReplyDelete(rno, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/postReplies/' + rno,
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
	function postReplyModify(reply, callback, error) {
		$.ajax({
			type : 'put',
			url : '/postReplies/' + reply.rno,     
			data : JSON.stringify(reply),
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
	function postReplyRead(rno, callback, error) {
		$.ajax({
			type : 'get',
			url : '/postReplies/' + rno + ".json",
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
	function postReplyDisplayTime(timeValue) {
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
		postReplyInsert : postReplyInsert,
		postReplyGetList : postReplyGetList,
		postReplyDelete : postReplyDelete,
		postReplyModify : postReplyModify,
		postReplyRead : postReplyRead,
		postReplyDisplayTime : postReplyDisplayTime
	};
})();

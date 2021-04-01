//console.log("postBoard...........");

var postBoardService = (function(){
	
	function postGetList(postBoard, callback, error){
		var pageNum = postBoard.pageNum;
		var amount = postBoard.amount;
		var searchType= postBoard.searchType;
		var searchKeyword = postBoard.searchKeyword;
		
		var url = "/postBoard/restPostBoardGetList";
		
		$.ajax({
			type : "get",
			url : url,
			data : {pageNum:pageNum, amount:amount ,searchType : searchType, searchKeyword : searchKeyword},
			contentType : "text/plain; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					//console.log(result);
					callback(result);
					
				}
			},
			error : function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		}); //ajax-end
	} // getList-end

	function postGetTotalPageCnt(postBoard,callback,error){
		var pageNum = postBoard.pageNum;
		var amount = postBoard.amount;
		var searchType= postBoard.searchType;
		var searchKeyword = postBoard.searchKeyword;
		
		var url = "/postBoard/restPostBoardGetTotalPageCnt";
		
		$.ajax({
			type : "get",
			url : url,
			data : {pageNum:pageNum, amount:amount ,searchType : searchType, searchKeyword : searchKeyword},
			contentType : "text/plain; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					//console.log(result);
					callback(result);
				}
			},
			error : function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		});
	} //postGetTotalPageCnt-end
	
	function postGetAttachList(bno,callback){
		var bno = bno;
		var url = "/board/postGetAttachList";
		var str = "/resources/images/portfolio/1.jpg";
		$.ajax({
			type : 'get',
			url : url,
			data : {bno : bno},
			dataType : 'json',
			success : function(arr, status, xhr){
				if(callback){
					callback(arr);
				}
			},
			error : function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		});
	} // getAttachList-end
	
	function showTime(timeValue){
		var dateObj = new Date(timeValue);
		
		var hh = dateObj.getHours();
		var mi = dateObj.getMinutes();
		var ss = dateObj.getSeconds();
		
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth()+1;
		var dd = dateObj.getDate();
		
		return [ yy, "/", (mm>9 ? '':'0')+mm, '/', (dd>9 ? '':'0')+dd, ' ',
				(hh>9 ? '':'0')+hh, ':', (mi>9 ? '':'0')+mi, ':', (ss>9 ? '':'0')+ss].join('');
		
	}// showTime-end
	
	
	return {
		postGetList : postGetList,
		postGetTotalPageCnt : postGetTotalPageCnt,
		postGetAttachList : postGetAttachList,
		showTime : showTime
	}
	
})();

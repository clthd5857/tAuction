//console.log("cmBoard...........");

var cmBoardService = (function(){
	
	function getList(cmBoard, callback, error){
		var pageNum = cmBoard.pageNum;
		var amount = cmBoard.amount;
		var category = cmBoard.category;
		var searchType= cmBoard.searchType;
		var searchKeyword = cmBoard.searchKeyword;
		
		var contextPath = getContextPath();
		var url = contextPath + "/cmBoard/restCmBoardGetList";
		
		$.ajax({
			type : "get",
			url : url,
			data : {pageNum:pageNum, amount:amount, category:category ,searchType : searchType, searchKeyword : searchKeyword},
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

	function getTotalPageCnt(cmBoard,callback,error){
		var pageNum = cmBoard.pageNum;
		var amount = cmBoard.amount;
		var category = cmBoard.category;
		var searchType= cmBoard.searchType;
		var searchKeyword = cmBoard.searchKeyword;
		
		var contextPath = getContextPath();
		var url = contextPath+"/cmBoard/restCmBoardGetTotalPageCnt";
		
		$.ajax({
			type : "get",
			url : url,
			data : {pageNum:pageNum, amount:amount, category:category ,searchType : searchType, searchKeyword : searchKeyword},
			contentType : "text/plain; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		});
	} //getTotalPageCnt-end
	
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
		getList : getList,
		getTotalPageCnt : getTotalPageCnt,
		showTime : showTime
	}
	
})();

function getContextPath(){
	
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	
	var contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex+1));
	
	
	if (contextPath=="/cmBoard"){
		contextPath = "";
	}
	
	return contextPath;
}




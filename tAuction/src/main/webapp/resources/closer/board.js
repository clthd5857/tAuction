var boardService = (function(){
	
	function getList(board, callback, error){
		var pageNum = board.pageNum;
		var amount = board.amount;
		var category = board.category;
		var searchType= board.searchType;
		var searchKeyword = board.searchKeyword;
		var contextPath = getContextPath();
		
		var url = contextPath + "/board/restBoardGetList";
		
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
		}); //ajax-end
	} // getList-end
	
	function getTotalPageCnt(board,callback,error){
		var pageNum = board.pageNum;
		var amount = board.amount;
		var category = board.category;
		var searchType= board.searchType;
		var searchKeyword = board.searchKeyword;
		var contextPath = getContextPath();
		
		var url = contextPath + "/board/restBoardGetTotalPageCnt";
		
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
		
		var yyyy = dateObj.getFullYear();
		var mm = dateObj.getMonth()+1;
		var dd = dateObj.getDate();
		
		return [ yyyy, "/", (mm>9 ? '':'0')+mm, '/', (dd>9 ? '':'0')+dd, ' ',
				(hh>9 ? '':'0')+hh, ':', (mi>9 ? '':'0')+mi, ':', (ss>9 ? '':'0')+ss].join('');
		
	}// showTime-end
	
	function price(priceValue){
		if(priceValue){
			var priceValue = priceValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		} else {
			var priceValue = 'X';
		}
		return priceValue;
	} // price-end
	
	
	return {
		getList : getList,
		getTotalPageCnt : getTotalPageCnt,
		showTime : showTime,
		price : price
	}
	
})();


function getContextPath(){
	
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	
	var contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex+1));
	
	
	if (contextPath=="/board"){
		contextPath = "";
	}
	
	return contextPath;
}



var adminService = (function(){
   
  

  
   function memberDelete(memberId,callback,error){
      $.ajax({
         type : "post",
         url : "/admin/memberDelete",
         data : {memberId:memberId},
         beforeSend:function(xhr){
            xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
         },
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
   }
   function memberRestore(memberId,callback,error){
      $.ajax({
         type : "post",
         url : "/admin/memberRestore",
         data : {memberId:memberId},
         beforeSend:function(xhr){
            xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
         },
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
   }
   
  
   
   function getCmBoardRemoveList(board, callback, error){
      var pageNum = board.pageNum;
      var amount = board.amount;
         
      
      $.ajax({
         type : "get",
         url :  "/admin/restCmBoardRemoveList",
         data : {pageNum:pageNum, amount:amount},
         contentType : "text/plain; charset=utf-8",
         success : function(result, status, xhr){
            if(callback){
               //console.log(callback);
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
   function boardDelete(bno,callback,error){
      $.ajax({
         type : "post",
         url : "/admin/boardDelete",
         data : {bno:bno},
         beforeSend:function(xhr){
            xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
         },
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
   }
   
   function cmBoardDelete(bno,callback,error){
      $.ajax({
         type : "post",
         url : "/admin/cmBoardDelete",
         data : {bno:bno},
         beforeSend:function(xhr){
            xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
         },
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
   }
   
   function boardRestore(bno,callback,error){
      $.ajax({
         type : "post",
         url : "/admin/boardRestore",
         data : {bno:bno},
         beforeSend:function(xhr){
            xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
         },
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
   }
   
   function cmBoardRestore(bno,callback,error){
      $.ajax({
         type : "post",
         url : "/admin/cmBoardRestore",
         data : {bno:bno},
         beforeSend:function(xhr){
            xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
         },
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
   }
   
   function showDate(DateValue){
      var dateObj = new Date(DateValue);
      
      
      
      var yy = dateObj.getFullYear();
      var mm = dateObj.getMonth()+1;
      var dd = dateObj.getDate();
      
      return [ yy, "/", (mm>9 ? '':'0')+mm, '/', (dd>9 ? '':'0')+dd, ' '].join('');
      
   }// showTime-end
//==========================================
 

function mainChart(callback,error){
      var labelList=[];
      var bidList=[];
      var successbidList=[];
      var boardList=[];
      
   
      $.ajax({
         type : "get",
         url : "/admin/mainChart",
         
         contentType : "text/plain; charset=utf-8",
         beforeSend:function(xhr){
            xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
         },
         success : function(result, status, xhr){
               //console.log("result: "+result);
            
               for(var i=0;i<result.length;i++)
               {
                  labelList.push(result[i].date);
                  bidList.push(result[i].bidCount);
                  successbidList.push(result[i].successbidCount);
                  boardList.push(result[i].boardCount);
               }
               
              // console.log(labelList);
               var ctx = document.getElementById("barLineChart");
               var basiclinechart = new Chart(ctx, {
                  type: 'bar',
                  data: {
                     labels: labelList,
                     datasets: [
                        {
                           label: '일별 게시물 개수',
                           data: boardList,
                           type: 'bar',
                           backgroundColor:'rgba(75, 192, 192, 0.2)',
                           borderColor: 'rgba(75, 192, 192, 1)',
                           borderWidth: 1
                        },
                        {
                        label: "입찰 수",
                        fill: false,
                        type: 'line',
                            backgroundColor: '#00c292',
                        borderColor: '#00c292',
                        data:bidList
                        },
                        {
                            label: "낙찰 수",
                        fill: false,
                        type: 'line',
                            backgroundColor: '#fb9678',
                        borderColor: '#fb9678',
                        data: successbidList
                        
                  }]
                  },
                  options: {
                     responsive: true,
                     title:{
                        display:true,
                        text:'일별 그래프'
                     },
                     tooltips: {
                        mode: 'index',
                        intersect: false,
                     },
                     hover: {
                        mode: 'nearest',
                        intersect: true
                     },
                     scales: {
                        xAxes: [{
                           display: true,
                           scaleLabel: {
                              display: true,
                              labelString: '날짜'
                           }
                        }],
                        yAxes: [{
                           display: true,
                           scaleLabel: {
                              display: true,
                              labelString: '수'
                           }
                        }]
                     }
                  }
               });
            
         },
         error : function(xhr,status,er){
            if(error){
               error(er);
            }
         }
      }); //ajax-end
   }
function allChartYear(year,callback,error){

 
    $.ajax({
       type : "get",
       url : "/admin/allChartYear",
       data:{year:year},
       contentType : "text/plain; charset=utf-8",
       beforeSend:function(xhr){
           xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
       },
       success : function(result, status, xhr){
             //console.log("result: "+result);
             
             for(var i=0;i<result.length;i++)
             {
                bidList.push(result[i].bidCount);
                successbidList.push(result[i].successbidCount);
                boardList.push(result[i].boardCount);
                visitorList.push(result[i].visitorCountView);
             }
          
         
             var ctx = document.getElementById("allChartYear");
             var basiclinechart = new Chart(ctx, {
                type: 'bar',
                data: {
                   labels: chartLabels,
                   datasets: [
                      {
                         label: '월별 방문자 수',
                         data: visitorList,
                         type: 'bar',
                         backgroundColor: 'rgba(153, 102, 255, 0.5)',
                         borderColor: 'rgba(153, 102, 255, 1.5)',
                         borderWidth: 1
                      },
                      {
                          label: '월별 게시물 개수',
                          data: boardList,
                          type: 'bar',
                          backgroundColor:'rgba(75, 192, 192, 0.2)',
                          borderColor: 'rgba(75, 192, 192, 1)',
                          borderWidth: 1
                       },
                      {
                      label: "입찰 수",
                      fill: false,
                      type: 'line',
                      backgroundColor: '#00c292',
                      borderColor: '#00c292',
                      data:bidList
                      },
                      {
                      label: "낙찰 수",
                      fill: false,
                      type: 'line',
                      backgroundColor: '#fb9678',
                      borderColor: '#fb9678',
                      data: successbidList
                      
                }]
                },
                options: {
                   responsive: true,
                   title:{
                      display:true,
                      text: year+'년 월별 그래프'
                   },
                   tooltips: {
                      mode: 'index',
                      intersect: false,
                   },
                   hover: {
                      mode: 'nearest',
                      intersect: true
                   },
                   scales: {
                      xAxes: [{
                         display: true,
                         scaleLabel: {
                            display: true,
                            labelString: '월'
                         }
                      }],
                      yAxes: [{
                         display: true,
                         scaleLabel: {
                            display: true,
                            labelString: '수'
                         }
                      }]
                   }
                }
             });
          
       },
       error : function(xhr,status,er){
          if(error){
             error(er);
          }
       }
    }); //ajax-end
 }
function allChartMonth(year,month,callback,error){


    var yearMonth;
    if(month<10)
    {
          yearMonth=year+"/0"+month;
    }
    else
    {
       yearMonth=year+"/"+month;
    }
 
    $.ajax({
       type : "get",
       url : "/admin/allChartMonth",
       data:{yearMonth:yearMonth},
       contentType : "text/plain; charset=utf-8",
       beforeSend:function(xhr){
           xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
       },
       success : function(result, status, xhr){
             //console.log("result: "+result);
             
             for(var i=0;i<result.length;i++)
             {
                bidList.push(result[i].bidCount);
                successbidList.push(result[i].successbidCount);
                boardList.push(result[i].boardCount);
                visitorList.push(result[i].visitorCountView);
             }
          
         
             var ctx = document.getElementById("allChartMonth");
             var basiclinechart = new Chart(ctx, {
                type: 'bar',
                data: {
                   labels: chartLabels,
                   datasets: [
                      {
                         label: '일별 방문자 수',
                         data: visitorList,
                         type: 'bar',
                         backgroundColor: 'rgba(153, 102, 255, 0.5)',
                         borderColor: 'rgba(153, 102, 255, 1.5)',
                         borderWidth: 1
                      },
                      {
                          label: '일별 게시물 개수',
                          data: boardList,
                          type: 'bar',
                          backgroundColor:'rgba(75, 192, 192, 0.2)',
                          borderColor: 'rgba(75, 192, 192, 1)',
                          borderWidth: 1
                       },
                      {
                      label: "입찰 수",
                      fill: false,
                      type: 'line',
                      backgroundColor: '#00c292',
                      borderColor: '#00c292',
                      data:bidList
                      },
                      {
                      label: "낙찰 수",
                      fill: false,
                      type: 'line',
                      backgroundColor: '#fb9678',
                      borderColor: '#fb9678',
                      data: successbidList
                      
                }]
                },
                options: {
                   responsive: true,
                   title:{
                      display:true,
                      text:'일별 그래프'
                   },
                   tooltips: {
                      mode: 'index',
                      intersect: false,
                   },
                   hover: {
                      mode: 'nearest',
                      intersect: true
                   },
                   scales: {
                      xAxes: [{
                         display: true,
                         scaleLabel: {
                            display: true,
                            labelString: '날짜'
                         }
                      }],
                      yAxes: [{
                         display: true,
                         scaleLabel: {
                            display: true,
                            labelString: '수'
                         }
                      }]
                   }
                }
             });
          
       },
       error : function(xhr,status,er){
          if(error){
             error(er);
          }
       }
    }); //ajax-end
 }
   
   
   
   return {
   
      memberDelete:memberDelete,
      showDate:showDate,
      memberRestore:memberRestore,
      boardDelete:boardDelete,
      boardRestore:boardRestore,
      cmBoardDelete:cmBoardDelete,
      cmBoardRestore:cmBoardRestore,
      mainChart:mainChart,
      allChartMonth:allChartMonth,
      allChartYear:allChartYear
      

   }
   
})();
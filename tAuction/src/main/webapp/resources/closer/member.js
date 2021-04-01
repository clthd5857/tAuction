var memberService = (function(){
   

function checkId(callback,error){
         var memberId=$("#memberId").val();
         
         
         var contextPath = getContextPath();
         var url = contextPath + "/member/checkId";
         
         //console.log("memberId="+memberId);
         //console.log("길이:"+memberId.length );
         if(memberId.length>=6)
         {
            //console.log("ajax준비");
            $.ajax({
            
               type:"post",
               url:url,
               data:{memberId:memberId},
               success: function(result,callback){
                  //console.log("성공여부:"+result)
                  if(result=="true"){
                     $("#alert-successId").hide();
                     $("#alert-dangerId").show();
                     $("#submit").attr("disabled","disabled");
                  }
                  else if(result=="false")
                  {  
                     $("#alert-dangerId").hide();
                     $("#alert-successId").show(); 
                  
                     $("#submit").removeAttr("disabled");  
                  }

                  
               }
            });
         }else
         {
             $("#alert-successId").hide();
             $("#alert-dangerId").hide();
         }
   }
   
function checkPassword(member,callback){
      var memberId=member.memberId;
      var memberPassword= member.memberPassword;
      
      var contextPath = getContextPath();
      var url = contextPath + "/member/checkPassword";

   
      $.ajax({
         type:"post",
         url:url,
         data:{memberId:memberId,
                memberPassword:memberPassword},
         success: function(data){
            //console.log(data);
            
            if(callback){
               callback(data);
            }
               
               
            
         }
      });
   }
function memberInfo(memberId,callback){
   $.ajax({
         type:"post",
         url:"/member/memberInfo",
         data:{memberId:memberId},
         success: function(data){
            //console.log(data);
            
            if(callback){
               callback(data);
            }
         }
   });
   }
function showDate(DateValue){
    var dateObj = new Date(DateValue);
    
    
    
    var yy = dateObj.getFullYear();
    var mm = dateObj.getMonth()+1;
    var dd = dateObj.getDate();
    
    return [ yy, "/", (mm>9 ? '':'0')+mm, '/', (dd>9 ? '':'0')+dd, ' '].join('');
    
 }
   
   return {
      
      checkId : checkId,
      checkPassword: checkPassword,
      memberInfo:memberInfo,
      showDate:showDate
   }
   
})();

function getContextPath(){
   
   var hostIndex = location.href.indexOf(location.host) + location.host.length;
   
   var contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex+1));
   
   if (contextPath=="/member"){
      contextPath = "";
   }
   
   return contextPath;
}




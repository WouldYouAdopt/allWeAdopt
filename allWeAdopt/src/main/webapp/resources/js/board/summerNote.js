console.log("summerNote.js 정상 연결됨");
 
 // 업로드된 이미지를 ajax를 이용하여 서버로 전송하여 저장하는 함수
 function sendFile(file, editor){
    
    // 매개변수 
    // file : 업로드된 이미지 정보
    // editor : 이미지 업로드가 발생한 summernote 에디터 요소
 
    
    form_data = new FormData();
    // FormData : form 태그 내부 값 전송을 위한  k:v 쌍을 쉽게 생성할 수 있는 객체
    
    form_data.append("uploadFile", file);
    // FormData 객체에 새로운 K, V 를 추가
    $.ajax({
       url : contextPath+"/summerNote/uploadImage",
       type : "post",
       data : form_data,
       dataType: "json",
       enctype: "multipart/form-data",   // 파일을 전달하기 때문에 enctype 설정 필수
       cache : false,
       contentType : false,
       // contentType : 서버로 전송되는 데이터의 형식 설정
       // 기본값  : application/x-www-form-urlencoded; charset=UTF-8
       // 파일 전송 시 multipart/form-data 형식으로 데이터를 전송해야 하므로
       // 데이터의 형식이 변경되지 않도록 false로 지정.
      
      processData : false,
      // processData : 서버로 전달되는 값을 쿼리스트링으로 보낼경우 true(기본값), 아니면 false
      //            파일 전송 시 false로 지정 해야 함.
       
       success : function(at){
       
        //   // contextPath(최상위 주소)를 javascript로 얻어오는 방법
        //   // -> js 파일에서는 EL을 사용할 수 없음 (EL은 JSP에서만 사용 가능) 
        //     var contextPath = location.pathname.substring(0, window.location.pathname.indexOf("/",2));
 
          // 저장된 이미지를 에디터에 삽입
          $(editor).summernote('editor.insertImage', contextPath + at.filePath + at.fileName);
          
          
       }, error : function(){
        console.log("ajax 실패");
       }
       
    });
 }


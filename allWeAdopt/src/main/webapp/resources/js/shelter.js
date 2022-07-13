$('#summernote').summernote({
    placeholder: '사진, 실종 날짜, 실종 위치, 생김새를 자세히 작성해주세요',
    tabsize: 2,
    height: 350,
    callback: {onImageUpload : function(files){
                    uploadSummernoteImageFile(files[0], this);
                },
               onPaste: function(e) {
                    var clipboardData  = e.originalEvent.clipboardData;
                    if(clipboardData && clipboardData.items && clipboardData.items.length) {
                        var item = clipboardData.items[0];
                        if(item.kind === 'file' && item.type.indexOf('image/') !== -1){
                            e.preventDefault();
                        }
                    }
               }     
        },
    toolbar: [
          // [groupName, [list of button]]
          ['fontname', ['fontname']],
          ['fontsize', ['fontsize']],
          ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
          ['color', ['forecolor','color']],
          // ['table', ['table']],
          // ['para', ['ul', 'ol', 'paragraph']],
          // ['height', ['height']],
          ['insert',['picture','link','video']],
          // ['view', ['fullscreen', 'help']]
      ],
      fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
      fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],

  });


// 이미지 파일 업로드
function uploadSummernoteImageFile(file, editor){

    data = new FormData();

    data.append("file", file);

    $.ajax({

        data : data, 
        type : "POST",
        url : "/uploadSummernoteImageFile",
        contentType : false,
        processData : false, 
        sucesess : function(data){
            var contextPath = location.pathname.substring(0, window.location.pathname.indexOf("/",2));
            $(editor).summernote("editor.insertImage", contextPath + data.url);
        }

    })

}







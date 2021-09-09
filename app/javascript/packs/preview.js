  document.addEventListener('DOMContentLoaded', function() {
     const ImageList = document.getElementById('image-list')
 
     // 選択した画像を表示する関数
     const createImageHTML = (blob) => {
        // 画像を表示するためのdiv要素を生成
       const imageElement = document.createElement('div')
       imageElement.setAttribute('class', "image-element")
       let imageElementNum = document.querySelectorAll('.image-element').length
 
       // 表示する画像を生成
       const blobImage = document.createElement('img')
       blobImage.setAttribute('src', blob)

      // 画像プレビューのサイズ調整

       //  ファイル選択ボタンを生成
       const inputHTML = document.createElement('input')
       inputHTML.setAttribute('id', `rock_information_image_${imageElementNum}`)
       inputHTML.setAttribute('name', 'rock_information[images][]')
       inputHTML.setAttribute('type', 'file')

       // 生成したHTMLの要素をブラウザに表示させる
       imageElement.appendChild(blobImage)
       imageElement.appendChild(inputHTML)
       ImageList.appendChild(imageElement)

      //  2枚目以降の画像にもイベント発火するように実装しましょう
       inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      })
     }
 
     document.getElementById('item-image').addEventListener('change', (e) => {
     // ここから削除(プレビュー画像でつかった　2枚目以降プレビュー画像を削除するという記述)
     // const imageContent = document.querySelector('img')
     // if (imageContent){
     // imageContent.remove();
     // }
     // ここまで削除
 
       const file = e.target.files[0];
       const blob = window.URL.createObjectURL(file);
 
       createImageHTML(blob)
     });
   });
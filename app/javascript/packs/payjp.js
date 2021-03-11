const pay = () => {
  Payjp.setPublicKey("pk_test_7cbf637053e5b4318d2ebf07"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    console.log("フォーム送信時にイベント発火")
  });
};

window.addEventListener("load", pay);
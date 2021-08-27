function achieveCheck (){
  const cBox = document.getElementById("a-check");
  const bColor = document.getElementById("change-bc");
  const achieveMessage = document.getElementById("a-change");
  cBox.addEventListener("click", () => {
    console.log(bColor)
    if(cBox.checked == true){
      bColor.style.border = "solid 1px black";
      bColor.style.borderColor = "#28a745";
      achieveMessage.innerHTML = "（達成おめでとうございます！）";
    }else{
      bColor.style.border = "solid 1px black";
      bColor.style.borderColor = "red";
      achieveMessage.innerHTML = "（目標を達成できたらチェック！）";
    };
  });
};

window.addEventListener('load', achieveCheck);
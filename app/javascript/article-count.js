function inputTextCount (){
  const input = document.getElementById("input-text");
  input.addEventListener("keyup", () => {
    const textNum = input.value.replace(/\r?\n/g, '改行').length ;
    const addTextNum = document.getElementById("counter");
    const restNum = 200 - textNum ;
    if(restNum >= 0){
      addTextNum.innerHTML = `（あと${restNum}文字）`;
      addTextNum.style.color = "#28a745";
    }else{
      const overNum = textNum - 200 ;
      addTextNum.innerHTML = `（${overNum}文字オーバーです！）`;
      addTextNum.style.color = "red";
    };
  });
  const inputTitle = document.getElementById("input-title");
  inputTitle.addEventListener("keyup", () => {
    const titleNum = inputTitle.value.replace(/\r?\n/g, '改行').length ;
    const addTitleNum = document.getElementById("title-counter");
    const restTitleNum = 20 - titleNum ;
    if(restTitleNum >= 0){
      addTitleNum.innerHTML = `（あと${restTitleNum}文字）`;
      addTitleNum.style.color = "#28a745";
    }else{
      const overTitleNum = titleNum - 20 ;
      addTitleNum.innerHTML = `（${overTitleNum}文字オーバーです！）`;
      addTitleNum.style.color = "red";
    };
  });
};

window.addEventListener('load', inputTextCount);
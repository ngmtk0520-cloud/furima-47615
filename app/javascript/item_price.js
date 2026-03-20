window.addEventListener('turbo:load', () => { 

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () =>{
    const inputValue = priceInput.value;

    // 手数料を計算して切り捨てる
    const addTaxPrice = Math.floor(inputValue * 0.1);

    // 利益を計算する
    const profit = inputValue - addTaxPrice;

    // 画面の特定の場所に表示させる
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = addTaxPrice;

    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = profit;

    const price = priceInput.value;
    const tax = Math.floor(price * 0.1);
    const salesProfit = price - tax;
    addTaxDom.innerHTML = tax;
    profitDom.innerHTML = salesProfit;
  })
  


});

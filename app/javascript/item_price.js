const price = () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return; 

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    const tax = Math.floor(inputValue * 0.1);
    const salesProfit = Math.floor(inputValue - tax);

    addTaxDom.innerHTML = tax;
    profitDom.innerHTML = salesProfit;
  });
};

window.addEventListener('turbo:load', price);
window.addEventListener("turbo:render", price);

function updateQuantity(button, operation) {
    var quantityElement = button.parentElement.querySelector("span");
    var currentQuantity = parseInt(quantityElement.textContent);

    if (operation === '-' && currentQuantity > 1) {
        currentQuantity--;
    } else if (operation === '+') {
        currentQuantity++;
    }

    quantityElement.textContent = currentQuantity;
    updateTotal(button);
}

function updateTotal(button) {
    var row = button.closest("tr");
    var priceElement = row.querySelector(".price p");
    var totalElement = row.querySelector(".total p");
    var quantityElement = row.querySelector(".quantity span");

    var price = parseFloat(priceElement.textContent.replace('$', ''));
    var quantity = parseInt(quantityElement.textContent);

    var total = (price * quantity).toFixed(2);
    totalElement.textContent = `$${total}`;
}
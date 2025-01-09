function showTotal() {
    const checkboxes = document.querySelectorAll('input[name="choices"]:checked');
    
    const selectedLabels = Array.from(checkboxes).map(checkbox => {
      const label = document.querySelector(`label[for="${checkbox.id}"]`);
      return label ? label.textContent : '';
    });

    document.getElementById('chosen').textContent = selectedLabels.join(', ');

    const total = calculateTotal(checkboxes);
    document.getElementById('total').textContent = total +",000";

    document.getElementById('resultForm').classList.remove('hidden');
  }

  function calculateTotal(checkboxes) {
    const total = Array.from(checkboxes).reduce((sum, checkbox) => {
      return sum + parseFloat(checkbox.value);
    }, 0);

    return total;
  }
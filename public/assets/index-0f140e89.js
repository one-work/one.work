import { Controller } from '@hotwired/stimulus'

class ExpenseController extends Controller {
  static targets = ['quantity', 'budget_amount', 'price']

  updatePrice(event) {
    let price = event.currentTarget
    let quantity = document.getElementById(price.id.replace('price', 'quantity'))
    let result = (price.value * quantity.value).toFixed(2)

    let budget = document.getElementById(price.id.replace('price', 'budget_amount'))
    if (budget) {
      budget.value = result
    }
    let amount = document.getElementById(price.id.replace('price', 'amount'))
    if (amount) {
      amount.value = result
    }
  }

  updateQuantity(event) {
    let quantity = event.currentTarget
    let price = document.getElementById(quantity.id.replace('quantity', 'price'))
    let result = (price.value * quantity.value).toFixed(2)

    let budget = document.getElementById(quantity.id.replace('quantity', 'budget_amount'))
    if (budget) {
      budget.value = result
    }
    let amount = document.getElementById(quantity.id.replace('quantity', 'amount'))
    if (amount) {
      amount.value = result
    }
  }

}

application.register('expense', ExpenseController)

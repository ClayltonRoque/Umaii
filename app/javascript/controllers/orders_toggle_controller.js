
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["orders", "newOrder", 'buttonCreateOrder', 'buttonListOrders']

    showOrders() {
        this.newOrderTarget.classList.add("hidden")
        this.buttonListOrdersTarget.classList.add("bg-neutral-lighter")
        this.buttonCreateOrderTarget.classList.remove("bg-neutral-lighter")
        this.ordersTarget.classList.remove("hidden")
    }

    showNewOrder() {
        this.buttonCreateOrderTarget.classList.add("bg-neutral-lighter")
        this.ordersTarget.classList.add("hidden")
        this.newOrderTarget.classList.remove("hidden")
        this.buttonListOrdersTarget.classList.remove("bg-neutral-lighter")
    }
}

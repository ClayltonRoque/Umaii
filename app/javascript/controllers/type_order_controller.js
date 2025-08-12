import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["typeInput", "rideBtn", "deliveryBtn", "descriptionInput"]

    connect() {
        this.setActive(this.typeInputTarget.value)
        this.toggleDescription()
    }

    selectRide() {
        this.typeInputTarget.value = "ride"
        this.setActive("ride")
        this.toggleDescription()
    }

    selectDelivery() {
        this.typeInputTarget.value = "delivery"
        this.setActive("delivery")
        this.toggleDescription()
    }
    toggleDescription() {
        if (!this.hasDescriptionInputTarget) return;
        if (this.typeInputTarget.value === "ride") {
            this.descriptionInputTarget.disabled = true;
        } else {
            this.descriptionInputTarget.disabled = false;
        }
    }

    setActive(type) {
        if (type === "ride") {
            this.descriptionInputTarget.classList.add("cursor-not-allowed", "opacity-50")
            this.rideBtnTarget.classList.add("bg-primary-base", "text-white")
            this.rideBtnTarget.classList.remove("bg-neutral-base", "text-neutral-700")
            this.deliveryBtnTarget.classList.remove("bg-primary-base", "text-white")
            this.deliveryBtnTarget.classList.add("bg-neutral-base", "text-neutral-700")
        } else {
            this.descriptionInputTarget.classList.remove("cursor-not-allowed", "opacity-50")
            this.deliveryBtnTarget.classList.add("bg-primary-base", "text-white")
            this.deliveryBtnTarget.classList.remove("bg-neutral-base", "text-neutral-700")
            this.rideBtnTarget.classList.remove("bg-primary-base", "text-white")
            this.rideBtnTarget.classList.add("bg-neutral-base", "text-neutral-700")
        }
    }
}

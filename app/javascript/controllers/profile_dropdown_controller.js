import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["menu"]

    connect() {
        this.open = false;
        document.addEventListener('click', this.closeOnOutsideClick);
    }

    disconnect() {
        document.removeEventListener('click', this.closeOnOutsideClick);
    }

    toggle(event) {
        event.stopPropagation();
        this.open = !this.open;
        this.menuTarget.classList.toggle('opacity-100', this.open);
        this.menuTarget.classList.toggle('visible', this.open);
        this.menuTarget.classList.toggle('opacity-0', !this.open);
        this.menuTarget.classList.toggle('invisible', !this.open);
    }

    closeOnOutsideClick = (event) => {
        if (!this.element.contains(event.target)) {
            this.open = false;
            this.menuTarget.classList.remove('opacity-100', 'visible');
            this.menuTarget.classList.add('opacity-0', 'invisible');
        }
    }
}

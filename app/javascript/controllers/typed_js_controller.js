import { Controller } from "@hotwired/stimulus";
import Typed from "typed.js";

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: [
        "Never forget the best moments of your couch life.",
        "Create lists.",
        "Bookmark your favourite movies.",
      ],
      typeSpeed: 50,
      loop: true,
    });
  }
}

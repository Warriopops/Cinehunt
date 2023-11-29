import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['modal'];
  connect() {
    console.log('coeur');
  }

  showModal(event) {
    const sceneId = this.data.get('sceneId');
    console.log(`${sceneId}`);
    this.modalTarget.style.display = 'block';
  }

  hideModal() {
    this.modalTarget.style.display = 'none';
  }
}

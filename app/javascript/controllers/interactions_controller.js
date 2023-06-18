import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  clicked(event) {
    const targetElement = event.target
    const isDescendantOfAddComment = event.target.closest('.add-comment') !== null;


    if(isDescendantOfAddComment){
      if(targetElement.classList.contains('comment-text'))
        event.preventDefault()
      event.stopPropagation()
      return
    } 

    if(targetElement.classList.contains('add-like')){
      event.preventDefault()

      let siblingForm = targetElement.nextSibling

      while (siblingForm && siblingForm.tagName !== 'FORM') {
        siblingForm = siblingForm.nextElementSibling;
      }

      if(siblingForm && siblingForm.tagName === 'FORM'){
        siblingForm.submit()
      }
      return
    }
  }
}

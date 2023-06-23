import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  clicked(event) {
    const targetElement = event.target;
    const isDescendantOfAddComment =
      event.target.closest('.add-comment') !== null;

    console.log(
      '---- targetElem -----',
      targetElement,
      targetElement.parentElement,
    );
    if (isDescendantOfAddComment) {
      if (targetElement.classList.contains('comment-text'))
        event.preventDefault();
      event.stopPropagation();
      return;
    }

    if (targetElement.classList.contains('add-like')) {
      event.preventDefault();

      let siblingForm = targetElement.nextSibling;

      while (siblingForm && siblingForm.tagName !== 'FORM') {
        siblingForm = siblingForm.nextElementSibling;
      }

      if (siblingForm && siblingForm.tagName === 'FORM') {
        siblingForm.submit();
      }
      return;
    }

    const deleteClasses = targetElement.parentElement.classList;

    if (
      deleteClasses.contains('delete-post') ||
      deleteClasses.contains('delete-comment')
    ) {
      console.log('delete ----------', targetElement.parentElement);
      event.preventDefault();

      targetElement.parentElement.submit();
      return;
    }
  }
}

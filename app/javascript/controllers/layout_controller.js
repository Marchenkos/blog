import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['cursorCircle', 'navMenu', 'mainContent'];

  static classes = ['hide', 'show'];

  connect() {
    if (this.hasCursorCircleTarget) {
      this.pinCircleToCursor(this.cursorCircleTarget);
    }

    // this.navMenuTarget.addEventListener("animationend", function() {
    //   if ($(this.navMenuTarget).hasClass(this.hideClass)) {
    //     $(this.navMenuTarget).hide();
    //   }
    // }.bind(this));
  }

  pinCircleToCursor(circle) {
    const circleWidht = $(circle).width();
    let mouseX = 0;
    let mouseY = 0;
    let xp = 0;
    let yp = 0;

     
    $(document).on('mousemove', function(e) {
      mouseX = e.pageX - circleWidht / 2;
      mouseY = e.pageY - circleWidht / 2; 
    });
      
    setInterval(function() {
      xp += ((mouseX - xp) / 6);
      yp += ((mouseY - yp) / 6);

      $(circle).css({ left: xp +'px', top: yp +'px' });
    }, 20);

  }

  toggleNav() {
    const isNavVisible = $(this.navMenuTarget).is(':visible');

    if (isNavVisible) {
      $(this.navMenuTarget).removeClass(this.showClass).addClass(this.hideClass);
      // $(this.mainContentTarget).removeClass(this.hideClass).addClass('fadeIn 0.5s ease-in-out 1s');
    } else {
      $(this.navMenuTarget).toggle();
      $(this.mainContentTarget).removeClass(this.showClass).addClass(this.hideClass);
      $(this.navMenuTarget).removeClass(this.hideClass).addClass(this.showClass);
    }
  }
}

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['cursorCircle'];

  connect() {
    if (this.hasCursorCircleTarget) {
      this.pinCircleToCursor(this.cursorCircleTarget);
    }
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
}

function mode(cmd) {
  fetch('/mode/' + cmd, {
    method: 'post'
  });
}

function color(r, g, b){
  fetch('/color/' + r + ',' + g + ',' + b, {
    method: 'post'
  });
}


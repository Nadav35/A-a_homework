document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("mycanvas");
  canvas.width = 500;
  canvas.height = 500;
  const ctx = canvas.getContext('2d');

  ctx.fillStyle = 'purple';
  ctx.fillRect(10, 10, 55, 10);

  ctx.beginPath();
  ctx.arc(150, 150, 50, 0, 2 * Math.PI, true);
  ctx.strokeStyle = 'blue';
  ctx.lineWidth = 35;
  ctx.stroke();
  ctx.fillStyle = 'red';
  ctx.fill();
});

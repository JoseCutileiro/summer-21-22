function main() {
	console.log("hello :)")
	var canvas = document.getElementById('example');
	if (!canvas) {
		console.log("Failed to load canvas :( ");
		return;
	}
	var ctx = canvas.getContext('2d');
	ctx.fillStyle = 'rgba(0,255,0,1.0)';
	ctx.fillRect(120,10,10,100);

	ctx.fillStyle = 'rgba(0,255,0,1.0)';
	ctx.fillRect(200,10,100,1000);
}
// a stupid clock in JavaScript
function ora() {
        const oggi = new Date();
        let h = oggi.getHours();
        let m = oggi.getMinutes();
        let s = oggi.getSeconds();
	h = aggZero(h);
        m = aggZero(m);
        s = aggZero(s);
        console.log(h + "." + m + ":" + s);
        setTimeout(ora, 1000);
}
function aggZero(t) {
    if (t < 10) {
        t = "0" + t;
    }
    return t;
}
ora()
//cock 😳
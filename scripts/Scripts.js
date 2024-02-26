function setActive() {
    var active = document.getElementById('menu-content').getElementsByTagName('a');
    var active1 = document.getElementById('menu-content').getElementsByTagName('li');
    for (i = 0; i < active.length; i++) {
        if (document.location.href.indexOf(active[i].href) >= 0) {
            active1[i].classList.add("active");
        }
    }
}
window.onload = setActive();

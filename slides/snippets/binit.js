function addbg() {
    bgimages = [".mdslides/img/image6.jpg", ".mdslides/img/image7.jpg", ".mdslides/img/image8.jpg"];
    [].forEach.call(document.querySelectorAll('section'), function (e) {
        e.setAttribute("data-background-image",
                       bgimages[Math.floor((Math.random() * bgimages.length))]);
        e.setAttribute("data-background-size", "cover");
        e.setAttribute("data-background-position", "right");
    });
}
addbg();

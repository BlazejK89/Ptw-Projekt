$(document).ready(function () {
    $(".obs").on("click", function () {
        const akapit = $(this);
        $.post("admin/add-observer.php", { idobserved: "'" + akapit.data("dzban") + "'" }, function (data) {
            if (data == "sukces") {
                akapit.text((akapit.text() == "Obserwuj") ? "Obserwowany" : "Obserwuj");;
            }
        });
    });
});

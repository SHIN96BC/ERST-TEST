
$(document).ready(function () {
    $.ajax({
        url: "/solution/menu",
        type: "POST",
        success: function (solutionList) {
            for(let solution of solutionList) {
                let solutionLiTag = `
                    <li><a href="/solution/content?id=${solution.id}">${solution.name}</a></li>
                `;
                $('.menu02').children('.submenu').append(solutionLiTag);
            }
        }
    })
});
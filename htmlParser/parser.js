
// 推荐书标题
function getRecBookTitls() {
    var results = [];
    $(".article").each(function (index) {
        var attr = {};
        var className = $("h2.title span",this).text();
        var els = $("div.block ul li",this);

        var books = [];
        $(els).each(function(index) {
            var allTitle = $(this).text();
            var bookname = $("a",this).text();
            var author   = $("span",this).text();
            var path     = $("a",this).attr("href");

            var book = {};
            book.allTitle = allTitle;
            book.bookname = bookname;
            book.author   = author;
            book.path     = path;

            books.push(book);
        });

        attr.books = books;
        attr.className = className;

        results.push(attr);
    });
    return  JSON.stringify(results);

    // $("div.block ul li",$("div.article")).text();
}

function getCatogery() {
    return $(".hot");
}


function help() {
    return JSON.stringify({
        "获取首页书籍列表":"getRecBookTitls",
        "获取所有分类":"getCatogery",
    });
}

// $("div.article").each(function(index) { console.log($($("div.block ul li",this)[0]).text()) })

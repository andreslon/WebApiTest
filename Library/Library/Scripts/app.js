var ViewModel = function () {
    var self = this;
    self.books = ko.observableArray();
    self.error = ko.observable();
    self.detail = ko.observable();
    self.authors = ko.observableArray();
    self.categories = ko.observableArray();
    self.newBook = {
        Author: ko.observable(),
        Category: ko.observable(),
        Title: ko.observable(),
        Year: ko.observable()
    }

    var booksUri = '/api/books/';
    var authorsUri = '/api/authors/';
    var categoriesUri = '/api/categories/';

    function ajaxHelper(uri, method, data) {
        self.error(''); // Clear error message
        return $.ajax({
            type: method,
            url: uri,
            dataType: 'json',
            contentType: 'application/json',
            data: data ? JSON.stringify(data) : null
        }).fail(function (jqXHR, textStatus, errorThrown) {
            self.error(errorThrown);
        });
    }

    function getAllBooks() {
        ajaxHelper(booksUri, 'GET').done(function (data) {
            self.books(data);
        });
    }

    self.getBookDetail = function (item) {
        ajaxHelper(booksUri + item.Id, 'GET').done(function (data) {
            self.detail(data);
        });
    }

    function getAuthors() {
        ajaxHelper(authorsUri, 'GET').done(function (data) {
            self.authors(data);
        });
    }
    function getCategories() {
        ajaxHelper(categoriesUri, 'GET').done(function (data) {
            self.categories(data);
        });
    }


    self.addBook = function (formElement) {

        var book = {
            AuthorId: self.newBook.Author().Id,
            CategoryId: self.newBook.Category().Id,
            Title: self.newBook.Title(),
            Year: self.newBook.Year()
        };

        ajaxHelper(booksUri, 'POST', book).done(function (item) {
            //self.books.push(item);
            getAllBooks();
        });
    }

    // Fetch the initial data.
    getAllBooks();
    getAuthors();
    getCategories();
};

ko.applyBindings(new ViewModel());
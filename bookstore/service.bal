import ballerina/graphql;

type BookDetails record {|
   string title;
   int published_year;
   string isbn;
   string name;
   string country;
|};

type VolumeInfo record {
    int averageRating?;
    int ratingsCount?;
};

type BookReviews record {
    record {
        VolumeInfo volumeInfo;
    }[] items;
};

service class Book {
    private final readonly & BookDetails bookDetails;

    function init(BookDetails bookDetails) {
        self.bookDetails = bookDetails.cloneReadOnly();
    }

    resource function get title() returns string|error {
        return self.bookDetails.title;        
    }

    resource function get isbn() returns string|error{
        return self.bookDetails.isbn;
    }

    resource function get published_year() returns int|error {
        return self.bookDetails.published_year;
    }

    resource function get author/country() returns string|error {
        return self.bookDetails.country;
    }

    resource function get author/name() returns string|error {
        return self.bookDetails.name;
    }

}


service /bookstore on new graphql:Listener(9000) {

    resource function get allBooks() returns Book[] {
        return getBooks(());
    }

    resource function get bookByName(string title) returns Book[] {
        return getBooks(title);
    }
}


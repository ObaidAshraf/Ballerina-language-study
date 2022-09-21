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

}


service /bookstore on new graphql:Listener(9000) {
    resource function get allBooks() returns Book[] {
        return getBooks(());
    }
}


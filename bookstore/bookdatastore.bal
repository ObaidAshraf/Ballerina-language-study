import ballerina/sql;
import ballerinax/mysql;
// import ballerina/http;

configurable string USER = ?;
configurable string PASSWORD = ?;
configurable string HOST = ?;
configurable int PORT = ?;
configurable string DATABASE = ?;

final mysql:Client dbClient = check new(host=HOST, user=USER, password=PASSWORD, port=PORT, database=DATABASE);

function getBooks(string? bookTitle) returns Book[] {
    sql:ParameterizedQuery query = `SELECT b.title, b.published_year, b.isbn, a.name, a.country  
                                    FROM BOOK b left join AUTHOR a on b.author_id=a.author_id `;

    if bookTitle is string {
        query = sql:queryConcat(query, ` where b.title=${bookTitle}`);
    }

    stream<BookDetails, error?> resultStream = dbClient->query(query);

    BookDetails[]|error? bookRecords = from var {title, published_year, isbn, name, country} in resultStream
    select {
        title: title,
        published_year: published_year,
        isbn: isbn,
        name: name,
        country: country
    };

    Book[] books = [];
    if bookRecords is BookDetails[] {
        books = bookRecords.map(br => new Book(br));
    }
    
    return books;

}

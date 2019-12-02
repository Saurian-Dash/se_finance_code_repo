// Nested functions

// You can treat a single step within a query as a self-contained sub-query, or convert
// it into a Custom Function by adding parameters. In this example, I'm passing a column
// containing text to the function, the function will then split the text at various
// points and contruct a proper date out of the components.

// Input text: COMPONENT_BOOKINGS_01 15-02-19 0101.CSV
// Output datetime: 15/02/2019 01:01:00

(text_field as text) =>
let
    year = Number.From("20" & Text.BetweenDelimiters(text_field, "-", " ", 1, 0)),
    month = Number.From(Text.BetweenDelimiters(text_field, "-", "-", 0, 0)),
    day = Number.From(Text.BetweenDelimiters(text_field, " ", "-")),
    hour = Number.From(Text.Start(Text.BetweenDelimiters(text_field, " ", ".", 1, 0), 2)),
    minute = Number.From(Text.End(Text.BetweenDelimiters(text_field, " ", ".", 1, 0), 2)),
    second = 0,
    timestamp = #datetime(year, month, day, hour, minute, second)
in
    timestamp

// Note: Notice how the year element of the Input text does not include the "20" of
// "2019". As Text.BetweenDelimiters returns a string data type, we can concatenate the
// result onto the string "20" with the "&" operator.

// Note: The word "datetime" is a reserved keyword, so I have used the word "timestamp"
// to refer to that step.

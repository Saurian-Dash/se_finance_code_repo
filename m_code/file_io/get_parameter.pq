// this function will return a text representation of the value present in
// any named range present in the current Excel workbook.

// ARGS ::
// named_range | type: text

// USAGE EXAMPLE ::
// import_path = get_parameter("import_path")

// TIPS ::
// when your named_range contains a date, you can parse it using one
// of Power Query's built in Date conversion functions:
// import_date = Date.FromText(get_parameter("import_date"))


(named_range as text) =>
let
    parameter =
        try Excel.CurrentWorkbook(){[Name=named_range]}[Content]{0}[Column1]
        otherwise "Error: Named range does not exist"
in
    parameter

// This function will return a text representation of the value present in
// any named range present in the current Excel workbook. If the named
// range does not exist, then an Error record will be returned.

// Args:
// named_range (text): The name of the Excel named range in text format.

// Usage Example:
// import_path = get_parameter("import_path")

// Tips:
// If your named_range contains a date, you can parse it using one of Power
// Power Query's built in Date conversion functions:
// import_date = Date.FromText(get_parameter("import_date"))


(named_range as text) =>
let
    parameter =
        try Excel.CurrentWorkbook(){[Name=named_range]}[Content]{0}[Column1]
in
    if parameter[HasError] then parameter[Error] else parameter[Value]

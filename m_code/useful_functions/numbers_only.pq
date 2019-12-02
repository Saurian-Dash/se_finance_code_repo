// Customer function to remove all non-numeric characters from a string. If you pass a column in
// as Source, this function will iterate over the column and remove all non-numeric characters.

(source) => 
let
    numbers_only = (char) => if Character.ToNumber(char) >=48 and Character.ToNumber(char) < 58 then char else "",
    string = Text.From(source)
    len = Text.Length(string),
    acc = List.Accumulate(
        List.Generate( () => 0, each _ < len, each _ + 1), 
            "", 
            (acc, index) => acc & numbers_only(Text.At(string, index))
    ),
    as_number = Number.FromText(acc)
in
    as_number

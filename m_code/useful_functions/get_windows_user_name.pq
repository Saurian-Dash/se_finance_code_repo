// Returns current Windows system user by iterating over the Users listed in "C:/Users"
// and extracting the record with the latest [Date accessed] timestamp. It is certain
// this record will either be the current User or the last User who accessed the computer.

let
    users = Folder.Contents("C:/Users"),
    current_user = Table.FirstN(Table.Sort(users,{{"Date accessed", Order.Descending}}),1)[Name]{0}
in
    current_user

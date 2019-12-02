// chars_to_remove generates a list of all non-numeric ASCII characters.
// You can then pass chars_to_remove and a [COLUMN_NAME] to Text.Remove
// to strip out any non-numeric characters that appear in [COLUMN_NAME].

let
    chars_to_remove = List.Transform({32, 33..45,46, 47,58..126}, each Character.FromNumber(_)),
    remove_chars = Text.Remove([COLUMN_NAME], chars_to_remove)
in
    remove_chars

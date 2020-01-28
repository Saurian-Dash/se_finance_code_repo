// You can transform columns in place with this pattern.

// Note that you can refer to the current row with the
// "_" character, you can even pass "_" into a function:
Table.TransformColumns(
    reference_to_previous_step,
    {
        {
            "column_name_to_transform",
            each if _ <> null then some_function(_) else null,
            type datetime
        }
    }
)

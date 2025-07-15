-- DROP FUNCTION print_board(integer[]);
CREATE OR REPLACE FUNCTION print_board(board INTEGER[][]) RETURNS SETOF TEXT AS $$
DECLARE
    row_text TEXT;
    i INTEGER;
    j INTEGER;
BEGIN
    -- Print the top border
    RETURN NEXT '-------------------------';

    FOR i IN 1..9 LOOP
        row_text := '|';
        FOR j IN 1..9 LOOP
            IF board[i][j] = 0 THEN
                row_text := row_text || ' . '; -- Use '.' for empty cells
            ELSE
                row_text := row_text || ' ' || board[i][j] || ' ';
            END IF;

            IF j % 3 = 0 AND j <> 9 THEN -- Add a vertical divider every 3 columns
                row_text := row_text || '|';
            END IF;
        END LOOP;
        row_text := row_text || '|';
        RETURN NEXT row_text;

        IF i % 3 = 0 AND i <> 9 THEN -- Add a horizontal divider every 3 rows
            RETURN NEXT '-------------------------';
        END IF;
    END LOOP;
    -- Print the bottom border
    RETURN NEXT '-------------------------';
    RETURN; -- End of function, no value returned for SETOF
END;
$$ LANGUAGE plpgsql;


DO $$
DECLARE initial_sudoku_board INTEGER[][] := ARRAY[
        [5, 3, 0, 0, 7, 0, 0, 0, 0],
        [6, 0, 0, 1, 9, 5, 0, 0, 0],
        [0, 9, 8, 0, 0, 0, 0, 6, 0],
        [8, 0, 0, 0, 6, 0, 0, 0, 3],
        [4, 0, 0, 8, 0, 3, 0, 0, 1],
        [7, 0, 0, 0, 2, 0, 0, 0, 6],
        [0, 6, 0, 0, 0, 0, 2, 8, 0],
        [0, 0, 0, 4, 1, 9, 0, 0, 5],
        [0, 0, 0, 0, 8, 0, 0, 7, 9]
    ];
    sudoku_row TEXT;
BEGIN 
    FOR sudoku_row IN SELECT * FROM print_board(initial_sudoku_board) LOOP
        RAISE NOTICE '%', sudoku_row;
    END LOOP;
END;
$$ LANGUAGE plpgsql;
    -- Call the print_board function and iterate through the returned rows




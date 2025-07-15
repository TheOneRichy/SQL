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
    empty_cell RECORD;
    is_it_valid BOOLEAN;

BEGIN 
    -- SELECT * INTO empty_cell FROM find_empty(initial_sudoku_board);
    -- -- Access the fields using the column names returned by find_empty function
    -- RAISE NOTICE 'Coord: %', empty_cell;

    SELECT * INTO is_it_valid FROM is_valid(initial_sudoku_board, 2, (1,4));
    -- Access the fields using the column names returned by find_empty function
    RAISE NOTICE '%', is_it_valid;


    FOR sudoku_row IN SELECT * FROM print_board(initial_sudoku_board) LOOP
        RAISE NOTICE '%', sudoku_row;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- DO $$
-- DECLARE 
--     x INTEGER;
--     x_x INTEGER;

-- BEGIN
--     x := FLOOR(1/3);
--     RAISE NOTICE '%', x;
-- END;
-- $$ LANGUAGE plpgsql;
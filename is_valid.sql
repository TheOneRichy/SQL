CREATE OR REPLACE FUNCTION is_valid(board INTEGER[][], num INT, pos RECORD) RETURNS BOOLEAN AS $$
DECLARE
    is_valid BOOLEAN;
    i INTEGER;
    j INTEGER;
    start_col INTEGER;
    start_row INTEGER;

BEGIN
    --Check the row
    FOR i IN 1..9 LOOP
        IF board[pos.f1][i] = num AND pos.f2 <> i THEN
            RETURN FALSE;
        END IF;
    END LOOP;

    -- --Check the column
    FOR i IN 1..9 LOOP
        IF board[pos.f1][1] = num AND pos.f1 <> i THEN
            RETURN FALSE;
        END IF;
    END LOOP;

    --Check 3x3 Box
    start_col := FLOOR((pos.f2 - 1) / 3) * 3 + 1;
    start_row := FLOOR((pos.f1 - 1) / 3) * 3 + 1;
    

    FOR i IN ((start_row*3))..((start_row*3) + 3) LOOP
        FOR j IN ((start_col*3))..((start_col*3) + 3) LOOP
        RAISE NOTICE 'Checking box position (%,%): value=%', i, j, board[i][j];
            IF board[i][j] = num AND (i,j) <> pos THEN
                RETURN FALSE;
            END IF;
        END LOOP;
    END LOOP;

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

;





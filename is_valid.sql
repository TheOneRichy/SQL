CREATE OR REPLACE FUNCTION is_valid(board INTEGER[][], num INT, pos RECORD) RETURNS BOOLEAN AS $$
DECLARE
    is_valid BOOLEAN;
    i INTEGER;
    j INTEGER;
    box_x INTEGER;
    box_y INTEGER;
    box_range_x INTEGER;
    box_range_y INTEGER;
BEGIN
    --Check the row
    -- FOR i IN 1..9 LOOP
    --     IF board[pos.f1][i] = num AND pos.f2 <> i THEN
    --         RETURN FALSE;
    --     END IF;
    -- END LOOP;

    -- --Check the column
    -- FOR i IN 1..9 LOOP
    --     IF board[pos.f1][1] = num AND pos.f1 <> i THEN
    --         RETURN FALSE;
    --     END IF;
    -- END LOOP;

    --Check 3x3 Box
    box_x := FLOOR((pos.f2)/3);
    box_y := FLOOR((pos.f1)/3);
    
    FOR i IN ((box_y*3))..((box_y*3) + 3) LOOP
        FOR j IN ((box_x*3))..((box_x*3) + 3) LOOP
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





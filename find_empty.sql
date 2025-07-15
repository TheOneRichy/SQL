CREATE OR REPLACE FUNCTION find_empty(board INTEGER[][]) RETURNS TABLE(i INTEGER, j INTEGER) AS $$
DECLARE 
    i INTEGER;
    j INTEGER;
BEGIN
    FOR i IN 1..9 LOOP
        FOR j IN 1..9 LOOP
            IF board[i][j] = 0 THEN
                RETURN QUERY SELECT i, j;
            END IF;
        END LOOP;
    END LOOP;
END;
$$ LANGUAGE plpgsql;


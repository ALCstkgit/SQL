DO $$
DECLARE nombre varchar(30) := 'Juan Lopez';
BEGIN
RAISE NOTICE 'Hola %', nombre;
END $$ LANGUAGE 'plpgsql';
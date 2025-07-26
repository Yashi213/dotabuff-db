DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1
      FROM pg_catalog.pg_roles
     WHERE rolname = '${DB_ADMIN_USER}'
  ) THEN
    EXECUTE format(
      'CREATE ROLE %I LOGIN CREATEDB PASSWORD %L',
      '${DB_ADMIN_USER}',
      '${DB_ADMIN_PASSWORD}'
    );
  END IF;
END
$$;
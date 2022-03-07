BEGIN;
UPDATE cuentas SET balance = balance - 1000 WHERE numero_cuenta = 2;
UPDATE cuentas SET balance = balance + 1000 WHERE numero_cuenta = 1;
ROLLBACK;
COMMIT;
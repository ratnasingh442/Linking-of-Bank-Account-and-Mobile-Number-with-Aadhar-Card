CREATE PROCEDURE show_balance (account_no NUMBER,balan out NUMBER)
AS
BEGIN
SELECT balance INTO balan FROM account WHERE accountno = account_no;
END;

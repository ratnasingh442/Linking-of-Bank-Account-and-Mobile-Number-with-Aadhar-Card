CREATE PROCEDURE show_balance (account_no NUMBER,balan out NUMBER)
AS
BEGIN
SELECT balance INTO balan FROM account WHERE accountno = account_no;
END;
DECLARE
bal number;
BEGIN
show_balance(&accno,bal);
dbms_output.put_line(bal);
END;
CREATE PROCEDURE close_account (account_no NUMBER)
AS
BEGIN
DELETE FROM account WHERE accountno = account_no;
END;
DECLARE
e number;
BEGIN
e:= :ACCOUNTNO;
close_account(e);
END;
DECLARE
votingst vote.votingstatus%type;
region aadhar.address%type;
age1 aadhar.age%type;
aadhar_no aadhar.aadharno%type;
BEGIN
aadhar_no:=&aadhaar;
SELECT votingstatus INTO votingst FROM vote WHERE aadharno=aadhar_no;
SELECT address,age INTO region,age1 FROM aadhar WHERE aadharno=aadhar_no;
IF (age1>=18 and region='hissar' and votingst=0)
THEN
DBMS_OUTPUT.PUT_LINE('Resident eligible to give vote');
UPDATE vote SET votingstatus=1 WHERE aadharno=aadhar_no;
ELSE
DBMS_OUTPUT.PUT_LINE('Resident not eligible to vote');
END IF;
END;

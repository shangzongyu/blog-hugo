# Document Title

```sql
CREATE TABLE `user` (
	`id` INT ( 20 ) NOT NULL AUTO_INCREMENT,
	`primary_key` VARCHAR ( 20 ),
	`first_name` VARCHAR ( 20 ),
	`last_name` VARCHAR ( 20 ),
	`dob` VARCHAR ( 20 ),
	`email` VARCHAR ( 20 ),
PRIMARY KEY ( `id` ) USING BTREE 
);
```

```sql
-- user.sql

-- query: FindUserById
SELECT first_name,
       last_name,
       dob,
       email
  FROM user
 WHERE id = :id;

-- query: UpdateFirstNameById
UPDATE user
   SET first_name = :first_name
 WHERE id = :id;

-- query: DeleteUserById
DELETE FROM user WHERE id = :id;
```


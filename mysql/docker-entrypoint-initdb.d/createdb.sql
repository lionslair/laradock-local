#
# Copy createdb.sql.example to createdb.sql
# then uncomment then set database name and username to create you need databases
#
# example: .env MYSQL_USER=appuser and needed db name is myshop_db
#
#    CREATE DATABASE IF NOT EXISTS `myshop_db` ;
#    GRANT ALL ON `myshop_db`.* TO 'appuser'@'%' ;
#
#
# this sql script will auto run when the mysql container starts and the $DATA_PATH_HOST/mysql not found.
#
# if your $DATA_PATH_HOST/mysql exists and you do not want to delete it, you can run by manual execution:
#
#     docker-compose exec mysql bash
#     mysql -u root -p < /docker-entrypoint-initdb.d/createdb.sql
#

CREATE DATABASE IF NOT EXISTS `homestead` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `homestead`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `q` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `q`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `screensavers` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `screensavers`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `greeta` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `greeta`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `greeta_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `greeta_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `taskey` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `taskey`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `taskey_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `taskey_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `taskey_dusk` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `taskey_dusk`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `surprise` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `surprise`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `surprise_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `surprise_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `laravel_websockets` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `laravel_websockets`.* TO 'homestead'@'%' ;

FLUSH PRIVILEGES ;

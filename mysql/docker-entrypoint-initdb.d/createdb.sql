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

CREATE DATABASE IF NOT EXISTS `greeta_wordpress` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `greeta_wordpress`.* TO 'homestead'@'%' ;

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

CREATE DATABASE IF NOT EXISTS `myoffer` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `myoffer`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `myoffer_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `myoffer_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `flooringlab` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `flooringlab`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `flooringlab_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `flooringlab_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `macuport` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `macuport`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `macuport_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `macuport_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `bestratedtransport` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `bestratedtransport`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `bestratedtransport_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `bestratedtransport_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `customerplus` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `customerplus`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `customerplus_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `customerplus_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `leeelectrix` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `leeelectrix`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `leeelectrix_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `leeelectrix_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `esg` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `esg`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `esg_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `esg_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `defex` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `defex`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `defex_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `defex_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `acn` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `acn`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `acn_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `acn_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `misura` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `misura`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `misura_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `misura_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `washed` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `washed`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `washed_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `awashed_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `wrapstudio` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `wrapstudio`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `wrapstudio_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `wrapstudio_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `kanopi` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `kanopi`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `kanopi_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `kanopi_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `ombord` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `ombord`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `ombord_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `ombord_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `dynamicts` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `dynamicts`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `dynamicts_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `dynamicts_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `edge_stealth` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `edge_stealth`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `edge_stealth_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `edge_stealth_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `premax` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `premax`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `premax_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `premax_testing`.* TO 'homestead'@'%' ;

FLUSH PRIVILEGES ;

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

CREATE DATABASE IF NOT EXISTS `laravel_websockets` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `laravel_websockets`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `myoffer` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `myoffer`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `flooringlab_central` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `flooringlab_central`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `flooringlab_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `flooringlab_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `macuport` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `macuport`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `bestratedtransport` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `bestratedtransport`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `customerplus` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `customerplus`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `leeelectrix` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `leeelectrix`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `honestysnacks` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `honestysnacks`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `mandoleorchard` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `mandoleorchard`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `esg` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `esg`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `defex` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `defex`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `acn` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `acn`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `misura` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `misura`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `washed` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `washed`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `wrapstudio` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `wrapstudio`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `kanopi` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `kanopi`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `ombord` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `ombord`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `dynamicts` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `dynamicts`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `edge_stealth` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `edge_stealth`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `premax` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `premax`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `m2electrical` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `m2electrical`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `wpe` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `wpe`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `kontrastinteriors` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `kontrastinteriors`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `ephire_test` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `ephire_test`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `phs_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `phs_testing`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `phs_webapp` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `phs_webapp`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `video_inspection` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `video_inspection`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `cabmaster` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `cabmaster`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `mlily` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `mlily`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `asiamarketentry` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `asiamarketentry`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `rpgroup` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `rpgroup`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `dcodegroup` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `dcodegroup`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `latrobegarmin` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `latrobegarmin`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `xconnect` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `xconnect`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `melbourneacl` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `melbourneacl`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `ipg` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `ipg`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `agushi` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `agushi`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `mountaindistilling` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `mountaindistilling`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `gradcon` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `gradcon`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `evolutionelectrical` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `evolutionelectrical`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `staircaseconstructions` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `staircaseconstructions`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `cambium` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `cambium`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `edge_website` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `edge_website`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `enqip` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `enqip`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `connectedcommercial` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `connectedcommercial`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `project_starter` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `project_starter`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `jetstream` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `jetstream`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `strata` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `strata`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `loveusoap` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `loveusoap`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `koala` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `koala`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `stinkybins` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `stinkybins`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `senseofself` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `senseofself`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `aheevastatus` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `aheevastatus`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `visyproductcatalogue` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `visyproductcatalogue`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `senseofself_accuity` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `senseofself_accuity`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `theloom` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `theloom`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `design-system` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `design-system`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `tallied` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `tallied`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `precision` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `precision`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `cjz` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `cjz`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `aluline` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `aluline`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `forge` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `forge`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `rhianandnathan` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `rhianandnathan`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `mailgun` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `mailgun`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `shlink` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `shlink`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `urlhub` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `urlhub`.* TO 'homestead'@'%' ;

FLUSH PRIVILEGES ;

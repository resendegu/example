<?php
/**
 * The following functions are used by the extension engine to generate a new table
 * for the plugin / destroy it on removal.
 */



/**
 * This function is called on installation and is used to 
 * create database schema for the plugin
 */
function extension_install_outputget()
{
    $commonObject = new ExtensionCommon;

    $commonObject -> sqlQuery(
        "CREATE TABLE IF NOT EXISTS `outputget` (
        ID INT(11) NOT NULL AUTO_INCREMENT, 
        HARDWARE_ID INT(11) NOT NULL,
        FILE_NAME VARCHAR(255) NOT NULL,
        OUTPUT_RESULT VARCHAR(255) DEFAULT NULL,
        LAST_MODIFIED DATETIME DEFAULT NULL,
        CREATED_AT DATETIME DEFAULT NULL,
        PRIMARY KEY (ID,HARDWARE_ID)) ENGINE=INNODB;"
    );
}

/**
 * This function is called on removal and is used to 
 * destroy database schema for the plugin
 */
function extension_delete_outputget()
{
    $commonObject = new ExtensionCommon;
    $commonObject -> sqlQuery("DROP TABLE IF EXISTS `outputget`");
}

/**
 * This function is called on plugin upgrade
 */
function extension_upgrade_outputget()
{

}

?>
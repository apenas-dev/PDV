<?php

class Database
{
    private static $instance = null;

    private function __construct()
    {
    }
    private function __clone()
    {
    }

    public static function getInstance(): PDO
    {
        if (self::$instance === null) {
            $dbFile = BASE_PATH . '/database.sqlite';
            $dbExists = file_exists($dbFile);

            self::$instance = new PDO('sqlite:' . $dbFile, null, null, [
                PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            ]);

            // Habilitar chaves estrangeiras no SQLite
            self::$instance->exec('PRAGMA foreign_keys = ON;');

            if (!$dbExists) {
                $sqlFile = BASE_PATH . '/banco_sqlite.sql';
                if (file_exists($sqlFile)) {
                    $sql = file_get_contents($sqlFile);
                    self::$instance->exec($sql);
                }
            }
        }

        return self::$instance;
    }
}

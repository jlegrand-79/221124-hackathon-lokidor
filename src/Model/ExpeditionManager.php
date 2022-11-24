<?php

namespace App\Model;

use PDO;

class ExpeditionManager extends AbstractManager
{
    public const TABLE = 'expedition';

    public function getExpeditions(): array
    {
        $query = "SELECT e.date, e.time, e.price, d.planet_name, d.image, s.name, s.picture 
        FROM expedition AS e JOIN destination AS d ON destination_id=d.id JOIN shuttle AS s ON shuttle_id=s.id;";

        return $this->pdo->query($query)->fetchAll();
    }
}

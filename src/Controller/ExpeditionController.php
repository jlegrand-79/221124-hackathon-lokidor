<?php

namespace App\Controller;

use App\Model\ExpeditionManager;

class ExpeditionController extends AbstractController
{
    public function getAllexpeditions(): string
    {
        if ($_SERVER['REQUEST_METHOD'] === "POST") {
            $reservation = array_map('trim', $_POST);
            $reservation['travel'] = explode(',', $reservation['travel']);
        }

        $expeditionManager = new ExpeditionManager();
        $expeditions = $expeditionManager->getExpeditions();

        return $this->twig->render('Reservation/reservation.html.twig', ['expeditions' => $expeditions]);
    }
}

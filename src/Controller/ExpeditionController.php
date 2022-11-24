<?php

namespace App\Controller;

use App\Model\ExpeditionManager;

class ExpeditionController extends AbstractController
{
    public function getAllexpeditions(): string
    {
        $expeditionManager = new ExpeditionManager();
        $expeditions = $expeditionManager->getExpeditions();

        return $this->twig->render('Reservation/reservation.html.twig', ['expeditions' => $expeditions]);
    }
}

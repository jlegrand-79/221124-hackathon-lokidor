<?php

namespace App\Controller;

use App\Model\DestinationManager;

class DestinationController extends AbstractController
{
    public function getAllDestinations(): string
    {
        $destinationManager = new DestinationManager();
        $destinations = $destinationManager->selectAll();

        return $this->twig->render('Destination/destination.html.twig', ['destinations' => $destinations]);
    }
}

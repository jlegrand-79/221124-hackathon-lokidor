<?php

namespace App\Controller;

use App\Model\DestinationManager;

class DestinationController extends AbstractController
{
    public function getAllDestinations(): string
    {
        $destinationManager = new DestinationManager();
        $destinations = $destinationManager->selectAll();

        return $this->twig->render('Destination/index.html.twig', ['destinations' => $destinations]);
    }

    public function show(int $id): string
    {
        $destinationManager = new DestinationManager();
        $destination = $destinationManager->selectOneById($id);
        return $this->twig->render('Destination/show.html.twig', ['destination' => $destination]);
    }
}

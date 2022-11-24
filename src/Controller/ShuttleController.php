<?php

namespace App\Controller;

use App\Model\ShuttleManager;

class ShuttleController extends AbstractController
{
    /**
     * List items
     */
    public function index(): string
    {
        $shuttleManager = new ShuttleManager();
        $shuttles = $shuttleManager->selectAll('speed', 'DESC');

        return $this->twig->render('Shuttle/index.html.twig', ['shuttles' => $shuttles]);
    }
}

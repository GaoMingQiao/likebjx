<?php

namespace App\Controller;

use App\Entity\Category;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class PartialController extends AbstractController{

#[Route('/nav', name: 'show_nav')]
public function showNav(ManagerRegistry $doctrine): Response
{   $categories = $doctrine->getRepository(Category::class)->findAll();

    return $this->render('partials/nav.html.twig', [
        'categories' => $categories
    ]);
}
}
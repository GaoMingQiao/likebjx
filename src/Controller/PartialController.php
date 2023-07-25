<?php

namespace App\Controller;

use App\Entity\Category;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class PartialController extends AbstractController{

#[Route('/nav', name: 'show_nav')]
public function showNav(ManagerRegistry $doctrine): Response
{   
    $categories = $doctrine->getRepository(Category::class)->findAll();
    
    // if ($request->get("search")) {
    //     dd($request->get("search"));
        
    // }
    return $this->render('partials/nav.html.twig', [
        'categories' => $categories
    ]);
}

#[Route('/search', name: 'search')]
public function search(Request $request)
{       
    if ($request->get("keyword")) {
         $produitSearch = $request->get("keyword");
        
    }
    return new Response();
}

}
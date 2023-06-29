<?php

namespace App\Controller;

use App\Entity\Produit;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ProduitController extends AbstractController
{
    #[Route('/produit/list', name: 'produit_list')]
    public function list(ManagerRegistry $doctrine): Response
    {   
        $produits = $doctrine->getRepository(Produit::class)->findAll();
        return $this->render('produit/list.html.twig', [
            'produits' => $produits,
        ]);
    }
    #[Route('/produit/show/{id}', name: 'produit_show')]
    public function index(ManagerRegistry $doctrine, $id): Response
    {   
        $produit = $doctrine->getRepository(Produit::class)->find($id);
        return $this->render('produit/show.html.twig', [
            'produit' => $produit,
        ]);
    }
    #[Route('/produit/{prix}', name:'produit_prix')]
    public function produitByPrix(ManagerRegistry $doctrine, $prix)
    {
        $repository = $doctrine->getRepository(Produit::class);
        $produits = $repository->findByPrix($prix);
        return $this->render('produit/lista.html.twig',[
            'produits'=>$produits
        ]);

    }
    #[Route('/produit/category/{id}', name:'produit_category')]
    public function produitByCategory(ManagerRegistry $doctrine, $id)
    {
        $repository = $doctrine->getRepository(Produit::class);
        $produits = $repository->findByCategory($id);
        return $this->render('produit/lista.html.twig',[
            'produits'=>$produits
        ]);

    }
    
}

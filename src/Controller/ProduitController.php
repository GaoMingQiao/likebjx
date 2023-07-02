<?php

namespace App\Controller;

use App\Entity\Produit;
use App\Entity\Category;
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
    #[Route('/produit/category/{id}', name:'produitByCategory')]
    public function produitByCategory(ManagerRegistry $doctrine, $id)
    {
        $repository = $doctrine->getRepository(Produit::class);
        $repositoryCategory = $doctrine->getRepository(Category::class);
        $category = $repositoryCategory->find($id);

        $produits = $repository->findByCategory($id);
        return $this->render('produit/lista.html.twig',[
            'produits'=>$produits,
            'category'=>$category
        ]);

    }
    #[Route('/produit/latest', name:'produitLatest')]
    public function produitLatest(ManagerRegistry $doctrine)
    {
     $repository = $doctrine->getRepository(Produit::class);
     $produits = $repository->findLatest();
     return $this->render('produit/_listLatest.html.twig',[
        'produits'=>$produits
     ]);
    }
    
}

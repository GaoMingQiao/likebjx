<?php

namespace App\Controller;

use DateTime;
use App\Entity\Commande;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class OrderController extends AbstractController
{   private $entityManager;
    function __construct(ManagerRegistry $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/commande/list', name: 'commande_list')]
    public function index(): Response
    {
        return $this->render('order/index.html.twig', [
            'controller_name' => 'OrderController',
        ]);
    }
    #[Route('/commande/new/{adresseId}', name: 'commande_new')]
    public function newCommande(ManagerRegistry $doctrine,Request $request): Response
    {   $adresseId = $request->attributes->get('adresseId');
        $date = new \DateTime();
        $commande = new Commande();
        $commande->setUser($this->getUser());
        $commande->setDatetime($date);
        $commande->setAdresseId($adresseId);
        $commande->setStatut('not_paid');

        $doctrine->getManager()->persist($commande);
        $doctrine->getManager()->flush($commande);
        
        
        return $this->render('order/add.html.twig', [
            'adresse' => $adresseId,
            
        ]);
    }
}

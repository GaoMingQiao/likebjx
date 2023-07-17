<?php

namespace App\Controller;

use DateTime;
use App\Entity\Adresse;
use App\Entity\Produit;
use App\Entity\Commande;
use App\Entity\DetailCommande;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class OrderController extends AbstractController
{   

    #[Route('/commande/list', name: 'commande_list')]
    public function index(ManagerRegistry $doctrine): Response
    {  
        $idUser = $this->getUser()->getId();
        $commandes = $doctrine->getRepository(Commande::class)->findBy(["userId"=>$idUser], array('id'=>'asc'), null, null);
      
        return $this->render('order/index.html.twig', [
            'commandes' => $commandes
        ]);
    
    }
    #[Route('/commande/show/{id}', name: 'commande_show')]
    public function show(ManagerRegistry $doctrine,$id): Response
    {  
        $commande = $doctrine->getRepository(Commande::class)->find($id);
        $detailCommandes = $commande->getDetailCommandes();
        foreach($commande->getDetailCommandes() as $detailCommande)
        return $this->render('order/show.html.twig', [
             'commande' => $commande,
            'detailCommandes'=>$detailCommandes,
            'detailCommande'=>$detailCommande,
            'user'=>$commande->getUser()
        ]);
    }
    #[Route('/commande/new/{adresseId}', name: 'commande_new')]
    public function newCommande(ManagerRegistry $doctrine,Request $request, SessionInterface $session): Response
    {   $adresseId = $request->attributes->get('adresseId');
        $adresse = $doctrine->getRepository(Adresse::class)->find($adresseId);
        
        $date = new \DateTime();
        $commande = new Commande();
        $commande->setUser($this->getUser());
        $commande->setDatetime($date);
        $commande->setAdresseId($adresseId);
        $commande->setStatut('not_paid');
        $commande->setAdresse($adresse);
        $doctrine->getManager()->persist($commande);
        $rows = [];
        $total = 0;
        $panier = $session->get('panier',[]);
        foreach($panier as $id=>$quantity)
        {
            $rows[] = [
                "product"=>$produit=$doctrine->getRepository(Produit::class)->find($id),
                "quantity"=>$quantity
            ];
      
            $detailCommande = new DetailCommande();
             $detailCommande->setCommande($commande);
            $detailCommande->setProduit($produit);
            $detailCommande->setQuantite($quantity);
            $detailCommande->setPrix($produit->getPrix());
            $detailCommande->setTotal(($produit->getPrix())*$quantity);
            $total = $total + $produit->getPrix()*$quantity;
            $doctrine->getManager()->persist($detailCommande);
            
        }
        $doctrine->getManager()->flush();
        $idCommande = $commande->getId();
        return $this->render('order/add.html.twig', [
            'adresse' => $adresse,
            "rows"=>$rows,
            "date"=> $date = new \DateTime(),
            "total"=>$total,
            "idCommande"=>$idCommande
        ]);
    }
}

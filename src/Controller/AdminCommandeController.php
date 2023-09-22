<?php

namespace App\Controller;

use DateTime;
use App\Entity\Commande;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;


#[Route('/admin/commande')]
class AdminCommandeController extends AbstractController
{
    #[Route('/list', name: 'app_admin_commande_list')]
    public function index(ManagerRegistry $doctrine): Response
    {  
        $commandes = $doctrine->getRepository(Commande::class)->findBy([], array('id'=>'desc'), null, null);
      
        return $this->render('order/index.html.twig', [
            'commandes' => $commandes
          
        ]);
    
    }
}

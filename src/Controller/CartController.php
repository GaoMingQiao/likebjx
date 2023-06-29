<?php

namespace App\Controller;

use App\Entity\Produit;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class CartController extends AbstractController

{
    #[Route('/cart', name: 'app_cart')]

    public function index(SessionInterface $session, ManagerRegistry $doctrine): Response
    {   
        $panier = $session->get('panier',[]);
        $rows = [];
        foreach($panier as $id=>$quantity)
        {
            $rows[] = [
                "product"=>$doctrine->getRepository(Produit::class)->find($id),
                "quantity"=>$quantity
            ];
        }
        //dd($rows);

        $total = 0;
        foreach($rows as $id=>$value)
        {
            $total = $total + $value['product']->getPrix()*$value['quantity'];
        }
        $totalQuantity = 0;
        foreach($rows as $id=>$value)
        {
            $totalQuantity += $value['quantity'];
        }

        return $this->render('cart/index.html.twig', [
            "rows"=>$rows,
            "total"=>$total,
            "totalQuantity"=>$totalQuantity
        ]);

    }
    
    #[Route("/cart/add/{id}", name: "cart_add")]
    public function cartAdd(SessionInterface $session, $id)
    {       

        
        $panier = $session->get('panier',[]);
        if(!empty($panier[$id]))
        {
            $panier[$id]++;
            
        }  else
        {
            
            $panier[$id] = 1;
        }

        $session->set('panier', $panier);

        $this->addFlash('message',"Merci pour votre achat:) le produit a bien été ajouté à votre panier.");

        //dd($session->get('panier',[]));
        return $this->redirectToRoute('produit_list');
    }

    #[Route("/cart/delete/{id}", name:"cart_delete")]
    public function delete($id,SessionInterface $session)
    {
        $panier = $session->get('panier',[]);
        if(!empty($panier[$id]))
        {$panier[$id]--;
            if($panier[$id]<=0)
            {
                unset($panier[$id]);
            }
        }

        $session->set('panier',$panier);
        return $this->redirectToRoute('app_cart');
        
    }    

    #[Route("/cart/clear", name: "cart_clear")]
    public function clearCart(SessionInterface $session)
    {
        $session->remove('panier');
        return $this->redirectToRoute('app_cart');
    }

    // #[Route("/cart/quantity", name:"cart_quantity")]
    public function cartQuantity(SessionInterface $session)
    {  if(empty($session['panier']))
        return 0;
        $count=0;
        foreach($session['panier'] as $row)
        
         $quantity = $row['quantity'];
         return $count = $count + $quantity;

    

        
       
    }
    
    

}

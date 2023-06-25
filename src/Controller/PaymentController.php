<?php

namespace App\Controller;


use Stripe\Stripe;

use App\Entity\Produit;

use Stripe\Checkout\Session;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class PaymentController extends AbstractController
{
    #[Route("/checkout", name:"payment_checkout")]
    public function checkout(SessionInterface $session, ManagerRegistry $doctrine)
    {
       Stripe::setApiKey("sk_test_51NBHiULSS5c6cm1cRSRYVgWrrdgEjDzTCR7lYQz5m4W3hKOvIBJux7vKfrm33cH3JUkHX3bMahL1lWiNe6bWnz8E00dFNslVHE");
       
       $panier = $session->get('panier',[]);
       $rows = [];
       foreach($panier as $id=>$quantity)
       {
        $rows[] = [
            "product"=>$doctrine->getRepository(Produit::class)->find($id),
            "quantity"=>$quantity
        ];
       }
       foreach($rows as $id => $value)
        {
            $line_items[] = [
                'price_data' => [
                    'currency' => 'eur',
                    'product_data' => [
                        'name' => $value['product']->getNom(),
                    ],
                    'unit_amount' => $value['product']->getPrix()*100, //Attention: bien mettre le format sans virgule et collé avec les centimes => dans notre cas, le prix est un entier donc ici on multiplie simplement par 100 (exemple 20€ donne 2000)
                    ],
                    'quantity' => $value['quantity'],                
                ];
        }

       $session = Session::create([
        'line_items' =>$line_items,
        'mode' => 'payment',
        'success_url' => $this->generateUrl('success_url', [], UrlGeneratorInterface::ABSOLUTE_URL),
        'cancel_url' => $this->generateUrl('cancel_url', [], UrlGeneratorInterface::ABSOLUTE_URL),
      ]);

    //   dd($session);
        return $this->redirect($session->url, 303);
      
    }

    #[Route("/payment/success", name:"success_url")]
    public function successUrl()
    {
        return $this->render("payment/success.html.twig");
    }
    
    #[Route("/payment/cancel", name:"cancel_url")]
    public function cancelUrl()
    {
        return $this->render("payment/cancel.html.twig");
    }
       
}

<?php
namespace App\Services;

use App\Repository\ProduitRepository;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class Cart{
    private $session;
    private $repoProduit;
    public function __construct(SessionInterface $session, ProduitRepository $repoProduit)
    {
        $this->session = $session;
        $this->repoProduit = $repoProduit;
    }
    
    public function getCart()
    {
        return $this->session->get('cart',[]);
    }
    public function updateCart($cart)
    {
        $this->session->set('cart',$cart);
        $this->session->set('cartData',$this->getFullCart());
    }
    public function deleteCart()
    {
        $this->updateCart([]);
    }
    public function addToCart($id)
    {
        $cart = $this->getCart();
        if(isset($cart[$id]))
        {
            $cart[$id]++;
        } else
          $cart[$id] = 1 ;
          $this->updateCart($cart);
    }
    public function getFullCart()
    {
        $cart = $this->getCart();
        $fullCart = [];
        $quantityCart = 0;
        $sousTotal = 0;
        foreach($cart as $id=>$quantity)
        {
            $produit = $this->repoProduit->find($id);
            if($produit)
            {
                $fullCart['produits'][]=[
                    'produit'=>$produit,
                    'quantity'=>$quantity
                ];
                $quantityCart += $quantity;
                $sousTotal += $quantity*$produit->getPrix();
            }else $this->deleteCart($id);
        }
        $fullCart['data'] = [
            "quantityCart"=>$quantityCart,
            "sousTotal"=>$sousTotal
        ];
        return $fullCart;

    
    }
}
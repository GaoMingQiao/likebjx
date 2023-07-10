<?php

namespace App\Controller;

use App\Entity\Adresse;
use App\Entity\User;
use App\Form\AdresseType;
use App\Repository\AdresseRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class AdresseController extends AbstractController
{
    // #[Route('/adresse', name: 'app_adresse')]
    // public function index(ManagerRegistry $doctrine): Response
    // {   
    //     $id = $this->getUser()->getId();
    //     $adresses = $doctrine->getRepository(Adresse::class)->findBy(['user_id'=>$id]);
    //     return $this->render('adresse/index.html.twig', [
    //         'adresses' => $adresses,
    //         // 'user'=>$id,

    //     ]);
    // }
    #[Route('/adresse', name: 'app_adresse')]
    public function index(ManagerRegistry $doctrine): Response
    {   
        $adresses= $this->getUser()->getAdresse()->getValues();
        // $adresses = $doctrine->getRepository(Adresse::class)->findBy(['user_id'=>$id]);
        return $this->render('adresse/index.html.twig', [
            'adresses' => $adresses,
            // 'user'=>$id,

        ]);
    }
    // {
    //     $adresses = $this->getUser()->getAdresse()->getValues();
    // }

    #[Route('/adresse/new', name:'adresse_new')]
    public function addAdressse(Request $request, AdresseRepository $adresseRepo)
    {
        $adresse = new Adresse();
        $form = $this->createForm(AdresseType::class,$adresse);
        $form->handleRequest($request);
        if($form->isSubmitted()&& $form->isValid())
        {
            $adresseRepo->save($adresse, true);
            return $this->redirectToRoute('app_adresse', [], Response::HTTP_SEE_OTHER);
        }


        
        return $this->render('adresse/new.html.twig',[
            'form'=>$form->createView(),
            'adresse'=>$adresse
        ]);
    }
    #[Route('/adresse/delete/{id}', name: 'adresse_delete', methods: ['GET', 'POST'])]
    public function delete(Request $request, Adresse $adresse, AdresseRepository $adresseRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$adresse->getId(), $request->request->get('_token'))) {
            $adresseRepository->remove($adresse, true);
        }

        return $this->redirectToRoute('app_adresse', [], Response::HTTP_SEE_OTHER);
    }

    
}

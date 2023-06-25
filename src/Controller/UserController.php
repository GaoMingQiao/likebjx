<?php

namespace App\Controller;

use App\Entity\User;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class UserController extends AbstractController
{
    #[Route('/admin/user', name: 'user_list')]
    public function index(ManagerRegistry $doctrine): Response
    {   $users = $doctrine->getRepository(User::class)->findAll();
        return $this->render('user/index.html.twig', [
            'users' => $users,
        ]);
    }
    #[Route('/admin/user/delete/{id}', name: 'user_delete')]
    public function delete($id, ManagerRegistry $doctrine)
    {
        $em = $doctrine->getManager();
        $user = $doctrine->getRepository(User::class)->find($id);
        $em->remove($user);
        $em->flush();
        $this->addFlash('user_delete', 'Cet utilisateur a bien été supprimé!');
        return $this->redirectToRoute('user_list');
    }
}

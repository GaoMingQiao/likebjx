<?php

namespace App\Controller;



use App\Entity\Produit;
use App\Entity\Category;
use App\Repository\ProduitRepository;
use Doctrine\Persistence\ManagerRegistry;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ProduitController extends AbstractController
{
    #[Route('/produit/list', name: 'produit_list')]
    public function list(ManagerRegistry $doctrine,Request $request, PaginatorInterface $paginator): Response
    {   
        $produits = $doctrine->getRepository(Produit::class)->findAll();
        $produits = $paginator->paginate(
            $produits, // Requête contenant les données à paginer (ici nos articles)
            $request->query->getInt('page', 1), // Numéro de la page en cours, passé dans l'URL, 1 si aucune page
            6 // Nombre de résultats par page
        );
     
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
    #[Route('/search', name:'search')]
    public function findBySearch(ProduitRepository $repository,Request $request)
    {
    $search = $request->query->get('search');
    
     $produits = $repository->findBySearch($search);
     return $this->render('produit/_listSearch.html.twig',[
        'produits'=>$produits
     ]);
    }
    #[Route('/produit/three', name:'produitThree')]
    public function produitThree(ManagerRegistry $doctrine)
    {
    
    
     $repository = $doctrine->getRepository(Produit::class);
     $produits = $repository->findBy([],['CreatedAt'=>'desc'],3,0);
    //  dd($produits);
     return $this->render('produit/_listLatest.html.twig',[
        'produits'=>$produits
     ]);
    }
    // Pour la barre de recherche :     
    //  /**
    //  * @Route("/search", name="search")
    //  */
    // public function search(Request $request): Response
    // {
    //     $form = $this->createForm(SearchType::class);
    //     $form->handleRequest($request);

    //     $results = [];

    //     if ($form->isSubmitted() && $form->isValid()) {
    //         $searchQuery = $form->get('titre')->getData();

    //         $entityManager = $this->getDoctrine()->getManager();
    //         $results = $entityManager->getRepository(Oeuvre::class)->findByTitreLike($searchQuery);
    //     }

    //     return $this->render('search/index.html.twig', [
    //         'form' => $form->createView(),
    //         'results' => $results,
    //     ]);
    // }
    
}

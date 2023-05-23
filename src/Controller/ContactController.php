<?php

namespace App\Controller;

use App\Entity\Contact;
use App\Form\ContactType;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ContactController extends AbstractController
{
    #[Route('/contact', name: 'app_contact')]
    public function index(Request $request, ManagerRegistry $doctrine, MailerInterface $mailer): Response
    {
        $contact = new Contact;
        $contactForm = $this->createForm(ContactType::class, $contact);
        $contactForm->handleRequest($request);
        if($contactForm->isSubmitted() && $contactForm-> isValid())
        {
            $em = $doctrine->getManager();
            $em->persist($contact);
            $em->flush();

            $email = (new TemplatedEmail())
            ->from($contact->getEmail())
            ->to('like@monsite.com')
            ->subject('Demande de contact')

            // path of the Twig template to render
            ->htmlTemplate('emails/contact.html.twig')

            // pass variables (name => value) to the template
            ->context([
                
                'contact' => $contact,
            ]);

            $mailer->send($email);

            
            $this->addFlash('notice', "Le mail a bien été envoyé!");

        }
        return $this->render('contact/index.html.twig', [
            'contactForm' => $contactForm->createView()
        ]);
    }
}

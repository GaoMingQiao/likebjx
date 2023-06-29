<?php

namespace App\Form;

use App\Entity\Produit;

use App\Entity\Category;
use App\Entity\Commande;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;

class ProduitType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom',TextType::class)
            ->add('description',TextareaType::class)
            ->add('prix',IntegerType::class)
            ->add('stock', IntegerType::class)
            ->add('imageFile', FileType::class)
            ->add('category', EntityType::class,[
                'required'=>false,
                'class'=>Category::class,
                'choice_label'=>'nom'
            ]);
            // ->add('commande', EntityType::class,[
            //     'required'=>false,
            //     'class'=>Commande::class,
            //     'choice_label'=>'id'
            // ]);
           
        
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Produit::class,
        ]);
    }
}

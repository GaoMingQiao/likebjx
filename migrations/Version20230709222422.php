<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230709222422 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE adresse CHANGE user_id user_id INT NOT NULL');
        $this->addSql('ALTER TABLE commande ADD adresse_id INT NOT NULL, ADD statut VARCHAR(255) NOT NULL, DROP montant_total, CHANGE user_id user_id INT NOT NULL');
        $this->addSql('ALTER TABLE detail_commande ADD total INT NOT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE adresse CHANGE user_id user_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE commande ADD montant_total INT DEFAULT NULL, DROP adresse_id, DROP statut, CHANGE user_id user_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE detail_commande DROP total');
    }
}

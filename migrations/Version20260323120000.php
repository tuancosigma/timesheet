<?php

/*
 * This file is part of the Kimai time-tracking app.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace DoctrineMigrations;

use App\Doctrine\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * @version 2.x
 */
final class Version20260323120000 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Add onesite flag to working times (Cosigma incentive)';
    }

    public function up(Schema $schema): void
    {
        $this->addSql("ALTER TABLE kimai2_working_times ADD onesite TINYINT(1) NOT NULL DEFAULT 0");
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE kimai2_working_times DROP onesite');
    }
}


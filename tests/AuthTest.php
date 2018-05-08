<?php

use Laravel\Lumen\Testing\DatabaseMigrations;
use Laravel\Lumen\Testing\DatabaseTransactions;

class AuthTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function signInTest()
    {
        $this->json('PATCH', '/signin', ['email' => 'rizalishan@gmail.com', 'password' => '123456'])
            ->seeJson([
                'data' => [
                    'id' => 1
                ],
            ]);
    }
}

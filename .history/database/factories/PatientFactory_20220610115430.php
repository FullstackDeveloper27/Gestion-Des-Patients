<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class PatientFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'nom' => $this->faker->nom,
            'prenom' => $this->faker->prenom,
            'date_de_naissance' => $this->faker->date_de_naissance,
            'telephone' => $this->faker->telephone,
            'cin' => rand(01234567,11203698),
            'status' => 1,

        ];
    }
}

require './config/environment'


use Rack::MethodOverride
use PokemonsController
use UsersController
run ApplicationController

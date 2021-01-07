# rails-api
Api básica en Ruby On Rails con Postgresql

Probar api en heroku: https://rails-api-pizza.herokuapp.com

Ejemplos:

- GET https://rails-api-pizza.herokuapp.com/api/v1/store para obtener todas las tiendas

- POST https://rails-api-pizza.herokuapp.com/api/v1/order para crear nueva orden y sus detalles
```javascript
{ 
  "headers": {
      "Content-Type": "application/json"
   }, 
   "body": {
      "id_store": 1,
      "detalle": [
          {
              "id_product": 1,
              "quantity": 2
          },
          {
              "id_product": 3,
              "quantity": 1
          }
      ]
   } 
}
```

## Instalación
- Instalar todas las dependencias
```ruby
bundler install
```

- Configurar base de datos en config/database.yml

## Ejecutar servidor de pruebas
- Iniciar servidor
```ruby
rails server
```
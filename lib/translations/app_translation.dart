import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'app_name':"RESTAURANTs",
      'welcome_guy': "Hello @name",
      'welcome': 'Welcome to restaurants in Mexico',
      'logged_in': 'logged in as @name with email @email',
      'food_types':"Food types",
      'suggestion': "Suggestion for you now",

      'error':"Error: @error",
      'no_restaurants': 'No restaurants',
      'no_food_types': "No food types",
      'comments':"@number Comments",

      'rate_and_comment':"Rate and comment",
      'rate_description':"Share your opinion with other users",
      'ratings_and_opinions': "Ratings and opinions",
      'add_restaurant':"Add Restaurant",

      'form_name':"Name",
      'form_description':"Description",
      'form_cancel':'Cancel',
      'form_ok': 'Accept',
      'form_email': 'Email',
      'form_comment': 'Comment',
      'form_comment_to': 'Comment',

      'validation_empty':"Please this field must be filled",
      'validation_email':"The email is not valid",
      'write_a_comment':"Write a comment"

    },
    'es_ES': {
      'app_name':"RESTAURANTES",
      'welcome_guy': "Hola @name",
      'welcome': 'Bienvenido a restaurantes de Mexico',
      'logged_in': 'iniciado sesión como @name con e-mail @email',
      'food_types': "Tipos de alimentos",
      'suggestion': "Sugerencias para ti",

      'error':"Error: @error",
      'no_restaurants': 'No existen restaurantes',
      'no_food_types': "No existen tipos de alimento",
      'comments': "@number Comentarios",
      'rate_and_comment':"Califica y comenta",
      'rate_description':"Comparte tu opinion con los demas usuarios",
      'ratings_and_opinions': "Calificaciones y opiniones",
      'add_restaurant':"Añadir restaurante",

      'form_name':"Nombre",
      'form_description':"Descripcion",
      'form_cancel':'Cancelar',
      'form_ok': 'Aceptar',
      'form_email': 'Correo',
      'form_comment': 'Comentario',
      'form_comment_to': 'Comentar',

      'validation_empty':"Por favor este campo debe ser llenado",
      'validation_email':"El correo no es valido",
      'write_a_comment':"Escribe un comentario"

    }
  };
}


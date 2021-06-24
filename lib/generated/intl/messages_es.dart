// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'es';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "mainDrawerShoppingCartOption":
            MessageLookupByLibrary.simpleMessage("Carrito de compras"),
        "productsScreenAddToShoppingCartButton":
            MessageLookupByLibrary.simpleMessage("Añadir a carrito de compras"),
        "productsScreenDeleteFromShoppingCartButton":
            MessageLookupByLibrary.simpleMessage(
                "Sacar producto del carrito de compras"),
        "productsScreenError": MessageLookupByLibrary.simpleMessage(
            "Ha ocurrido un error al obtener los productos, por favor intente de nuevo"),
        "productsScreenProductAdded": MessageLookupByLibrary.simpleMessage(
            "El producto fue añadido con éxito"),
        "productsScreenProductDeleted": MessageLookupByLibrary.simpleMessage(
            "El producto fue eliminado del carrito de compras"),
        "productsScreenTitle":
            MessageLookupByLibrary.simpleMessage("Productos"),
        "shoppingCartScreenNoProducts": MessageLookupByLibrary.simpleMessage(
            "No hay productos en el carrito de compras aún"),
        "shoppingCartScreenPurchaseButton":
            MessageLookupByLibrary.simpleMessage("Comprar"),
        "shoppingCartScreenPurchaseSuccess":
            MessageLookupByLibrary.simpleMessage("La compra ha sido exitosa"),
        "shoppingCartScreenTitle":
            MessageLookupByLibrary.simpleMessage("Carrito de compras")
      };
}

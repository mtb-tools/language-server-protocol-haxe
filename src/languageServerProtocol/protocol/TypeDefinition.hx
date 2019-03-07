package languageServerProtocol.protocol;

import jsonrpc.Types;
import haxe.extern.EitherType;
import languageServerProtocol.Types;
import languageServerProtocol.protocol.Protocol;

@:publicFields
class TypeDefinitionMethods {
	/**
		A request to resolve the type definition locations of a symbol at a given text
		document position.
	**/
	static inline var TypeDefinition = new RequestMethod<TextDocumentPositionParams, Null<EitherType<Definition, Array<DefinitionLink>>>, NoData,
		TextDocumentRegistrationOptions>("textDocument/typeDefinition");
}

typedef TypeDefinitionClientCapabilities = {
	/**
		Capabilities specific to the `textDocument/typeDefinition`
	**/
	var ?typeDefinition:{
		/**
			Whether implementation supports dynamic registration. If this is set to `true`
			the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
			return value for the corresponding server capability as well.
		**/
		var ?dynamicRegistration:Bool;

		/**
			The client supports additional metadata in the form of definition links.
		**/
		var ?linkSupport:Bool;
	};
}

typedef TypeDefinitionServerCapabilities = {
	/**
		The server provides Goto Type Definition support.
	**/
	var ?typeDefinitionProvider:EitherType<Bool, TextDocumentRegistrationOptions & StaticRegistrationOptions>;
}

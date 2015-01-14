import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:dart_polymer_presentation_model/dart_polymer_presentation_model.dart';
 
AlbumBrowser albumBrowser;

void main() 
{
	initPolymer().run(() => Polymer.onReady.then((_) 
	{
		albumBrowser = querySelector("#album-browser");
		albumBrowser.albumBrowserModel = new AlbumBrowserModel();
	}));
}
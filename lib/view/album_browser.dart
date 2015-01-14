library dart_polymer_presentation_model.view.album_browser;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:dart_polymer_presentation_model/vo/album.dart';
import 'package:dart_polymer_presentation_model/view/album_form.dart';
import 'package:dart_polymer_presentation_model/model/album_browser_model.dart';
import 'package:core_elements/core_list_dart.dart';
  
@CustomTag('album-browser')
class AlbumBrowser extends PolymerElement
{
  //-----------------------------------
  //
  // Public Properties
  //
  //-----------------------------------
	
	@published AlbumBrowserModel albumBrowserModel;
	
	//-----------------------------------
	// HTML Elements
	//-----------------------------------
			
	CoreList get albumsList => shadowRoot.querySelector("#albums-list");

	AlbumForm get albumForm => shadowRoot.querySelector("#album-form");
		
  //-----------------------------------
  //
  // Constructor
  //
  //-----------------------------------

  AlbumBrowser.created() : super.created();
  
  //-----------------------------------
  //
  // Public Methods
  //
  //-----------------------------------
  
  void onSelectionChanged(CustomEvent event)
  {
  	bool ignoreChanges = true;
    		
		if (albumBrowserModel.albumChanged)
			ignoreChanges = window.confirm("Do you wish to discard your changes?");
		
		if (ignoreChanges)
			albumBrowserModel.updateSelectedAlbum((event.detail as CoreActivateEvent).data as Album);
  }
}
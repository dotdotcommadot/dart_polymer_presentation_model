library dart_polymer_presentation_model.model.album_browser_model;

import 'package:observe/observe.dart';
import 'package:dart_polymer_presentation_model/vo/album.dart';
import 'package:dart_polymer_presentation_model/model/album_form_model.dart';
import 'package:dart_polymer_presentation_model/delegate/album_delegate.dart';

class AlbumBrowserModel extends Observable
{
	//-----------------------------------
  //
  // Public Properties
  //
  //-----------------------------------

  @observable ObservableList<Album> albums = new ObservableList();

  @observable AlbumFormModel albumFormModel = new AlbumFormModel();
  
	bool get albumChanged => albumFormModel.album != null && albumFormModel.canCancel();
  
  //-----------------------------------
  //
  // Constructor
  //
  //-----------------------------------
	
	AlbumBrowserModel()
	{
		albums.addAll(new AlbumDelegate().getAlbums());
		albums.sort((a, b) => a.artist.compareTo(b.artist));
	}
	
  //-----------------------------------
  //
  // Public Methods
  //
  //-----------------------------------
	
	void updateSelectedAlbum(Album album)
	{
		albumFormModel.album = album;
	}
}


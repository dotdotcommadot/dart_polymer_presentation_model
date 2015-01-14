library dart_polymer_presentation_model.model.album_form_model;

import 'package:observe/observe.dart';
import 'package:dart_polymer_presentation_model/vo/album.dart';

class AlbumFormModel extends Observable
{
  /* 
   * Includes hack to convert two-way binding to one-way binding
   */
  Album albumOriginal;
  @observable Album albumDuplicate;
  @observable Album get album => albumOriginal;
  
  set album(Album value) {
  	albumOriginal = value;
  	
  	if (value != null)
    	albumDuplicate = value.clone();
  	else
  		albumDuplicate = null;
  }
  
  //-----------------------------------
  //
  // Constructor
  //
  //-----------------------------------
	
	AlbumFormModel();
	
  //-----------------------------------
  //
  // Public Methods
  //
  //-----------------------------------
	
	bool canCancel()
	{
		if (albumOriginal.artist != albumDuplicate.artist ||
				albumOriginal.title != albumDuplicate.title ||
				albumOriginal.composer != albumDuplicate.composer ||
				albumOriginal.isClassical != albumDuplicate.isClassical)
		{
			return true;
		}
		
		return false;
	}
	
	void updateIsClassical(bool isClassical)
	{
		if (isClassical)
			albumDuplicate.composer = albumOriginal.composer;
		else
			albumDuplicate.composer = '';
	}
	
	void applyChanges()
	{
		albumOriginal.artist = albumDuplicate.artist;
		albumOriginal.title = albumDuplicate.title;
		albumOriginal.isClassical = albumDuplicate.isClassical;
		albumOriginal.composer = albumDuplicate.composer;
	}

	void cancelChanges()
	{
		albumDuplicate = albumOriginal.clone();
	}
}
library dart_polymer_presentation_model.vo.album;

import 'package:observe/observe.dart';

class Album extends Observable
{
  //-----------------------------------
  //
  // Public Properties
  //
  //-----------------------------------
	
	@observable String title = '';
	
	@observable String artist = '';
	
	@observable String composer = '';
	
	@observable bool isClassical = false;
	
	@observable bool selected = false;
	
  //-----------------------------------
  //
  // Constructor
  //
  //-----------------------------------
	
	Album();
	
  //-----------------------------------
  //
  // Public Methods
  //
  //-----------------------------------
	
  Album clone()
	{
		Album album = new Album()
			..title = this.title
			..artist = this.artist
			..composer = this.composer
			..isClassical = this.isClassical
			..selected = this.selected;
		
		return album;
	}
}
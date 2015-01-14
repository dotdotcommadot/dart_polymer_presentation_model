library dart_polymer_presentation_model.delegate.album_delegate;

import 'package:observe/observe.dart';
import 'package:dart_polymer_presentation_model/vo/album.dart';

class AlbumDelegate
{
  //-----------------------------------
  //
  // Public Methods
  //
  //-----------------------------------
	
	ObservableList<Album> getAlbums()
	{
		final ObservableList<Album> albums = new ObservableList<Album>();
		
		Album album;
		
		album = new Album()
			..title = "OK Computer"
			..artist = "Radiohead";
		albums.add(album);

		album = new Album()
			..title = "The Joshua Tree"
			..artist = "U2";
		albums.add(album);

		album = new Album()
			..title = "Nevermind"
			..artist = "Nirvana";
		albums.add(album);

		album = new Album()
			..title = "Thriller"
			..artist = "Michael Jackson";
		albums.add(album);

		album = new Album()
			..title = "Dark Side of the Moon"
			..artist = "Pink Floyd";
		albums.add(album);

		album = new Album()
			..title = "Definitely Maybe"
			..artist = "Oasis";
		albums.add(album);

		album = new Album()
			..title = "Sgt. Pepper's Lonely Hearts Club Band"
			..artist = "The Beatles";
		albums.add(album);

		album = new Album()
			..title = "Like a Prayer"
			..artist = "Madonna";
		albums.add(album);

		album = new Album()
			..title = "Appetite For Destruction"
			..artist = "Guns N' Roses";
		albums.add(album);

		album = new Album()
			..title = "Revolver"
			..artist = "The Beatles";
		albums.add(album);

		album = new Album()
			..title = "Piano Quintet In A Major Opus 81"
			..artist = "Andreas Haefliger and Takacs Quartet"
			..composer = "Antonin Dvorak"
			..isClassical = true;
		albums.add(album);

		album = new Album()
			..title = "Lieutenant Kije (suite) Opus 60"
			..artist = "Lille National Orchestra"
			..composer = "Sergei Prokofiev"
			..isClassical = true;
		albums.add(album);

		album = new Album()
			..title = "Alessandro Severo - Overture"
			..artist = "Academy Of Ancient Music"
			..composer = "George Frideric Handel"
			..isClassical = true;
		albums.add(album);

		album = new Album()
			..title = "Sinfonia In C Minor"
			..artist = "Czech Chamber Philharmonic Orchestra"
			..composer = "Josef Barta"
			..isClassical = true;
		albums.add(album);

		album = new Album()
			..title = "Sleeping Beauty - Waltz"
			..artist = "Kirov Orchestra"
			..composer = "Peter Ilich Tchaikovsky"
			..isClassical = true;
		albums.add(album);
		
		album = null;
		return albums;
	}
}
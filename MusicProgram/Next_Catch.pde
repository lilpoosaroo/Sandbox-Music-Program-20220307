void Next_Catch () {
if ( currentSong >= song.length-1) { 
        currentSong -= currentSong; //Makes the playlist start from the beginning
      } else {
        currentSong++;
      }
}//End Catch

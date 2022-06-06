//Libraries: uses Sketch / Import Library / Add Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
float appDisplayWidth, appDisplayHeight;


Minim minim; //creates an object that will be able to access all functions
AudioPlayer song0, song1, song2, song3, song4, song5, song6; 
//Creates a "PlayList" vairables holding extensions WAV, AIFF, AU, SNG, MP3
//
void setup () {
  size(900, 400); //Display Geometry is mandatory, CHANGE TO FULLSCREEN
  appDisplayWidth= width;
  appDisplayHeight= height;
  minim = new Minim(this); //leads from data directory loadFile should also load from project folder, similiar to loadImage
  song1 = minim.loadFile("MusicDownload/27 Shooting Stars In Summer ΓÇô Naoko Ikeda.mp3");//able to pass absolute pathway, file name, and URL
  song1.loop(0);//Parameter is number of repeats 
  /*
  song2 = minim.loadFile("");
   song3 = minim.loadFile("");
   song4 = minim.loadFile("");
   song5 = minim.loadFile("");
   */
}//End setup
//
void draw () {
  if (song1.isLooping() ) println("There are:", song1.loopCount(), "loops left.");
  if (song1.isPlaying() && !song1.isLooping()) println("Playing once"); //! means not
  //
  println("Song position:", song1.position(), "Song Length:", song1.length() );
}//End draw
//
void keyPressed () {
  //Only press a number for this code,
  //by pressing a number it will determine how many times the song loops
  println(key);
  if (key=='1' || key=='2' || key=='9') { 
    if (key=='1') println("Looping 1 time");
    if (key=='2') println("Looping 2 times");
    if (key=='9') println("Looping 9 times"); //Looping nine times can be defined as infinity
    String keyString= String.valueOf(key);
    println("Number of repeats is:", keyString);
    int number= int(keyString);
    song1.loop(number);
  } //End Loop
  if (key>=3 && key!='9') println("I do not loop that much! Try again.");
  //Previous Play button and loop button

  int loopNumber=0;
  if (key=='L' || key=='l') song1.loop(loopNumber);
  /*
   //Mute button
  
  if ( (key=='m' || key=='M') && song1.isMuted() ) {
    song1.unmute();
  } else {
    song1.mute();
  }
  */

  //Pause/Play button, Parameters is milli-seconds from start of audio file to strat of playing 
  if ( (key=='p' || key=='P') ) {
    if (song1.isPlaying() ) { 
    song1.pause(); 
  } else if ( song1.length() - song1.position() <= 1000 ) {
  //To calculate the end of the song
  //Alternate forumala: song1.position() >= song1.length()-song1.length()*1/5, 
  //this means if the song position is larger than 80% of the song length, 
  //or what we classified as "the end", the song will rewind and play
  song1.rewind();
  song1.play();
  }  else  {
    song1.play();
  }
  
  //Forward/Reverse Button
  //Built-in question: x.isPlaying()
  if (key=='f' || key=='F'  ) song1.skip(1000) ; //skip forward 1 second, or 1000 milliseconds
  if ( key=='r' || key=='R'  ) song1.skip(-1000); //skip backward
  //
  if (keyCode=='/') exit();
  //
  
  // 
  if (key=='s' || key=='S') {
    if ( song1.isPlaying() ) {
      song1.pause();
      song1.rewind();
    } else {
      song1.rewind();
    }
  }
}//End keyPressed
//
void mousePressed () {
}//End mousepressed
//
//End MAIN program
//

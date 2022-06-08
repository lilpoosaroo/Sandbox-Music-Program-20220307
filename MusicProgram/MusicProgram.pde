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
color black=#000000, purple=#D899CE;
PFont titleFont;
int numberOfSongs = 4;
int currentSong=numberOfSongs-numberOfSongs;



Minim minim; //creates an object that will be able to access all functions
AudioPlayer[] song = new AudioPlayer[numberOfSongs]; 
//Creates a "PlayList" vairables holding extensions WAV, AIFF, AU, SNG, MP3
AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs]; //song1's meta data

//
void setup () {
  size(900, 400); //Display Geometry is mandatory, CHANGE TO FULLSCREEN
  appDisplayWidth= width;
  appDisplayHeight= height;
  minim = new Minim(this); //leads from data directory loadFile should also load from project folder, similiar to loadImage
  song[currentSong] = minim.loadFile("MusicDownload/27 Shooting Stars In Summer ΓÇô Naoko Ikeda.mp3");//able to pass absolute pathway, file name, and URL
  song[currentSong+=1] = minim.loadFile("MusicDownload/15 Consolation, Op. 30, No. 3 ΓÇô Felix Mendelssohn.mp3");
  song[currentSong+=1] = minim.loadFile("MusicDownload/07 Fluttering Leaves, Op. 46, No. 11 ΓÇô Stephen Heller.mp3");
  song[currentSong+=1] = minim.loadFile("MusicDownload/05 In The Evening, Op. 88, No. 2 ΓÇô Heinrich Hofmann.mp3");
  //
  currentSong-=currentSong;
  for (int i=currentSong; i<song.length; i+=1 ) {//could have also put i=i+1, i++
    songMetaData[i] = song[i].getMetaData();
    /* Which means
     songMetaData[0] = song[0].getMetaData();
     songMetaData[1] = song[1].getMetaData(); 
     songMetaData[2] = song[2].getMetaData(); 
     songMetaData[3] = song[3].getMetaData(); 
     */
  }
  //
  song[0].loop(0);//Parameter is number of repeats 
  //reads song meta 1, like song1, mimicking array notation
  titleFont = createFont("Calibri Bold Italic", 55);
  //
  println("Start of Console");
  println("Click the console to finish starting this program");
  println("Title:", songMetaData[currentSong].title() );
}//End setup
//
void draw () {


  println("Start of Console");
  println("Click the console to finish starting this program");
  println("Title:", songMetaData[currentSong].title() );


  if (song[currentSong].isLooping() ) println("There are:", song[currentSong].loopCount(), "loops left.");
  if (song[currentSong].isPlaying() && !song[currentSong].isLooping()) println("Playing once"); //! means not
  //
  println("Song position:", song[currentSong].position(), "Song Length:", song[currentSong].length() );
  //
  background(black);
  rect(width*1/4, height*0, width*1/2, height*1/10);
  fill(purple);
  textAlign(CENTER, CENTER);
  textFont(titleFont, 18);
  text(songMetaData[currentSong].title(), width*1/4, height*0, width*1/2, height*1/10 );
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
    song[currentSong].loop(number);
  } //End Loop
  if (key>=3 && key!='9') println("I do not loop that much! Try again.");
  //Previous Play button and loop button

  int loopNumber=0;
  if (key=='L' || key=='l') song[currentSong].loop(loopNumber);
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
    if (song[currentSong].isPlaying() ) { 
      song[currentSong].pause();
    } else if (/*song[currentSong].position() >=*/ song[currentSong].length() - song[currentSong].position() <= 1000 ) {
      //To calculate the end of the song
      //Alternate forumala: song1.position() >= song1.length()-song1.length()*1/5, 
      //this means if the song position is larger than 80% of the song length, 
      //or what we classified as "the end", the song will rewind and play
      song[currentSong].rewind();
      song[currentSong].play();
    } else {
      song[currentSong].play();
    }
  }

  //Forward/Reverse Button
  //Built-in question: x.isPlaying()
  if (key=='f' || key=='F'  ) song[currentSong].skip(1000) ; //skip forward 1 second, or 1000 milliseconds
  if ( key=='r' || key=='R'  ) song[currentSong].skip(-1000); //skip backward
  //
  if (keyCode=='/') exit();
  //

  // Stop button
  if (key=='s' || key=='S') {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
    } else {
      song[currentSong].rewind();
    }
  }
  //Next Song button
  if (key=='n' || key=='N') {
    if ( song[currentSong].isPlaying() ) 
    { //Serious problems, playing multiple songs at the same time
    song[currentSong].pause();
    song[currentSong].rewind();
     Next_Catch ();
     song[currentSong].play();
    } else {
      Next_Catch ();
      //if you just put currentSong++ without the if statement, will cause an error because it will keep pn adding 
      //numbers above 3
      song[currentSong].play();
    }
  }
  //Previous Button
  //if (song) {}
}//End keyPressed
//
void mousePressed () {
}//End mousepressed
//
//End MAIN program
//

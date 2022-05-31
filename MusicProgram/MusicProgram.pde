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
void setup (){
  size(900, 400); //Display Geometry is mandatory, CHANGE TO FULLSCREEN
  appDisplayWidth= width;
  appDisplayHeight= height;
  minim = new Minim(this); //leads from data directory loadFile should also load from project folder, similiar to loadImage
  song1 = minim.loadFile("MusicDownload/27 Shooting Stars In Summer ΓÇô Naoko Ikeda.mp3");//able to pass absolute pathway, file name, and URL
  /*
  song2 = minim.loadFile("");
  song3 = minim.loadFile("");
  song4 = minim.loadFile("");
  song5 = minim.loadFile("");
  */

}//End setup
//
void draw (){

}//End draw
//
void keyPressed (){

}//End keyPressed
//
void mousePressed (){

}//End mousepressed
//
//End MAIN program
//

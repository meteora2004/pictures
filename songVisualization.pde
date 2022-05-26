ArrayList <Song> songInfo = new ArrayList<Song>();
Table table;
Song s; 
int currentSong = 0; 
void setup(){
  
  
    size(500,500);
    table = loadTable("https://raw.githubusercontent.com/meteora2004/pictures/main/songs_normalize.csv", "header");

    System.out.println(table.getRowCount() + " total rows in table");

    for (TableRow row : table.rows()) {

      String songName = row.getString("song");
      String artist = row.getString("artist");
      
   
      double danceability = row.getDouble("danceability");

      println(artist + " (" + songName + ") has a danceability of " + danceability);

      Song s = new Song(artist, songName, danceability ); 
      songInfo.add(s);
    
  }
   
}// ends set up
public void draw(){
    background(10,204,100);
    textSize(30);
    text("Random Spotify Stats", 100, 60);
    textSize(20);
    text("for your enjoyment I guess", 130, 90);
    textSize(20);
    text("ARTIST:", 85, 200);
    textSize(20);
    text("SONG:", 85, 240);
    textSize(20);
    text("DANCEABILITY:", 85, 280);
    
    
    
    s = songInfo.get(currentSong); 
    s.display();
     
 


}//ends draw
void keyPressed(){
  if (key == CODED){
    if(keyCode == UP){
      currentSong += 1;
      
    }
  
  
  }

}


public class Song{
  private String artist;
  private String songName;
  private double danceability;

  public Song(String artist, String songName, double danceability){
    this.artist = artist; 
    this.songName = songName;
    this.danceability = danceability;
  
  
  
  
  
  }// ends constructor

public void display(){
  text(artist, 165, 200);
  textSize(20);
  text(songName, 165, 240);
  textSize(20);
  Double dance = new Double(danceability);
  text(dance.toString(), 250, 280);
  



}



}

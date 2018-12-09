import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import ddf.minim.*;

Minim minim;
AudioPlayer musica, pop;
Box2DProcessing box2d;

//Clases
  ArrayList <Ovni> ovnis;
  Vaquita vaca;
//imágenes
  PImage fondo, inicio, fin;
//Contador naves
  int contador;
  String contador_texto;
//Tiempo de la nave 
  int timerOv1 = 0, timerOv2 = 0, timerOv3 = 0;
//Pantallas
  boolean pantalla = true, perder = false;
  int timer = 300;
//Fuente
  PFont font;
//Sonidos
  
void setup() {
  size(955, 637);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);  
  
  //Naves
  ovnis = new ArrayList<Ovni>();
  vaca = new Vaquita(450,500,150,100);
  
  //Fondos
  fondo = loadImage("data/background.jpg");
  inicio = loadImage("data/inicio.jpg");
  fin = loadImage("data/final.jpg");
  
  //Font
  font = createFont("data/presque.ttf", 12);
  
  //Sonidos
  minim = new Minim(this);
  pop = minim.loadFile("data/pop.mp3");
  musica = minim.loadFile("data/Cybercity.mp3");
}


void draw() {
  background(fondo);
  box2d.step();
  musica.play();
  if(pantalla){
    if(key == ENTER)
    {
      timer --;
    } 
    inicio();   
  }
  
  if(pantalla == false && perder == false){
    juego();
  }
  
  if(pantalla == false && perder){
    finJuego();
  }  
  

}

class Ovni{
  float ancho;
  float alto;
  float x;
  float y;
  Body b;
  PImage ovni;
  

  Ovni(float x_, float y_,float ancho_, float alto_, float vel_1, float vel_2, String imagen){
    this.ancho = ancho_;
    this.alto = alto_;
    this.x = x_;
    this.y = y_;
    
    ovni = loadImage(imagen);
    
    //Definir Body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x_,y_));
    
    //Crear Body
    b = box2d.createBody(bd);
    
    //Forma Body
    PolygonShape ps = new PolygonShape();
    float anchoAjustado = box2d.scalarPixelsToWorld(ancho_/2);
    float altoAjustado = box2d.scalarPixelsToWorld(alto_/2);
    ps.setAsBox(anchoAjustado,altoAjustado);
    
    //Fixture Body
    FixtureDef fd = new FixtureDef();
    
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5; 
    
    //Velocidad 
    b.createFixture(fd);
    b.setLinearVelocity(new Vec2(vel_1,vel_2));
    //b.setAngularVelocity(0);
  }
  
  boolean eliminar(){
     Vec2 posicion = box2d.getBodyPixelCoord(b);
       if(mouseX > posicion.x && mouseX < (posicion.x + ancho) 
       && mouseY > posicion.y && mouseY < (posicion.y + alto) && mousePressed){
          eliminarBody();
          return false;
       }
       else{
          return true;
       }
  }
  
  
  boolean vacas(){
     Vec2 posicion = box2d.getBodyPixelCoord(b);
       if(posicion.x > 300 && posicion.x < 550
       && posicion.y > 380 && posicion.y < 560){
          return false;
       }
       else{
          return true;
       }
  }

  
  void eliminarBody(){
     box2d.destroyBody(b);  
  }  
      
 
  //display
  void display(){
    Vec2 posicion = box2d.getBodyPixelCoord(b);
    float angulo = b.getAngle();
    pushMatrix();
      translate(posicion.x,posicion.y);
      rotate(-angulo);     
      image(ovni,0,0);
    popMatrix();    
  }
  
}

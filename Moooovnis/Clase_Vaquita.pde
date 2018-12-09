class Vaquita{
  float x,y,w,h;
  Body b;
  PImage vaca;
  
  Vaquita(float x_, float y_, float w_, float h_){
    this.x = x_;
    this.y = y_;
    this.w = w_;
    this.h = h_;

    vaca = loadImage("data/vaca.png");
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x_,y_));    
    b = box2d.createBody(bd);
    PolygonShape ps = new PolygonShape();
    float anchoAjustado = box2d.scalarPixelsToWorld(w_/2);
    float altoAjustado = box2d.scalarPixelsToWorld(h_/2);
    ps.setAsBox(anchoAjustado,altoAjustado);
    b.createFixture(ps,1);
  }
  
  void display(){    
    noStroke();
    image(vaca,x-75,y-50);
    noFill();
    rectMode(CENTER);
    rect(this.x,this.y,this.w,this.h);
  }
}

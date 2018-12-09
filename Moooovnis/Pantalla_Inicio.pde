void inicio(){
background(inicio);  
  fill(0,0,0,150);

  if(key == ENTER){
    
    textFont(font);
    fill(255);
    textSize(13);   
  
    text("INSTRUCCIONES:",50,500); 
    text("DALE CLIC A LAS NAVES!",50,525); 
    if(key == ENTER){
      text("TIEMPO PARA INICIAR EL JUEGO:",660,500);
      textSize(16);
      text(timer/100,770,535);
      
      if(timer <= 1){
        pantalla = false;
      }     
    }
  }
}

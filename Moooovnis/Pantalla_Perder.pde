void finJuego(){
  background(fin);  
  
  if(mousePressed){
    if(mouseX > 70 && mouseX < 165 &&
       mouseY > 525 && mouseY < 565){
         //Inicio
         pantalla = true;
         perder = false;
         //contador = 0;
         timer = 300;        
         for(int i = ovnis.size()-1; i>=0; i--){
          ovnis.remove(i);
         }
         key = 0;
         contador = 0;
    }
    
    else if(mouseX > 798 && mouseX < 888 &&
         mouseY > 537 && mouseY < 577){
         //Fin
         exit();
    }

  }

}

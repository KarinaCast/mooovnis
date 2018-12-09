void juego(){
  //Tiempos cada nave
  timerOv1 ++;
  timerOv2 ++;
  timerOv3 ++;
  
  //Localizacion cada nave
  float r1 = random(50, 200);
  float r2 = random(300, 360);
  float r3 = random(20, 55);
  
  //Crear nave 1
  if(contador >= 0 && contador < 5){
    ovnis1(18, -10, r1);
  }
  //Crear nave 1 y 2
  else if(contador > 4 && contador < 15){
    ovnis1(25, -10, r1);
    ovnis2(10, -30, r2); 

  }
  //Crear nave 1, 2 y 3
  else if (contador > 14){
    ovnis1(35, -20, r1);
    ovnis2(20, -30, r2);
    ovnis3(-40, -10, r3);
  }
  
  //Display naves y eliminar
  for (int i = ovnis.size()-1; i>=0; i--) {
    Ovni ov = ovnis.get(i);
    if(ov.eliminar()){
      ov.display();
    }
    else{
      ovnis.remove(i);
      pop.play();
      contador ++;
      pop.rewind();
    }   
  }  
  
  for (int i = ovnis.size()-1; i>=0; i--) {
    Ovni ov = ovnis.get(i);
    if(ov.vacas()){
      perder = false;
    }
    else{
      perder = true;
    }   
  }

  //Display vaquita
  vaca.display();
  
  //Contador
  fill(255);
  textFont(font);
  contador_texto = "NAVES DESTRUIDAS: " + contador;
  text(contador_texto,725,50);
  println("Naves destruidas: ", contador); 
}


//Funcion nave 
void ovnis1(int x, int y, float r) {  
  //Tiempo aleatorio
  int timer = (int) random(75,100);
  //Si el tiempo de la nave es mayor o igual al aleatorio, crea nave
  if (timerOv1 >= timer){
    
    //Datos de nave: x, y, w, h, velocidad, imagen
    Ovni ov = new Ovni(0, r, 117, 68, x, y, "data/ovni1.png");
    ovnis.add(ov);
    
    //Se reinicia el tiempo de la nave
    timerOv1 = 0;
  } 
}

void ovnis2(int x, int y, float r) {  
  int timer = (int) random(60,75);
  if (timerOv2 >= timer){
    Ovni ov = new Ovni(r, -10, 112, 92, x, y, "data/ovni2.png");
    ovnis.add(ov);
    timerOv2 = 0;
  } 
}

void ovnis3(int x, int y, float r) { 
  int timer = (int) random(65,80);
  if (timerOv3 >= timer){
    Ovni ov = new Ovni(1200, r, 177, 106, x, y, "data/ovni3.png");
    ovnis.add(ov);
    timerOv3 = 0;
  } 
}

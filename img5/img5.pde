void setup(){
  size(400,302);
  noLoop();
}

void draw(){
  PImage img = loadImage("coruja.jpg");
  
  PImage imgGS = createImage(img.width, img.height, RGB);
  
  PImage imgGT = createImage(img.width, img.height, RGB);
  
  
  
  //escala de cinza
  
  for(int y = 0; y < img.height; y++){
    for(int x = 0; x < img.width; x++){
      int pos = y*img.width + x;
      
      imgGS.pixels[pos] = color(blue(img.pixels[pos]));
    }
  }
  
   //image(imgGS,0,0);
   //save("corujaGS.png");
  
  //tratamento
  
for(int y = 0; y < img.height; y++) {
       for (int x = 0; x < img.width; x++) {
          int pos = y * img.width + x;
          
          int qtde = 0;
          float r1 = 0, r2 = 0, r3 = 0, r4 = 0, media=0;
          
          if ( y != 0 ) {
             int pos1 = (y-1)*img.width + x; 
             r1 = red(imgGS.pixels[pos1]);
             media += r1;
             qtde++;
          }
          
          if ( y != (img.height-1)) {
             int pos2 = (y+1)*img.width + x; 
             r2 = red(imgGS.pixels[pos2]);
             media += r2;
             qtde++;
          }
          
          if (x != 0) {
             int pos3 = y*img.width + (x-1); 
             r3 = red(imgGS.pixels[pos3]);
             media += r3;
             qtde++;
          }
          
          if (x != (img.width-1)) {
             int pos4 = y*img.width + (x+1); 
             r4 = red(imgGS.pixels[pos4]);
             media += r4;
             qtde++;
          }
          
          media = (media + red(img.pixels[pos])) / ++qtde;
          imgGS.pixels[pos] = color(media);
       }
    }

    
   
  //grond truth
    for(int y = 0; y < img.height; y++){
    for(int x = 0; x < img.width; x++){
      int pos = y*img.width + x;
      
      if(red(imgGS.pixels[pos]) < 199 && x > 129 && x < 270 && y < 205 && y > 20){
        imgGT.pixels[pos] = color(255);
      }else
      if(red(imgGS.pixels[pos]) < 200 && x >101 && x<197 && y>=205){
        imgGT.pixels[pos] = color(255);
      }else{
        imgGT.pixels[pos] = color(0);
      }
      
      if(x > 120 && x < 230 && y>269){
        imgGT.pixels[pos] = color(0);
      }
    }
  }

   image(imgGT,0,0);
   save("corujaGT.png");
   
   PImage imgGT_original  = loadImage("corujaGTOriginal.png"); //carrega a imagem original com Ground Truth
  //image(img_original,0,0);
  
  PImage imgGT_feita = loadImage("corujaGT.png");//carrega a imagem criada pelo algoritmo
  //image(img_igual,0,0);
    
  acuracia(imgGT_original, imgGT_feita);
}

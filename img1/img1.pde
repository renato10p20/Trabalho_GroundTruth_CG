void setup(){
  size(400,309);
  noLoop();
}

void draw(){
  PImage img = loadImage("coruja.jpg");
  image(img,0,0);
  
  PImage imgGS;
  imgGS = createImage(img.width,img.height,RGB);
  
  //escala de cinza
    
  for(int y = 0; y < img.height; y++){
    for(int x = 0; x < img.width; x++){
      int pos = y*img.width + x;
      
      int blue = int(blue(img.pixels[pos]));
      
      imgGS.pixels[pos] = color(blue);
    }
  }

  //image(imgGS,0,0);
  //save("corujaPretoEBranco.png");
  
  //GROUND TRUTH
  PImage imgGT;
  imgGT = createImage(img.width,img.height,RGB);
  
  for(int y = 0; y < img.height; y++){
    for(int x = 0; x < img.width; x++){
      int pos = y*img.width + x;
      if(red(imgGS.pixels[pos]) < 217){
        imgGT.pixels[pos] = color(255);
      }else{
        imgGT.pixels[pos] = color(0);
      }
    }
  }
  
  
  //Ground Truth Pintada
 /* for(int y = 0; y < img.height; y++){
    for(int x = 0; x < img.width; x++){
      int pos = y*img.width + x;
      if(red(imgGS.pixels[pos]) < 217){
        imgGT.pixels[pos] = color(red(img.pixels[pos]), green(img.pixels[pos]), blue(img.pixels[pos]));
      }else{
        imgGT.pixels[pos] = color(0);
      }
    }
  }*/
  
  image(imgGT,0,0);
  save("corujaGT.png");
  
  PImage imgGT_original  = loadImage("corujaGTOriginal.png"); //carrega a imagem original com Ground Truth
  //image(img_original,0,0);
  
  PImage imgGT_feita = loadImage("corujaGT.png");//carrega a imagem criada pelo algoritmo
  //image(img_igual,0,0);
    
  acuracia(imgGT_original, imgGT_feita);
}

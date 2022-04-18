void setup () {
  size(400, 308);
  noLoop();
}

void draw() {
  PImage img = loadImage("coruja.jpg");
  //PImage aux = createImage(img.width, img.height, RGB);
  
  
  PImage imgES;
  imgES = createImage(img.width,img.height,RGB);
  
  
  

  for (int y=0; y< img.height; y++) {
    for (int x=0; x < img.width; x++) {
      int pos = y*img.width + x;
       int red = int(red(img.pixels[pos]));
       //img.pixels[pos] = color(red(img.pixels[pos]));
       imgES.pixels[pos] = color(blue(img.pixels[pos]));
      //img.pixels[pos] = color  ((red(img.pixels[pos]) + green(img.pixels[pos]))/2);
    }   
  }
 image(img, 0,0);
  //image(imgES, 0,0);
  // save("corujaGS.png");

  for (int y=0; y< img.height; y++) {
    for (int x=0; x < img.width; x++) {
      int pos = y*img.width + x;
      if(green(imgES.pixels[pos]) > 210){
        imgES.pixels[pos] = color(0);
      }else{
        //imgES.pixels[pos] = color(255);
        imgES.pixels[pos] = color (red(img.pixels[pos]), green(img.pixels[pos]), blue(img.pixels[pos]));
        
        
      
       
       
      } 
    }   
  }
 
  image(imgES, 0,0);
  save("corujaPintada.png");
    PImage imgGT_original  = loadImage("corujaGTOriginal.png"); //carrega a imagem original com Ground Truth
  //image(img_original,0,0);
  
  PImage imgGT_feita = loadImage("corujaGT.png");//carrega a imagem criada pelo algoritmo
  //image(img_igual,0,0);
    
  acuracia(imgGT_original, imgGT_feita);
}

 

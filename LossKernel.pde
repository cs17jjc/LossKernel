public class Kernal
{
  float[][] Data;
 Kernal(float[][] Data)
 {
   this.Data = Data;
 }
  
  PImage Apply(PImage img)
  {
    PImage ReturnImg = createImage(img.width,img.height,RGB);
   for(int x = Data.length; x < img.width;x++)
   {
     for(int y = Data[0].length; y < img.height;y++)
     {
       float SumR = 0;
       float SumG = 0;
       float SumB = 0;
       for(int xK = 0; xK < Data.length; xK ++)
       {
         for(int yK = 0; yK < Data[xK].length; yK ++)
         {
           float ProdR = Data[xK][yK] *0.2* red(img.get(x + (xK -1),y + (yK -1)));
           float ProdG = Data[xK][yK] *0.2* green(img.get(x + (xK -1),y + (yK -1)));
           float ProdB = Data[xK][yK] *0.2* blue(img.get(x + (xK -1),y + (yK -1)));
           //if(Prod != 0) println(Prod);
           SumR += ProdR;
           SumG += ProdG;
           SumB += ProdB;
         }
       }
       //println(Sum);
       ReturnImg.set(x,y,color(SumR,SumG,SumB));
     }
   }
   return ReturnImg;
  }
  
}

PImage Grey(PImage img)
{

void setup()
{
  PImage p = loadImage("LOSS.jpg");
  size(700,1000);
  background(0);
  Kernal k = new Kernal(new float[][]{
  {1,0,0,-1,1,0,1},
  {1,0,0,-1,1,0,1},
  {1,0,0,-1,1,0,1},
  {-1,-1,-1,-1,-1,-1,-1},
  {1,0,1,-1,1,0,0},
  {1,0,1,-1,1,0,0},
  {1,0,1,-1,1,1,1}});
  PImage NewP = p;
  NewP = k.Apply(NewP); 
  NewP.save("out.jpg");
  println("Done");
  image(NewP,0,0);
}

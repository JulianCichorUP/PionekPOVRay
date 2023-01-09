#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 

#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"

camera {perspective angle 75     
        location  <10.0 , 10.0 ,-10.0>
        right     x*image_width/image_height
        look_at   <0.0 , 1.0 , 0.0>}

light_source{< 3000,3000,-3000> color White}                                

sky_sphere { pigment { gradient <0,1,0>
                       color_map { [0.00 rgb <0.6,0.7,1.0>]
                                   [0.35 rgb <0.1,0.0,0.8>]
                                   [0.65 rgb <0.1,0.0,0.8>]
                                   [1.00 rgb <0.6,0.7,1.0>] 
                                 } 
                       scale 2         
                     }
           }         
           
plane{ <0,1,0>, 0 
       texture{ pigment{ checker color rgb<1,1,1>*1.2 color rgb<0.25,0.15,0.1>*0}

                finish { phong 0.1}
              } 
     } 

#declare PawnBase =
union {
    intersection {
       sphere { <0, 0, 0>, 2.5 }
       plane { -y, 0 }
    }
    cylinder { 0, y*0.35, 2.5 }
}

#declare Pawn = union {
   sphere { <0, 7, 0>, 1.5 }
   
   sphere { <0, 0, 0>, 1
      scale <1.2, 0.3, 1.2>
      translate 5.5*y
   }

   intersection {
      plane { y, 5.5 }
      object {
         Hyperboloid_Y
         translate 5*y
         scale <0.5, 1, 0.5>
      }
      plane { -y, -2.5 }
   }

   sphere { <0, 0, 0>, 1
      scale <2, 0.5, 2>
      translate <0, 2.3, 0>
   }
   object { PawnBase }
}

object { Pawn }

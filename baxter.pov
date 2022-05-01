#version 3.7;
#include "/home/eryk/CSCI534/amino/lisp/../share/default.inc"
#include "/tmp/amino-eryk/povray/home/eryk/CSCI534/baxter_common/baxter_description/meshes/wrist/W2.inc"
#include "/tmp/amino-eryk/povray/home/eryk/CSCI534/baxter_common/baxter_description/meshes/upper_shoulder/S0.inc"
#include "/tmp/amino-eryk/povray/home/eryk/CSCI534/baxter_common/baxter_description/meshes/upper_forearm/W0.inc"
#include "/tmp/amino-eryk/povray/home/eryk/CSCI534/baxter_common/baxter_description/meshes/upper_elbow/E0.inc"
#include "/tmp/amino-eryk/povray/home/eryk/CSCI534/baxter_common/baxter_description/meshes/torso/base_link.inc"
#include "/tmp/amino-eryk/povray/home/eryk/CSCI534/baxter_common/baxter_description/meshes/lower_shoulder/S1.inc"
#include "/tmp/amino-eryk/povray/home/eryk/CSCI534/baxter_common/baxter_description/meshes/lower_forearm/W1.inc"
#include "/tmp/amino-eryk/povray/home/eryk/CSCI534/baxter_common/baxter_description/meshes/lower_elbow/E1.inc"
#include "/tmp/amino-eryk/povray/home/eryk/CSCI534/baxter_common/baxter_description/meshes/head/H1.inc"
#include "/tmp/amino-eryk/povray/home/eryk/CSCI534/baxter_common/baxter_description/meshes/head/H0.inc"
#include "/tmp/amino-eryk/povray/home/eryk/CSCI534/baxter_common/baxter_description/meshes/base/PEDESTAL.inc"
// FRAME: torso_t0
mesh2 {
   _home_eryk_CSCI534_baxter_common_baxter_description_meshes_torso_base_link_DAE
   scale 1.0
   transform {
      matrix <
         1.0, 0.0, 0.0,
         0.0, 1.0, 0.0,
         0.0, 0.0, 1.0,
         0.0, 0.0, 0.0 >
   }
}
// FRAME: sonar_ring-visual
cylinder {
   <0.0, 0.0, 0.0>
   <0.0, 0.009999999776482582, 0.0>
   0.08500000089406967
   scale 1
   texture {
      pigment {
         color rgb<0.20000000298023224, 0.20000000298023224, 0.20000000298023224>
         transmit 0.0
      }
      finish {
         metallic
         specular 0
      }
   }
   transform {
      matrix <
         1.0, 0.0, 0.0,
         0.0, 1.0, 0.0,
         0.0, 0.0, 1.0,
         0.06000000238418579, 0.8215299723669887, 0.0 >
   }
}
// FRAME: screen-visual
mesh2 {
   _home_eryk_CSCI534_baxter_common_baxter_description_meshes_head_H1_DAE
   scale 1.0
   transform {
      matrix <
         0.9838841762613115, -0.17880695652742506, -0.0000000007044450578419514,
         0.0000000007044450578419514, 0.000000007815900704422063, -0.9999999999999998,
         0.17880695652742506, 0.9838841762613113, 0.000000007815900704422063,
         0.14685518688119245, 0.6828281741036686, -0.0000000015668264775892116 >
   }
}
// FRAME: right_w2
mesh2 {
   _home_eryk_CSCI534_baxter_common_baxter_description_meshes_wrist_W2_DAE
   scale 1.0
   transform {
      matrix <
         -0.0000001236345974486852, -0.9999999999999907, -0.00000006181701317498067,
         0.707105408599584, -0.00000004371137851677531, -0.7071081537708455,
         0.707108153770836, -0.00000013113417612897749, 0.7071054085995825,
         0.7171699464462928, 0.3209759881516457, -0.9121725221656702 >
   }
}
// FRAME: right_w1
mesh2 {
   _home_eryk_CSCI534_baxter_common_baxter_description_meshes_lower_forearm_W1_DAE
   scale 1.0
   transform {
      matrix <
         0.7071054395082683, 0.00000000000000588418203051333, -0.7071081228622809,
         0.7071081228622749, -0.0000001311341741860872, 0.7071054395082623,
         -0.00000009272603557208825, -0.9999999999999913, -0.00000009272569201357328,
         0.6351633931246095, 0.32097598815164496, -0.8301656576420053 >
   }
}
// FRAME: right_w0
mesh2 {
   _home_eryk_CSCI534_baxter_common_baxter_description_meshes_upper_forearm_W0_DAE
   scale 1.0
   transform {
      matrix <
         -0.000000092725918388048, -0.9999999999999952, -0.00000003090845140940601,
         0.7071054395082651, -0.00000004371138423442389, -0.7071081228622829,
         0.707108122862278, -0.00000008742278417850358, 0.7071054395082659,
         0.44374994614847746, 0.33097599976079944, -0.6387514830455765 >
   }
}
// FRAME: right_s1
mesh2 {
   _home_eryk_CSCI534_baxter_common_baxter_description_meshes_lower_shoulder_S1_DAE
   scale 1.0
   transform {
      matrix <
         0.7071055013256238, 0.0, -0.7071080610451548,
         0.707108061045154, -0.00000004371139006309477, 0.707105501325623,
         -0.0000000309086763405908, -0.999999999999999, -0.00000003090856437459877,
         0.11281752069423541, 0.39997600950300694, -0.3078178327259032 >
   }
}
// FRAME: right_s0
mesh2 {
   _home_eryk_CSCI534_baxter_common_baxter_description_meshes_upper_shoulder_S0_DAE
   scale 1.0
   transform {
      matrix <
         0.7071055013256238, -0.0, -0.7071080610451548,
         0.0, 1.0, -0.0,
         0.7071080610451548, 0.0, 0.7071055013256238,
         0.06402724232502377, 0.12962600030004978, -0.25902737773604834 >
   }
}
// FRAME: right_hand_range
box {
   <0.0024999999441206455, 0.0024999999441206455, 0.009999999776482582>
   <-0.0024999999441206455, -0.0024999999441206455, -0.009999999776482582>
   scale 1
   texture {
      pigment {
         color rgb<0.0, 0.0, 1.0>
         transmit 0.19999998807907104
      }
      finish {
         metallic
         specular 0
      }
   }
   transform {
      matrix <
         0.7071054395082635, -0.00000004371138617731418, -0.7071081228622844,
         0.7071081228622689, -0.00000017484556424918196, 0.7071054395082588,
         -0.0000001545432776750566, -0.9999999999999838, -0.00000009272557333073195,
         0.8035109918962284, 0.2889759830642243, -1.0271447189136422 >
   }
}
// FRAME: right_hand_camera-visual
cylinder {
   <0.0, 0.0, 0.0>
   <0.0, 0.009999999776482582, 0.0>
   0.019999999552965164
   scale 1
   texture {
      pigment {
         color rgb<0.0, 0.0, 1.0>
         transmit 0.19999998807907104
      }
      finish {
         metallic
         specular 0
      }
   }
   transform {
      matrix <
         -0.7071081537708301, 0.00000017484556619207225, -0.7071054085995794,
         0.707105408599584, -0.00000004371137854453089, -0.7071081537708455,
         -0.0000001545432775640343, -0.999999999999984, -0.00000009272557369155443,
         0.8132691354845799, 0.2827259818772333, -0.9913014955419682 >
   }
}
// FRAME: right_hand_accelerometer
box {
   <0.004999999888241291, 0.004999999888241291, 0.004999999888241291>
   <-0.004999999888241291, -0.004999999888241291, -0.004999999888241291>
   scale 1
   texture {
      pigment {
         color rgb<0.0, 0.0, 0.0>
         transmit 0.0
      }
      finish {
         metallic
         specular 0
      }
   }
   transform {
      matrix <
         -0.0000001236345974486852, -0.9999999999999907, -0.00000006181701317498067,
         0.707105408599584, -0.00000004371137851677531, -0.7071081537708455,
         0.707108153770836, -0.00000013113417612897749, 0.7071054085995825,
         0.7872320714434384, 0.31899598386625894, -0.9820468287692629 >
   }
}
// FRAME: right_gripper_base-visual
box {
   <0.012500000186264515, 0.017500000074505806, 0.03750000149011612>
   <-0.012500000186264515, -0.017500000074505806, -0.03750000149011612>
   scale 1
   texture {
      pigment {
         color rgb<0.5, 0.10000000149011612, 0.10000000149011612>
         transmit 0.0
      }
      finish {
         metallic
         specular 0
      }
   }
   transform {
      matrix <
         -0.0000001236345974486852, -0.9999999999999907, -0.00000006181701317498067,
         0.707105408599584, -0.00000004371137851677531, -0.7071081537708455,
         0.707108153770836, -0.00000013113417612897749, 0.7071054085995825,
         0.7833196576610204, 0.3209759840624462, -0.9783224901911703 >
   }
}
// FRAME: right_endpoint
box {
   <0.004999999888241291, 0.004999999888241291, 0.004999999888241291>
   <-0.004999999888241291, -0.004999999888241291, -0.004999999888241291>
   scale 1
   texture {
      pigment {
         color rgb<0.0, 0.0, 0.0>
         transmit 0.0
      }
      finish {
         metallic
         specular 0
      }
   }
   transform {
      matrix <
         -0.0000001236345974486852, -0.9999999999999907, -0.00000006181701317498067,
         0.707105408599584, -0.00000004371137851677531, -0.7071081537708455,
         0.707108153770836, -0.00000013113417612897749, 0.7071054085995825,
         0.8151394009953183, 0.32097598209543415, -1.0101423570581747 >
   }
}
// FRAME: right_e1
mesh2 {
   _home_eryk_CSCI534_baxter_common_baxter_description_meshes_lower_elbow_E1_DAE
   scale 1.0
   transform {
      matrix <
         0.7071054704169468, 0.000000000000001887379141862766, -0.7071080919537185,
         0.7071080919537157, -0.00000008742278234663559, 0.7071054704169442,
         -0.00000006181735540122801, -0.9999999999999962, -0.00000006181712897124214,
         0.3705008928046029, 0.3309759997607993, -0.5655021581367164 >
   }
}
// FRAME: right_e0
mesh2 {
   _home_eryk_CSCI534_baxter_common_baxter_description_meshes_upper_elbow_E0_DAE
   scale 1.0
   transform {
      matrix <
         -0.00000006181724088172302, -0.9999999999999982, 0.00000000000011179945857975326,
         0.707105470416945, -0.00000004371138825898235, -0.7071080919537192,
         0.7071080919537178, -0.000000043711392117007364, 0.7071054704169462,
         0.1849422804807523, 0.39997600950300694, -0.37994285360380736 >
   }
}
// FRAME: pedestal_fixed
mesh2 {
   _home_eryk_CSCI534_baxter_common_baxter_description_meshes_base_PEDESTAL_DAE
   scale 1.0
   transform {
      matrix <
         1.0, 0.0, 0.0,
         0.0, 1.0, 0.0,
         0.0, 0.0, 1.0,
         0.0, 0.0, 0.0 >
   }
}
// FRAME: left_w2
mesh2 {
   _home_eryk_CSCI534_baxter_common_baxter_description_meshes_wrist_W2_DAE
   scale 1.0
   transform {
      matrix <
         0.00000006181746037281499, -0.9999999999999907, -0.00000012363437351670115,
         0.7071055940516497, -0.000000043711378683308766, 0.7071079683194511,
         -0.7071079683194498, -0.00000013113417607346634, 0.7071055940516402,
         0.7171700223802585, 0.3209759881516455, 0.9121724462319794 >
   }
}
// FRAME: left_w1
mesh2 {
   _home_eryk_CSCI534_baxter_common_baxter_description_meshes_lower_forearm_W1_DAE
   scale 1.0
   transform {
      matrix <
         0.7071055631429735, 0.000000000000005773159728050814, 0.7071079992280236,
         -0.7071079992280175, -0.0000001311341742971095, 0.7071055631429675,
         0.00000009272602757848247, -0.9999999999999916, -0.00000009272570011820136,
         0.6351634547200402, 0.32097598815164485, 0.8301655960467974 >
   }
}
// FRAME: left_w0
mesh2 {
   _home_eryk_CSCI534_baxter_common_baxter_description_meshes_upper_forearm_W0_DAE
   scale 1.0
   transform {
      matrix <
         0.0000000309087866412483, -0.9999999999999954, -0.00000009272580642205597,
         0.7071055631429756, -0.00000004371138453973522, 0.7071079992280203,
         -0.7071079992280209, -0.00000008742278412299243, 0.7071055631429706,
         0.4437499730396442, 0.33097599976079956, 0.638751456154507 >
   }
}
// FRAME: left_s1
mesh2 {
   _home_eryk_CSCI534_baxter_common_baxter_description_meshes_lower_shoulder_S1_DAE
   scale 1.0
   transform {
      matrix <
         0.7071055013256238, 0.0, 0.7071080610451548,
         -0.707108061045154, -0.00000004371139006309477, 0.707105501325623,
         0.0000000309086763405908, -0.999999999999999, -0.00000003090856437459877,
         0.11281752069423541, 0.39997600950300694, 0.3078178327259032 >
   }
}
// FRAME: left_s0
mesh2 {
   _home_eryk_CSCI534_baxter_common_baxter_description_meshes_upper_shoulder_S0_DAE
   scale 1.0
   transform {
      matrix <
         0.7071055013256238, 0.0, 0.7071080610451548,
         0.0, 1.0, 0.0,
         -0.7071080610451548, 0.0, 0.7071055013256238,
         0.06402724232502377, 0.12962600030004978, 0.25902737773604834 >
   }
}
// FRAME: left_hand_range
box {
   <0.0024999999441206455, 0.0024999999441206455, 0.009999999776482582>
   <-0.0024999999441206455, -0.0024999999441206455, -0.009999999776482582>
   scale 1
   texture {
      pigment {
         color rgb<0.0, 0.0, 1.0>
         transmit 0.19999998807907104
      }
      finish {
         metallic
         specular 0
      }
   }
   transform {
      matrix <
         0.7071055631429768, -0.00000004371138617731418, 0.7071079992280187,
         -0.707107999228014, -0.00000017484556424918196, 0.7071055631429612,
         0.0000000927261327166029, -0.9999999999999838, -0.0000001545429419991251,
         0.8321419065737493, 0.2889759830642241, 0.9985139078795606 >
   }
}
// FRAME: left_hand_camera-visual
cylinder {
   <0.0, 0.0, 0.0>
   <0.0, 0.009999999776482582, 0.0>
   0.019999999552965164
   scale 1
   texture {
      pigment {
         color rgb<0.0, 0.0, 1.0>
         transmit 0.19999998807907104
      }
      finish {
         metallic
         specular 0
      }
   }
   transform {
      matrix <
         0.7071079683194462, 0.0000001748455660255388, -0.7071055940516342,
         0.7071055940516497, -0.000000043711378627797615, 0.707107968319451,
         0.00000009272613266109175, -0.9999999999999838, -0.0000001545429419991251,
         0.7962986478779273, 0.2827259818772331, 1.0082719217157352 >
   }
}
// FRAME: left_hand_accelerometer
box {
   <0.004999999888241291, 0.004999999888241291, 0.004999999888241291>
   <-0.004999999888241291, -0.004999999888241291, -0.004999999888241291>
   scale 1
   texture {
      pigment {
         color rgb<0.0, 0.0, 0.0>
         transmit 0.0
      }
      finish {
         metallic
         specular 0
      }
   }
   transform {
      matrix <
         0.00000006181746037281499, -0.9999999999999907, -0.00000012363437351670115,
         0.7071055940516497, -0.000000043711378683308766, 0.7071079683194511,
         -0.7071079683194498, -0.00000013113417607346634, 0.7071055940516402,
         0.787044075359196, 0.31899598386625877, 0.9822348241729625 >
   }
}
// FRAME: left_gripper_base-visual
box {
   <0.012500000186264515, 0.017500000074505806, 0.03750000149011612>
   <-0.012500000186264515, -0.017500000074505806, -0.03750000149011612>
   scale 1
   texture {
      pigment {
         color rgb<0.5, 0.10000000149011612, 0.10000000149011612>
         transmit 0.0
      }
      finish {
         metallic
         specular 0
      }
   }
   transform {
      matrix <
         0.00000006181746037281499, -0.9999999999999907, -0.00000012363437351670115,
         0.7071055940516497, -0.000000043711378683308766, 0.7071079683194511,
         -0.7071079683194498, -0.00000013113417607346634, 0.7071055940516402,
         0.783319750944027, 0.32097598406244604, 0.9783223969085014 >
   }
}
// FRAME: left_endpoint
box {
   <0.004999999888241291, 0.004999999888241291, 0.004999999888241291>
   <-0.004999999888241291, -0.004999999888241291, -0.004999999888241291>
   scale 1
   texture {
      pigment {
         color rgb<0.0, 0.0, 0.0>
         transmit 0.0
      }
      finish {
         metallic
         specular 0
      }
   }
   transform {
      matrix <
         0.00000006181746037281499, -0.9999999999999907, -0.00000012363437351670115,
         0.7071055940516497, -0.000000043711378683308766, 0.7071079683194511,
         -0.7071079683194498, -0.00000013113417607346634, 0.7071055940516402,
         0.8151395026236676, 0.320975982095434, 1.010142255430193 >
   }
}
// FRAME: left_e1
mesh2 {
   _home_eryk_CSCI534_baxter_common_baxter_description_meshes_lower_elbow_E1_DAE
   scale 1.0
   transform {
      matrix <
         0.7071055322342991, 0.0000000000000019984014443252818, 0.70710803013659,
         -0.7071080301365873, -0.00000008742278234663559, 0.7071055322342966,
         0.0000000618173526811816, -0.9999999999999963, -0.0000000618171317467997,
         0.3705009132921103, 0.33097599976079933, 0.5655021376492831 >
   }
}
// FRAME: left_e0
mesh2 {
   _home_eryk_CSCI534_baxter_common_baxter_description_meshes_upper_elbow_E0_DAE
   scale 1.0
   transform {
      matrix <
         0.0000000000001120215031846783, -0.9999999999999981, -0.00000006181724071518957,
         0.7071055322343, -0.000000043711388120204475, 0.7071080301365877,
         -0.7071080301365891, -0.000000043711392117007364, 0.7071055322342985,
         0.1849422804807523, 0.39997600950300694, 0.37994285360380736 >
   }
}
// FRAME: head-visual
mesh2 {
   _home_eryk_CSCI534_baxter_common_baxter_description_meshes_head_H0_DAE
   scale 1.0
   transform {
      matrix <
         1.0, 0.0, 0.0,
         0.0, 1.0, 0.0,
         0.0, 0.0, 1.0,
         0.05999999865889549, 0.6955299898982048, 0.0 >
   }
}
// FRAME: display-visual
box {
   <0.10899999737739563, 0.0005000000237487257, 0.07999999821186066>
   <-0.10899999737739563, -0.0005000000237487257, -0.07999999821186066>
   scale 1
   texture {
      pigment {
         color rgb<0.0, 0.0, 0.0>
         transmit 0.0
      }
      finish {
         metallic
         specular 0
      }
   }
   transform {
      matrix <
         -0.00000004371139017411707, 0.00000000000000005551115123125783, 0.9999999999999992,
         0.9040804870683969, -0.4273622268078556, 0.00000003951861471396256,
         0.4273622268078551, 0.9040804870683978, 0.000000018680596736153632,
         0.1798390855377197, 0.6702578419416897, -0.00000000012505441647492344 >
   }
}
// FRAME: collision_head_2
sphere {
   <0.0, 0.0, 0.0>
   0.0010000000474974513
   scale 1
   texture {
      pigment {
         color rgb<0.800000011920929, 0.30000001192092896, 0.30000001192092896>
         transmit 0.699999988079071
      }
      finish {
         metallic
         specular 0
      }
   }
   transform {
      matrix <
         1.0, 0.0, 0.0,
         0.0, 1.0, 0.0,
         0.0, 0.0, 1.0,
         0.10999999940395355, 0.75, 0.0 >
   }
}
// FRAME: collision_head_1
sphere {
   <0.0, 0.0, 0.0>
   0.0010000000474974513
   scale 1
   texture {
      pigment {
         color rgb<0.800000011920929, 0.30000001192092896, 0.30000001192092896>
         transmit 0.699999988079071
      }
      finish {
         metallic
         specular 0
      }
   }
   transform {
      matrix <
         1.0, 0.0, 0.0,
         0.0, 1.0, 0.0,
         0.0, 0.0, 1.0,
         0.10999999940395355, 0.75, 0.0 >
   }
}
camera {
   location <2.799999952316284, 1.0, 0.0>
   look_at <1.8582580425356738, 0.6636635979220076, 0.0>
   sky <-0.3363364020779928, 0.9417419097806103, -0.00000000000000027755575615628914>
   right x*3840/3840
}
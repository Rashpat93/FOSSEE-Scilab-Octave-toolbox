// Copyright (C) 2015 - IIT Bombay - FOSSEE
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
// Author: Rupak Rokade
// Organization: FOSSEE, IIT Bombay
// Email: toolbox@scilab.in

mode(-1)
lines(0)

toolbox_title = "scilab_octave";

Build_64Bits = %t;

path_builder = get_absolute_file_path('builder_gateway_cpp.sce');

Function_Names = [
        //fun function
        "octave_fun","sci_octave_fun", "csci6";
    ];

//Name of all the files to be compiled
Files = [
        "sci_octave.cpp"
    ]



[a, opt] = getversion();
Version = opt(2);

//Build_64Bits = %f;

if getos()=="Windows" then

	  third_dir = path_builder+filesep()+'..'+filesep()+'..'+filesep()+'thirdparty';
    lib_base_dir = third_dir + filesep() + 'windows' + filesep() + 'lib' + filesep() + Version + filesep();
    inc_base_dir = third_dir + filesep() + 'linux' + filesep() + 'include';
    threads_dir=third_dir + filesep() + 'linux' + filesep() + 'include' + filesep() + 'pthreads-win32';
    C_Flags=['-D__USE_DEPRECATED_STACK_FUNCTIONS__  -I -w '+path_builder+' '+ '-I '+inc_base_dir+' '+'-I '+threads_dir+' ']   
    Linker_Flag  = [lib_base_dir+"liblibraryname.lib"]

elseif getos()=="Darwin" then 
	third_dir = path_builder+filesep()+'..'+filesep()+'..'+filesep()+'thirdparty';
    	lib_base_dir = third_dir + filesep() + 'Mac' + filesep() + 'lib' + filesep() + Version + filesep();
      inc_base_dir = third_dir + filesep() + 'linux' + filesep() + 'include';
    	C_Flags=["-D__USE_DEPRECATED_STACK_FUNCTIONS__ -w -fpermissive -I"+path_builder+" -I"+inc_base_dir+" -Wl,-rpath "+lib_base_dir+" "]
    	Linker_Flag = ["-L"+lib_base_dir+"liblibraryname"];

else//LINUX

    third_dir = path_builder+filesep()+'..'+filesep()+'..'+filesep()+'thirdparty';
    lib_base_dir = third_dir + filesep() + 'linux' + filesep() + 'lib' + filesep() + Version + filesep();
    inc_base_dir = third_dir + filesep() + 'linux' + filesep() + 'include';
    

    C_Flags = ["-g -I"+inc_base_dir];
		Linker_Flag = ["-g -L/usr/lib/x86_64-linux-gnu/octave/7.3.0/ -L" + lib_base_dir + " -lfun -Wl,-rpath="+lib_base_dir+" -loctave -loctinterp removed"];

    //disp(C_Flags);
    //disp(Linker_Flag);
    
end

tbx_build_gateway(toolbox_title,Function_Names,Files,get_absolute_file_path("builder_gateway_cpp.sce"), [], Linker_Flag, C_Flags,[]);

clear toolbox_title Function_Names Files Linker_Flag C_Flags;

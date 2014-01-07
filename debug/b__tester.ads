pragma Ada_95;
with System;
package ada_main is
   pragma Warnings (Off);

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2013 (20130314)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_tester" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#38a7e296#;
   pragma Export (C, u00001, "testerB");
   u00002 : constant Version_32 := 16#3935bd10#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#b31646c6#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#c453848b#;
   pragma Export (C, u00004, "astS");
   u00005 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00005, "adaS");
   u00006 : constant Version_32 := 16#cff320ef#;
   pragma Export (C, u00006, "ada__exceptionsB");
   u00007 : constant Version_32 := 16#813e0b0c#;
   pragma Export (C, u00007, "ada__exceptionsS");
   u00008 : constant Version_32 := 16#16173147#;
   pragma Export (C, u00008, "ada__exceptions__last_chance_handlerB");
   u00009 : constant Version_32 := 16#1f42fb5e#;
   pragma Export (C, u00009, "ada__exceptions__last_chance_handlerS");
   u00010 : constant Version_32 := 16#bd760655#;
   pragma Export (C, u00010, "systemS");
   u00011 : constant Version_32 := 16#0071025c#;
   pragma Export (C, u00011, "system__soft_linksB");
   u00012 : constant Version_32 := 16#d02d7c88#;
   pragma Export (C, u00012, "system__soft_linksS");
   u00013 : constant Version_32 := 16#27940d94#;
   pragma Export (C, u00013, "system__parametersB");
   u00014 : constant Version_32 := 16#0b940a95#;
   pragma Export (C, u00014, "system__parametersS");
   u00015 : constant Version_32 := 16#17775d6d#;
   pragma Export (C, u00015, "system__secondary_stackB");
   u00016 : constant Version_32 := 16#a91821fb#;
   pragma Export (C, u00016, "system__secondary_stackS");
   u00017 : constant Version_32 := 16#ace32e1e#;
   pragma Export (C, u00017, "system__storage_elementsB");
   u00018 : constant Version_32 := 16#47bb7bcd#;
   pragma Export (C, u00018, "system__storage_elementsS");
   u00019 : constant Version_32 := 16#4f750b3b#;
   pragma Export (C, u00019, "system__stack_checkingB");
   u00020 : constant Version_32 := 16#1ed4ba79#;
   pragma Export (C, u00020, "system__stack_checkingS");
   u00021 : constant Version_32 := 16#7b9f0bae#;
   pragma Export (C, u00021, "system__exception_tableB");
   u00022 : constant Version_32 := 16#2c18daf0#;
   pragma Export (C, u00022, "system__exception_tableS");
   u00023 : constant Version_32 := 16#5665ab64#;
   pragma Export (C, u00023, "system__htableB");
   u00024 : constant Version_32 := 16#3ede485b#;
   pragma Export (C, u00024, "system__htableS");
   u00025 : constant Version_32 := 16#8b7dad61#;
   pragma Export (C, u00025, "system__string_hashB");
   u00026 : constant Version_32 := 16#9beadec1#;
   pragma Export (C, u00026, "system__string_hashS");
   u00027 : constant Version_32 := 16#aad75561#;
   pragma Export (C, u00027, "system__exceptionsB");
   u00028 : constant Version_32 := 16#b188cee2#;
   pragma Export (C, u00028, "system__exceptionsS");
   u00029 : constant Version_32 := 16#010db1dc#;
   pragma Export (C, u00029, "system__exceptions_debugB");
   u00030 : constant Version_32 := 16#85062381#;
   pragma Export (C, u00030, "system__exceptions_debugS");
   u00031 : constant Version_32 := 16#b012ff50#;
   pragma Export (C, u00031, "system__img_intB");
   u00032 : constant Version_32 := 16#bfade697#;
   pragma Export (C, u00032, "system__img_intS");
   u00033 : constant Version_32 := 16#dc8e33ed#;
   pragma Export (C, u00033, "system__tracebackB");
   u00034 : constant Version_32 := 16#dcf1d220#;
   pragma Export (C, u00034, "system__tracebackS");
   u00035 : constant Version_32 := 16#907d882f#;
   pragma Export (C, u00035, "system__wch_conB");
   u00036 : constant Version_32 := 16#029d2868#;
   pragma Export (C, u00036, "system__wch_conS");
   u00037 : constant Version_32 := 16#22fed88a#;
   pragma Export (C, u00037, "system__wch_stwB");
   u00038 : constant Version_32 := 16#2f8c0469#;
   pragma Export (C, u00038, "system__wch_stwS");
   u00039 : constant Version_32 := 16#617a40f2#;
   pragma Export (C, u00039, "system__wch_cnvB");
   u00040 : constant Version_32 := 16#1c63aebe#;
   pragma Export (C, u00040, "system__wch_cnvS");
   u00041 : constant Version_32 := 16#cb4a8015#;
   pragma Export (C, u00041, "interfacesS");
   u00042 : constant Version_32 := 16#75729fba#;
   pragma Export (C, u00042, "system__wch_jisB");
   u00043 : constant Version_32 := 16#481135aa#;
   pragma Export (C, u00043, "system__wch_jisS");
   u00044 : constant Version_32 := 16#ada34a87#;
   pragma Export (C, u00044, "system__traceback_entriesB");
   u00045 : constant Version_32 := 16#ef57e814#;
   pragma Export (C, u00045, "system__traceback_entriesS");
   u00046 : constant Version_32 := 16#1358602f#;
   pragma Export (C, u00046, "ada__streamsS");
   u00047 : constant Version_32 := 16#afd62b40#;
   pragma Export (C, u00047, "ada__tagsB");
   u00048 : constant Version_32 := 16#1442fc05#;
   pragma Export (C, u00048, "ada__tagsS");
   u00049 : constant Version_32 := 16#d7975a23#;
   pragma Export (C, u00049, "system__unsigned_typesS");
   u00050 : constant Version_32 := 16#79817c71#;
   pragma Export (C, u00050, "system__val_unsB");
   u00051 : constant Version_32 := 16#c73fb718#;
   pragma Export (C, u00051, "system__val_unsS");
   u00052 : constant Version_32 := 16#aea309ed#;
   pragma Export (C, u00052, "system__val_utilB");
   u00053 : constant Version_32 := 16#11d6b0ab#;
   pragma Export (C, u00053, "system__val_utilS");
   u00054 : constant Version_32 := 16#b7fa72e7#;
   pragma Export (C, u00054, "system__case_utilB");
   u00055 : constant Version_32 := 16#106a66dd#;
   pragma Export (C, u00055, "system__case_utilS");
   u00056 : constant Version_32 := 16#af50e98f#;
   pragma Export (C, u00056, "ada__stringsS");
   u00057 : constant Version_32 := 16#261c554b#;
   pragma Export (C, u00057, "ada__strings__unboundedB");
   u00058 : constant Version_32 := 16#2bf53506#;
   pragma Export (C, u00058, "ada__strings__unboundedS");
   u00059 : constant Version_32 := 16#562e7aee#;
   pragma Export (C, u00059, "ada__strings__searchB");
   u00060 : constant Version_32 := 16#b5a8c1d6#;
   pragma Export (C, u00060, "ada__strings__searchS");
   u00061 : constant Version_32 := 16#96e9c1e7#;
   pragma Export (C, u00061, "ada__strings__mapsB");
   u00062 : constant Version_32 := 16#24318e4c#;
   pragma Export (C, u00062, "ada__strings__mapsS");
   u00063 : constant Version_32 := 16#35042ca6#;
   pragma Export (C, u00063, "system__bit_opsB");
   u00064 : constant Version_32 := 16#c30e4013#;
   pragma Export (C, u00064, "system__bit_opsS");
   u00065 : constant Version_32 := 16#12c24a43#;
   pragma Export (C, u00065, "ada__charactersS");
   u00066 : constant Version_32 := 16#051b1b7b#;
   pragma Export (C, u00066, "ada__characters__latin_1S");
   u00067 : constant Version_32 := 16#c4857ee1#;
   pragma Export (C, u00067, "system__compare_array_unsigned_8B");
   u00068 : constant Version_32 := 16#674df098#;
   pragma Export (C, u00068, "system__compare_array_unsigned_8S");
   u00069 : constant Version_32 := 16#9d3d925a#;
   pragma Export (C, u00069, "system__address_operationsB");
   u00070 : constant Version_32 := 16#7d08efc2#;
   pragma Export (C, u00070, "system__address_operationsS");
   u00071 : constant Version_32 := 16#b2cd7d9b#;
   pragma Export (C, u00071, "system__machine_codeS");
   u00072 : constant Version_32 := 16#1fd820b1#;
   pragma Export (C, u00072, "system__storage_pools__subpoolsB");
   u00073 : constant Version_32 := 16#951e0de9#;
   pragma Export (C, u00073, "system__storage_pools__subpoolsS");
   u00074 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00074, "system__address_imageB");
   u00075 : constant Version_32 := 16#1c9a9b6f#;
   pragma Export (C, u00075, "system__address_imageS");
   u00076 : constant Version_32 := 16#91d2300e#;
   pragma Export (C, u00076, "system__finalization_mastersB");
   u00077 : constant Version_32 := 16#d783aa79#;
   pragma Export (C, u00077, "system__finalization_mastersS");
   u00078 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00078, "system__img_boolB");
   u00079 : constant Version_32 := 16#48af77be#;
   pragma Export (C, u00079, "system__img_boolS");
   u00080 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00080, "system__ioB");
   u00081 : constant Version_32 := 16#2334f11a#;
   pragma Export (C, u00081, "system__ioS");
   u00082 : constant Version_32 := 16#8cbe6205#;
   pragma Export (C, u00082, "ada__finalizationB");
   u00083 : constant Version_32 := 16#22e22193#;
   pragma Export (C, u00083, "ada__finalizationS");
   u00084 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00084, "system__finalization_rootB");
   u00085 : constant Version_32 := 16#f28475c5#;
   pragma Export (C, u00085, "system__finalization_rootS");
   u00086 : constant Version_32 := 16#a7a37cb6#;
   pragma Export (C, u00086, "system__storage_poolsB");
   u00087 : constant Version_32 := 16#6ed81938#;
   pragma Export (C, u00087, "system__storage_poolsS");
   u00088 : constant Version_32 := 16#1777d351#;
   pragma Export (C, u00088, "system__storage_pools__subpools__finalizationB");
   u00089 : constant Version_32 := 16#12aaf1de#;
   pragma Export (C, u00089, "system__storage_pools__subpools__finalizationS");
   u00090 : constant Version_32 := 16#8d43fb6a#;
   pragma Export (C, u00090, "system__atomic_countersB");
   u00091 : constant Version_32 := 16#f7ea6ae1#;
   pragma Export (C, u00091, "system__atomic_countersS");
   u00092 : constant Version_32 := 16#a6e358bc#;
   pragma Export (C, u00092, "system__stream_attributesB");
   u00093 : constant Version_32 := 16#e89b4b3f#;
   pragma Export (C, u00093, "system__stream_attributesS");
   u00094 : constant Version_32 := 16#b46168d5#;
   pragma Export (C, u00094, "ada__io_exceptionsS");
   u00095 : constant Version_32 := 16#ba5d60c7#;
   pragma Export (C, u00095, "system__pool_globalB");
   u00096 : constant Version_32 := 16#d56df0a6#;
   pragma Export (C, u00096, "system__pool_globalS");
   u00097 : constant Version_32 := 16#fc605663#;
   pragma Export (C, u00097, "system__memoryB");
   u00098 : constant Version_32 := 16#77fdba40#;
   pragma Export (C, u00098, "system__memoryS");
   u00099 : constant Version_32 := 16#d45bc0f4#;
   pragma Export (C, u00099, "system__crtlS");
   u00100 : constant Version_32 := 16#012b511f#;
   pragma Export (C, u00100, "utilS");
   u00101 : constant Version_32 := 16#673debe7#;
   pragma Export (C, u00101, "ast__bindersB");
   u00102 : constant Version_32 := 16#80b07951#;
   pragma Export (C, u00102, "ast__bindersS");
   u00103 : constant Version_32 := 16#ae97ef6c#;
   pragma Export (C, u00103, "system__concat_3B");
   u00104 : constant Version_32 := 16#cb5c043f#;
   pragma Export (C, u00104, "system__concat_3S");
   u00105 : constant Version_32 := 16#39591e91#;
   pragma Export (C, u00105, "system__concat_2B");
   u00106 : constant Version_32 := 16#46a6f4a9#;
   pragma Export (C, u00106, "system__concat_2S");
   u00107 : constant Version_32 := 16#354dcf5e#;
   pragma Export (C, u00107, "ast__namesB");
   u00108 : constant Version_32 := 16#ee3b4775#;
   pragma Export (C, u00108, "ast__namesS");
   u00109 : constant Version_32 := 16#ce0e2acb#;
   pragma Export (C, u00109, "system__strings__stream_opsB");
   u00110 : constant Version_32 := 16#8453d1c6#;
   pragma Export (C, u00110, "system__strings__stream_opsS");
   u00111 : constant Version_32 := 16#7f3a23e7#;
   pragma Export (C, u00111, "ada__streams__stream_ioB");
   u00112 : constant Version_32 := 16#31db4e88#;
   pragma Export (C, u00112, "ada__streams__stream_ioS");
   u00113 : constant Version_32 := 16#e0b7a7e8#;
   pragma Export (C, u00113, "interfaces__c_streamsB");
   u00114 : constant Version_32 := 16#95ad191f#;
   pragma Export (C, u00114, "interfaces__c_streamsS");
   u00115 : constant Version_32 := 16#5de653db#;
   pragma Export (C, u00115, "system__communicationB");
   u00116 : constant Version_32 := 16#485d2313#;
   pragma Export (C, u00116, "system__communicationS");
   u00117 : constant Version_32 := 16#228a5436#;
   pragma Export (C, u00117, "system__file_ioB");
   u00118 : constant Version_32 := 16#2c376772#;
   pragma Export (C, u00118, "system__file_ioS");
   u00119 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00119, "interfaces__cB");
   u00120 : constant Version_32 := 16#29899d4e#;
   pragma Export (C, u00120, "interfaces__cS");
   u00121 : constant Version_32 := 16#b2cb9bcf#;
   pragma Export (C, u00121, "interfaces__c__stringsB");
   u00122 : constant Version_32 := 16#603c1c44#;
   pragma Export (C, u00122, "interfaces__c__stringsS");
   u00123 : constant Version_32 := 16#d6bc4ecc#;
   pragma Export (C, u00123, "system__crtl__runtimeS");
   u00124 : constant Version_32 := 16#1eab0e09#;
   pragma Export (C, u00124, "system__img_enum_newB");
   u00125 : constant Version_32 := 16#3a71cda5#;
   pragma Export (C, u00125, "system__img_enum_newS");
   u00126 : constant Version_32 := 16#14502dea#;
   pragma Export (C, u00126, "system__os_libB");
   u00127 : constant Version_32 := 16#89dce9aa#;
   pragma Export (C, u00127, "system__os_libS");
   u00128 : constant Version_32 := 16#4cd8aca0#;
   pragma Export (C, u00128, "system__stringsB");
   u00129 : constant Version_32 := 16#0a9c4c91#;
   pragma Export (C, u00129, "system__stringsS");
   u00130 : constant Version_32 := 16#9a926c2b#;
   pragma Export (C, u00130, "system__file_control_blockS");
   u00131 : constant Version_32 := 16#bf28cc85#;
   pragma Export (C, u00131, "ast__typesB");
   u00132 : constant Version_32 := 16#6d420962#;
   pragma Export (C, u00132, "ast__typesS");
   u00133 : constant Version_32 := 16#5e196e91#;
   pragma Export (C, u00133, "ada__containersS");
   u00134 : constant Version_32 := 16#e29da6b5#;
   pragma Export (C, u00134, "ast__identsB");
   u00135 : constant Version_32 := 16#08b5bc7e#;
   pragma Export (C, u00135, "ast__identsS");
   u00136 : constant Version_32 := 16#2d08d4ae#;
   pragma Export (C, u00136, "system__assertionsB");
   u00137 : constant Version_32 := 16#1ed2e0fe#;
   pragma Export (C, u00137, "system__assertionsS");
   u00138 : constant Version_32 := 16#e9763ba7#;
   pragma Export (C, u00138, "ast__exprsB");
   u00139 : constant Version_32 := 16#e9b0b991#;
   pragma Export (C, u00139, "ast__exprsS");
   u00140 : constant Version_32 := 16#72f3365f#;
   pragma Export (C, u00140, "ast__literalsB");
   u00141 : constant Version_32 := 16#f1fe1c66#;
   pragma Export (C, u00141, "ast__literalsS");
   u00142 : constant Version_32 := 16#eafa0b0b#;
   pragma Export (C, u00142, "ast__quantsB");
   u00143 : constant Version_32 := 16#2c840f92#;
   pragma Export (C, u00143, "ast__quantsS");
   u00144 : constant Version_32 := 16#cda6244e#;
   pragma Export (C, u00144, "ast__high_levelB");
   u00145 : constant Version_32 := 16#52c18881#;
   pragma Export (C, u00145, "ast__high_levelS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.atomic_counters%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.io%s
   --  system.io%b
   --  system.machine_code%s
   --  system.atomic_counters%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.os_lib%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.unsigned_types%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  system.address_image%s
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.tags%s
   --  ada.streams%s
   --  interfaces.c%s
   --  interfaces.c.strings%s
   --  system.communication%s
   --  system.communication%b
   --  system.crtl.runtime%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.assertions%s
   --  system.assertions%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.file_control_block%s
   --  ada.streams.stream_io%s
   --  system.file_io%s
   --  ada.streams.stream_io%b
   --  system.secondary_stack%s
   --  system.file_io%b
   --  system.storage_pools.subpools%b
   --  system.finalization_masters%b
   --  interfaces.c.strings%b
   --  interfaces.c%b
   --  ada.tags%b
   --  ada.strings.maps%b
   --  system.soft_links%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.address_image%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  system.strings.stream_ops%s
   --  system.strings.stream_ops%b
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  util%s
   --  ast%s
   --  ast.literals%s
   --  ast.literals%b
   --  ast.names%s
   --  ast.names%b
   --  ast.idents%s
   --  ast.idents%b
   --  ast.quants%s
   --  ast.quants%b
   --  ast.types%s
   --  ast.types%b
   --  ast.binders%s
   --  ast.binders%b
   --  ast.exprs%s
   --  ast.exprs%b
   --  ast.high_level%s
   --  ast.high_level%b
   --  tester%b
   --  END ELABORATION ORDER


end ada_main;

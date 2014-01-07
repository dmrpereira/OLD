pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__tester.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__tester.adb");
with Ada.Exceptions;

package body ada_main is
   pragma Warnings (Off);

   E127 : Short_Integer; pragma Import (Ada, E127, "system__os_lib_E");
   E012 : Short_Integer; pragma Import (Ada, E012, "system__soft_links_E");
   E022 : Short_Integer; pragma Import (Ada, E022, "system__exception_table_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "ada__containers_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "ada__io_exceptions_E");
   E056 : Short_Integer; pragma Import (Ada, E056, "ada__strings_E");
   E062 : Short_Integer; pragma Import (Ada, E062, "ada__strings__maps_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "ada__tags_E");
   E046 : Short_Integer; pragma Import (Ada, E046, "ada__streams_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "interfaces__c_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "interfaces__c__strings_E");
   E028 : Short_Integer; pragma Import (Ada, E028, "system__exceptions_E");
   E085 : Short_Integer; pragma Import (Ada, E085, "system__finalization_root_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "ada__finalization_E");
   E087 : Short_Integer; pragma Import (Ada, E087, "system__storage_pools_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "system__finalization_masters_E");
   E073 : Short_Integer; pragma Import (Ada, E073, "system__storage_pools__subpools_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "system__assertions_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "system__pool_global_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "system__file_control_block_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "ada__streams__stream_io_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "system__file_io_E");
   E016 : Short_Integer; pragma Import (Ada, E016, "system__secondary_stack_E");
   E058 : Short_Integer; pragma Import (Ada, E058, "ada__strings__unbounded_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "system__strings__stream_ops_E");
   E004 : Short_Integer; pragma Import (Ada, E004, "ast_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "ast__literals_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "ast__names_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "ast__idents_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "ast__quants_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "ast__types_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "ast__binders_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "ast__exprs_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "ast__high_level_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E145 := E145 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "ast__high_level__finalize_spec");
      begin
         F1;
      end;
      E139 := E139 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "ast__exprs__finalize_spec");
      begin
         F2;
      end;
      E102 := E102 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "ast__binders__finalize_spec");
      begin
         F3;
      end;
      E132 := E132 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "ast__types__finalize_spec");
      begin
         F4;
      end;
      E143 := E143 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "ast__quants__finalize_spec");
      begin
         F5;
      end;
      E135 := E135 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "ast__idents__finalize_spec");
      begin
         F6;
      end;
      E108 := E108 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "ast__names__finalize_spec");
      begin
         F7;
      end;
      E141 := E141 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "ast__literals__finalize_spec");
      begin
         F8;
      end;
      declare
         procedure F9;
         pragma Import (Ada, F9, "ast__finalize_spec");
      begin
         E004 := E004 - 1;
         F9;
      end;
      E058 := E058 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "ada__strings__unbounded__finalize_spec");
      begin
         F10;
      end;
      E077 := E077 - 1;
      E073 := E073 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "system__file_io__finalize_body");
      begin
         E118 := E118 - 1;
         F11;
      end;
      E112 := E112 - 1;
      declare
         procedure F12;
         pragma Import (Ada, F12, "ada__streams__stream_io__finalize_spec");
      begin
         F12;
      end;
      declare
         procedure F13;
         pragma Import (Ada, F13, "system__file_control_block__finalize_spec");
      begin
         E130 := E130 - 1;
         F13;
      end;
      E096 := E096 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "system__pool_global__finalize_spec");
      begin
         F14;
      end;
      declare
         procedure F15;
         pragma Import (Ada, F15, "system__storage_pools__subpools__finalize_spec");
      begin
         F15;
      end;
      declare
         procedure F16;
         pragma Import (Ada, F16, "system__finalization_masters__finalize_spec");
      begin
         F16;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");
   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");

      procedure Install_Handler;
      pragma Import (C, Install_Handler, "__gnat_install_handler");

      Handler_Installed : Integer;
      pragma Import (C, Handler_Installed, "__gnat_handler_installed");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      if Handler_Installed = 0 then
         Install_Handler;
      end if;

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E022 := E022 + 1;
      Ada.Containers'Elab_Spec;
      E133 := E133 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E094 := E094 + 1;
      Ada.Strings'Elab_Spec;
      E056 := E056 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E046 := E046 + 1;
      Interfaces.C'Elab_Spec;
      Interfaces.C.Strings'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E028 := E028 + 1;
      System.Finalization_Root'Elab_Spec;
      E085 := E085 + 1;
      Ada.Finalization'Elab_Spec;
      E083 := E083 + 1;
      System.Storage_Pools'Elab_Spec;
      E087 := E087 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      System.Assertions'Elab_Spec;
      E137 := E137 + 1;
      System.Pool_Global'Elab_Spec;
      E096 := E096 + 1;
      System.File_Control_Block'Elab_Spec;
      E130 := E130 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E112 := E112 + 1;
      System.File_Io'Elab_Body;
      E118 := E118 + 1;
      E073 := E073 + 1;
      System.Finalization_Masters'Elab_Body;
      E077 := E077 + 1;
      E122 := E122 + 1;
      E120 := E120 + 1;
      Ada.Tags'Elab_Body;
      E048 := E048 + 1;
      E062 := E062 + 1;
      System.Soft_Links'Elab_Body;
      E012 := E012 + 1;
      System.Os_Lib'Elab_Body;
      E127 := E127 + 1;
      System.Secondary_Stack'Elab_Body;
      E016 := E016 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E058 := E058 + 1;
      System.Strings.Stream_Ops'Elab_Body;
      E110 := E110 + 1;
      Ast'Elab_Spec;
      E004 := E004 + 1;
      Ast.Literals'Elab_Spec;
      E141 := E141 + 1;
      Ast.Names'Elab_Spec;
      E108 := E108 + 1;
      Ast.Idents'Elab_Spec;
      E135 := E135 + 1;
      Ast.Quants'Elab_Spec;
      E143 := E143 + 1;
      Ast.Types'Elab_Spec;
      E132 := E132 + 1;
      Ast.Binders'Elab_Spec;
      E102 := E102 + 1;
      Ast.Exprs'Elab_Spec;
      E139 := E139 + 1;
      Ast.High_Level'Elab_Spec;
      E145 := E145 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_tester");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/dpereira/Dropbox/Work/Ada/SmtAda/debug/util.o
   --   /home/dpereira/Dropbox/Work/Ada/SmtAda/debug/ast.o
   --   /home/dpereira/Dropbox/Work/Ada/SmtAda/debug/ast-literals.o
   --   /home/dpereira/Dropbox/Work/Ada/SmtAda/debug/ast-names.o
   --   /home/dpereira/Dropbox/Work/Ada/SmtAda/debug/ast-idents.o
   --   /home/dpereira/Dropbox/Work/Ada/SmtAda/debug/ast-quants.o
   --   /home/dpereira/Dropbox/Work/Ada/SmtAda/debug/ast-types.o
   --   /home/dpereira/Dropbox/Work/Ada/SmtAda/debug/ast-binders.o
   --   /home/dpereira/Dropbox/Work/Ada/SmtAda/debug/ast-exprs.o
   --   /home/dpereira/Dropbox/Work/Ada/SmtAda/debug/ast-high_level.o
   --   /home/dpereira/Dropbox/Work/Ada/SmtAda/debug/tester.o
   --   -L/home/dpereira/Dropbox/Work/Ada/SmtAda/debug/
   --   -L/home/dpereira/Dropbox/Work/Ada/SmtAda/debug/
   --   -L/home/dpereira/bin/gnat/lib/gcc/i686-pc-linux-gnu/4.7.4/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;

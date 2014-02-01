all:
	gcc -c -gnatA -fPIC bridge.ads
	gcc -c -gnatA -fPIC bridge-z3.ads
	gcc -c -gnatA -fPIC bridge-z3-configurations.ads
	gcc -c -gnatA -fPIC bridge-z3-contexts.ads
	gcc -c -gnatA -fPIC bridge-z3-parameters.ads
	gcc -c -gnatA -fPIC bridge-z3-symbols_and_sorts.ads
	gcc -c -gnatA -fPIC bridge-z3-consts_and_apps.ads
	gcc -c -gnatA -fPIC bridge-z3-logic_and_equal.ads
	gcc -c -gnatA -fPIC bridge-z3-arith.ads
	gcc -c -gnatA -fPIC bridge-z3-bvectors.ads
	gcc -c -gnatA -fPIC bridge-z3-arrays_and_sets.ads
	gcc -c -gnatA -fPIC bridge-z3-numerals.ads
	gcc -c -gnatA -fPIC bridge-z3-quants.ads
	gcc -c -gnatA -fPIC bridge-z3-accessors.ads
	gcc -c -gnatA -fPIC bridge-z3-solvers.ads
	gcc -c -gnatA -lz3 -fPIC z3_teste.adb
	gnatbind -n bridge.ali
	gnatbind -n bridge-z3.ali
	gnatbind -n bridge-z3-configurations.ali
	gnatbind -n bridge-z3-contexts.ali
	gnatbind -n bridge-z3-parameters.ali
	gnatbind -n bridge-z3-symbols_and_sorts.ali
	gnatbind -n bridge-z3-consts_and_apps.ali
	gnatbind -n bridge-z3-logic_and_equal.ali
	gnatbind -n bridge-z3-arith.ali
	gnatbind -n bridge-z3-bvectors.ali
	gnatbind -n bridge-z3-arrays_and_sets.ali
	gnatbind -n bridge-z3-numerals.ali
	gnatbind -n bridge-z3-quants.ali
	gnatbind -n bridge-z3-accessors.ali
	gnatbind -n bridge-z3-solvers.ali
	gnatbind z3_teste.ali
#	gnatlink -v z3_teste.ali -L/home/dpereira/Provers/z3/lib -lz3
	gnatlink -v z3_teste.ali -L/Users/dpereira/Provers/lib -lz3
	install_name_tool -change libz3.dylib /Users/dpereira/Provers/lib/libz3.dylib z3_teste

clean:
	gnatclean z3_teste 
	rm b~*

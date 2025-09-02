# ���������� � �����
FC = /opt/nvidia/hpc_sdk/Linux_x86_64/20.11/compilers/bin/nvfortran
FCFLAGS = -O3 -fopenmp -gpu=rdc -cuda
LDFLAGS = -O3 -fopenmp -gpu=rdc -cuda

# �������� �����
SOURCES = Storage_module.f90 Solvers.f90 cuf_kernel.cuf cuf_solvers.cuf FCMHD.f90
OBJECTS = $(SOURCES:.f90=.o)
OBJECTS := $(OBJECTS:.cuf=.o)

# ����
all: my_program

my_program: $(OBJECTS)
	$(FC) -o $@ $^ $(LDFLAGS)

# ������� ��� .f90 ������
%.o: %.f90
	$(FC) -c $(FCFLAGS) $< -o $@

# ������� ��� .cuf ������  
%.o: %.cuf
	$(FC) -c $(FCFLAGS) $< -o $@

clean:
	rm -f *.o *.mod my_program

.PHONY: all clean
! include "Storage_module.f90"
! include "cuf_kernel.cuf"
! include "cuf_solvers.cuf"
! include "Solvers.f90"



program MIK
    use STORAGE
    use MY_CUDA

    call CUDA_info()

end program MIK
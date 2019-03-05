/*========================================================================*
 * NI VeriStand Model Framework code generation
 *
 * Model : NACCBraytonCycle2017a
 * Model version : 1.136
 * VeriStand Model Framework version : 2017.0.1.0 (2017 f1)
 * Source generated on : Mon Mar 04 16:21:35 2019
 *========================================================================*/

/*
 * Note:
 *   This file was generated by the main model, NACCBraytonCycle2017a.
 *   This file redirects parameter references to the NI VeriStand rtParameter buffer.
 *
 *   In a model reference configuration, this file defines the globally shared parameter structure
 *   across all model references. All models must share the same type definition for proper execution.
 *
 */
#if !defined(_DEFINED_TYPEDEF_FOR_niUrtParametersTypeDef_)
#define _DEFINED_TYPEDEF_FOR_niUrtParametersTypeDef_

/* Parameters typedef identifier */
#define NI_PARAM_TYPEDEF               P_NACCBraytonCycle2017a_T
#endif

#if defined(_NI_DEFINE_PARAMS_DBL_BUFFER_)
#undef _NI_DEFINE_PARAMS_DBL_BUFFER_
#ifdef MULTITASKING
#define NI_PARAM_BUFF                  (*param_lookup[tid][READSIDE])
#else
#define NI_PARAM_BUFF                  rtParameter[READSIDE]
#endif

#define NACCBraytonCycle2017a_P        NI_PARAM_BUFF
#elif defined(_NI_UNDEFINE_PARAMS_DBL_BUFFER_)
#undef _NI_UNDEFINE_PARAMS_DBL_BUFFER_
#undef NACCBraytonCycle2017a_P
#endif

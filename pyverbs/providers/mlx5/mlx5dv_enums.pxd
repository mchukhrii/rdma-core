# SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
# Copyright (c) 2019 Mellanox Technologies, Inc. All rights reserved. See COPYING file

#cython: language_level=3

cdef extern from 'infiniband/mlx5dv.h':

    cpdef enum  mlx5dv_context_attr_flags:
        MLX5DV_CONTEXT_FLAGS_DEVX

    cpdef enum mlx5dv_context_comp_mask:
        MLX5DV_CONTEXT_MASK_CQE_COMPRESION      = 1 << 0
        MLX5DV_CONTEXT_MASK_SWP                 = 1 << 1
        MLX5DV_CONTEXT_MASK_STRIDING_RQ         = 1 << 2
        MLX5DV_CONTEXT_MASK_TUNNEL_OFFLOADS     = 1 << 3
        MLX5DV_CONTEXT_MASK_DYN_BFREGS          = 1 << 4
        MLX5DV_CONTEXT_MASK_CLOCK_INFO_UPDATE   = 1 << 5
        MLX5DV_CONTEXT_MASK_FLOW_ACTION_FLAGS   = 1 << 6
        MLX5DV_CONTEXT_MASK_DC_ODP_CAPS         = 1 << 7
        MLX5DV_CONTEXT_MASK_NUM_LAG_PORTS       = 1 << 9

    cpdef enum mlx5dv_context_flags:
        MLX5DV_CONTEXT_FLAGS_CQE_V1                     = 1 << 0
        MLX5DV_CONTEXT_FLAGS_MPW_ALLOWED                = 1 << 2
        MLX5DV_CONTEXT_FLAGS_ENHANCED_MPW               = 1 << 3
        MLX5DV_CONTEXT_FLAGS_CQE_128B_COMP              = 1 << 4
        MLX5DV_CONTEXT_FLAGS_CQE_128B_PAD               = 1 << 5
        MLX5DV_CONTEXT_FLAGS_PACKET_BASED_CREDIT_MODE   = 1 << 6

    cpdef enum mlx5dv_sw_parsing_offloads:
        MLX5DV_SW_PARSING       = 1 << 0
        MLX5DV_SW_PARSING_CSUM  = 1 << 1
        MLX5DV_SW_PARSING_LSO   = 1 << 2

    cpdef enum mlx5dv_cqe_comp_res_format:
        MLX5DV_CQE_RES_FORMAT_HASH          = 1 << 0
        MLX5DV_CQE_RES_FORMAT_CSUM          = 1 << 1
        MLX5DV_CQE_RES_FORMAT_CSUM_STRIDX   = 1 << 2

    cpdef enum mlx5dv_sched_elem_attr_flags:
        MLX5DV_SCHED_ELEM_ATTR_FLAGS_BW_SHARE    = 1 << 0
        MLX5DV_SCHED_ELEM_ATTR_FLAGS_MAX_AVG_BW  = 1 << 1

    cpdef enum mlx5dv_tunnel_offloads:
        MLX5DV_RAW_PACKET_CAP_TUNNELED_OFFLOAD_VXLAN            = 1 << 0
        MLX5DV_RAW_PACKET_CAP_TUNNELED_OFFLOAD_GRE              = 1 << 1
        MLX5DV_RAW_PACKET_CAP_TUNNELED_OFFLOAD_GENEVE           = 1 << 2
        MLX5DV_RAW_PACKET_CAP_TUNNELED_OFFLOAD_CW_MPLS_OVER_GRE = 1 << 3
        MLX5DV_RAW_PACKET_CAP_TUNNELED_OFFLOAD_CW_MPLS_OVER_UDP = 1 << 4

    cpdef enum mlx5dv_flow_action_cap_flags:
        MLX5DV_FLOW_ACTION_FLAGS_ESP_AES_GCM                = 1 << 0
        MLX5DV_FLOW_ACTION_FLAGS_ESP_AES_GCM_REQ_METADATA   = 1 << 1
        MLX5DV_FLOW_ACTION_FLAGS_ESP_AES_GCM_SPI_STEERING   = 1 << 2
        MLX5DV_FLOW_ACTION_FLAGS_ESP_AES_GCM_FULL_OFFLOAD   = 1 << 3
        MLX5DV_FLOW_ACTION_FLAGS_ESP_AES_GCM_TX_IV_IS_ESN   = 1 << 4

    cpdef enum mlx5dv_qp_init_attr_mask:
        MLX5DV_QP_INIT_ATTR_MASK_QP_CREATE_FLAGS    = 1 << 0
        MLX5DV_QP_INIT_ATTR_MASK_DC                 = 1 << 1
        MLX5DV_QP_INIT_ATTR_MASK_SEND_OPS_FLAGS     = 1 << 2

    cpdef enum mlx5dv_qp_create_flags:
        MLX5DV_QP_CREATE_TUNNEL_OFFLOADS            = 1 << 0
        MLX5DV_QP_CREATE_TIR_ALLOW_SELF_LOOPBACK_UC = 1 << 1
        MLX5DV_QP_CREATE_TIR_ALLOW_SELF_LOOPBACK_MC = 1 << 2
        MLX5DV_QP_CREATE_DISABLE_SCATTER_TO_CQE     = 1 << 3
        MLX5DV_QP_CREATE_ALLOW_SCATTER_TO_CQE       = 1 << 4
        MLX5DV_QP_CREATE_PACKET_BASED_CREDIT_MODE   = 1 << 5

    cpdef enum mlx5dv_mkey_init_attr_flags:
        MLX5DV_MKEY_INIT_ATTR_FLAGS_INDIRECT

    cpdef enum mlx5dv_dc_type:
        MLX5DV_DCTYPE_DCT   = 1
        MLX5DV_DCTYPE_DCI   = 2

    cpdef enum mlx5dv_qp_create_send_ops_flags:
        MLX5DV_QP_EX_WITH_MR_INTERLEAVED    = 1 << 0
        MLX5DV_QP_EX_WITH_MR_LIST           = 1 << 1
        MLX5DV_QP_EX_WITH_MKEY_CONFIGURE    = 1 << 2

    cpdef enum mlx5dv_cq_init_attr_mask:
        MLX5DV_CQ_INIT_ATTR_MASK_COMPRESSED_CQE = 1 << 0
        MLX5DV_CQ_INIT_ATTR_MASK_FLAGS          = 1 << 1
        MLX5DV_CQ_INIT_ATTR_MASK_CQE_SIZE       = 1 << 2

    cpdef enum mlx5dv_cq_init_attr_flags:
        MLX5DV_CQ_INIT_ATTR_FLAGS_CQE_PAD   = 1 << 0
        MLX5DV_CQ_INIT_ATTR_FLAGS_RESERVED  = 1 << 1

    cpdef enum mlx5dv_flow_action_type:
        MLX5DV_FLOW_ACTION_DEST_IBV_QP
        MLX5DV_FLOW_ACTION_DROP
        MLX5DV_FLOW_ACTION_IBV_COUNTER
        MLX5DV_FLOW_ACTION_IBV_FLOW_ACTION
        MLX5DV_FLOW_ACTION_TAG
        MLX5DV_FLOW_ACTION_DEST_DEVX
        MLX5DV_FLOW_ACTION_COUNTERS_DEVX
        MLX5DV_FLOW_ACTION_DEFAULT_MISS

    cpdef enum mlx5dv_dr_domain_type:
        MLX5DV_DR_DOMAIN_TYPE_NIC_RX
        MLX5DV_DR_DOMAIN_TYPE_NIC_TX
        MLX5DV_DR_DOMAIN_TYPE_FDB

    cpdef unsigned long long MLX5DV_RES_TYPE_QP
    cpdef unsigned long long MLX5DV_RES_TYPE_RWQ
    cpdef unsigned long long MLX5DV_RES_TYPE_DBR
    cpdef unsigned long long MLX5DV_RES_TYPE_SRQ
    cpdef unsigned long long MLX5DV_PP_ALLOC_FLAGS_DEDICATED_INDEX
    cpdef unsigned long long MLX5DV_UAR_ALLOC_TYPE_BF
    cpdef unsigned long long MLX5DV_UAR_ALLOC_TYPE_NC
    cpdef unsigned long long MLX5DV_QUERY_PORT_VPORT
    cpdef unsigned long long MLX5DV_QUERY_PORT_VPORT_VHCA_ID
    cpdef unsigned long long MLX5DV_QUERY_PORT_VPORT_STEERING_ICM_RX
    cpdef unsigned long long MLX5DV_QUERY_PORT_VPORT_STEERING_ICM_TX
    cpdef unsigned long long MLX5DV_QUERY_PORT_VPORT_REG_C0
    cpdef unsigned long long MLX5DV_QUERY_PORT_ESW_OWNER_VHCA_ID


_MLX5DV_RES_TYPE_QP = MLX5DV_RES_TYPE_QP
_MLX5DV_RES_TYPE_RWQ = MLX5DV_RES_TYPE_RWQ
_MLX5DV_RES_TYPE_DBR = MLX5DV_RES_TYPE_DBR
_MLX5DV_RES_TYPE_SRQ = MLX5DV_RES_TYPE_SRQ
_MLX5DV_PP_ALLOC_FLAGS_DEDICATED_INDEX = MLX5DV_PP_ALLOC_FLAGS_DEDICATED_INDEX
_MLX5DV_UAR_ALLOC_TYPE_BF = MLX5DV_UAR_ALLOC_TYPE_BF
_MLX5DV_UAR_ALLOC_TYPE_NC = MLX5DV_UAR_ALLOC_TYPE_NC
MLX5DV_QUERY_PORT_VPORT_ = MLX5DV_QUERY_PORT_VPORT
MLX5DV_QUERY_PORT_VPORT_VHCA_ID_ = MLX5DV_QUERY_PORT_VPORT_VHCA_ID
MLX5DV_QUERY_PORT_VPORT_STEERING_ICM_RX_ = MLX5DV_QUERY_PORT_VPORT_STEERING_ICM_RX
MLX5DV_QUERY_PORT_VPORT_STEERING_ICM_TX_ = MLX5DV_QUERY_PORT_VPORT_STEERING_ICM_TX
MLX5DV_QUERY_PORT_VPORT_REG_C0_ = MLX5DV_QUERY_PORT_VPORT_REG_C0
MLX5DV_QUERY_PORT_ESW_OWNER_VHCA_ID_ = MLX5DV_QUERY_PORT_ESW_OWNER_VHCA_ID


cdef extern from 'infiniband/mlx5_user_ioctl_verbs.h':
    cdef enum mlx5_ib_uapi_flow_table_type:
        pass

cdef extern from 'infiniband/mlx5_api.h':
    cpdef int MLX5DV_FLOW_TABLE_TYPE_RDMA_RX
    cpdef int MLX5DV_FLOW_TABLE_TYPE_RDMA_TX
    cpdef int MLX5DV_FLOW_TABLE_TYPE_NIC_RX
    cpdef int MLX5DV_FLOW_TABLE_TYPE_NIC_TX
    cpdef int MLX5DV_FLOW_TABLE_TYPE_FDB

    cdef int MLX5DV_FLOW_ACTION_PACKET_REFORMAT_TYPE_L2_TUNNEL_TO_L2
    cdef int MLX5DV_FLOW_ACTION_PACKET_REFORMAT_TYPE_L2_TO_L2_TUNNEL
    cdef int MLX5DV_FLOW_ACTION_PACKET_REFORMAT_TYPE_L3_TUNNEL_TO_L2
    cdef int MLX5DV_FLOW_ACTION_PACKET_REFORMAT_TYPE_L2_TO_L3_TUNNEL

MLX5DV_FLOW_TABLE_TYPE_RDMA_RX_ = MLX5DV_FLOW_TABLE_TYPE_RDMA_RX
MLX5DV_FLOW_TABLE_TYPE_RDMA_TX_ = MLX5DV_FLOW_TABLE_TYPE_RDMA_TX
MLX5DV_FLOW_TABLE_TYPE_NIC_RX_ = MLX5DV_FLOW_TABLE_TYPE_NIC_RX
MLX5DV_FLOW_TABLE_TYPE_NIC_TX_ = MLX5DV_FLOW_TABLE_TYPE_NIC_TX
MLX5DV_FLOW_TABLE_TYPE_FDB_ = MLX5DV_FLOW_TABLE_TYPE_FDB

MLX5DV_FLOW_ACTION_PACKET_REFORMAT_TYPE_L2_TUNNEL_TO_L2_ = \
    MLX5DV_FLOW_ACTION_PACKET_REFORMAT_TYPE_L2_TUNNEL_TO_L2
MLX5DV_FLOW_ACTION_PACKET_REFORMAT_TYPE_L2_TO_L2_TUNNEL_ = \
    MLX5DV_FLOW_ACTION_PACKET_REFORMAT_TYPE_L2_TO_L2_TUNNEL
MLX5DV_FLOW_ACTION_PACKET_REFORMAT_TYPE_L3_TUNNEL_TO_L2_ = \
    MLX5DV_FLOW_ACTION_PACKET_REFORMAT_TYPE_L3_TUNNEL_TO_L2
MLX5DV_FLOW_ACTION_PACKET_REFORMAT_TYPE_L2_TO_L3_TUNNEL_ = \
    MLX5DV_FLOW_ACTION_PACKET_REFORMAT_TYPE_L2_TO_L3_TUNNEL

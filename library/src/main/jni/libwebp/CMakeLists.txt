# Copyright 2018 Hippo Seven
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cmake_minimum_required(VERSION 3.4.1)
project(libwebp)

set(LIBWEBP_SOURCES
    libwebp/src/dec/alpha_dec.c
    libwebp/src/dec/buffer_dec.c
    libwebp/src/dec/frame_dec.c
    libwebp/src/dec/idec_dec.c
    libwebp/src/dec/io_dec.c
    libwebp/src/dec/quant_dec.c
    libwebp/src/dec/tree_dec.c
    libwebp/src/dec/vp8_dec.c
    libwebp/src/dec/vp8l_dec.c
    libwebp/src/dec/webp_dec.c
    libwebp/src/demux/anim_decode.c
    libwebp/src/demux/demux.c
    libwebp/src/dsp/alpha_processing.c
    libwebp/src/dsp/alpha_processing_mips_dsp_r2.c
    libwebp/src/dsp/alpha_processing_neon.c
    libwebp/src/dsp/alpha_processing_sse2.c
    libwebp/src/dsp/alpha_processing_sse41.c
    libwebp/src/dsp/cost.c
    libwebp/src/dsp/cost_mips32.c
    libwebp/src/dsp/cost_mips_dsp_r2.c
    libwebp/src/dsp/cost_neon.c
    libwebp/src/dsp/cost_sse2.c
    libwebp/src/dsp/cpu.c
    libwebp/src/dsp/dec.c
    libwebp/src/dsp/dec_clip_tables.c
    libwebp/src/dsp/dec_mips32.c
    libwebp/src/dsp/dec_mips_dsp_r2.c
    libwebp/src/dsp/dec_msa.c
    libwebp/src/dsp/dec_neon.c
    libwebp/src/dsp/dec_sse2.c
    libwebp/src/dsp/dec_sse41.c
    libwebp/src/dsp/enc.c
    libwebp/src/dsp/enc_mips32.c
    libwebp/src/dsp/enc_mips_dsp_r2.c
    libwebp/src/dsp/enc_msa.c
    libwebp/src/dsp/enc_neon.c
    libwebp/src/dsp/enc_sse2.c
    libwebp/src/dsp/enc_sse41.c
    libwebp/src/dsp/filters.c
    libwebp/src/dsp/filters_mips_dsp_r2.c
    libwebp/src/dsp/filters_msa.c
    libwebp/src/dsp/filters_neon.c
    libwebp/src/dsp/filters_sse2.c
    libwebp/src/dsp/lossless.c
    libwebp/src/dsp/lossless_enc.c
    libwebp/src/dsp/lossless_enc_mips32.c
    libwebp/src/dsp/lossless_enc_mips_dsp_r2.c
    libwebp/src/dsp/lossless_enc_msa.c
    libwebp/src/dsp/lossless_enc_neon.c
    libwebp/src/dsp/lossless_enc_sse2.c
    libwebp/src/dsp/lossless_enc_sse41.c
    libwebp/src/dsp/lossless_mips_dsp_r2.c
    libwebp/src/dsp/lossless_msa.c
    libwebp/src/dsp/lossless_neon.c
    libwebp/src/dsp/lossless_sse2.c
    libwebp/src/dsp/lossless_sse41.c
    libwebp/src/dsp/rescaler.c
    libwebp/src/dsp/rescaler_mips32.c
    libwebp/src/dsp/rescaler_mips_dsp_r2.c
    libwebp/src/dsp/rescaler_msa.c
    libwebp/src/dsp/rescaler_neon.c
    libwebp/src/dsp/rescaler_sse2.c
    libwebp/src/dsp/ssim.c
    libwebp/src/dsp/ssim_sse2.c
    libwebp/src/dsp/upsampling.c
    libwebp/src/dsp/upsampling_mips_dsp_r2.c
    libwebp/src/dsp/upsampling_msa.c
    libwebp/src/dsp/upsampling_neon.c
    libwebp/src/dsp/upsampling_sse2.c
    libwebp/src/dsp/upsampling_sse41.c
    libwebp/src/dsp/yuv.c
    libwebp/src/dsp/yuv_mips32.c
    libwebp/src/dsp/yuv_mips_dsp_r2.c
    libwebp/src/dsp/yuv_neon.c
    libwebp/src/dsp/yuv_sse2.c
    libwebp/src/dsp/yuv_sse41.c
    libwebp/src/enc/alpha_enc.c
    libwebp/src/enc/analysis_enc.c
    libwebp/src/enc/backward_references_cost_enc.c
    libwebp/src/enc/backward_references_enc.c
    libwebp/src/enc/config_enc.c
    libwebp/src/enc/cost_enc.c
    libwebp/src/enc/filter_enc.c
    libwebp/src/enc/frame_enc.c
    libwebp/src/enc/histogram_enc.c
    libwebp/src/enc/iterator_enc.c
    libwebp/src/enc/near_lossless_enc.c
    libwebp/src/enc/picture_csp_enc.c
    libwebp/src/enc/picture_enc.c
    libwebp/src/enc/picture_psnr_enc.c
    libwebp/src/enc/picture_rescale_enc.c
    libwebp/src/enc/picture_tools_enc.c
    libwebp/src/enc/predictor_enc.c
    libwebp/src/enc/quant_enc.c
    libwebp/src/enc/syntax_enc.c
    libwebp/src/enc/token_enc.c
    libwebp/src/enc/tree_enc.c
    libwebp/src/enc/vp8l_enc.c
    libwebp/src/enc/webp_enc.c
    libwebp/src/mux/anim_encode.c
    libwebp/src/mux/muxedit.c
    libwebp/src/mux/muxinternal.c
    libwebp/src/mux/muxread.c
    libwebp/src/utils/bit_reader_utils.c
    libwebp/src/utils/bit_writer_utils.c
    libwebp/src/utils/color_cache_utils.c
    libwebp/src/utils/filters_utils.c
    libwebp/src/utils/huffman_encode_utils.c
    libwebp/src/utils/huffman_utils.c
    libwebp/src/utils/palette.c
    libwebp/src/utils/quant_levels_dec_utils.c
    libwebp/src/utils/quant_levels_utils.c
    libwebp/src/utils/random_utils.c
    libwebp/src/utils/rescaler_utils.c
    libwebp/src/utils/thread_utils.c
    libwebp/src/utils/utils.c
)
set(LIBWEBP_INCLUDES
        ${IMAGE_EXPORT_INCLUDES}
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_SOURCE_DIR}/libwebp
        ${CMAKE_CURRENT_SOURCE_DIR}/libwebp/src/webp
        ${ANDROID_NDK}/sources/android/cpufeatures
)

set(LIBWEBP_DEFINITIONS
)
set(LIBWEBP_LIBRARIES
)

add_definitions(-DWEBP_HAVE_NEON_RTCD)

add_library(libwebp STATIC ${LIBWEBP_SOURCES})
target_include_directories(libwebp PUBLIC ${LIBWEBP_INCLUDES})

target_compile_definitions(libwebp PRIVATE ${LIBWEBP_DEFINITIONS})

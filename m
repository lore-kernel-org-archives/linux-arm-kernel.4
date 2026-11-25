Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798B6606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nl5WCf+3;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=XNm/q/ks
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x271shXrnQtZ5N50kHdir9WArwxUBnNDZma76/NqmL8=; b=nl5WCf+3dieeWj
	IAhMy+7o48IPPOly1ah4G9BLiGodrlEaA/Yn1lxkykPA7XEY2DhkIVUXNeJq/GxcbOOlpiX1JoBTN
	wvhmPOAMlvoAALxdGlOz2Ev05yD04Xbu+znDcB5KkD14y1z13R3gIvkbZJlyu/7cmqB8asiqk9oXb
	FCIjYpEKhB+6B6LA6raZrnvf+cnDBaXbrVBRkou0HsnvRl3ov8fBGxznDeWK5GK2SyWQx8DXx19K8
	Fi5a9UVRUYX+KY7NXVku942X3ig5JZKSfGA9Qb0WXxzofnSLasNBvqD/Bo2G/r0B32A7G7/1Ew04x
	1UNMz1uavZJXsrQC5XEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHzx-0000000B3FG-1yXZ;
	Wed, 25 Nov 2026 18:45:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHzM-0000000B2ru-2JCL;
	Wed, 25 Nov 2026 18:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795632302;
	bh=ra0owAXuDG8SEFgv0wVHmtX1rNjs4shQHkS5a3cIqxs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XNm/q/ks0Ig4efkSG4o7vsRfGAgjsVK3OUmtxb+SSahwdTRElHpXaWv7JDq3xToA8
	 fvvo+cijDWnkQ0AtzXEboI/wgvR8lWG4/m4867SyyNzGWyxMk1EaWd0/nasG+e8FgW
	 Tk3HC1DygFG/N20b/uQb7WZYUn62ZazYZv0k18waqtfG8wuf5MTLZQcJWbxdHc1rv7
	 R0BxmLBMbSRJgRi6XYMIOE74GNoMcDHsXxZL/PgRDwp3Sdy4tqgeZ6yCOjrdUIhznU
	 2laK7sOx4++d8AwuGo1bJJeaZM2PiEkMowis3iQl6hQVHjWlX/h7+GNFD1T4f6RHDs
	 ugF03RIZyMXZw==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 99F2D17E120C;
	Wed, 25 Nov 2026 19:45:00 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 25 Nov 2026 13:33:28 -0500
Subject: [PATCH v3 6/9] media: Trace the stateless controls when set in
 v4l2-ctrls-core.c
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-v4l2-add-ftrace-v3-6-1d1db48372ed@collabora.com>
References: <20261125-v4l2-add-ftrace-v3-0-1d1db48372ed@collabora.com>
In-Reply-To: <20261125-v4l2-add-ftrace-v3-0-1d1db48372ed@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_104507_867651_DB2A3818 
X-CRM114-Status: GOOD (  17.87  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Also remove the trace from visl as the generic v4l2-requests traces can
now be used instead.

It allows all stateless drivers to inherit traceability, with just a small
overhead when disabled in userspace.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/test-drivers/visl/visl-dec.c |  74 -------------------
 drivers/media/v4l2-core/v4l2-ctrls-api.c   |  10 +++
 drivers/media/v4l2-core/v4l2-ctrls-core.c  | 113 +++++++++++++++++++++++++++++
 include/media/v4l2-ctrls.h                 |  15 ++++
 4 files changed, 138 insertions(+), 74 deletions(-)

diff --git a/drivers/media/test-drivers/visl/visl-dec.c b/drivers/media/test-drivers/visl/visl-dec.c
index 2a065a6249ad..9517830fb3e8 100644
--- a/drivers/media/test-drivers/visl/visl-dec.c
+++ b/drivers/media/test-drivers/visl/visl-dec.c
@@ -12,7 +12,6 @@
 #include <linux/workqueue.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/tpg/v4l2-tpg.h>
-#include <trace/events/v4l2_controls.h>
 
 #define LAST_BUF_IDX (V4L2_AV1_REF_LAST_FRAME - V4L2_AV1_REF_LAST_FRAME)
 #define LAST2_BUF_IDX (V4L2_AV1_REF_LAST2_FRAME - V4L2_AV1_REF_LAST_FRAME)
@@ -486,78 +485,6 @@ static void visl_tpg_fill(struct visl_ctx *ctx, struct visl_run *run)
 	}
 }
 
-static void visl_trace_ctrls(struct visl_ctx *ctx, struct visl_run *run)
-{
-	int i;
-	struct v4l2_fh *fh = &ctx->fh;
-
-	switch (ctx->current_codec) {
-	default:
-	case VISL_CODEC_NONE:
-		break;
-	case VISL_CODEC_FWHT:
-		trace_v4l2_ctrl_fwht_params(fh->tgid, fh->fd, run->fwht.params);
-		break;
-	case VISL_CODEC_MPEG2:
-		trace_v4l2_ctrl_mpeg2_sequence(fh->tgid, fh->fd, run->mpeg2.seq);
-		trace_v4l2_ctrl_mpeg2_picture(fh->tgid, fh->fd, run->mpeg2.pic);
-		trace_v4l2_ctrl_mpeg2_quantisation(fh->tgid, fh->fd, run->mpeg2.quant);
-		break;
-	case VISL_CODEC_VP8:
-		trace_v4l2_ctrl_vp8_frame(fh->tgid, fh->fd, run->vp8.frame);
-		trace_v4l2_ctrl_vp8_entropy(fh->tgid, fh->fd, run->vp8.frame);
-		break;
-	case VISL_CODEC_VP9:
-		trace_v4l2_ctrl_vp9_frame(fh->tgid, fh->fd, run->vp9.frame);
-		trace_v4l2_ctrl_vp9_compressed_hdr(fh->tgid, fh->fd, run->vp9.probs);
-		trace_v4l2_ctrl_vp9_compressed_coeff(fh->tgid, fh->fd, run->vp9.probs);
-		trace_v4l2_vp9_mv_probs(fh->tgid, fh->fd, &run->vp9.probs->mv);
-		break;
-	case VISL_CODEC_H264:
-		trace_v4l2_ctrl_h264_sps(fh->tgid, fh->fd, run->h264.sps);
-		trace_v4l2_ctrl_h264_pps(fh->tgid, fh->fd, run->h264.pps);
-		trace_v4l2_ctrl_h264_scaling_matrix(fh->tgid, fh->fd, run->h264.sm);
-		trace_v4l2_ctrl_h264_slice_params(fh->tgid, fh->fd, run->h264.spram);
-
-		for (i = 0; i < ARRAY_SIZE(run->h264.spram->ref_pic_list0); i++)
-			trace_v4l2_h264_ref_pic_list0(fh->tgid, fh->fd,
-						      &run->h264.spram->ref_pic_list0[i], i);
-		for (i = 0; i < ARRAY_SIZE(run->h264.spram->ref_pic_list0); i++)
-			trace_v4l2_h264_ref_pic_list1(fh->tgid, fh->fd,
-						      &run->h264.spram->ref_pic_list1[i], i);
-
-		trace_v4l2_ctrl_h264_decode_params(fh->tgid, fh->fd, run->h264.dpram);
-
-		for (i = 0; i < ARRAY_SIZE(run->h264.dpram->dpb); i++)
-			trace_v4l2_h264_dpb_entry(fh->tgid, fh->fd, &run->h264.dpram->dpb[i], i);
-
-		trace_v4l2_ctrl_h264_pred_weights(fh->tgid, fh->fd, run->h264.pwht);
-		break;
-	case VISL_CODEC_HEVC:
-		trace_v4l2_ctrl_hevc_sps(fh->tgid, fh->fd, run->hevc.sps);
-		trace_v4l2_ctrl_hevc_pps(fh->tgid, fh->fd, run->hevc.pps);
-		trace_v4l2_ctrl_hevc_slice_params(fh->tgid, fh->fd, run->hevc.spram);
-		trace_v4l2_ctrl_hevc_scaling_matrix(fh->tgid, fh->fd, run->hevc.sm);
-		trace_v4l2_ctrl_hevc_decode_params(fh->tgid, fh->fd, run->hevc.dpram);
-
-		for (i = 0; i < ARRAY_SIZE(run->hevc.dpram->dpb); i++)
-			trace_v4l2_hevc_dpb_entry(fh->tgid, fh->fd, &run->hevc.dpram->dpb[i]);
-
-
-		trace_v4l2_hevc_pred_weight_table(fh->tgid, fh->fd,
-						  &run->hevc.spram->pred_weight_table);
-		trace_v4l2_ctrl_hevc_ext_sps_lt_rps(fh->tgid, fh->fd, run->hevc.rps_lt);
-		trace_v4l2_ctrl_hevc_ext_sps_st_rps(fh->tgid, fh->fd, run->hevc.rps_st);
-		break;
-	case VISL_CODEC_AV1:
-		trace_v4l2_ctrl_av1_sequence(fh->tgid, fh->fd, run->av1.seq);
-		trace_v4l2_ctrl_av1_frame(fh->tgid, fh->fd, run->av1.frame);
-		trace_v4l2_ctrl_av1_film_grain(fh->tgid, fh->fd, run->av1.grain);
-		trace_v4l2_ctrl_av1_tile_group_entry(fh->tgid, fh->fd, run->av1.tge);
-		break;
-	}
-}
-
 void visl_device_run(void *priv)
 {
 	struct visl_ctx *ctx = priv;
@@ -634,7 +561,6 @@ void visl_device_run(void *priv)
 		      run.dst->sequence, run.dst->vb2_buf.timestamp);
 
 	visl_tpg_fill(ctx, &run);
-	visl_trace_ctrls(ctx, &run);
 
 	if (bitstream_trace_frame_start > -1 &&
 	    run.dst->sequence >= bitstream_trace_frame_start &&
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 93d8d4012d0f..c44578828b21 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -523,6 +523,12 @@ int v4l2_g_ext_ctrls(struct v4l2_ctrl_handler *hdl, struct video_device *vdev,
 }
 EXPORT_SYMBOL(v4l2_g_ext_ctrls);
 
+static void trace_ext_ctrl(struct v4l2_fh *fh, const struct v4l2_ctrl *ctrl)
+{
+	if (ctrl->type_ops->trace)
+		ctrl->type_ops->trace(fh, ctrl, ctrl->p_cur);
+}
+
 /* Validate a new control */
 static int validate_new(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr p_new)
 {
@@ -711,6 +717,10 @@ int try_set_ext_ctrls_common(struct v4l2_fh *fh,
 				idx = helpers[idx].next;
 			} while (!ret && idx);
 		}
+
+		if (set)
+			trace_ext_ctrl(fh, master);
+
 		v4l2_ctrl_unlock(master);
 	}
 
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 6e751a043a21..28ca9ce2ca6f 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -10,8 +10,11 @@
 #include <linux/slab.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
 #include <media/v4l2-fwnode.h>
 
+#include <trace/events/v4l2_controls.h>
+
 #include "v4l2-ctrls-priv.h"
 
 static const union v4l2_ctrl_ptr ptr_null;
@@ -1546,12 +1549,122 @@ int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl,
 }
 EXPORT_SYMBOL(v4l2_ctrl_type_op_validate);
 
+void v4l2_ctrl_type_op_trace(const struct v4l2_fh *fh,
+			     const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr ptr)
+{
+	int i = 0;
+
+	switch ((u32)ctrl->type) {
+	case V4L2_CTRL_TYPE_FWHT_PARAMS:
+		trace_v4l2_ctrl_fwht_params(fh->tgid, fh->fd, ptr.p_fwht_params);
+		break;
+	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
+		trace_v4l2_ctrl_mpeg2_sequence(fh->tgid, fh->fd, ptr.p_mpeg2_sequence);
+		break;
+	case V4L2_CTRL_TYPE_MPEG2_PICTURE:
+		trace_v4l2_ctrl_mpeg2_picture(fh->tgid, fh->fd, ptr.p_mpeg2_picture);
+		break;
+	case V4L2_CTRL_TYPE_MPEG2_QUANTISATION:
+		trace_v4l2_ctrl_mpeg2_quantisation(fh->tgid, fh->fd, ptr.p_mpeg2_quantisation);
+		break;
+	case V4L2_CTRL_TYPE_VP8_FRAME:
+		trace_v4l2_ctrl_vp8_frame(fh->tgid, fh->fd, ptr.p_vp8_frame);
+		trace_v4l2_ctrl_vp8_entropy(fh->tgid, fh->fd, ptr.p_vp8_frame);
+		break;
+	case V4L2_CTRL_TYPE_VP9_FRAME:
+		trace_v4l2_ctrl_vp9_frame(fh->tgid, fh->fd, ptr.p_vp9_frame);
+		break;
+	case V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR:
+		trace_v4l2_ctrl_vp9_compressed_hdr(fh->tgid, fh->fd,
+						   ptr.p_vp9_compressed_hdr_probs);
+		trace_v4l2_ctrl_vp9_compressed_coeff(fh->tgid, fh->fd,
+						     ptr.p_vp9_compressed_hdr_probs);
+		trace_v4l2_vp9_mv_probs(fh->tgid, fh->fd, &ptr.p_vp9_compressed_hdr_probs->mv);
+		break;
+	case V4L2_CTRL_TYPE_H264_SPS:
+		trace_v4l2_ctrl_h264_sps(fh->tgid, fh->fd, ptr.p_h264_sps);
+		break;
+	case V4L2_CTRL_TYPE_H264_PPS:
+		trace_v4l2_ctrl_h264_pps(fh->tgid, fh->fd, ptr.p_h264_pps);
+		break;
+	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
+		trace_v4l2_ctrl_h264_scaling_matrix(fh->tgid, fh->fd, ptr.p_h264_scaling_matrix);
+		break;
+	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
+	{
+		struct v4l2_ctrl_h264_slice_params *sp = ptr.p_h264_slice_params;
+
+		trace_v4l2_ctrl_h264_slice_params(fh->tgid, fh->fd, sp);
+
+		for (i = 0; i < ARRAY_SIZE(sp->ref_pic_list0); i++)
+			trace_v4l2_h264_ref_pic_list0(fh->tgid, fh->fd, &sp->ref_pic_list0[i], i);
+		for (i = 0; i < ARRAY_SIZE(sp->ref_pic_list1); i++)
+			trace_v4l2_h264_ref_pic_list1(fh->tgid, fh->fd, &sp->ref_pic_list1[i], i);
+
+		break;
+	}
+	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
+	{
+		struct v4l2_ctrl_h264_decode_params *dp = ptr.p_h264_decode_params;
+
+		trace_v4l2_ctrl_h264_decode_params(fh->tgid, fh->fd, dp);
+
+		for (i = 0; i < ARRAY_SIZE(dp->dpb); i++)
+			trace_v4l2_h264_dpb_entry(fh->tgid, fh->fd, &dp->dpb[i], i);
+
+		break;
+	}
+	case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
+		trace_v4l2_ctrl_h264_pred_weights(fh->tgid, fh->fd, ptr.p_h264_pred_weights);
+		break;
+	case V4L2_CTRL_TYPE_HEVC_SPS:
+		trace_v4l2_ctrl_hevc_sps(fh->tgid, fh->fd, ptr.p_hevc_sps);
+		break;
+	case V4L2_CTRL_TYPE_HEVC_PPS:
+		trace_v4l2_ctrl_hevc_pps(fh->tgid, fh->fd, ptr.p_hevc_pps);
+		break;
+	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
+		trace_v4l2_ctrl_hevc_slice_params(fh->tgid, fh->fd, ptr.p_hevc_slice_params);
+		trace_v4l2_hevc_pred_weight_table(fh->tgid, fh->fd,
+						  &ptr.p_hevc_slice_params->pred_weight_table);
+		break;
+	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
+		trace_v4l2_ctrl_hevc_scaling_matrix(fh->tgid, fh->fd, ptr.p_hevc_scaling_matrix);
+		break;
+	case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
+	{
+		struct v4l2_ctrl_hevc_decode_params *dp = ptr.p_hevc_decode_params;
+
+		trace_v4l2_ctrl_hevc_decode_params(fh->tgid, fh->fd, dp);
+
+		for (i = 0; i < ARRAY_SIZE(dp->dpb); i++)
+			trace_v4l2_hevc_dpb_entry(fh->tgid, fh->fd, &dp->dpb[i]);
+
+		break;
+	}
+	case V4L2_CTRL_TYPE_AV1_SEQUENCE:
+		trace_v4l2_ctrl_av1_sequence(fh->tgid, fh->fd, ptr.p_av1_sequence);
+		break;
+	case V4L2_CTRL_TYPE_AV1_FRAME:
+		trace_v4l2_ctrl_av1_frame(fh->tgid, fh->fd, ptr.p_av1_frame);
+		break;
+	case V4L2_CTRL_TYPE_AV1_FILM_GRAIN:
+		trace_v4l2_ctrl_av1_film_grain(fh->tgid, fh->fd, ptr.p_av1_film_grain);
+		break;
+	case V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY:
+		trace_v4l2_ctrl_av1_tile_group_entry(fh->tgid, fh->fd, ptr.p_av1_tile_group_entry);
+		break;
+	}
+}
+EXPORT_SYMBOL(v4l2_ctrl_type_op_trace);
+
 static const struct v4l2_ctrl_type_ops std_type_ops = {
 	.equal = v4l2_ctrl_type_op_equal,
 	.init = v4l2_ctrl_type_op_init,
 	.minimum = v4l2_ctrl_type_op_minimum,
 	.maximum = v4l2_ctrl_type_op_maximum,
 	.log = v4l2_ctrl_type_op_log,
+	.trace = v4l2_ctrl_type_op_trace,
 	.validate = v4l2_ctrl_type_op_validate,
 };
 
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 6e363262c868..976f9b05af9a 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -140,6 +140,7 @@ struct v4l2_ctrl_ops {
  * @minimum: set the value to the minimum value of the control.
  * @maximum: set the value to the maximum value of the control.
  * @log: log the value.
+ * @trace: trace the value of the control with Ftrace.
  * @validate: validate the value for ctrl->new_elems array elements.
  *	Return 0 on success and a negative value otherwise.
  */
@@ -153,6 +154,8 @@ struct v4l2_ctrl_type_ops {
 	void (*maximum)(const struct v4l2_ctrl *ctrl, u32 idx,
 			union v4l2_ctrl_ptr ptr);
 	void (*log)(const struct v4l2_ctrl *ctrl);
+	void (*trace)(const struct v4l2_fh *fh,
+		      const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr ptr);
 	int (*validate)(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr ptr);
 };
 
@@ -1633,6 +1636,18 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
  */
 void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl);
 
+/**
+ * v4l2_ctrl_type_op_trace - Default v4l2_ctrl_type_ops trace callback.
+ *
+ * @fh: The v4l2_fh of the current context.
+ * @ctrl: The v4l2_ctrl pointer.
+ * @ptr: The v4l2 control value.
+ *
+ * Return: void
+ */
+void v4l2_ctrl_type_op_trace(const struct v4l2_fh *fh,
+			     const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr ptr);
+
 /**
  * v4l2_ctrl_type_op_validate - Default v4l2_ctrl_type_ops validate callback.
  *

-- 
2.56.1



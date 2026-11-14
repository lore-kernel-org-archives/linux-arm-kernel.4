Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6852360A260D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 10:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iExeX4Ur
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v4iYho5VZvmEyDSaOjiZizZqmyPF7Vw4WNsQWZBxg9c=; b=iExeX4Uro2vtvaR+6L4Q0QkV1v
	B74Pb5g5MWND/wwC7ZFJkoOpA85u6/AbthQdeVe2Zkls08i/pGccM/SOhmssbp41uwXoRDCTQP477
	g/MuQQyAbukmfjtQL00E2ZgIbddCEfiYH04/1odUcmA5QRhU97M0Agc2I1ah/pLuHRvKvm6zb+Sg5
	jUQts+X3ReDuu9H2b3FyIwiYrVlydBAkrq7SH+1Do2RuQwl8+aDqud+wHIEG49AqEZ7HRRhsIwIvj
	09rOVhrvoDLnVFBvZHqR7fu3CvxW5I41HmTsI/mdac9w+bOhkToOdm1wRpCx4WJUdZHOmhF6FKo4v
	H0LtyNiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAuv-0000000FkWu-0zU4;
	Sat, 14 Nov 2026 10:23:29 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAup-0000000FkTA-1VQT;
	Sat, 14 Nov 2026 10:23:26 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSAui-000000003bx-1lCf;
	Sat, 14 Nov 2026 10:23:16 +0000
Date: Sat, 14 Nov 2026 10:23:13 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Alex Bee <knaerzche@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] media: rkvdec: hevc: cache every short-term RPS set
Message-ID: <bc2872729866f947057117ea6635cd44f4b4e749.1794645268.git.daniel@makrotopia.org>
References: <cover.1794645268.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794645268.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_022323_436995_69287209 
X-CRM114-Status: GOOD (  15.69  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

rkvdec_hevc_prepare_hw_st_rps() skips building the short-term RPS
table when the first element of the EXT_SPS_ST_RPS control equals its
cache, which holds a single element and starts zeroed. When the first
element is all zero, e.g. for an empty first set, the table entries of
the remaining sets are never built, and an SPS that differs from the
previous one only after its first set, or only in
num_short_term_ref_pic_sets, keeps the previous table. Inter pictures
are then decoded with wrong references: JCT-VC DELTAQP_A_BRCM_4 decodes
its intra pictures correctly and its inter pictures wrongly on an
RK3568, whose VDPU346 uses the VDPU381 back end.

Cache all sets the SPS uses together with their number, for both the
VDPU381 and the VDPU383 back end. The SPS control validation bounds
num_short_term_ref_pic_sets to 64, the size of the cache.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.c    | 12 ++++++++----
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.h    |  9 ++++++++-
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c   |  2 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c   |  2 +-
 4 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index 3b281c16a75ed..e3449ab0d415b 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -330,14 +330,17 @@ static void st_ref_pic_set_calculate(struct rkvdec_hevc_run *run, int idx,
 }
 
 static void rkvdec_hevc_prepare_hw_st_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
-					  struct v4l2_ctrl_hevc_ext_sps_st_rps *cache)
+					  struct rkvdec_hevc_st_rps_cache *cache)
 {
+	u8 num_sets = run->sps->num_short_term_ref_pic_sets;
+	size_t size;
 	int idx;
 
 	if (!run->ext_sps_st_rps)
 		return;
 
-	if (!memcmp(cache, run->ext_sps_st_rps, sizeof(struct v4l2_ctrl_hevc_ext_sps_st_rps)))
+	size = num_sets * sizeof(*cache->sets);
+	if (cache->num_sets == num_sets && !memcmp(cache->sets, run->ext_sps_st_rps, size))
 		return;
 
 	struct calculated_rps_st_set *calculated_rps_st_sets =
@@ -357,11 +360,12 @@ static void rkvdec_hevc_prepare_hw_st_rps(struct rkvdec_hevc_run *run, struct rk
 
 	kfree(calculated_rps_st_sets);
 
-	memcpy(cache, run->ext_sps_st_rps, sizeof(struct v4l2_ctrl_hevc_ext_sps_st_rps));
+	memcpy(cache->sets, run->ext_sps_st_rps, size);
+	cache->num_sets = num_sets;
 }
 
 void rkvdec_hevc_assemble_hw_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
-				 struct v4l2_ctrl_hevc_ext_sps_st_rps *st_cache)
+				 struct rkvdec_hevc_st_rps_cache *st_cache)
 {
 	rkvdec_hevc_prepare_hw_st_rps(run, rps, st_cache);
 	rkvdec_hevc_assemble_hw_lt_rps(run, rps);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
index 2a9b7719ab2d5..f6a3dec6ff4ad 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
@@ -35,10 +35,17 @@
 
 #define RKVDEC_RPS_HEVC_SIZE		ALIGN(1032 + 64 * 384, 128)
 
+#define RKVDEC_HEVC_MAX_SHORT_TERM_REF_PIC_SETS	64
+
 struct rkvdec_rps {
 	u32 info[RKVDEC_RPS_HEVC_SIZE / 8 / 4];
 } __packed;
 
+struct rkvdec_hevc_st_rps_cache {
+	struct v4l2_ctrl_hevc_ext_sps_st_rps sets[RKVDEC_HEVC_MAX_SHORT_TERM_REF_PIC_SETS];
+	u8 num_sets;
+};
+
 struct rkvdec_hevc_run {
 	struct rkvdec_run base;
 	const struct v4l2_ctrl_hevc_slice_params *slices_params;
@@ -65,7 +72,7 @@ void compute_tiles_non_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_size
 			       u16 width, u16 height, s32 pic_in_cts_width,
 			       s32 pic_in_cts_height, u16 *column_width, u16 *row_height);
 void rkvdec_hevc_assemble_hw_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
-				 struct v4l2_ctrl_hevc_ext_sps_st_rps *st_cache);
+				 struct rkvdec_hevc_st_rps_cache *st_cache);
 void rkvdec_hevc_assemble_hw_scaling_list(struct rkvdec_ctx *ctx,
 					  struct rkvdec_hevc_run *run,
 					  struct scaling_factor *scaling_factor,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index db836536e601b..8388421a68a48 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -117,7 +117,7 @@ struct rkvdec_hevc_priv_tbl {
 struct rkvdec_hevc_ctx {
 	struct rkvdec_aux_buf			priv_tbl;
 	struct v4l2_ctrl_hevc_scaling_matrix	scaling_matrix_cache;
-	struct v4l2_ctrl_hevc_ext_sps_st_rps	st_cache;
+	struct rkvdec_hevc_st_rps_cache		st_cache;
 	struct rkvdec_vdpu381_regs_hevc		regs;
 };
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index c409d21c08598..47f236295f1e5 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -124,7 +124,7 @@ struct rkvdec_hevc_priv_tbl {
 struct rkvdec_hevc_ctx {
 	struct rkvdec_aux_buf			priv_tbl;
 	struct v4l2_ctrl_hevc_scaling_matrix	scaling_matrix_cache;
-	struct v4l2_ctrl_hevc_ext_sps_st_rps	st_cache;
+	struct rkvdec_hevc_st_rps_cache		st_cache;
 	struct vdpu383_regs_h26x		regs;
 };
 
-- 
2.56.0


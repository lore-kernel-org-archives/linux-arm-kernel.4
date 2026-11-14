Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC966606A333
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 10:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WaXtLMdj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=72+8+ONCbYPEnWoOxWpVed8NR0ccEgS3pN2/pYyR4jc=; b=WaXtLMdjYgkgTeno+FhMshyOvo
	tiO+fW1U3THiHPkytrffwOistSdYFwlPgf+mDIHAazF2MtmEJGWEF8h5/jGC9IfVs9cAE5pv0/nuh
	RDAnpPU5c02DDhRTcTf/KDWddcZ35YLU8YX/aMN3AsBhzmhK0kgEgpJNAi9fp1bFPpCQP5V8C1FNn
	AlF8CtI4ub3oOilG+D4KIwJ0KwS0GwIjRxGMAuXxREaOmxbn4MBxGDUbaJBJPZJLBJP+5vsSatwQq
	Adde7B39+1g/7cgIaGG1pYx3iPw7/XqscmWmY4W7bEkBKkHaXhcMS/VACK7NJTacTt0KOcohCHV4q
	plAY/8Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAv0-0000000FkcY-1yPj;
	Sat, 14 Nov 2026 10:23:34 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAuy-0000000FkZG-1778;
	Sat, 14 Nov 2026 10:23:33 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSAur-000000003cT-0wU4;
	Sat, 14 Nov 2026 10:23:25 +0000
Date: Sat, 14 Nov 2026 10:23:22 +0000
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
Subject: [PATCH 7/7] media: rkvdec: hevc: check the RPS scratch allocation
Message-ID: <e09a3368475ce68d7498a7ff3521e2da6c1f74ea.1794645268.git.daniel@makrotopia.org>
References: <cover.1794645268.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794645268.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_022332_335855_55BBFC02 
X-CRM114-Status: GOOD (  15.64  )
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

rkvdec_hevc_prepare_hw_st_rps() uses the array returned by kzalloc()
without checking it, so a failed allocation while a decode job is
prepared dereferences a NULL pointer. Return -ENOMEM through
rkvdec_hevc_assemble_hw_rps() and let both back ends refuse the job
after completing the request's controls.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../rockchip/rkvdec/rkvdec-hevc-common.c      | 26 ++++++++++++++-----
 .../rockchip/rkvdec/rkvdec-hevc-common.h      |  4 +--
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |  7 ++++-
 .../rockchip/rkvdec/rkvdec-vdpu383-hevc.c     |  7 ++++-
 4 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index e3449ab0d415b..80df05bacaeba 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -329,24 +329,27 @@ static void st_ref_pic_set_calculate(struct rkvdec_hevc_run *run, int idx,
 	st_rps->num_delta_pocs = st_rps->num_positive_pics + st_rps->num_negative_pics;
 }
 
-static void rkvdec_hevc_prepare_hw_st_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
-					  struct rkvdec_hevc_st_rps_cache *cache)
+static int rkvdec_hevc_prepare_hw_st_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
+					 struct rkvdec_hevc_st_rps_cache *cache)
 {
 	u8 num_sets = run->sps->num_short_term_ref_pic_sets;
 	size_t size;
 	int idx;
 
 	if (!run->ext_sps_st_rps)
-		return;
+		return 0;
 
 	size = num_sets * sizeof(*cache->sets);
 	if (cache->num_sets == num_sets && !memcmp(cache->sets, run->ext_sps_st_rps, size))
-		return;
+		return 0;
 
 	struct calculated_rps_st_set *calculated_rps_st_sets =
 		kzalloc(sizeof(struct calculated_rps_st_set) *
 			run->sps->num_short_term_ref_pic_sets, GFP_KERNEL);
 
+	if (!calculated_rps_st_sets)
+		return -ENOMEM;
+
 	for (idx = 0; idx < run->sps->num_short_term_ref_pic_sets; idx++) {
 		const struct v4l2_ctrl_hevc_ext_sps_st_rps *rps_data = &run->ext_sps_st_rps[idx];
 
@@ -362,13 +365,22 @@ static void rkvdec_hevc_prepare_hw_st_rps(struct rkvdec_hevc_run *run, struct rk
 
 	memcpy(cache->sets, run->ext_sps_st_rps, size);
 	cache->num_sets = num_sets;
+
+	return 0;
 }
 
-void rkvdec_hevc_assemble_hw_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
-				 struct rkvdec_hevc_st_rps_cache *st_cache)
+int rkvdec_hevc_assemble_hw_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
+				struct rkvdec_hevc_st_rps_cache *st_cache)
 {
-	rkvdec_hevc_prepare_hw_st_rps(run, rps, st_cache);
+	int ret;
+
+	ret = rkvdec_hevc_prepare_hw_st_rps(run, rps, st_cache);
+	if (ret)
+		return ret;
+
 	rkvdec_hevc_assemble_hw_lt_rps(run, rps);
+
+	return 0;
 }
 
 struct vb2_buffer *
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
index f6a3dec6ff4ad..32f192743c8c8 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
@@ -71,8 +71,8 @@ void compute_tiles_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_size,
 void compute_tiles_non_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_size,
 			       u16 width, u16 height, s32 pic_in_cts_width,
 			       s32 pic_in_cts_height, u16 *column_width, u16 *row_height);
-void rkvdec_hevc_assemble_hw_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
-				 struct rkvdec_hevc_st_rps_cache *st_cache);
+int rkvdec_hevc_assemble_hw_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
+				struct rkvdec_hevc_st_rps_cache *st_cache);
 void rkvdec_hevc_assemble_hw_scaling_list(struct rkvdec_ctx *ctx,
 					  struct rkvdec_hevc_run *run,
 					  struct scaling_factor *scaling_factor,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index 8388421a68a48..2a239114759a2 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -593,6 +593,7 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	struct rkvdec_hevc_run run;
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_hevc_priv_tbl *tbl = hevc_ctx->priv_tbl.cpu;
+	int ret;
 
 	rkvdec_hevc_run_preamble(ctx, &run);
 
@@ -606,7 +607,11 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	rkvdec_hevc_assemble_hw_scaling_list(ctx, &run, &tbl->scaling_list,
 					     &hevc_ctx->scaling_matrix_cache);
 	assemble_hw_pps(ctx, &run);
-	rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
+	ret = rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
+	if (ret) {
+		rkvdec_run_postamble(ctx, &run.base);
+		return ret;
+	}
 
 	config_registers(ctx, &run);
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index 47f236295f1e5..52554c75f47f4 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -542,6 +542,7 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_hevc_priv_tbl *tbl = hevc_ctx->priv_tbl.cpu;
 	u32 timeout_threshold;
+	int ret;
 
 	rkvdec_hevc_run_preamble(ctx, &run);
 
@@ -560,7 +561,11 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	rkvdec_hevc_assemble_hw_scaling_list(ctx, &run, &tbl->scaling_list,
 					     &hevc_ctx->scaling_matrix_cache);
 	assemble_hw_pps(ctx, &run);
-	rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
+	ret = rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
+	if (ret) {
+		rkvdec_run_postamble(ctx, &run.base);
+		return ret;
+	}
 
 	config_registers(ctx, &run);
 
-- 
2.56.0


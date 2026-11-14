Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D046B606A338
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 10:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TBuZZ8DT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hQdAK6nXJHg9IiRiM6Gy5G99h7yBYkgKonnA+V+wGAU=; b=TBuZZ8DTFiatX7eVV6jsyOEWkm
	xQTYy0uqDQHrAlV5FWCceAxCyzmetRmHw+x71VV3QcRJO3R0Y1BZAGw5wvMY420HeVdODWXlJMUzo
	PceEz1dKIORm1LYOJkNJmlb1eIFK9a8sSTDa2rnzxXjWzFZZ5H6gl6RrUYWfXyfa684HSF/cIZ7Po
	l2hrB4j9AJZwnC+itlzEAk0VG8BCoBoCVwJVN815NQszb05WGueF6cCKpODko6TigY3pKw+kSsXJi
	Nmg/I7aSAydCD8zTUQPSeHlbsapYEq+ydQG0pt7MatSJYiAp9NM45OTADlMN3ePJ/PNFBVbFOdr+U
	CDC93J7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAub-0000000FkIv-2MOi;
	Sat, 14 Nov 2026 10:23:09 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAuZ-0000000FkG5-0Jr7;
	Sat, 14 Nov 2026 10:23:08 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSAuS-000000003bG-0Ffl;
	Sat, 14 Nov 2026 10:23:00 +0000
Date: Sat, 14 Nov 2026 10:22:57 +0000
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
Subject: [PATCH 3/7] media: rkvdec: hevc: bound the RPS reads by the control
 size
Message-ID: <bb9c44d0f56221874b105394169e5c377ef21b42.1794645268.git.daniel@makrotopia.org>
References: <cover.1794645268.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794645268.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_022307_118126_29389012 
X-CRM114-Status: GOOD (  17.07  )
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

The RPS helpers read num_short_term_ref_pic_sets elements of the
EXT_SPS_ST_RPS control and num_long_term_ref_pics_sps elements of the
EXT_SPS_LT_RPS control, however many elements userspace passed. Beyond
the passed elements they read stale entries of the control's array,
and past its allocation once the SPS counts more sets than the control
has ever held, as the control framework sizes a dynamic array for the
largest element count it has seen. The short-term sets read from there
are unchecked, and a num_negative_pics or num_positive_pics above 16
overflows the calculated sets, the stack arrays of
st_ref_pic_set_prediction() and the hardware RPS table.

A userspace V4L2 client that can open the RKVDEC m2m decoder can set an
SPS whose counts exceed the number of elements it passed in these
controls, so the reads run past the allocation.

Use the controls only when they hold at least as many elements as the
SPS counts, and treat them as not set otherwise in both back ends.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.c    | 12 ++++++------
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c   |  4 ++--
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c   |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index c249e3f16f42c..797a16517ed59 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -448,18 +448,18 @@ void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx,
 			      V4L2_CID_STATELESS_HEVC_SCALING_MATRIX);
 	run->scaling_matrix = ctrl ? ctrl->p_cur.p : NULL;
 
+	run->ext_sps_st_rps = NULL;
 	if (ctx->has_sps_st_rps) {
 		ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
 				      V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS);
-		run->ext_sps_st_rps = ctrl ? ctrl->p_cur.p : NULL;
-	} else {
-		run->ext_sps_st_rps = NULL;
+		if (ctrl && ctrl->elems >= run->sps->num_short_term_ref_pic_sets)
+			run->ext_sps_st_rps = ctrl->p_cur.p;
 	}
+	run->ext_sps_lt_rps = NULL;
 	if (ctx->has_sps_lt_rps) {
 		ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
 				      V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS);
-		run->ext_sps_lt_rps = ctrl ? ctrl->p_cur.p : NULL;
-	} else {
-		run->ext_sps_lt_rps = NULL;
+		if (ctrl && ctrl->elems >= run->sps->num_long_term_ref_pics_sps)
+			run->ext_sps_lt_rps = ctrl->p_cur.p;
 	}
 }
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index e1936e87f45be..fea7ff48c0dce 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -604,8 +604,8 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	 * On vdpu381, not setting the long and short term ref sets will just output wrong frames.
 	 * Let's just warn about it and let the decoder run anyway.
 	 */
-	if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
-	    (!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
+	if ((!run.ext_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
+	    (!run.ext_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
 		dev_warn_ratelimited(rkvdec->dev, "Long and short term RPS not set\n");
 	} else {
 		rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index e9d8b590f0d58..c409d21c08598 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -550,8 +550,8 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	 * To be on the safe side for this new v4l2 control, write an error in the log and mark
 	 * the buffer as failed by returning an error here.
 	 */
-	if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
-	    (!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
+	if ((!run.ext_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
+	    (!run.ext_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
 		dev_err_ratelimited(rkvdec->dev, "Long and short term RPS not set\n");
 		rkvdec_run_postamble(ctx, &run.base);
 		return -EINVAL;
-- 
2.56.0


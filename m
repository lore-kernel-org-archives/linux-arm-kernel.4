Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416A1606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 23:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bVjsZVgZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EmTTjpiwcFOXJi4W2Zi3h/Yk6GAi9STPmCYXBs3Yfps=; b=bVjsZVgZV3NvA14exZkyoeWj9V
	WWquZE9cWR9bZzRRCWmpWvu6f4OxAH8kpXm/Tn+7aXJD8LLNVmzCeMJOWBmSy+HgHM4VULx3h4wR5
	64NvaxFg4d9l7+qUSX63WK75AAjnwmWEq1Kj6j1Kl+ZSZ/7jS4vFh8ZQqCExCRHLuByTWz1GYBSEu
	ZzYtYzs6txWg2ZcjHBzW30wKzqmqFbL2+8yelvLnLlm4va+0D033rQC2NWKQgEY5w6aD4ykVyhTh2
	Vh81IDym7BtW2zJ5cQhxj8LDtcaRNi+ff7BoBRPwbgz6RlCmzokNW9EWwFftTCbHzpB/Ptc5Ct5wR
	KU2/QeMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYFr-0000000GRUV-34Jk;
	Fri, 20 Nov 2026 23:42:55 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYFa-0000000GRR0-0QPD;
	Fri, 20 Nov 2026 23:42:49 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUYFT-000000002f2-0gyc;
	Fri, 20 Nov 2026 23:42:31 +0000
Date: Fri, 20 Nov 2026 23:42:23 +0000
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
Subject: [PATCH v2 4/7] media: rkvdec: hevc: refuse RPS controls shorter than
 the SPS counts
Message-ID: <3244aca607a6714f92dd330d5f3fdfcff2d4a508.1795217229.git.daniel@makrotopia.org>
References: <cover.1795217229.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795217229.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_154248_764850_A6782227 
X-CRM114-Status: GOOD (  19.83  )
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

The SPS control tells how many short-term and long-term reference
picture sets a stream has. The sets themselves are passed in two
separate array controls, EXT_SPS_ST_RPS and EXT_SPS_LT_RPS. The driver
reads as many array elements as the SPS announces, without checking
that userspace passed that many. A larger count in the SPS makes it
read past the end of the array.

Compare the array size with the SPS count when a decode job is
prepared, and refuse the job if the array is too short. The controls
can be set independently, so this is the first point where both values
are known.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Changes since v1:
- Move after the VDPU381 refusal, was 3/7, so that a control which is
  too short fails the job in both back ends (Nicolas Dufresne)
- Change the subject, was "media: rkvdec: hevc: bound the RPS reads by
  the control size"
- Rewrite the commit message, and say why the size cannot be checked
  when the control is set (Nicolas Dufresne)
- The VDPU381 hunk now applies to the refusal instead of the warning,
  no other code change

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
index 7627282c15f0a..db836536e601b 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -596,8 +596,8 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 
 	rkvdec_hevc_run_preamble(ctx, &run);
 
-	if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
-	    (!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
+	if ((!run.ext_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
+	    (!run.ext_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
 		dev_err_ratelimited(rkvdec->dev, "Long and short term RPS not set\n");
 		rkvdec_run_postamble(ctx, &run.base);
 		return -EINVAL;
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
2.56.1


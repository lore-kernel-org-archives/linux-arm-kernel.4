Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7668E606A697
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 23:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y0PKaDF5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dfLaICCFFs23kF3QbDbJpGN/JagEIg84ZRjiNRLMMHI=; b=Y0PKaDF5WlHYu9VDhk+LYjmfLQ
	iO+ToBWJGfeyEBWB6eplhKWv3r5+ubrklt7JSPnMv94JL/eoR+Kb22HtUwRBmQaygEB+KhpOStVOW
	+1aCMAqiemB+jV+/r5dzh4x8Hs2xtRKiNBhM7892bNgZz1G+S2V2JViLJaRbGsyHS0V7hu4PxOe/X
	CblQPkXGShARH085DsHZvB7NF/zzvMWEaTvMaZ/nwQxcOytoyDxhYFjuEmxXdhNVwiC4cpjjwiTE9
	572NxMfggOPSz4DDUZ3aNQFny8pp6qKOacdqGQDF35sB8bGL1tZFGY5RpRUkT84LlIHY3k4AQd7rt
	o+PhwJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYFO-0000000GRMM-0UT6;
	Fri, 20 Nov 2026 23:42:26 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYFD-0000000GRHG-37a3;
	Fri, 20 Nov 2026 23:42:17 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUYF6-000000002eg-3IM4;
	Fri, 20 Nov 2026 23:42:08 +0000
Date: Fri, 20 Nov 2026 23:42:00 +0000
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
Subject: [PATCH v2 3/7] media: rkvdec: vdpu381: refuse HEVC jobs without RPS
 sets
Message-ID: <114caf6a80ded7185458027c729bbb4b4a4ba17b.1795217229.git.daniel@makrotopia.org>
References: <cover.1795217229.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795217229.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_154216_640500_5325DCE4 
X-CRM114-Status: GOOD (  14.87  )
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

When a stream uses reference picture sets and userspace never set the
EXT_SPS_ST_RPS or EXT_SPS_LT_RPS control, the VDPU381 HEVC back end
only logs a warning and starts the decoder anyway. The hardware then
uses an RPS table which does not belong to the stream and gives wrong
pictures at best. On the VDPU346 of the RK3568, which uses this back
end, such a decode ends in a failed IOMMU reset and the system stops
responding until the hardware watchdog resets it.

Fail the job with -EINVAL before the hardware is started, as the
VDPU383 back end does.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Changes since v1:
- Move before the check of the control size, was 5/7
- Test ctx->has_sps_st_rps and ctx->has_sps_lt_rps as a result of the
  new position, the next patch replaces them in both back ends
- Rewrite the commit message

 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index e1936e87f45be..7627282c15f0a 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -596,21 +596,18 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 
 	rkvdec_hevc_run_preamble(ctx, &run);
 
-	rkvdec_hevc_assemble_hw_scaling_list(ctx, &run, &tbl->scaling_list,
-					     &hevc_ctx->scaling_matrix_cache);
-	assemble_hw_pps(ctx, &run);
-
-	/*
-	 * On vdpu381, not setting the long and short term ref sets will just output wrong frames.
-	 * Let's just warn about it and let the decoder run anyway.
-	 */
 	if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
 	    (!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
-		dev_warn_ratelimited(rkvdec->dev, "Long and short term RPS not set\n");
-	} else {
-		rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
+		dev_err_ratelimited(rkvdec->dev, "Long and short term RPS not set\n");
+		rkvdec_run_postamble(ctx, &run.base);
+		return -EINVAL;
 	}
 
+	rkvdec_hevc_assemble_hw_scaling_list(ctx, &run, &tbl->scaling_list,
+					     &hevc_ctx->scaling_matrix_cache);
+	assemble_hw_pps(ctx, &run);
+	rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
+
 	config_registers(ctx, &run);
 
 	rkvdec_run_postamble(ctx, &run.base);
-- 
2.56.1


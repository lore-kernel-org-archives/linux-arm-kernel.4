Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5E3606A89B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 10:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HCmVN//j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jrBobRkGyr/IcjYrx7kD98jCz8paoRMgebEiflmNI3I=; b=HCmVN//jIG7W2SwThgVVFFU0W2
	2FEfxQVjxdnuKx0KCGCgcGG8/S6bNS4cf7ATLwiRkqMuhFfXi4q+22sqBUXxIYgBUg8ZnUHDijazD
	ds2aPvvfLSJ5V8OM8qs4FkEjgwOfrPRYgN7H2RPJnLqRa1HaFd1uHi5T4iVWoQe+8mwOYN1FcS6Kp
	8sf1VssW52SK2m7uOSVHXK+0C3gc71lVBdFLNPfO00Qg4rzhlsZEMpwTSgUDbm8WSOjqZzGa8lGBK
	sQZzAYNXsKw+i+YkwC2uoQfu5dG1KpwuQk9og+hRd5RW182x5gaOhulGbOyr+X8KJFDI4a/i/cJ2G
	VdWhE44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAul-0000000FkQ1-08gn;
	Sat, 14 Nov 2026 10:23:19 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAui-0000000FkNF-2UWa;
	Sat, 14 Nov 2026 10:23:17 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSAub-000000003bk-25J2;
	Sat, 14 Nov 2026 10:23:09 +0000
Date: Sat, 14 Nov 2026 10:23:06 +0000
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
Subject: [PATCH 5/7] media: rkvdec: vdpu381: refuse HEVC jobs without RPS sets
Message-ID: <b7a2619578693a708dbd187e2f659dc0886ae23a.1794645268.git.daniel@makrotopia.org>
References: <cover.1794645268.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794645268.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_022316_635695_88D50214 
X-CRM114-Status: GOOD (  12.84  )
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

When the SPS uses short-term or long-term reference picture sets and
the matching EXT_SPS_ST_RPS or EXT_SPS_LT_RPS control was never set or
holds fewer sets than the SPS counts, rkvdec_hevc_run() logs a warning
and starts the decoder with an RPS table that does not belong to the
stream, which at best gives wrong pictures. On the VDPU346 of the
RK3568, which uses this back end, such decodes also raise error
interrupts and time out, the IOMMU force reset fails, and the system
stops responding until the hardware watchdog resets it.

Refuse the job as the VDPU383 back end does: log an error and return
-EINVAL before any table is assembled, so that rkvdec_device_run()
returns the buffers with VB2_BUF_STATE_ERROR and the hardware is not
started. The request's controls are completed first, as
rkvdec_vp9_run() does, so that the request is signalled as complete.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index fea7ff48c0dce..db836536e601b 100644
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
 	if ((!run.ext_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
 	    (!run.ext_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
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
2.56.0


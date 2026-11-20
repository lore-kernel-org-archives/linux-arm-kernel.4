Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288BB606A6B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 23:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UFrxU1HF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eQV0TtdjwA2l+DJGgyIwBU2JmOAWMeSkZF1hw7dK8hQ=; b=UFrxU1HFZwhYHKlSy4h2UD3CRs
	WJW4ygfK9QpTW5yTXDOia8yBrz41WtObI1Phtp0bYB0Jbl8QFvWlXPZMFM0L8y+84kv2zaOZ++wZu
	zfpQNZO3NJTVkQ7uBLjCJDUdtlmVxRTQSvMggfUALjHNNTVMG2os2bnaaKaiU2FNDUaEg+7qJ/6Qz
	4AKiXSCvjKDqv716YhTREj+10FR4pXx8T+ZIea1ar1lgJ6HS0JIdSkPAOP2H0hOu2MoZpo1w/Hfj6
	wtB+o50KcozoNRm25Sk4X8xvLeOth4EnIyfclblprXWRFHQgpWfC9hARU0R1oNZUDZmcHAe3MyBqj
	PKgecWug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYF6-0000000GRFd-1L8G;
	Fri, 20 Nov 2026 23:42:11 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYEw-0000000GRBP-1wIG;
	Fri, 20 Nov 2026 23:42:02 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUYEp-000000002eL-2HrS;
	Fri, 20 Nov 2026 23:41:51 +0000
Date: Fri, 20 Nov 2026 23:41:43 +0000
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
Subject: [PATCH v2 2/7] media: rkvdec: vdpu383: complete refused HEVC requests
Message-ID: <ba10548c37e59b94e9f5ed5984eb48f7149a7628.1795217229.git.daniel@makrotopia.org>
References: <cover.1795217229.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795217229.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_154200_920731_D6CCF84B 
X-CRM114-Status: GOOD (  10.38  )
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

When the RPS controls are missing, the VDPU383 HEVC back end fails the
job after the request was applied, but without completing the request's
controls. The request then never completes: userspace waits for it
forever and MEDIA_REQUEST_IOC_REINIT fails with -EBUSY.

Complete the controls before returning the error, as the VP9 code does.

Fixes: e3b5b77e3689 ("media: rkvdec: Add HEVC support for the VDPU383 variant")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Changes since v1:
- Rewrite the commit message
- No code change

 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index 3462d995d4cf0..e9d8b590f0d58 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -553,6 +553,7 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
 	    (!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
 		dev_err_ratelimited(rkvdec->dev, "Long and short term RPS not set\n");
+		rkvdec_run_postamble(ctx, &run.base);
 		return -EINVAL;
 	}
 
-- 
2.56.1


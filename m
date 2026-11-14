Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F86A606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 10:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nTUXq5gB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h+vA9r9n4WkcSpsjfAj26/xWi1Iy6en+RLiUeVeS0jI=; b=nTUXq5gBrQMvON2lWnP5QkR7KL
	HfJTTuj0MjDsRQ3JY6cX/BAN5E3je7G7mMCUbhdWjLU0GDO9bMpNxVZN88RXbJZD1ATTOz7cCbPUP
	AlFYVrUKJ0i5Zd3cveefxV2Bqj9pQtbOc7/oW3uaWJHwFzz118Sz/GzMA75CooJa6F5H6bPMylKWk
	k3fSRnDGuGJvQuCDfp7SbRst3WITmwSYMX5Bxzz0cLRUFmsw0N2OtptZ1nZrgrxXOEVTsW5Lmc80f
	YXCxQMd3potENX99DeNstnDZB/ZkHAW2yGW7QpfdeB0jaF7V5+Oftd/GS0awx2HGPbdDHMtIvMKzz
	ILsjwtIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAuU-0000000FkDo-44NZ;
	Sat, 14 Nov 2026 10:23:02 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAuR-0000000FkAY-3CED;
	Sat, 14 Nov 2026 10:23:00 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSAuK-000000003aj-37ZX;
	Sat, 14 Nov 2026 10:22:52 +0000
Date: Sat, 14 Nov 2026 10:22:50 +0000
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
Subject: [PATCH 2/7] media: rkvdec: vdpu383: complete refused HEVC requests
Message-ID: <1c2a7d695a34ff9a1603d981da53fbeb564f6dfe.1794645268.git.daniel@makrotopia.org>
References: <cover.1794645268.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794645268.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_022259_816251_CF48AF57 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

rkvdec_hevc_run() returns -EINVAL when the RPS controls are missing,
after rkvdec_hevc_run_preamble() applied the request's controls but
without completing them. rkvdec_device_run() then returns the buffers
with VB2_BUF_STATE_ERROR, which unbinds the source buffer from the
request, while the request's control handler object stays incomplete.
The request never reaches MEDIA_REQUEST_STATE_COMPLETE: poll() on its
file descriptor never reports it, and MEDIA_REQUEST_IOC_REINIT fails
with -EBUSY.

Complete the request's controls before returning the error, as
rkvdec_vp9_run() does.

Fixes: e3b5b77e3689 ("media: rkvdec: Add HEVC support for the VDPU383 variant")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
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
2.56.0


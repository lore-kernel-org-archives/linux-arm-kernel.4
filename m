Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452A460A3835
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kvBKiRHg;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L1OuxHm8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Lh32Z30mmHI0PILnepXbAQ166lUKFxf5yfIlmnK4noU=; b=kvBKiRHgZL0CSxnkVqJovDFFjm
	HQFFVkKJB4ZTfDjEYdT7Ch9dZ9swCdjE+BRQSGN2ABkaz5pBZnJTJzYTVXCzSKp1fXxHfaupgeHlw
	BOqmjT1T36vwuFOx4iB3aeeggyenROO0aDCQZQ/uXgJGMMqY53B5A9l0vYKpMlsibgYR7L8UqRfPE
	RyGZ8/HlOUsuldA7fEFJYju20FSdW3qa8cpxSyarAQJCX9GVXlKKGpQU0l3qTnTQK/eiMBO6Vj0Ff
	9/1DW4dbkO8XQHlUd22fQpq7Z3RXpqe4GC77hVh2QCGjSA166sB/iqNGamjhNdnzqYkjzO77JNdq/
	okPlCQXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQim6-00000003Ojv-3eLL;
	Tue, 10 Nov 2026 10:08:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQilv-00000003OKn-3DFC;
	Tue, 10 Nov 2026 10:08:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EAB0B6386E;
	Tue, 10 Nov 2026 10:08:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305290;
	b=Cltzq1OiQ31vKNj5q6tBgtuytmY9nYMOpBSdy+DN3Jn7E+h8eLT6JKzjBR/tsfRX+dTw
	 DbOlene3s43d+QJP7AEheG8+ElUVfw35hPAYVOfAh2WIAk1JD5P+KLANM2d3Tf0Yh9zH3
	 5MxmprU/LvvpfxhxHbQ4C9E/tFqUo2y/2EM05hRUsh+nbX7Zueqe0y7p+pEtLWLGB6pQU
	 TCsFqLXd7utCy1w6Wg1iyysqV35Zuue+YdGLNR4iuPJrRlo7YW8EORuRU0azJNG8PSQaO
	 3XwYnNlmDXUWDYY3ydTYpJ/wS2+4ozV/Hih8zIgg0yqZyu+zVoiVY/PHcTyVULtFNbQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305290;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Lh32Z30mmHI0PILnepXbAQ166lUKFxf5yfIlmnK4noU=;
	b=VOESPx/PowVOrbNLHDviFqtghUG5b3yfkKSwRoxCVIFpVTUhxvTxLd6UPxHdEdVQlTAt
	 HxdJeWi9+YP69NNbc/c/1uBHemavzn7Ij8wCADOwDHl6uqb4K8q2rDOp9ri8IuS6uuw1z
	 dfAk87Uk3E9GHnFE54UZxXPbLDyjR3w5dxVlkdLGBF0w1mFpmL3YHgsN5lG399/sPzBu6
	 /dt7DeBemUAPzwEcFjiK8wwu+H/yZpr8MNFSfd1lFluNbR/ik+AOQ6URpGPBdbqjgvjBO
	 ecuIV7SG8tdSgJA/LjvMHrUnQgyJ9zZ7xJ+bpeo0HN0ouLVk7H41mfiiD2SROrRKjdw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56E451F008A1;
	Tue, 10 Nov 2026 10:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305290;
	bh=Lh32Z30mmHI0PILnepXbAQ166lUKFxf5yfIlmnK4noU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=L1OuxHm8VNg5iOdYT/q6ga+2kzYllAvYF8N2zzkji7Ao5EA4UotDnC4cOk1tk886T
	 6ULXZ/mnFYye9czrgyiPtr++Z8T8XNictF1m3rrdF72xRl+iBXCn1wN6xY+ovXkHFK
	 dXefexQzZMtL721dGnWeePbTsRxjvoed2MwF/uKX5Ew31JwYRKwO1viStOgGZMSuBH
	 AjvbJ/SVUpv88meRabC60CeGo5QUm12DiYg2UH2dBf1DD9d9EgBHk+uZV0dwUsRFMu
	 tl9/fByuP3VGvo7Iq6kO8iLH/cajzwtPBDxmyY+TJdBKR5ZRaC1YZHD2/hsweyo8+6
	 NMjDsLCKMN1qA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0EEC848AEB;
	Tue, 10 Nov 2026 10:08:05 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:08:13 +0000
Subject: [PATCH RFC 11/12] media: rockchip: rkvenc: Offer VBR for H.264
 encoding
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-rkvenc-v1-11-ea8b47122d8c@gmail.com>
References: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
In-Reply-To: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Jiaxing Hu <gahing@gahingwoo.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305283; l=2309;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=JF9FEhr+Fnv76x4udoa/NyLN+ajs26dykYgNbWUENQo=;
 b=RzAbjJ74L7b+RRhiG7UT37yP7BGoU6GeGywkhjOgqEOVXxXNrH0bqsfUP8SikAg1F4XkcPxx5
 x5LRkXw7TtiA4hD1pDWP1uz5bWPWEnEWOQvoUHWA2WuafXj4OG9P3wg
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

The H.264 encode core has a variable bitrate mode now. Offer it in
V4L2_CID_MPEG_VIDEO_BITRATE_MODE and add V4L2_CID_MPEG_VIDEO_BITRATE_PEAK,
which the core reads for it (default 20 Mbit/s, twice the default
bitrate), and hand the size target of the variable bitrate pictures to the
hardware row rate control as for constant bitrate.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c b/drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c
index fcb8c070ab30..313c33038670 100644
--- a/drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c
+++ b/drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c
@@ -381,11 +381,13 @@ static int rkvenc_h264_run(struct rkvenc_ctx *ctx, struct rkvenc_core *core,
 	vepu580_setup_h264_tuning(ctx->dev, core, intra);
 
 	/*
-	 * In CBR mode the frame size target of the rate control is handed to
-	 * the hardware row rate control, which adapts the QP of each
+	 * In CBR and VBR mode the frame size target of the rate control is
+	 * handed to the hardware row rate control, which adapts the QP of each
 	 * macroblock row by up to the row_rc_qp_range parameter.
 	 */
-	h264->hw_rc = rc->mode && rc->mode->type == V4L2_H264_ENC_RC_TYPE_CBR &&
+	h264->hw_rc = rc->mode &&
+		      (rc->mode->type == V4L2_H264_ENC_RC_TYPE_CBR ||
+		       rc->mode->type == V4L2_H264_ENC_RC_TYPE_VBR) &&
 		      READ_ONCE(rkvenc_row_rc_qp_range);
 	if (h264->hw_rc)
 		vepu580_setup_row_rc(core, &vepu580_h264_row_rc, rc->qp,
@@ -466,12 +468,15 @@ static const struct v4l2_ctrl_config rkvenc_h264_ctrl_cfgs[] = {
 		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
 		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CQ,
 		.def = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
-		.menu_skip_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR),
 	},
 	{
 		.id = V4L2_CID_MPEG_VIDEO_BITRATE,
 		.min = 10000, .max = 200000000, .step = 1, .def = 10000000,
 	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_BITRATE_PEAK,
+		.min = 10000, .max = 200000000, .step = 1, .def = 20000000,
+	},
 	{
 		.id = V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY,
 		.min = 1, .max = 100, .step = 1, .def = 50,

-- 
2.55.0




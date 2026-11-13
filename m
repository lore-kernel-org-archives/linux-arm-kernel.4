Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965EA606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=htGfTuz9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RIjsIC+X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DxUKnJSoxh5R0Lqzvv32zTimhe+hLNG3ZBbQWBwfczg=; b=htGfTuz95FXV3izjkuIOdxC7O6
	YgiNMlYMiNUSusrTp9KDFCaIcCCPtjzkSHPOBMPLLHVR8DL9OmzDuHOjCS2mpslHZsR71rEF8Ga9c
	+E55cThsT2ocTKgJ3qbF/BLtgeTaotZdsBJYfQj9+hYEXmiYB+wsVKrXxZpQ8dC/P95hRboDwMHXu
	imPuqJhuumnCXWmKm3JwHFXFzV/n/gZzvjIZUGXgxs0HObpGAdIyHk2qg9Ee7yFWR9CChuKaYjmat
	Ipd5CbOwoc+H17Rd7wMdvWidXEpK/lzWEy8VMSvfM8wKhy6CwSdR2d3wT6LqFjPoFUkcxHhPgZpUo
	DPovStJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuKy-0000000DbSc-2p7s;
	Fri, 13 Nov 2026 16:41:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuKL-0000000DaxL-0SYw;
	Fri, 13 Nov 2026 16:40:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E01B628EC;
	Fri, 13 Nov 2026 16:40:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794588036;
	b=ej0bCZZMx3s/eMYrZoC6WZAsB0HI3mHxiGSUXjPaJ9qHk20EEYKVv21YzdS3MdX5kdG+
	 AcrtucW5u8uVWmrNXLyrXNHl19Rplr55m3uJv0Mb6wdGr/becxAmgYRFEQvzN8pM2EvRh
	 u8lAbhpv1rg6m56hn0h2PQ3XPK/NHcduqJ8WNeRfBpiCr45MdQtYjYgyvrmdSZI813oqM
	 1BaxMpSkSCxQ0WBkDsbH+u0ZwbjCRkPTfW5t/uWib/D2fjOTVyE/uOhkNgI0sR9yeftLM
	 iO4iIOHAVoNu0PclaYm8RsbUTu6FSnvWwF6JD0b+GjF2qJjIQsSH85ZK1VjTH4hr3Cg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794588036;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DxUKnJSoxh5R0Lqzvv32zTimhe+hLNG3ZBbQWBwfczg=;
	b=gnWHT76Hgk6oYb62v/M7DR5gpkpHyUX0C+8ccvxtqKi1dogrhcndZ2QWoGib+fMOxUf4
	 jE0uZ+Zqp/G3MsGjzfd2DQPrrkUqs6X5X0otYCVoLHCB6b7HOIFA2PqYdB10D22sCuLwM
	 xN866L2GgEvyvLja5H4PrzmGPTUJU2vfgjy8upCQKu4rTIoqJYMyTjcTDLBCLLf3g0+nK
	 nugiWGR1W8pbGRRKOzDZKO/abqo5nlMQZO5HdXgGZTx0rnnirrdrJqPe5ZkhFFt4MQPhN
	 9lUN/2R7N/tOIZxuayQmJDPRMA7nFWIS17Cykm2IIr7FuJGipcK96vL9ePCSFCeXU2A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E73D1F000C8;
	Fri, 13 Nov 2026 16:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794588036;
	bh=DxUKnJSoxh5R0Lqzvv32zTimhe+hLNG3ZBbQWBwfczg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RIjsIC+XXwPwlP6sgBYp7s2rBD4I2LpgvZ7dzXI08xo/X5RsdFFOxeHkYVSVVJmSU
	 SJ9SrdnKP2N7LXuHmGCpvX5xgvHSijbFRwjPtKRzzSpKDz6wv6+BkGNAvbz/4CQ35X
	 Rk9JP0J/k7MX2K2x8POQzF/IedLy0nf+mPivdTwyN2HsenmBe+2/L9uvk8FV48pxCn
	 zdQQDkL9GR4YPUmbIP6+tsf5x8FsZnH9C8n42aORoCdnz7t6PsTSkPVjXbez7ncuXq
	 G5wBPm9Mn87HsYf/YHxPNq9buLoHKVW8K26PKsmCnEHojspUEqeccQGaHaJuSvjk78
	 LROtvxFmcpDjA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E44FD499DF;
	Fri, 13 Nov 2026 16:40:32 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:40:34 +0000
Subject: [PATCH v3 03/12] media: verisilicon: Complete the request when the
 VPU can't resume
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-hantro-robust-v3-3-82383c722ad2@gmail.com>
References: <20261113-hantro-robust-v3-0-82383c722ad2@gmail.com>
In-Reply-To: <20261113-hantro-robust-v3-0-82383c722ad2@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: linux-media@vger.kernel.org, iommu@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sergei Khomenkov <shomenkow@gmail.com>, 
 Tharit Tangkijwanichakul <tharitt97@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794588032; l=1356;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=dcuFbBUH76d1uZ1BUVv0QU7AVt7L3akWWbZ+Mrdvg+I=;
 b=YS62kIkVRY6LHDmN/vH4lFvz33jKVGNFKm/SlC2vyNIpKbNOEVMlQ4zjchnMUSOlOD9PgdR/D
 nojFp3hpkZwCWE0o5NH26npE1Kg342s81Ds9ADxyFjTFwHYy7gEZsbN
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

If pm_runtime_resume_and_get() fails, device_run() returns the buffers
without completing the controls of the request, and the request stays
queued forever. Complete them on that path.

Fixes: 7d47b45dc590 ("media: rockchip/vpu: Support the Request API")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index e86eb943d16a..42822b2b376c 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -176,16 +176,20 @@ static void device_run(void *priv)
 	dst = hantro_get_dst_buf(ctx);
 
 	ret = pm_runtime_resume_and_get(vpu->dev);
-	if (ret < 0) {
-		hantro_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
-		return;
-	}
+	if (ret < 0)
+		goto err_cancel_job;
 
 	v4l2_m2m_buf_copy_metadata(src, dst);
 
 	ret = ctx->codec_ops->run(ctx);
 	if (ret)
 		hantro_job_finish(ctx, VB2_BUF_STATE_ERROR);
+
+	return;
+
+err_cancel_job:
+	v4l2_ctrl_request_complete(src->vb2_buf.req_obj.req, &ctx->ctrl_handler);
+	hantro_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
 }
 
 static const struct v4l2_m2m_ops vpu_m2m_ops = {

-- 
2.55.0




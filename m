Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974CD606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 08:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oVv640bX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BpyRBYU2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ENmgzf/tl3n2tKo2JxTzXWou+7h9tZdT57vOa3F26Cc=; b=oVv640bXwgoNRFgRl5OeeVyp4Y
	G4ntDRujF4MsXR76LsSBHT5PRmPBjNqC8VafX5nFFmg+Q67wKMnVqjNevrwlUHnZ4LroLnfZuTROm
	ia0TIMSgruKQAQeLLlqYoxkJGigd5ALBd6KsowfdzmMmV2OR7SqenVJahDei5nZB3ZEjKGWd+lTG3
	PZUin72jP/BbFhtMkPLSHS4Rt1x/LkGiD090+B1oTYh/trebYsKDQ1fNTeenYsov0ogpweYC5s3ze
	+OveycHizwjrO7G7No+P8dxG/DfF556nYOTj47ucJF5wElnYr1oDZ/CKwzbCIRSs/fp5iJ/psQ3e1
	t55g1h1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVUR-0000000HDZf-3svX;
	Sun, 15 Nov 2026 08:21:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVUQ-0000000HDZ7-05jK;
	Sun, 15 Nov 2026 08:21:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C39244471F;
	Sun, 15 Nov 2026 08:21:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794730889;
	b=MzrAL84BkU0iS4w4dm81jOX1zb9NCzBQ5v0LUUhQK3a4fDcSpHwXyh3OagNS/9Z3h/qv
	 Cxkhs5CN4syrX/xbitBQVJI/Oi/5/1bEUiUM2nvdKoszbqjCQWBJRN8zPViWM5H4IqiQC
	 dj4JpGZF8uzusBQqusEf8ze8cySWxlo8aG7gblWoY1aATvlIYAEvuwQ+KGLZCXulEB8Hu
	 mNd2ZOjGlFVJKst6JfiF0HcIsyXPCGv9vNbIk94Iaee0gEChfgH/HNKZ26kSUnPmzFJp3
	 Md/CeOom7aneVRGBhaUjJ0wPk/+u91vKn0/Kj4aaI7B/niCrehDz3xqTBNnKaWaCTYw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794730889;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ENmgzf/tl3n2tKo2JxTzXWou+7h9tZdT57vOa3F26Cc=;
	b=xezzN3HvdI9p1/MhKJgFkMzQHvczVPzaehsHZb0F4mRFMBo75zpnqVCHDHeacrUxkGue
	 zvXjn6Hkpf1cGkCKl4xNOKrf0HVtM/tmPd+qC2RpQ+ZU8BAG2U+xFbzsHyt1CjWFgQqHV
	 I9lwNYR2xSE99VmjXTosWXhMr1d3ZMhoFaACKXr91vxcuKazYWrBrYUALlOZ3Q5M5NMR1
	 sGuA54k4+j7xM+V7TQFFyvCOe5JXNot/Rnipo11hVcE8tkvMYNRhsdx9hjxb8jpNL/w4P
	 kOfte4nfVxyhMb3+qyt9+mt0DTZ5CrUrTSD6ZvwT42zZdQ1RJtzlCJeqvwOX+hbOrHg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D75E71F000C6;
	Sun, 15 Nov 2026 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794730889;
	bh=ENmgzf/tl3n2tKo2JxTzXWou+7h9tZdT57vOa3F26Cc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BpyRBYU2KY3sEJXEWT64YFXWDBxtN8Tss1AhHeNFf6F215TqWrLS6QmHHvQ3ChHUr
	 CDBP8SbivO0j86mlFJpDeIgS7Be81LvBdY5M0jcI3r2Hfhg28fYccbeRSpxjLgdQtS
	 d46NFsZMQEAtrrtRUmf4gMz+5GoX7G+cHMkQXZo+9Xx/pZqASlIIVr0UTb3cMs5HDn
	 7KBgzoZqaEuiz82XAG1nnSlOa9TIknPCaLZGDExOwQdGmTI4Fzabb2QFi4O6/AWR7l
	 o30Ts/r4mza7H9uc6nRmwtnmlYoAlAkovumLq0pyIjHX1ZN7LQI39a+heu681F9iRf
	 N73lxqf5PngOw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 62B4A49FE2;
	Sun, 15 Nov 2026 08:21:28 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sun, 15 Nov 2026 08:21:29 +0000
Subject: [PATCH 2/2] media: rkvdec: Stop the VDPU383 core on timeout
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261115-rkvdec-wdt-stop-v1-2-59e687c6cc63@gmail.com>
References: <20261115-rkvdec-wdt-stop-v1-0-59e687c6cc63@gmail.com>
In-Reply-To: <20261115-rkvdec-wdt-stop-v1-0-59e687c6cc63@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alex Kazinsky <a.kazinsky@ideco.ru>, stable@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794730887; l=2992;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=igPIRoqR10XhXtRMntnOpxbLAunwjLzr9JIJfVVGwv8=;
 b=uDK7aEpPgMbGShhyHDHLQc5AGfT0UOsY5Ar/vSvRfvtp0JO7iOAsFrAIYv26VDvlfCA84Yf7c
 BNKe0CtcK23BXvO7k1DdQN0BDVFHfHaZXly0aQybwFwW5F0cxzPhAS0
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

The watchdog's RK3399 register write does not stop a VDPU383 core
either. Use the IP reset, as the Rockchip BSP does, then reprogram the
IOMMU, which the reset leaves in bypass. No reset line pulse: on RK3576
the DT lines are the BIU resets.

Compile-tested only.

Fixes: fde24907570d ("media: rkvdec: Add H264 support for the VDPU383 variant")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h   |  4 ++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.c      | 20 +++++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
index 04eb23297e37..b8ee9c4dd294 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
@@ -33,6 +33,9 @@
 #define VDPU383_LINK_DEC_ENABLE		0x40
 #define VDPU383_DEC_E_BIT		BIT(0)
 
+#define VDPU383_LINK_IP_RESET		0x044
+#define VDPU383_IP_RESET_EN		BIT(0)
+
 #define VDPU383_LINK_INT_EN		0x048
 #define VDPU383_INT_EN_IRQ		BIT(0)
 #define VDPU383_INT_EN_LINE_IRQ		BIT(1)
@@ -40,6 +43,7 @@
 #define VDPU383_LINK_STA_INT		0x04c
 #define VDPU383_STA_INT_DEC_RDY_STA	BIT(0)
 #define VDPU383_STA_INT_SOFTRESET_RDY	(BIT(10) | BIT(11))
+#define VDPU383_STA_INT_IP_RESET_RDY	BIT(11)
 #define VDPU383_STA_INT_ALL		0x3ff
 
 struct vdpu383_regs_common {
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index a8fdad2850fb..63482354bc2e 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1644,6 +1644,24 @@ static void vdpu381_stop(struct rkvdec_dev *rkvdec)
 	rkvdec_iommu_restore(rkvdec);
 }
 
+static void vdpu383_stop(struct rkvdec_dev *rkvdec)
+{
+	void __iomem *link = rkvdec->link;
+	u32 status;
+
+	writel(FIELD_PREP_WM16(VDPU383_INT_EN_IRQ | VDPU383_INT_EN_LINE_IRQ, 0),
+	       link + VDPU383_LINK_INT_EN);
+	writel(VDPU383_IP_RESET_EN, link + VDPU383_LINK_IP_RESET);
+	if (readl_poll_timeout_atomic(link + VDPU383_LINK_STA_INT, status,
+				      status & VDPU383_STA_INT_IP_RESET_RDY,
+				      1, 200))
+		dev_warn(rkvdec->dev, "IP reset failed\n");
+	writel(FIELD_PREP_WM16(VDPU383_STA_INT_ALL | VDPU383_STA_INT_SOFTRESET_RDY, 0),
+	       link + VDPU383_LINK_STA_INT);
+
+	rkvdec_iommu_restore(rkvdec);
+}
+
 static void rkvdec_watchdog_func(struct work_struct *work)
 {
 	struct rkvdec_dev *rkvdec;
@@ -1779,7 +1797,7 @@ static const struct rcb_size_info vdpu383_rcb_sizes[] = {
 
 static const struct rkvdec_variant_ops vdpu383_variant_ops = {
 	.irq_handler = vdpu383_irq_handler,
-	.stop = rk3399_stop,
+	.stop = vdpu383_stop,
 	.colmv_size = vdpu383_colmv_size,
 	.flatten_matrices = vdpu383_flatten_matrices,
 };

-- 
2.55.0




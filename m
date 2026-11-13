Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6076C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bnGzyJnb;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y6Nq7pdR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7JtHxEZ3zVjqG6N0awE0RxJCNgcaXPj43VY7SRoAxhM=; b=bnGzyJnbUIAEDxhETLZtGtRvGe
	Fr/E6zV8K+/WFr0k/4QjS1zioY96k5fGEZwreXCz/zWTAWQ+fbG4wvhQSlceFubAsC0nNkbbTHZOu
	dokZ/vMFsLKluiwfs9ADtJIJRBqt6xHOLZMq5C627OVj2ifImm2PLIUg7oSL8mroXE5Ila2M6nD6B
	SeqGQbp20aErKlGU/uxSrCin4ZrfVpgr2fyfYiTgolvpf01Lak9Exo0ckavLtsWBZ3htaZmkyjyMG
	Ot3Mp3FBpdq01uwYCazPveLHpEhYBXpPdH54Bh2m7XkKEilZMe9S4ayrLPHQcDQlxiMJBE7k81Daj
	B54kRkXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuL4-0000000DbdE-1IN4;
	Fri, 13 Nov 2026 16:41:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuKL-0000000Day4-35io;
	Fri, 13 Nov 2026 16:40:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CEC546A0F;
	Fri, 13 Nov 2026 16:40:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794588037;
	b=HR/YlWplZQVgt7hrmAQ/Vi0pNCOOAs2bxGG6s+wzsCWbVHk9csvcevXRCJiI80XB2tsK
	 N/G26M/D0wY9A5QIAzgnIsCuN2OfMz8FfiqucDwHqXx4hxQu5ycP1KPk5wFnPHWrsUTm8
	 xfM2hJZRCMa0GJBV+Mx7iqt35c5G5PMQp/ZW7T1QOq1b2zC4EnQKrAojHmE+QoQlJW9/d
	 U2tibTqJcEX57k6B0Uku2VhZ/PChv+N9+/gGRgTcQsbvxecyuYE4NOay8AmzM/qGaERJV
	 r+rDmJPjV+Q1v+fhiltvU6YOAo2dUUFmgScna4n8kTX7zNjFMmp+8PgeGSG119d/1/A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794588037;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7JtHxEZ3zVjqG6N0awE0RxJCNgcaXPj43VY7SRoAxhM=;
	b=rrz2HWremDyk2hEiJ8D9kBbgD18fhl+FZTsk4g/TLdkZ+vF1BWMEFcdTccVvjscvaTo9
	 6rOGcU0T0lD6GHXbQVXjYgC1JIimUBEAWuN4ONDwhGDLvgKIezTIAcAEIlHnU9iMRAskn
	 l3Ospx8pgQtXZgva+RGx1A5OmT899H3sZrP3oTsUufh+FJoZYR03G3c0c644vy+17FEq/
	 ih6dcU/tsD2/hmTqa90MCdunoI427lVvdgQSD7ThIlGE2Kt0XG8sMOtnXm6FuUbqf0ZoB
	 2fVFc4XQWd3S1GQkdWl28KZHyDC7gYxUwzABVtE95bdKDvfZ0fnk4V4fmk1SxnuXPag==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0CB8F1F000D4;
	Fri, 13 Nov 2026 16:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794588037;
	bh=7JtHxEZ3zVjqG6N0awE0RxJCNgcaXPj43VY7SRoAxhM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Y6Nq7pdRNwJ9vQfF+l25eyAz+QexccSqDbp+OVkC70Q/Eha2qOEc56Y4hX1u4+5kf
	 TU1mXHcMrms615PIcRZ5Z9NoB5r0/kB3SaImOxhXu4/YA/Oz+8g4vjK3F3Yhu5aOVy
	 jODtN4HlxhzS1inlr+e/S0S7rLJDTI/1iKW0xrC8uoid1bVJ6xYmqaYbr1eHt492f1
	 2LzrQqoEithLYTlygDr4HHbqRBNLY8wkN2mr2UUBrWP/jopcWYhJ4PmNyEmw5ojANf
	 XmD6sTvYniTR2wLpfTWJ/Hx84qsEm2k0ah+Z4eP6IJ2unKjD3p4RiewNu+n0ywd3SY
	 tJ5g+OPg5cdKg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6C2B9499F3;
	Fri, 13 Nov 2026 16:40:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:40:39 +0000
Subject: [PATCH v3 08/12] media: verisilicon: Acquire the reset lines only
 while using them
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-hantro-robust-v3-8-82383c722ad2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794588032; l=4115;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=DgHWOwtiMWRIc2UDuvJ7/ad5T9I1cEKGr7IVqd0TNqU=;
 b=Pz0rWgvs751W58G0yVV7YcqRJj4gbON0x2nffi0LB0drWSdsB2a4Eaucp1Zi0ySLkNlU48he/
 TL15X6x6kzMDLjiwM/Li+rp9w3k/8gxRMmY291rAq4GKtO259+bob4w
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

The RK3588 AV1 IOMMU has no reset lines of its own: it shares the four
AV1 resets with the decoder. Get them as released exclusive controls and
acquire them only around their use, so that the IOMMU driver can
deassert them too.

Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c       | 10 ++++++++--
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c  | 12 ++++++++++--
 drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c |  4 ++++
 drivers/media/platform/verisilicon/sunxi_vpu_hw.c     |  4 ++++
 4 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 9bb4d1582622..823be057e167 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1188,7 +1188,9 @@ static int hantro_probe(struct platform_device *pdev)
 			return PTR_ERR(vpu->clocks[0].clk);
 	}
 
-	vpu->resets = devm_reset_control_array_get_optional_exclusive(&pdev->dev);
+	/* Released: the IOMMU of a core can share its reset lines. */
+	vpu->resets = devm_reset_control_array_get(&pdev->dev,
+						   RESET_CONTROL_OPTIONAL_EXCLUSIVE_RELEASED);
 	if (IS_ERR(vpu->resets))
 		return PTR_ERR(vpu->resets);
 
@@ -1267,7 +1269,11 @@ static int hantro_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(vpu->dev);
 	pm_runtime_enable(vpu->dev);
 
-	ret = reset_control_deassert(vpu->resets);
+	ret = reset_control_acquire(vpu->resets);
+	if (!ret) {
+		ret = reset_control_deassert(vpu->resets);
+		reset_control_release(vpu->resets);
+	}
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to deassert resets\n");
 		goto err_pm_disable;
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 113b6977031d..f1188a6435b1 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -481,10 +481,16 @@ static void rockchip_vpu_enc_hw_reset(struct hantro_dev *vpu)
 	if (!vpu->resets)
 		return;
 
+	ret = reset_control_acquire(vpu->resets);
+	if (ret) {
+		dev_warn(vpu->dev, "Failed to acquire resets: %d\n", ret);
+		return;
+	}
+
 	ret = reset_control_assert(vpu->resets);
 	if (ret) {
 		dev_warn(vpu->dev, "Failed to assert resets: %d\n", ret);
-		return;
+		goto release;
 	}
 
 	udelay(5);
@@ -492,10 +498,12 @@ static void rockchip_vpu_enc_hw_reset(struct hantro_dev *vpu)
 	ret = reset_control_deassert(vpu->resets);
 	if (ret) {
 		dev_err(vpu->dev, "Failed to deassert resets: %d\n", ret);
-		return;
+		goto release;
 	}
 
 	hantro_iommu_restore(vpu);
+release:
+	reset_control_release(vpu->resets);
 }
 
 static void rockchip_vpu1_enc_reset(struct hantro_ctx *ctx)
diff --git a/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c b/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
index 833821120b20..a16c43bdeb24 100644
--- a/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
@@ -115,7 +115,11 @@ static void stm32mp25_venc_reset(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 
+	if (reset_control_acquire(vpu->resets))
+		return;
+
 	reset_control_reset(vpu->resets);
+	reset_control_release(vpu->resets);
 }
 
 /*
diff --git a/drivers/media/platform/verisilicon/sunxi_vpu_hw.c b/drivers/media/platform/verisilicon/sunxi_vpu_hw.c
index 02ce8b064a8f..f15ead62dc96 100644
--- a/drivers/media/platform/verisilicon/sunxi_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/sunxi_vpu_hw.c
@@ -91,7 +91,11 @@ static void sunxi_vpu_reset(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 
+	if (reset_control_acquire(vpu->resets))
+		return;
+
 	reset_control_reset(vpu->resets);
+	reset_control_release(vpu->resets);
 }
 
 static const struct hantro_codec_ops sunxi_vpu_codec_ops[] = {

-- 
2.55.0




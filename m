Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552D560A261D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kpD/rqFG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W6pUh405
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2P6KekH0hCxMm0qywIprjOxa3BV3GtGLufcAFLGvF6s=; b=kpD/rqFGUZlBxb3sX+edJFFOfU
	0GRDCPvvjF2HYLQ3rVIRt+A/7gdx2RdYpILrpgvJf8ZNQnsuDy0vd5ynJ4cif0Xg9C+XTSJG9Nata
	N6+4hQ9L09CNxJv3FAihV5R6u018+LW6LU9GuKQLAhcHZYHy4pVTJ0PwH2fZkItYAkrM1UmZ/9aEJ
	5mybRQWiYQRBwwK+XseBBN3yrtu0hu3ZNKSL5Yci2wnSZ69CwB4U2kBna8WK86kettibzRo95zX6O
	NnJAx9aeCiULlRDKTvNC7k6YUg2x3JkNuHYsY6KEtIv4UTAAotWZLxZZmTJcUgpU4AeoCBJEI8S+8
	E62HDD/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg6t-00000002oqk-0D3Z;
	Tue, 10 Nov 2026 07:17:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg6n-00000002onv-1wyQ;
	Tue, 10 Nov 2026 07:17:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 397D846A16;
	Tue, 10 Nov 2026 07:17:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295053;
	b=XXJDzX18JFcn/EdNxqdKaReAUXNoNo1HT5PI4wpw9Ijfcpc0XgmzbzKy89T2Nk/vXfQ5
	 RlYhkZv837Y0fuSMZkdVLwYhyEr5QCXrzKgZVaONp3B6dFXAJxZiiqed9yImkMUUHfi3C
	 tXpSsFeN6K0m7Mt8HkH9LpjIlVPyIQkzzC9UYYFtvLpJPaAydMtFcZ09dif9zvzBZu4O4
	 C+SENuikI/hYQZSxyxiWVyYE/txd3Se6qNhInsv+0vagsyBHhnjTKpeq/giARzpaQwTC+
	 2xovCfp9gKmZi/t8wji1rbesUX8RnoV61Wo60xzS4E1PoYZSU0sWy9U1JSfN9nY3XaQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295053;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=2P6KekH0hCxMm0qywIprjOxa3BV3GtGLufcAFLGvF6s=;
	b=ERHIeF9/xRHF51BckWyQUNl65jGocFQIhoIwvXjooJ0snY20/9bVFSTxSJbekW4NIY4b
	 XLl3BijJAlmHKkfwBfFdI0AmtNv+vrHNmJ7I1e9yMnkvKgzj++vu/djfyNJ/oWnoz+GfW
	 QBnpkQi67j2YZzrhUt7wmxDvZ3/JqTSFtoH5f7o29N09pQOfwZHwvTrOyyiy3veK4z8Rq
	 j34uMM9qsaXhV2V+ubf/VJCnN6rX8Q/TjpHf2OeCmRy/Tok9skL19d/Plusxq1EFt92o9
	 cAI7fCcUSSTX2eJCiWhtLnMEoZOd/bV9ZYwlc4Ez65JovvMpGk+l0KOKvr8RXr3GUfA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E587B1F008A2;
	Tue, 10 Nov 2026 07:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295053;
	bh=2P6KekH0hCxMm0qywIprjOxa3BV3GtGLufcAFLGvF6s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=W6pUh405mz5+hlEmzTihxFvFRKTxwklHZK/yihhyw5UYggcnlYNbG7Sjbd1lTnLgK
	 lJvwKTEmBfm/o7Gsxx5zWSYMP4C1I53S6Ms0u6oXqK49Uhh3dBcg1HwWyzqeTQAAF6
	 nXjyZSvyab5wStEZpghctMhdettgKESayR6q9zfvaR5mK7+f2cOOh3IhEoS+vPXz2D
	 ROcydxOl639oP6emvM+puiPMfybTYaiJh/kqt2Pjg0lrWey10b97D2QvYGQeYrQ7Wo
	 5aDKMJgi5bOI8F4RUSGsATFJGbhHfLjeKgzfU3z02hnk/KZSFEYhXAaV6TSRy+Duu7
	 BSWeEGASqR9Dw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 760434897A;
	Tue, 10 Nov 2026 07:17:31 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:17:32 +0000
Subject: [PATCH 2/5] media: verisilicon: Don't hold a VPU behind an IOMMU
 in reset after remove
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-hantro-robust-v1-2-6b6269c05bfa@gmail.com>
References: <20261110-hantro-robust-v1-0-6b6269c05bfa@gmail.com>
In-Reply-To: <20261110-hantro-robust-v1-0-6b6269c05bfa@gmail.com>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295050; l=3316;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=qEr5569N+FtYhMibKxk7kNNyVtrp7SmuCFMePGyeKvw=;
 b=fdUwC5bYd2lXyty1r4w2ZIv3Hhp/77nCtRCIhe5M+B4/Zo/HUAmC5ceAhRfoIxSoe8W2K9Ysz
 PH/BdhEdI5sBto3K5kUPq6O1Ylip07SvmIgPxarr29aFacY6sjgrOhA
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

On the RK3588, the resets of the AV1 decoder include the AXI and APB
bus interface resets (SRST_A_AV1_BIU, SRST_P_AV1_BIU), which also cover
the Verisilicon IOMMU of the decoder. When the driver is unbound, the
driver core runtime resumes the device and, through the runtime PM
device link, its IOMMU. hantro_remove() then asserts the resets, and
when the IOMMU autosuspends 100 ms later, vsi_iommu_suspend() writes to
its registers while they are held in reset, which raises an SError and
panics the system:

  SError Interrupt on CPU4, code 0x00000000be000411 -- SError
  Workqueue: pm pm_runtime_work
  Call trace:
   clk_disable+0x30/0x90 (P)
   clk_bulk_disable+0x44/0x90
   vsi_iommu_suspend+0x4c/0xc8 [vsi_iommu]
   pm_generic_runtime_suspend+0x38/0x80
   genpd_runtime_suspend+0xc4/0x348
   ...
  Kernel panic - not syncing: Asynchronous SError Interrupt

This was hit when reloading the module, unless the decoder happened to
be probed again within the autosuspend delay of its IOMMU.

The IOMMU outlives the VPU driver, so leave the resets of a VPU that is
behind an IOMMU deasserted on remove and on the probe error path. VPUs
without an IOMMU are still put into reset.

Fixes: ea71631b7129 ("media: hantro: add support for reset lines")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 26e5d5547466..702d878c7b50 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1069,6 +1069,22 @@ static struct v4l2_m2m_dev *hantro_get_v4l2_m2m_dev(struct hantro_dev *vpu)
 	return v4l2_m2m_init(&vpu_m2m_ops);
 }
 
+/*
+ * The resets may also cover the bus interface that the IOMMU of the VPU is
+ * accessed through, e.g. on the RK3588 AV1 decoder. The IOMMU is a separate
+ * device which is runtime resumed with the VPU while it is unbound, and
+ * accesses its registers again when it runtime suspends afterwards. Holding
+ * the VPU in reset at that point causes an asynchronous external abort, so
+ * leave the resets deasserted for a VPU behind an IOMMU.
+ */
+static void hantro_reset_assert(struct hantro_dev *vpu)
+{
+	if (device_iommu_mapped(vpu->dev))
+		return;
+
+	reset_control_assert(vpu->resets);
+}
+
 static int hantro_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
@@ -1267,7 +1283,7 @@ static int hantro_probe(struct platform_device *pdev)
 err_pm_disable_assert_reset:
 	pm_runtime_dont_use_autosuspend(vpu->dev);
 	pm_runtime_disable(vpu->dev);
-	reset_control_assert(vpu->resets);
+	hantro_reset_assert(vpu);
 	return ret;
 err_pm_disable:
 	pm_runtime_dont_use_autosuspend(vpu->dev);
@@ -1290,7 +1306,7 @@ static void hantro_remove(struct platform_device *pdev)
 	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
 	pm_runtime_dont_use_autosuspend(vpu->dev);
 	pm_runtime_disable(vpu->dev);
-	reset_control_assert(vpu->resets);
+	hantro_reset_assert(vpu);
 }
 
 static int hantro_runtime_resume(struct device *dev)

-- 
2.55.0




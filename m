Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC74606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dg/W7jLZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iOdpoGbC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IIcORSMCHHPaaM/EomqXjuMSf3vKl+5Nk3vSHMLuEVI=; b=dg/W7jLZmB4K6QQhCie5hI/71L
	bYGh+r4HWx4pq/r/L1YkTjPn0f6sTqqFBxTV7ZTOOqeqlfPLgzo0b45qiSTrakHmSQmd3jcW9yLc8
	h8MObRc76x/1rCus+dDX+X/y4DjCfK0mqPxVf8n2iWecNTSlZJS+dFooGN13M8pG8Ma0rPuAN7mCL
	PHDlIY3IfKOwXaa4ZyWfmiVu5Ixsq2I8DNkjlN1rWGljJ6fTjt9naUraNcTCnynSUpy1yatR3TpoV
	1N6Ek3xFoPGjByOvFJ0JRdTXHjEKx3nZTdDCqu1ZgXGjoMmU0P3mlETSoHuy4qF60K0vPUNaLUqN5
	hdznSOag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuKs-0000000DbMQ-47DJ;
	Fri, 13 Nov 2026 16:41:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuKJ-0000000DawF-2ktZ;
	Fri, 13 Nov 2026 16:40:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DF6362930;
	Fri, 13 Nov 2026 16:40:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794588034;
	b=l37SEBs+uLM29R5ut4AZ7y2KIjgKzKOm+roY9W4tFmcNVBm33Q725RjsovO52mXYo3er
	 9E2S6vitYhxZUT97zxnusU2vFgyOVoif9Q7SUEaxpBzG+1RzM25oEV3UQ6mDCSyGyOyLs
	 ixWa8Aeny6h6AR2S/TxDINGFJHvWF1HnUMji3oE8LwMtmIH5Qq4nczdKOVBiUfF5mdvEy
	 AZJ4WIDdcOk2GD7VB90G6Y3ryJOiG0Va19YtQcit5bpARAGfqJ+IGeOPV1zPcB/1HNatf
	 cRghXsWubc1wvrYmYFrUYahPQsnW33cxHNPbrqru7nFnPPWQFN0jogwFaTJGm4BudwQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794588034;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=IIcORSMCHHPaaM/EomqXjuMSf3vKl+5Nk3vSHMLuEVI=;
	b=Aq0UCJTIaIZmwxYlD5w3waH8KPIOooqAZlwYFl2mRyMbstn8VSRp0/VRyj5oQSnub7O2
	 gHs4MrN+EAAtVtBKr8HyxI73hxiVXsX2E/S9ppcMO7U4ORqwF2/MOK1hO6oz377++ViT7
	 D0e6FAUU61duGBLIHcmBYX/Be5gFIz7tUepKtu3Svj/AWBWr8lKm1SXcIFTfk8KsT+meM
	 KKhkME++JP1xJO6sc3Q8/dYbfD/7oC2Zg79zUMF2NfXACiLHmBN02YqtKkEutdfgBPWCO
	 IvwzWAtWlOdvGALyLimzvbpK9lcbnPJA0DWoUPVXSDTOAPVs4DaaNVb0VtPoZ0xqoHg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 747661F000C9;
	Fri, 13 Nov 2026 16:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794588034;
	bh=IIcORSMCHHPaaM/EomqXjuMSf3vKl+5Nk3vSHMLuEVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=iOdpoGbCGEiHaRmCdZAjmnLFzoWobWqj1FPsRaz7zfHFEukg28xV3hnXu2hOXBc0g
	 3AqdC7mL5J4lqb2uCjIvN7C5IjBrVcofyCTPNteQU8h2cx4RR8MNdoKYsWw4pas29t
	 JpYgWvvl30BodLDlUtafWcKeTJGJ2yStB0V6I/oetRlEeWiqxyX9LHqvlyq9UE2gyO
	 izDnP9OorjV40GR+TACFupdPJdvjhZjga3b05EcxOX9WayW20TebZwKlOvWXw+vnZ/
	 bPxuc32Ba/Xl/fEX5MIigMmVY3Ab/fjTGvq6olr3FmAHPXDA350PL71YI8i9cAvaQ+
	 2tCKPRIHd37xQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0541A499E3;
	Fri, 13 Nov 2026 16:40:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:40:35 +0000
Subject: [PATCH v3 04/12] media: verisilicon: Don't hold the VPU in reset
 after remove
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-hantro-robust-v3-4-82383c722ad2@gmail.com>
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
 Arun Iyengar <aiyengar1990@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794588032; l=3070;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=423gUTaQDvX29zH2dozaJwYSRoYQI88efAs7A7ebRKw=;
 b=tK9mQBxdWRV/qXhq69U7Id832ZFNjel5ug1ZPyHSDNSzD1jaelBWFjauAfPUIZdm2DvMYlri7
 cZ8ygCe4PpQA6cWZfiuh03rbalK2SrvLh5ZOzcYkXnSeUwuBSY/boA6
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

Hit when reloading the module.

Commit 8e26d4c20ed2 ("media: hantro: disable runtime PM before hardware
teardown") moved the assert after the runtime PM teardown because
powering the domain off faulted on it. With the resets left asserted,
the domain is still powered on for the next bind, and off after a
failed probe, in that state.

A runtime suspended VPU has its resets deasserted and its clocks off.
Leave it in that state on remove and on the probe error path instead of
asserting the resets.

Fixes: ea71631b7129 ("media: hantro: add support for reset lines")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 42822b2b376c..daec9f1ea968 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1214,7 +1214,7 @@ static int hantro_probe(struct platform_device *pdev)
 	ret = clk_bulk_prepare(vpu->variant->num_clocks, vpu->clocks);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to prepare clocks\n");
-		goto err_pm_disable_assert_reset;
+		goto err_pm_disable;
 	}
 
 	ret = v4l2_device_register(&pdev->dev, &vpu->v4l2_dev);
@@ -1268,11 +1268,6 @@ static int hantro_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&vpu->v4l2_dev);
 err_clk_unprepare:
 	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
-err_pm_disable_assert_reset:
-	pm_runtime_dont_use_autosuspend(vpu->dev);
-	pm_runtime_disable(vpu->dev);
-	reset_control_assert(vpu->resets);
-	return ret;
 err_pm_disable:
 	pm_runtime_dont_use_autosuspend(vpu->dev);
 	pm_runtime_disable(vpu->dev);
@@ -1294,7 +1289,6 @@ static void hantro_remove(struct platform_device *pdev)
 	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
 	pm_runtime_dont_use_autosuspend(vpu->dev);
 	pm_runtime_disable(vpu->dev);
-	reset_control_assert(vpu->resets);
 }
 
 static int hantro_runtime_resume(struct device *dev)

-- 
2.55.0




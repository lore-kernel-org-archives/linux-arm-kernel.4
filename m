Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6FE606A891
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 22:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CWs1uriM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E291gQyL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U8LstPPrHCW3ctEClTfo7NSAD6yF6+iQLjvIIR3H+/Q=; b=CWs1uriM2g9nUaLut+3yefVlY6
	1uShrSqf2FqNqip5qK0pJEFIhyN19G0sdtM7Nv4Xaj40i+hL87/LrzrNmu3URav/NWKBL6M2G7pvS
	yf0nG7DwQhnKhEqJjtPhdWLMUVaRYcjqa826wRTfiT0dHmLek9XhcI2mkNz5oEx7zPTAd6KEGrOBQ
	OmEXLVAuxoPxSYoXwInAjNMhi3DNKwM9m8+FcFHMiJGpbMvjAgc6UO3GW9y7OfDf5Br1x2A5QNB8m
	II57AQHHp7g6fyvJ7L4m+EhpekLMRvsvEffX6oGw6Jd9ExAZ67VNfWJKVcra8ASPfuqBOBL+9t56q
	F5fbvtKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzeV-0000000Eg24-26r0;
	Fri, 13 Nov 2026 22:21:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzeL-0000000EfwM-0HLA;
	Fri, 13 Nov 2026 22:21:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 362DB62910;
	Fri, 13 Nov 2026 22:21:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794608495;
	b=TL1/vAUYG2ExfX5S9RYJW//jRYC4g+v7s705qhJEVNRNef3QqiltRHq4Z3A9X+ml3FT3
	 YA6NUsK3taFPB90Saurr+9AxCnUHFvp1Si32dHHETNJG1DvX2ihc5RUl2zL/1YHbEcd8D
	 Cdjxj/f4kpf+vfuQMTHxWe5RbDCOQjcTx+o19kfNbXOm1PtT5OuHTNp5UhBy3CmiV2YXi
	 Zhds9ZJM5I06eyU3q3r2QCwyIvCTMyzJsCTJ7enlgg1zWakjf/QfT88zUKfpwy3nRbSUX
	 tWacJ/2l85/RMsARgDyTi5lrm7KpLDOLMrwe2IfM4F3ZtWHEUkpicfl4Jiyq+IbHtdA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794608495;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=U8LstPPrHCW3ctEClTfo7NSAD6yF6+iQLjvIIR3H+/Q=;
	b=2ucIC5o7ifZuTxzUyDTZ6QprxgFOGcGI77mnF9NtFRVFNbnewFZfQ1pvkQ8zzRX5d6zQ
	 LX30Q8U28kt/qJn0CmYkyYuTEz4UpwgLMFa/VxVYJNCtge/kNnfMR/MulBQnX7m3lCMwi
	 b9KNoe71OHSOg3/6YNm8tdoXsCeI9WrSJ+NIaZZkyZnbQOfNE7VQkZBDzRxuqzG4BXH+L
	 0MeRMKsrjDKB5Q8akgNkwKnF86RR5w7tjYO9zSdM+CItnngOxJ5ITit+7Le1D+/i76gAa
	 3SxvEp0J4M3zahdjsv892vchhtvxLnSFz4eEkzU8ey87sBM60EV7lsH8eT3BTvWy6NQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E726F1F000C5;
	Fri, 13 Nov 2026 22:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794608495;
	bh=U8LstPPrHCW3ctEClTfo7NSAD6yF6+iQLjvIIR3H+/Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=E291gQyLy6PootibV+pUePNMnGhLV9TOYkcA43DvtOQ1RHgTWi4Oo02R0DX6gT52A
	 VOdZ6hK0rV3rTgoBBt5EMzupdYfWiaN6KELLaYt8zhFgEOPhSUCMFXFrxZ91sEydLd
	 SbWJFC37KbkhlE/hj72I9OLVr6HXZIvX4N3vadik+EB46QAQ3ybNjH5SQYk02FKOc8
	 V/7k2zQQbqnCEdJhYYzxAFEPMhjy84PvPVWEzVFv9jESbNgVO6DywoHvRMY8/54MdE
	 kGnnMgKlVI47gjTrtO1tPumrqw5I2c6FNRsBeuJQotZPeqI3RRL8SBtU7o40c8/O/b
	 pDELIA3d4+TlQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4267349B22;
	Fri, 13 Nov 2026 22:21:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 22:21:32 +0000
Subject: [PATCH RFC 1/3] media: verisilicon: Split probe into hardware init
 and device registration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-hantro-multicore-v1-1-43811eea14c4@gmail.com>
References: <20261113-hantro-multicore-v1-0-43811eea14c4@gmail.com>
In-Reply-To: <20261113-hantro-multicore-v1-0-43811eea14c4@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Sergei Khomenkov <shomenkow@gmail.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794608492; l=7068;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=w6qJkiLCLbyhDjp75hGrho7FBAJ1tiuNlQsSG9pOWtI=;
 b=rYwXShfgTY/VH8fB0R1BuB/+cbigqnJMUZkaZ08g0Lt7UmROosTg5UQ5qv9WHrKpHlgc1OvVi
 4DBeO39m2FmDCrGxq6OvY0bSM6zP6dZFqUppTlbzJ+NfgdDX1Cdjmt3
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

Move the acquisition of the per-instance hardware resources (clocks,
resets, registers, interrupts, runtime PM) out of hantro_probe() into
hantro_hw_init()/hantro_hw_cleanup(), and the creation of the mem2mem,
video and media devices into hantro_register_devices() and
hantro_unregister_devices().

This prepares for multi-core support, where every core needs its
hardware set up, but only the main core registers the devices exposed to
userspace, and only once all cores are known.

No functional change intended.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 158 +++++++++++++++---------
 1 file changed, 101 insertions(+), 57 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 26e5d5547466..d02988fc19ae 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1069,38 +1069,16 @@ static struct v4l2_m2m_dev *hantro_get_v4l2_m2m_dev(struct hantro_dev *vpu)
 	return v4l2_m2m_init(&vpu_m2m_ops);
 }
 
-static int hantro_probe(struct platform_device *pdev)
+/*
+ * Acquire and initialize the hardware resources of one VPU instance:
+ * clocks, resets, registers, interrupts and runtime PM.
+ */
+static int hantro_hw_init(struct hantro_dev *vpu)
 {
-	const struct of_device_id *match;
-	struct hantro_dev *vpu;
+	struct platform_device *pdev = vpu->pdev;
 	int num_bases;
 	int i, ret;
 
-	vpu = devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);
-	if (!vpu)
-		return -ENOMEM;
-
-	vpu->dev = &pdev->dev;
-	vpu->pdev = pdev;
-	mutex_init(&vpu->vpu_mutex);
-	spin_lock_init(&vpu->irqlock);
-
-	match = of_match_node(of_hantro_match, pdev->dev.of_node);
-	vpu->variant = match->data;
-
-	ret = hantro_disable_multicore(vpu);
-	if (ret)
-		return ret;
-
-	/*
-	 * Support for nxp,imx8mq-vpu is kept for backwards compatibility
-	 * but it's deprecated. Please update your DTS file to use
-	 * nxp,imx8mq-vpu-g1 or nxp,imx8mq-vpu-g2 instead.
-	 */
-	if (of_device_is_compatible(pdev->dev.of_node, "nxp,imx8mq-vpu"))
-		dev_warn(&pdev->dev, "%s compatible is deprecated\n",
-			 match->compatible);
-
 	INIT_DELAYED_WORK(&vpu->watchdog_work, hantro_watchdog);
 
 	vpu->clocks = devm_kcalloc(&pdev->dev, vpu->variant->num_clocks,
@@ -1213,18 +1191,39 @@ static int hantro_probe(struct platform_device *pdev)
 		goto err_pm_disable_assert_reset;
 	}
 
-	ret = v4l2_device_register(&pdev->dev, &vpu->v4l2_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register v4l2 device\n");
-		goto err_clk_unprepare;
-	}
-	platform_set_drvdata(pdev, vpu);
+	return 0;
+
+err_pm_disable_assert_reset:
+	pm_runtime_dont_use_autosuspend(vpu->dev);
+	pm_runtime_disable(vpu->dev);
+	reset_control_assert(vpu->resets);
+	return ret;
+err_pm_disable:
+	pm_runtime_dont_use_autosuspend(vpu->dev);
+	pm_runtime_disable(vpu->dev);
+	return ret;
+}
+
+static void hantro_hw_cleanup(struct hantro_dev *vpu)
+{
+	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
+	pm_runtime_dont_use_autosuspend(vpu->dev);
+	pm_runtime_disable(vpu->dev);
+	reset_control_assert(vpu->resets);
+}
+
+/*
+ * Create the mem2mem device and register the video and media devices that
+ * expose the VPU to userspace. The v4l2_device must already be registered.
+ */
+static int hantro_register_devices(struct hantro_dev *vpu)
+{
+	int ret;
 
 	vpu->m2m_dev = hantro_get_v4l2_m2m_dev(vpu);
 	if (IS_ERR(vpu->m2m_dev)) {
 		v4l2_err(&vpu->v4l2_dev, "Failed to init mem2mem device\n");
-		ret = PTR_ERR(vpu->m2m_dev);
-		goto err_v4l2_unreg;
+		return PTR_ERR(vpu->m2m_dev);
 	}
 
 	vpu->mdev.dev = vpu->dev;
@@ -1235,13 +1234,13 @@ static int hantro_probe(struct platform_device *pdev)
 
 	ret = hantro_add_enc_func(vpu);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to register encoder\n");
+		dev_err(vpu->dev, "Failed to register encoder\n");
 		goto err_m2m_rel;
 	}
 
 	ret = hantro_add_dec_func(vpu);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to register decoder\n");
+		dev_err(vpu->dev, "Failed to register decoder\n");
 		goto err_rm_enc_func;
 	}
 
@@ -1260,18 +1259,70 @@ static int hantro_probe(struct platform_device *pdev)
 err_m2m_rel:
 	media_device_cleanup(&vpu->mdev);
 	v4l2_m2m_put(vpu->m2m_dev);
+	return ret;
+}
+
+static void hantro_unregister_devices(struct hantro_dev *vpu)
+{
+	media_device_unregister(&vpu->mdev);
+	hantro_remove_dec_func(vpu);
+	hantro_remove_enc_func(vpu);
+	media_device_cleanup(&vpu->mdev);
+	v4l2_m2m_put(vpu->m2m_dev);
+}
+
+static int hantro_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *match;
+	struct hantro_dev *vpu;
+	int ret;
+
+	vpu = devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);
+	if (!vpu)
+		return -ENOMEM;
+
+	vpu->dev = &pdev->dev;
+	vpu->pdev = pdev;
+	mutex_init(&vpu->vpu_mutex);
+	spin_lock_init(&vpu->irqlock);
+
+	match = of_match_node(of_hantro_match, pdev->dev.of_node);
+	vpu->variant = match->data;
+
+	ret = hantro_disable_multicore(vpu);
+	if (ret)
+		return ret;
+
+	/*
+	 * Support for nxp,imx8mq-vpu is kept for backwards compatibility
+	 * but it's deprecated. Please update your DTS file to use
+	 * nxp,imx8mq-vpu-g1 or nxp,imx8mq-vpu-g2 instead.
+	 */
+	if (of_device_is_compatible(pdev->dev.of_node, "nxp,imx8mq-vpu"))
+		dev_warn(&pdev->dev, "%s compatible is deprecated\n",
+			 match->compatible);
+
+	ret = hantro_hw_init(vpu);
+	if (ret)
+		return ret;
+
+	ret = v4l2_device_register(&pdev->dev, &vpu->v4l2_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register v4l2 device\n");
+		goto err_hw_cleanup;
+	}
+	platform_set_drvdata(pdev, vpu);
+
+	ret = hantro_register_devices(vpu);
+	if (ret)
+		goto err_v4l2_unreg;
+
+	return 0;
+
 err_v4l2_unreg:
 	v4l2_device_unregister(&vpu->v4l2_dev);
-err_clk_unprepare:
-	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
-err_pm_disable_assert_reset:
-	pm_runtime_dont_use_autosuspend(vpu->dev);
-	pm_runtime_disable(vpu->dev);
-	reset_control_assert(vpu->resets);
-	return ret;
-err_pm_disable:
-	pm_runtime_dont_use_autosuspend(vpu->dev);
-	pm_runtime_disable(vpu->dev);
+err_hw_cleanup:
+	hantro_hw_cleanup(vpu);
 	return ret;
 }
 
@@ -1281,16 +1332,9 @@ static void hantro_remove(struct platform_device *pdev)
 
 	v4l2_info(&vpu->v4l2_dev, "Removing %s\n", pdev->name);
 
-	media_device_unregister(&vpu->mdev);
-	hantro_remove_dec_func(vpu);
-	hantro_remove_enc_func(vpu);
-	media_device_cleanup(&vpu->mdev);
-	v4l2_m2m_put(vpu->m2m_dev);
+	hantro_unregister_devices(vpu);
 	v4l2_device_unregister(&vpu->v4l2_dev);
-	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
-	pm_runtime_dont_use_autosuspend(vpu->dev);
-	pm_runtime_disable(vpu->dev);
-	reset_control_assert(vpu->resets);
+	hantro_hw_cleanup(vpu);
 }
 
 static int hantro_runtime_resume(struct device *dev)

-- 
2.55.0




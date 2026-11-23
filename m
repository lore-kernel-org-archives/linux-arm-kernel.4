Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199C9606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 01:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3Y0ccgy9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VXz0/ij6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4B36WbMifke7+O2AJIQ+hm2Rk03uKtR2vzfH5UQsqfg=; b=3Y0ccgy92Hicy4
	BWDmTadlNR+8PRS2CzedVyviy5p+G8NrJIO3CyKjGprPFIQHpy7KboJj3T/SBgxfgim7Stg8AW76w
	nws5m9X3P1kw3OCng4UjLyvLuyMMgVfDLekG+36abJ99aYJ46E/XHoLTin5fWa9u9ljHmi+JkHgcw
	Fkywm2unRsReRk93ImlvDVIh9yacTjao+nomTOBBO+jCvq57wXlqmAt2nFtmeTTV1UnA31yieUuVT
	S62O+L1plooUQWBvdF9e0ctyOnobr1KjYwIhZtD+nchgQUXrWO2ecLNPMYd8MkK+1uCMBYQNcSZ3P
	8IVBTky5n6eoXh46vPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIgf-0000000244O-0J9z;
	Mon, 23 Nov 2026 01:17:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIgd-0000000243f-3Dc7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 01:17:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C04E4425F;
	Mon, 23 Nov 2026 01:17:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795396659;
	b=b/VvX1KUEugZVjTe1n3JiHC7O78Avsn8WjdHgSyiI2jYjw4VFAG9pZr9hn5T6wOQgOT1
	 +PyGOgd7PoffFC4nOS5ysYCSISi/hYPuVSqPM95mRSodqHEuVXabWN1JEh6snVcoKGEh9
	 E8qfv27x7/f7qvZrAIH9/Rl1CK8aNpPyyj0bH60Bpj/gb+H4KaDTob9zpC7DwRcmqczO7
	 eoERR+Ce7QavnopY12VRNT4W/QLKBPxWQjuECyOckKyzz8DRiK0ZE5UnJp/xVlKvJcCq5
	 qavP6Sd7oIcVpq9u3+wXlfQXwLGy4y7x2suZtDPkG45jcCd5Yo132x3GviRBqCWoQYg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795396659;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=4B36WbMifke7+O2AJIQ+hm2Rk03uKtR2vzfH5UQsqfg=;
	b=xOVWOGP2Ed5OUUr1WZHHP/Rh20JNr/sZeLpmvm6lxXxHPjJ9Wvo0yWuk3J8ySYaoeQnw
	 U0Lqkjd2mirtq3o7lwpnKHElx7AUj8p+6jT3oX84ZuSwZtIrUHor0wTmHfGaGUvCaLNdo
	 m0wwZ2vOOzQ+5bNDnWGrbEE4L9YE4XLu1VIpvBuXPS3OS+bbhI6obOdcNo8S5kA1wl2kA
	 Rc37wR+X606GFSjsbMZVNy+vXHSK7CAEzzD4s01ngx8pYZFeCExTo8Qrd7VSUtx9TXZ6E
	 NYWIBHzjKpm7dYdD3iooETPTUjKaq+/tYnL1EvrVxeHJ9TM3no7K1fxTKTR0XqmaNDA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 90DC71F000C4;
	Mon, 23 Nov 2026 01:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795396659;
	bh=4B36WbMifke7+O2AJIQ+hm2Rk03uKtR2vzfH5UQsqfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VXz0/ij6zrNgfGTuKKVRNSVAZqB75F4iuEcPh6yc+SpHJg9ANTqwKFvMFgfI1paQo
	 +C6UiM20Ick79CyJl9O6zmNGBRuHQ1x92laGk666FI6oGJfqgDBbwQuVRmdqpy4rNt
	 rv86eQbwj7E0J5KsxaUHEMjni4OsID26m5NKngeHjqXm4BLrBjB0yhVXG7iwEXyd/J
	 7+gCVSoW4GeNh0F24fnFtAiBIKxLlMHn3bGzB2zQ7NidVKuNLEpXVAAqwjzEh+e2Ku
	 Zn3TvpJ3SL/7iWEFY1BqsQzX5OySIuvuVL/B47ksQElmUl4MxepKFSVeoKZ0EnsSmS
	 X+awfoX1SF5jg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1211D4C2A1;
	Mon, 23 Nov 2026 01:17:38 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 01:17:37 +0000
Subject: [PATCH v2 1/2] dmaengine: at_xdmac: Kill the channel tasklets
 before unregistering
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-dma-chancnt-v2-1-241b1672883e@gmail.com>
References: <20261123-dma-chancnt-v2-0-241b1672883e@gmail.com>
In-Reply-To: <20261123-dma-chancnt-v2-0-241b1672883e@gmail.com>
To: ludovic.desroches@microchip.com, vkoul@kernel.org
Cc: Frank.Li@kernel.org, dave.jiang@intel.com, linux-kernel@vger.kernel.org, 
 andriy.shevchenko@linux.intel.com, dmaengine@vger.kernel.org, 
 allen.lkml@gmail.com, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795396657; l=2983;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=37CrXOmHngl8hduNk3ISIljXPc21J8blRcQ8FE7hl2Y=;
 b=xRJ6Jxg/MhAl8yKoKVPpMjDP/LVLwP5ZpBd/diE5bv3dkjKDbpzQCVIlWfz7HhwBjyX63FBkB
 /MZbutFOEfxCVN5Mx/JaIOV72KLvp6HbenUm+7kfvvRMGTQwAVNw7pH
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: shyckless@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Suyuan Wang <stevewong@hust.edu.cn>

at_xdmac_remove() unregisters the DMA device and disables the clock,
and only then frees the IRQ and kills the channel tasklets in a loop
over dma.chancnt:

	dma_async_device_unregister(&atxdmac->dma);
	...
	clk_disable_unprepare(atxdmac->clk);

	free_irq(atxdmac->irq, atxdmac);

	for (i = 0; i < atxdmac->dma.chancnt; i++) {
		...
		tasklet_kill(&atchan->tasklet);
		at_xdmac_free_chan_resources(&atchan->chan);
	}

Since commit e81274cd6b52 ("dmaengine: add support to dynamic
register/unregister of channels"), dma_async_device_unregister()
unregisters each channel and decrements dma.chancnt for it, so the
loop does nothing and a tasklet scheduled by an interrupt can run after
the devm-allocated atxdmac has been freed. Even when the loop ran,
tasklet_kill() let a pending tasklet run after the channel devices
were freed and the clock was disabled, and the tasklet reads the
channel registers and logs through the channel device.

Free the IRQ, kill the tasklets and free the channel resources right
after at_xdmac_off(), before the channels are unregistered and the
clock is disabled.

Found with a static analysis tool and checked by hand.

Fixes: e1f7c9eee707 ("dmaengine: at_xdmac: creation of the atmel eXtended DMA Controller driver")
Fixes: e81274cd6b52 ("dmaengine: add support to dynamic register/unregister of channels")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
 drivers/dma/at_xdmac.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index ef0dfe9d37ba..d5d60f3d3543 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -2439,21 +2439,26 @@ static void at_xdmac_remove(struct platform_device *pdev)
 	int		i;
 
 	at_xdmac_off(atxdmac, true);
-	of_dma_controller_free(pdev->dev.of_node);
-	dma_async_device_unregister(&atxdmac->dma);
-	pm_runtime_disable(atxdmac->dev);
-	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	clk_disable_unprepare(atxdmac->clk);
-
 	free_irq(atxdmac->irq, atxdmac);
 
+	/*
+	 * Do this before dma_async_device_unregister(): it frees the channel
+	 * devices and decrements dma.chancnt, and the tasklets also need the
+	 * clock.
+	 */
 	for (i = 0; i < atxdmac->dma.chancnt; i++) {
 		struct at_xdmac_chan *atchan = &atxdmac->chan[i];
 
 		tasklet_kill(&atchan->tasklet);
 		at_xdmac_free_chan_resources(&atchan->chan);
 	}
+
+	of_dma_controller_free(pdev->dev.of_node);
+	dma_async_device_unregister(&atxdmac->dma);
+	pm_runtime_disable(atxdmac->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	clk_disable_unprepare(atxdmac->clk);
 }
 
 static const struct dev_pm_ops __maybe_unused atmel_xdmac_dev_pm_ops = {

-- 
2.34.1




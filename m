Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547AF606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 08:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U3mNEQsB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B4pcMMA4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=78oIkokJZirdbrk9ibRh931gBhzKbqHoRYpE62Jld9U=; b=U3mNEQsBsLf3aJfX4WXDjTqU3e
	gkdNMIP1bKNyvWqDRohm5jsJhlKslFXoXkCwZXTWysHN3QIzgzd0KU3Fp7pL3/fXtb92mK4GaROHn
	oR72pl6NaheP/pKOHKtdaafCIitPcSo3DsZ+bBGcqU2moYGEv7g4vD9tk7F2Gwicymt5Qqo6LVpXv
	dKQtPhlWgQwgzPlQ7oSUu5g4LN4lZAgnFkskOSXYvaJv869cplCdZ6T0Pub4awmSvg3XDR8maTzSY
	72GEgDUHrvXPsi03hcfzKYBonMegLpXvFQq3jv0UYySQL1iwRF/JyZuDvbNg/BG+2vITRl+AcPlpg
	28jm6vrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsKt-00000001eOp-1U93;
	Mon, 16 Nov 2026 08:45:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsKs-00000001eO2-0CBJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 08:45:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D567B6126A;
	Mon, 16 Nov 2026 08:45:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794818708;
	b=yw+ctRDtUPXtaLb0/SPqvwx3UUgEXrslQ7cyP0wmtWdAcFbOv4qTmqtRVSLNwe7k4xBn
	 JXAJPdjOTk6ZNT5GIxw7lr+v1jFlg28JnP/v/r1RaI7G5ilsUa7GeucbQW7f9VE6EBpwY
	 VIuNwtFHKdl4hzA9ZSUU9bC6MbnVI1itnNfpC4iGr3Kg6Wc4nhE5eYBb4LOC54lHBllWw
	 olK9QSSNs3VnZ/3KfCrUxG7LhQVIMoHhG/C+UqpLY4hifsi0R5NEq/hwguq9YI/bEmTjd
	 it2DQ8Nc/cvlDJ3GICm2nOn9SnbdyGPtzr/ZOVn3p035aHtNmcexTkb43lJDPOlOlgA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794818708;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=78oIkokJZirdbrk9ibRh931gBhzKbqHoRYpE62Jld9U=;
	b=uo3lO7OS9lnp3fwMgrkSbs3xWLa+7MdnBy4Ac32bwLwv8D7WVh/tioEtUcHeaQttYVou
	 F1F3cm8FPADVEbyxz2x/1M3KgA0zCmTltD8NDLr+wIgQRm6tl64vLWngN8rwC8D06zO7v
	 RLFV3bCmQMwrMGtl+1i6SvWeiqqJTXamgLAFjwUNIbBpej3rpe8rnV0PLSBgiiTahmnCU
	 AHNZdA7Pd7fMJd6d3nR0yvxKwVYKpIAG+iXVH9kDEjt/Wqf/oDzM8RLtjOQLTtqvNE0IM
	 r72hAYZYy/Lg2DhXK7CeDZbAhZUPtfKeFZOr10oc4CGVSAnA/wH7cDvFEr9pCaJUwwg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A9D91F000C6;
	Mon, 16 Nov 2026 08:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794818708;
	bh=78oIkokJZirdbrk9ibRh931gBhzKbqHoRYpE62Jld9U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=B4pcMMA4BJqIPjhjMnjzKs0EdRb6/d2cskScb/0ONtBSX8ZDRpMighL8FX0/JImPB
	 cherqBXTxCrDKoZxksNTCFsxd3wtItrFSwVLEbbvTnldSt3K9T1CNixhZ9C0ErV1Bd
	 RTJMiWqeO3yZCgsQPaiNujziQcbf8S1YULiqYJU9oTzOB2OfBXtmKoFdIVuVBcH8md
	 W1LzuPR9dhAUdw72Rh6Gs/29KhIQxD1IAUhGTnkCqrbO9VO1A0najE7IcO8xbOskQ1
	 xBun5Zu+c56rZz7PksugmM0rfdhdxVMizNglaxbo4r+HWlrLaAlEHTO9TOalAnqeZB
	 yfenFN24Z04dg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 896204A3E2;
	Mon, 16 Nov 2026 08:45:07 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Mon, 16 Nov 2026 08:45:08 +0000
Subject: [PATCH v2 2/2] clk: sunxi-ng: h616: Register GPU PLL notifier
 before mux notifier
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261116-h616-pll-output-gate-v2-2-a418026ffae6@gmail.com>
References: <20261116-h616-pll-output-gate-v2-0-a418026ffae6@gmail.com>
In-Reply-To: <20261116-h616-pll-output-gate-v2-0-a418026ffae6@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Philippe Simons <simons.philippe@gmail.com>, 
 Ilya Titov <ilya.titov@wirenboard.com>, linux-clk@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794818707; l=1471;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=QL/weaZ6VGxEBkGAwe9yYKN6VnO0kkiDcNvaqnoXQSE=;
 b=77W17WrT9nFCzC+g6lJHQ5hR7OvFqbPOm6VA8sd65vxexQQJGeaCX4IXRt/PSOBZ0yJZ8Jt5Q
 ZJfHeM/omhGBwPsMy926W+02bT/vUWgreFPRf7oIuJYzzYK6vuEvh8w
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

Register the GPU PLL notifier first, so the GPU goes back to the PLL
only after it has re-locked, as required by commit 02ae2bc6febd
("clk: sunxi-ng: Add clk notifier to gate then ungate PLL clocks").
Commit 0ec5e7572ddc ("clk: sunxi-ng: h616: register CPU PLL notifier
before mux notifier") did this for the CPU.

Fixes: eb963d7948ce ("clk: sunxi-ng: h616: Reparent GPU clock during frequency changes")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 4037c5f022a8..8f53605eaafa 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -1254,13 +1254,16 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
 				  &sun50i_h616_cpu_nb);
 
+	/*
+	 * Re-lock the GPU PLL after any rate changes. Must be registered
+	 * before the mux notifier, so GPU goes back to a locked PLL.
+	 */
+	ccu_pll_notifier_register(&sun50i_h616_pll_gpu_nb);
+
 	/* Reparent GPU during GPU PLL rate changes */
 	ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
 				  &sun50i_h616_gpu_nb);
 
-	/* Re-lock the GPU PLL after any rate changes */
-	ccu_pll_notifier_register(&sun50i_h616_pll_gpu_nb);
-
 	return 0;
 }
 

-- 
2.55.0




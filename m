Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD3F606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XFMh+MEY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V3fTkIeY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Eirx/uCHYo84G24R6PBVAV1asTOmor2BurhkMEaTGv0=; b=XFMh+MEYU6r8uc77Chtmq6uStN
	pM/FW1bzLiz0psVwjqYVI7Hs1zl6pMyNMoOtqfnDZK1wjVXnj+wrK61hT7JhKODp3NWFSkjoX7PVx
	j749DNIQYQKVOoSNQ3a0tn+ht8h2GRuiA0+yk6m9WOwIrdl9wxt82MYeutVeHOWM1XbWv9vwxxiXO
	kIAh1A/KqWH+GJ0lZVYzDhvGmPdbpgJLMmkeO5UH2o6WPwlkCjMJSzIrOSj1c6sM9dA9V3T1wuiqf
	pw/PkmTL/Xx24YqGC9MuOdmubaK1skO/CZ5rsD3HPMvcDOwAOeXYJSaqZmUxJ95NwvzpApKO+0ttK
	aTHyyZ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeV3-00000002XMm-1zBo;
	Tue, 10 Nov 2026 05:34:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeV2-00000002XMa-0XzM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:34:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DC1545BDD;
	Tue, 10 Nov 2026 05:34:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794288867;
	b=TC66Sh0RjADDbybA91/229p6uvUJ0BX6BFxnlCKNEVU0FseVvBkaLigyn+kKWitH5pSZ
	 m/u7iU+TSpma4DAxckPbDELLgF9em5sh15vs32hAu0ApyQWTx0yjW61YNFKcMmvYH3FAt
	 emV2DLIquxL1SD4lt9vYf7tOhDDRsMt1Vfh8KI1DsBombVVYkyOAvmY0vmMsqwPSxz3M/
	 dnNEP3A+VKgBPE9pbFXWRBx8xiOLK3wIXgcecPuWcqTU/b0pcjWuilLUxdsTfPXqIQtQd
	 EXRBAGW6n5Y7shNVNdcyCsH1dE/9enpVZBj416MgwMr4DEn5+AYAZ71H1p3rUy+Sbpw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794288867;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Eirx/uCHYo84G24R6PBVAV1asTOmor2BurhkMEaTGv0=;
	b=iMn9CJrdBqSKERbOHjCsxR8/f6EXRFa06+yp3L/1qoKpF45UZEycjaUogWEtAh6EdU92
	 CjlSO5mQLOHjQWLPjx4f+B1hBXOvceNMHQ9Yqi1cevh8VndT+SZiUAjLweyYLYfl16LPL
	 L1SSOy3fSDClr+dGfM70z3xBgc/twu/SmTQokaSJS4tdxfggqhdEcdt64gMKUTN8d7Yg2
	 i0/D6iyIRE0WZlU5HzbYVcK5OqNjs62fGKwdSz5cQfzekwiZz523wCSbYkFk415EeFrBL
	 ouHq+VPMzPlJp57AS5Zu6fGCDIyZ4rXTBuWQVaP5Kzqdhyphyv+QIEZvkLL8FbBZ8Mw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5D011F00904;
	Tue, 10 Nov 2026 05:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794288867;
	bh=Eirx/uCHYo84G24R6PBVAV1asTOmor2BurhkMEaTGv0=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=V3fTkIeYU3AO543kr3tFqV9nxgH78M9EbGHwusSTxrhqvPWFAOYrrgqmBUEhgPvwa
	 2AipVnG1pDKUZCJrTQbdGcyaL6PP8kXBjLXX39XUR9EuOSnAgPDz0DRFcWRaRYB+qv
	 8rom2PcZ8CZ3zhAEMZcbebhPaoo3npamqDqvAFZXQ+cUzLXoWdAEbmnmAe1h/2JdQw
	 lrMV94kFOe2NxeOjHxboTcNs+D1x00t5ZnrUab5ulFm6FyubGPti/M9MZT7CDNKtBe
	 tlcE/gSp/jf/OAnzW84ebpd/hCw8p5mIIHi7qMMSsOpRA4S7zY+8m2g7BcbzdjUI/3
	 UxIGwL6KdETDQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 625D54888D;
	Tue, 10 Nov 2026 05:34:26 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 05:34:25 +0000
Subject: [PATCH] spi: sun6i: Add dual read support for the H616
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-spi-sun6i-h616-dual-read-v1-1-59bea5a897d4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAyA4VcZORto6oziq4iHro0uInU0qwhj7
 76qx+/w/wuYFBWDc7dAkbeavnID7TqIY8h3QU3N4J1nInJok6LVzIojE2Oq4YlFQsID+1O/H6J
 36Qgtn4rc9PNbX65/Wx0eEufvD9Z1A3MFpoh8AAAA
X-Change-ID: 20261110-spi-sun6i-h616-dual-read-562843bc20d7
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794288866; l=2702;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=tZGT7ZjHdId9r6BpMj+RA8BeDisXnRX+tnPmmh0C0Bc=;
 b=JQoe49yHNtyNnSQIFDzWoChjblFpYLtLOMljJsURSgpAJkp/VHvmdUU3GdI2MtVLx950u7Sv5
 CUuT5ewN6PRCOmrX6+9aL9hk09MET/uGHpH3so2UnyRvdoLds2y82kP
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

The H616 SPI controllers are bound through the "allwinner,sun8i-h3-spi"
fallback, whose configuration advertises no dual or quad modes. The
H616 user manual (v1.0, SPI_BCC register at 0x38) documents the same
dual read (DRM, bit 28) and quad (Quad_EN, bit 29) controls that the
driver already programs for the R329, while the controller keeps the
H3-style clock control register (SPI_CCR at 0x24).

Add an H616 configuration that combines the H3 clock control with dual
reads, matched on the existing "allwinner,sun50i-h616-spi" compatible,
so SPI NOR flashes can use 1-1-2 reads where the board wires both data
lines. Only dual reads are advertised: dual writes and quad mode use the
same register bits but have not been tested on the H616.

Tested on an Orange Pi Zero2 with its 2 MiB Macronix SPI NOR and
spi-rx-bus-width = <2> on the flash node: spi-nor reads with 1S-1S-2S
(opcode 0x3b), reading the whole flash takes 0.30 s instead of 0.52 s,
and repeated reads return identical data with a valid boot0 header.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
This patch was developed with Claude (Anthropic) as a coding assistant:
it investigated the problem, wrote the code and the commit message. I
reviewed it, and it was tested on an Orange Pi Zero2 (H616) as described
above.
---
 drivers/spi/spi-sun6i.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index e9fce8618299..2798b9c198c6 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -777,6 +777,12 @@ static const struct sun6i_spi_cfg sun8i_h3_spi_cfg = {
 	.has_clk_ctl	= true,
 };
 
+static const struct sun6i_spi_cfg sun50i_h616_spi_cfg = {
+	.fifo_depth	= SUN8I_FIFO_DEPTH,
+	.has_clk_ctl	= true,
+	.mode_bits	= SPI_RX_DUAL,
+};
+
 static const struct sun6i_spi_cfg sun50i_r329_spi_cfg = {
 	.fifo_depth	= SUN8I_FIFO_DEPTH,
 	.mode_bits	= SPI_RX_DUAL | SPI_TX_DUAL | SPI_RX_QUAD | SPI_TX_QUAD,
@@ -785,6 +791,7 @@ static const struct sun6i_spi_cfg sun50i_r329_spi_cfg = {
 static const struct of_device_id sun6i_spi_match[] = {
 	{ .compatible = "allwinner,sun6i-a31-spi", .data = &sun6i_a31_spi_cfg },
 	{ .compatible = "allwinner,sun8i-h3-spi",  .data = &sun8i_h3_spi_cfg },
+	{ .compatible = "allwinner,sun50i-h616-spi", .data = &sun50i_h616_spi_cfg },
 	{ .compatible = "allwinner,sun50i-r329-spi", .data = &sun50i_r329_spi_cfg },
 	/*
 	 * A523's SPI controller has a combined RX buffer + FIFO counter

---
base-commit: 429c9a10b3811ca2581f88c05a58bb1fd23229a7
change-id: 20261110-spi-sun6i-h616-dual-read-562843bc20d7

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>




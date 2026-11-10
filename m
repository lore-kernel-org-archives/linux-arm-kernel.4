Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD8C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 06:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wXjY5Mak;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GeH37zLg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aBuTrJA+FgdKKec0+ASncz9uD0roe2QTrv+5Thtip9c=; b=wXjY5Makv8fCUunAM0Oejr9LIA
	pbcZzbby9Rcb7Kbq3+afjvItUpbnHxCd2g8+3RyRnL6Z7Q1PrDFbH1Rr5IctEsvkQQVNi0b3VgHai
	spwdnvjS8XCjzFlFoFJsn1WSAURAdZtbV3o1fpu5pkDHgzLj/RsvEbumDANI5Rz3aM/GdYFWKrQdw
	78emfTqj4VDwu6jTLsuAOgvMtWLI+lmaNSUIXTmANrJVtwjZX18IGNElSklMOZVnjmvgFS6R4SQxe
	h30oBC3kA8+JSm03eEwoo7jY5H7TW0GVYFKjAuIOtFTgbwqvDw+psNyNA2/NLQyvGhhawYegtT05o
	2Mrln5lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQewh-00000002abq-3NxZ;
	Tue, 10 Nov 2026 06:03:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQewg-00000002abQ-3GaK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 06:03:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 89CD942B1E;
	Tue, 10 Nov 2026 06:03:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794290582;
	b=ocuq7KUvLN6Lna9nEel/ougNICl/K0RGqx9CHhSCYE+HTau1iWK67mRtpkjxPN9kJ1Oj
	 tS+Fnrvrhi1lDdqYZ80v7UZ32KPPI1ka4Iw8q1wrbQnAsHPHykYFsg7vKjhUilh1o2PrE
	 WCxvHW9dPWZ9YobWgu8Hle/WQhTQf8BMMWb1ZZ7J0AIoJjrU8opUh/bynDuV9tnqp/NfB
	 KzUTPQQDXQWvmBX4yAww2uRJWx16KWatavI2SEUCEmxFCXjiCFP+Nrl911XuBtuOTp+DO
	 TOptoY1qfH2LiUifAele6//bAikjt6Zr/5kTI0T/Oe/2wcowg2ES9HmyKNxZ+gR5GSQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794290582;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aBuTrJA+FgdKKec0+ASncz9uD0roe2QTrv+5Thtip9c=;
	b=CXetJ7jRYyzQg+Je7hJdInS+b444IbuGfaHAFJ8AGyVwgfb4afqRX7IxUfps4fVxyK17
	 boZOi/wzhtO356otuW9YoRjnHeF+VBsTrxtWlZw+D/mUGxl45AE7sbZKwgTZhsaVkQUM3
	 Af9vdRb9hi1/6pHxN/JtGxjut/mNNz5lOPuCJLjgsENVYfFX6sNMnrSW6wVoC6CR+4oxv
	 pAkP4AceKc16mWzr2FAHYa4B6/rYLVTHbuKiKXylBvdQQeFi8aK9zHU4jsezIxzAT545W
	 R2hi0dZ83rANO7dIc+gUi57weMiaJMeCYzk6+wJ8DI1G3ikh04LIZ0sfk9yhZaRmvcw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C4C91F008A1;
	Tue, 10 Nov 2026 06:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794290582;
	bh=aBuTrJA+FgdKKec0+ASncz9uD0roe2QTrv+5Thtip9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GeH37zLgXVBvjj1YxJ74cdkIewwXe/anc3KkRL95uX0nkbufhjdl5XDOgTugHzBke
	 AgU73Kh0BB2Kk7GCgaLkflfd6trcbkPt0ybJ/UHERb4/fAHLnU7D5OHFgQXD1JbiQ8
	 VfyObIlkAphBG4lSTy4SueYcEdXUb5VJsW/pins7iqiM733aBJ047+21TLpZ1ek564
	 LqGhWrmFeq23vASZEPYOmOQ/x9V60yn1qNyWNRnDR7d1Sz3sXnFA4sYKv+LmQdyc9C
	 y6dJz5/hS3LRcnjDJ7T7jPE4YqI0hvajf4oJcTX4mMHyROw1cujGqkjjoC5Knr2sN2
	 XVf5+GrezQ07A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A2CA1488C9;
	Tue, 10 Nov 2026 06:03:00 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 06:03:00 +0000
Subject: [PATCH 1/2] clk: sunxi-ng: h616: Fix the EMAC 25 MHz clock parent
 and divider
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-h616-clk-emac-spdif-v1-1-e5e36e8963e4@gmail.com>
References: <20261110-h616-clk-emac-spdif-v1-0-e5e36e8963e4@gmail.com>
In-Reply-To: <20261110-h616-clk-emac-spdif-v1-0-e5e36e8963e4@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794290580; l=2089;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=3R8NOHaq8WoHe/ITqSr7/Mvs3yLBB/Q5F/fqBEKvzFI=;
 b=jzSAMX5MGax6j/Mgiufd6pZI7rdjq+ZZuAkF5zVH/+HvL4wamDRRPeN1VUPK/621DM58gISNj
 SyCW5lxUvqJBU2BHhv0egJCBCxYqLjGQzir3oElj7XrOaxwf9M6FO3a
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

The H616 user manual (v1.0, 3.3.5.86 EPHY_25M_CLK_REG, 0x0970) gives the
EPHY 25 MHz clock as PLL_PERI0(1X) / 24, with bit 31 gating the output
and bit 30 gating the PLL_PERI0 input. The driver models it as a plain
gate below ahb3, so the clock framework reports the AHB3 rate (200 MHz)
for a clock that runs at 25 MHz, and the clock tree does not show that
the PHY clock depends on pll-periph0 rather than on the AHB3 bus.

Model it like the D1 driver does: a gate with a fixed /24 pre-divider
below pll-periph0. The register writes do not change, only the parent
and the reported rate do. On an Orange Pi Zero2, emac-25m now reads
25000000 with pll-periph0 (600 MHz) as its parent.

Fixes: 88dde5e23da1 ("clk: sunxi-ng: Add support for the Allwinner H616 CCU")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 955c614830fa..d2625fec651a 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -489,8 +489,17 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(spi1_clk, "spi1", nand_spi_parents, 0x944,
 static SUNXI_CCU_GATE(bus_spi0_clk, "bus-spi0", "ahb3", 0x96c, BIT(0), 0);
 static SUNXI_CCU_GATE(bus_spi1_clk, "bus-spi1", "ahb3", 0x96c, BIT(1), 0);
 
-static SUNXI_CCU_GATE(emac_25m_clk, "emac-25m", "ahb3", 0x970,
-		      BIT(31) | BIT(30), 0);
+/*
+ * The EPHY 25 MHz clock is PLL_PERI0(1X) / 24, gated by both the special
+ * clock gate (bit 31) and the PLL_PERI0 input gate (bit 30).
+ */
+static const struct clk_hw *emac_25m_parents[] = {
+	&pll_periph0_clk.common.hw
+};
+
+static SUNXI_CCU_GATE_HWS_WITH_PREDIV(emac_25m_clk, "emac-25m",
+				      emac_25m_parents, 0x970,
+				      BIT(31) | BIT(30), 24, 0);
 
 static SUNXI_CCU_GATE(bus_emac0_clk, "bus-emac0", "ahb3", 0x97c, BIT(0), 0);
 static SUNXI_CCU_GATE(bus_emac1_clk, "bus-emac1", "ahb3", 0x97c, BIT(1), 0);

-- 
2.55.0




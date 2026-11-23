Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38815606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i71gSWmP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mFh6HYTP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NTwmS0cXn/fDgENx4s6M91w/9O+98Yyk8OQMMb+a61M=; b=i71gSWmPVSiXU5
	564+wVMvV4Nj9CPLePh4i1dYizReIocsn31Dn3CsCX/O5nQwPcBYh9SDW+SDU//dUAWkuUB6ffZcX
	GMkaobo0YRLDMO5OEBFNHcJGyHJN3r0aPtj7+Z0JSjBK0uPoVYM1Ve8x1+Jpii6DRm3cbT9GYKeSa
	5u3CmuIQN/+/43jwULpA08L0/BFmhFS7eA01sanbHcte7zO9tHVjtxZ/XiAYDAwuryB10wOxGCOzP
	mqnRyfvoyk2+VaZM92BUtkrwbwdzL2pGPzcLrNLvSzSUyb3IDI9gP+KtgE7rXFJySwqbRpttPgbG6
	iXMffPGSdPLqagG7h2aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZZ1-00000004dlR-1v2x;
	Mon, 23 Nov 2026 19:18:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZYz-00000004dl6-22HR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:18:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3586662471;
	Mon, 23 Nov 2026 19:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4F81F000CA;
	Mon, 23 Nov 2026 19:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795461531;
	bh=NTwmS0cXn/fDgENx4s6M91w/9O+98Yyk8OQMMb+a61M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mFh6HYTPvakiRxmtTMUG5/44aSgrfmHA4DI6QmVyuVRGBZFwFPuHhecalqVMMkDJ0
	 88YHisK0Gsh5OsP2DI0fZsngYhaH/kRg4vmpgvpOMb/Fzle9FWiTQ16FqbMogvQfZy
	 5st+eTFKxPL9R1J28c8umm1pH+neHysxOAwnQ9WAVZWZc5n5aos1ZbPc5vt1tQirPC
	 P/Z4IX0w1EVmAwiqQBThRJPYG/x3d4Rd60UTZgwf2PWt1dk8FgSsbvbeAo9hjl3Btm
	 axLf5mA9XMNTToOL42shBnS8b48OwRwZc8AffUxs3PQHGHNqq3lHVjL5mCs9xr4Qv6
	 qDlJ8Xj9ENf4w==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 13/13] mmc: sdhci-brcmstb: Handle absent optional sdio_freq clock in probe
Date: Mon, 23 Nov 2026 19:15:57 +0000
Message-ID: <20261123191703.179283-14-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261123191703.179283-1-lee@kernel.org>
References: <20261123191703.179283-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Standard MMC Device Tree nodes may specify "clock-frequency" on SoCs
that do not provide the optional 72116B0 "sdio_freq" clock, in which
case devm_clk_get_optional() legitimately returns NULL.  However,
sdhci_brcmstb_probe() only checks IS_ERR(base_clk): when base_clk is
NULL, clk_get_rate(base_clk) evaluates to 0 and overwrites
SDHCI_CLOCK_V3_BASE_MASK in host->caps with 0 MHz while leaving
priv->base_freq_hz non-zero for system resume.

Check IS_ERR_OR_NULL(base_clk) and clear priv->base_freq_hz on the
fallback path before jumping to add_host.

Fixes: 97904a59855c ("mmc: sdhci-brcmstb: Add ability to increase max clock rate for 72116b0")
Closes: https://sashiko.dev/#/bug/linux-88799a75-1ece-4f9d-bdab-eeb713627ab2
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/mmc/host/sdhci-brcmstb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
index db857f2273e2..976cddb2ca9e 100644
--- a/drivers/mmc/host/sdhci-brcmstb.c
+++ b/drivers/mmc/host/sdhci-brcmstb.c
@@ -585,8 +585,10 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
 		goto add_host;
 
 	base_clk = devm_clk_get_optional(&pdev->dev, "sdio_freq");
-	if (IS_ERR(base_clk)) {
-		dev_warn(&pdev->dev, "Clock for \"sdio_freq\" not found\n");
+	if (IS_ERR_OR_NULL(base_clk)) {
+		if (IS_ERR(base_clk))
+			dev_warn(&pdev->dev, "Clock for \"sdio_freq\" not found\n");
+		priv->base_freq_hz = 0;
 		goto add_host;
 	}
 
-- 
2.56.1.750.gf70dc682cf-goog



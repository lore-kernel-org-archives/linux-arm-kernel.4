Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AE3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UzodHDc6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sMXkCW9Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QV7/azGZskXYhWhh8bvjrBkzYwv/Uf2HoCpYkbr0EGk=; b=UzodHDc6ofEMHi
	e7uX3YEqx4PGhKlH9hiIZtL8gCc7E2wAf7QReDfm4nL1Zbyl5B8lq07b76iuUwq6qm8ZJ0GRArvjC
	Hxo2gMfVfpBvzaUd40N1lbn80u4RJGX9qMptLIUu71SRhAY7yrPvMgNooPN0L93uIh/OCZ7uUZtW6
	LxvFV9nR1IBLIvdFAZDiZiCMYdYC7MqnB3tefZlQ6Fv8CsYSSQQ/z2yLu2jgzYiZMNyUW679o/TIQ
	F3X6MXC++zsMQyUKiSRbhWIP0FIcY0kN89Tn8w7K1YXvVD6UcUQCWwdB6PW3yWzKwusD7WDBH1JaB
	5JyE9d+ESkLqelmNl/XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqgr-0000000FBwf-3yNE;
	Fri, 27 Nov 2026 07:48:17 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqgb-0000000FBcK-3Ijp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:48:06 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-386d822a548so249125eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 23:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765681; x=1796370481; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QV7/azGZskXYhWhh8bvjrBkzYwv/Uf2HoCpYkbr0EGk=;
        b=sMXkCW9ZpstcESMAi+TTfTiVaR9SILrShdayEINPHI0kAOEU8m5wjsR789ZOhmok75
         Vy+gyI+K0Xs+MN1j3cVjHtI1mn7efqjBoD8NLLmnOJBn7hSdIiZjJjDuzgF1sYDUq7ks
         mUV5WEynK4cufL1grCqF0dlpoMVFX7pf26JKV2Uvh7Zaz9rYDSsSOoQUPAb4uF/xIjZU
         4dLxErBUotEwYtVjSxJDzPhn8FZuB/RO+nF5MIJyMDJtL1vqzKUop0xtt4c4qeFyBWP/
         P9jI+kgDK6N6swH2gqCo8cPmWYeE0ylQ1Y9hGff6L/WRfkIg/3cI+532b5km0c/9Qxtz
         L2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765681; x=1796370481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QV7/azGZskXYhWhh8bvjrBkzYwv/Uf2HoCpYkbr0EGk=;
        b=m2o52ms8whW0CDCcLu7XldiRA6aaCPr08Dj1zDO3GYpFpsgptZL01CTb7zJ4QaKtou
         buASvEfwU/3MYAr/11hw9WV67In9m2YHzJ3Da3ZRY+xBEXO134eOJcfH127R5rGKLUqb
         8XeFCmxzTaKvi64YcsfQZ1gAyQTkJD0HReF3IvIxPy/qGvEVGjyzj9aQa85+9EH8pLz0
         1zI1QeQBeBS1zPkAdvnw1mh7iiE5S7Uq34EDPzuVN2cdtPoYr8j9y9M6IRdup7UfISOU
         zIisILRQccEI2rOkQeJ+Y8rHRs0841+PxIklySw8nA43JU0aIXEqErzul2/zMCRDjtrk
         /mAw==
X-Forwarded-Encrypted: i=1; AL+hErHToy3taMIfb3qfwH4QkAJiKlJmkR/N4L+B3Dl4s6vXBF4NXGJp9Foeg/cwV2vjqgYMo6/tqieUABUlsT3539Z0@lists.infradead.org
X-Gm-Message-State: APuU4Z+e3mThw82+s9g5GbRcyKtvGgVNJKRNNsD4G1qdOwAEd+ElyXiI
	+dHKIF8j0Ep/PaUvnlgiHu+UEFMNdWj1GJzTiYuPAoStVtrZ1d7CPRFI
X-Gm-Gg: AZFdTZfs/7YSBrT35YkUn+T5Yq4Xni3kw0DN3DsQ9M+2HuAJ8YQvMCfxC5Ri/OhREb3
	hVUI1xoQ0fDU/7QhlzJvvIG0M++Wn7VSuLXXdiU1rSfePZuKAIvfDhkRiIGdlJX6lnn8JQUK1U5
	aJUlk4J+iulLYBbJe3PT0lPiUbdgcl9tPNSdjT743++ItCh7CzKyN7S08PoCkRGtxDsW2uLyfUi
	rg7iyDcjEmAO8Q6FdDScpX5NeA+jnWiCUgp61pzKWI74QzXHE2FgVBG4t+1gsM5wkjZ/l1Pprqd
	e776SnU58F7SGLisAJ8pzYhiB5nwFw5UNtU9vCDroO/Hn91bEFrJ2px6/If7b1avPDVgccdRXz8
	Kqrlh+JZCBukg3nINH3GPWEBd0ZTX24pxQ+4NY42KwzuHaXhANxibpipgpErwAXNNh1/dxlx1CX
	VK4rm9eJD75CORsfjbxNM6TIHH/pRLqqOoheALZkc1CV6N+BrfhU43fsJyNbs9JPMMSsRNbFnTX
	jd+uGb60XPec4gFkDueQAFe/b86L95qjzjv/VhplpjjpNINkZmgJGoGPlK53dB88NItXX0t71ug
	4VXVbHNubzHo1dY5ajHa9g7P6mf0vdsBo2HDoZVhyuA5SMXNf9Pgw6FewoSzysKU9DOI+hLHEyQ
	IYvHEkNC/zQS+o9RNiSdn
X-Received: by 2002:a05:7301:2624:b0:385:1a45:47b3 with SMTP id 5a478bee46e88-3856e24682amr38261091eec.1.1795765680315;
        Thu, 26 Nov 2026 23:48:00 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm68098252eec.15.2026.11.26.23.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:47:59 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 15:47:39 +0800
Subject: [PATCH v8 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on PLL
 lock failure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-dcphy-rx-v1-v8-3-9ddfef99221d@gmail.com>
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
In-Reply-To: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795765664; l=1650;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=W4uqFjWfli07BWEGnXyu4qteuMVlaJHZHz3TMUadK50=;
 b=Gu0eVRuDgeu70F7RSPjzHKcztPH+YfJNOX2TmitsSMipP6dmk3XLTBw0qxoOQ7E27z/ZVeIVL
 49W0elPOCvABZVdIcpA/1gyuWqHTOki4wOqlFDrQr9OYlLDzFUx3Z14
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_234801_832520_308093F8 
X-CRM114-Status: GOOD (  14.31  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

samsung_mipi_dphy_power_on() returns on a PLL lock timeout with PLL_EN
set and m_phy_rst still asserted, and the PHY core does not call
power_off after a failed power_on.

Today the APB reset at the start of the next power_on cleans this up.

A later change moves that reset to runtime resume, so the leftover
PLL_EN would stay set, and regmap_update_bits() would not even write
it again.

Unwind the power-on before returning the error.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/sashiko-outbox-174059@kernel.org/
Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 7382043e1f31..ce1bc62497c5 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1343,8 +1343,11 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
 	samsung_mipi_dphy_clk_lane_timing_init(samsung);
 	samsung_mipi_dphy_data_lane_timing_init(samsung);
 	ret = samsung_mipi_dcphy_pll_enable(samsung);
-	if (ret < 0)
+	if (ret < 0) {
+		samsung_mipi_dcphy_pll_disable(samsung);
+		reset_control_deassert(samsung->m_phy_rst);
 		return ret;
+	}
 
 	samsung_mipi_dphy_lane_enable(samsung);
 

-- 
2.43.0



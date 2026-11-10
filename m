Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73E660A383E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 08:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=txsB2+rI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KTX1WspW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AJjN4yOJO47ZPiYrwc/9QIPNcniGJgIrcFp8qD1WpVk=; b=txsB2+rIMN9ESl
	tXcsxdyMDAmWnoYelBK8cs31Wq1/PCPhFcAA3C+/Na/UpvFj+DCnzHsXUhFKYri7fD2fIESnK4ocB
	5GlNRCJUS2boDL9frZl+R7tNysbRXXkzpsxSbzollwzEewJhG9GZtQX3DX5+rAQEb36JXAoS7x8bP
	0nPtFcJkDyIqDTsxV4c53++3VMhrJjQHZLy5m2lLmW81FtWqNkhvJ2GXJH8ELqe9z4TGioeJl95bJ
	0yX8cmhXNn/oZwE01RAWz00AI0dEaWOhuhv2NkUoxzTi0lPKyxnhkspW1yySDmIzqtVBBIBDf2SZF
	/R8O2JtTkU1JMIbhtzmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh42-000000034sL-0zLt;
	Tue, 10 Nov 2026 08:18:46 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh3w-000000034h1-0XjZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 08:18:41 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-36e2b1db9bfso204193eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 00:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298719; x=1794903519; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJjN4yOJO47ZPiYrwc/9QIPNcniGJgIrcFp8qD1WpVk=;
        b=KTX1WspW3dAOk/E+CRlKdbtCmIorjWB+IsXkP2y1ET8YFTU68zhe3rABuUnAr5SZcP
         L/IDJH8gHKb00fllbnOQw5E1a99o4Hem3lCUSJRVEjn61i+n8PqQo8Nwfz5a0kzX0nW/
         eyr9kuXpSDMRvjB7kTB9TDa/NiXQCL29pUz61Eg0cgbyHA3pU/Iz5Eg6fvbjQ9+GSBnD
         hIFzWrrsdvzVVd1qbIdaNGlyZcDqPqtQMtQ99/zLirhmGVbcTVA5h9lBay0Urt6BXZ0Y
         TeYJ0sb9c+t/78aM6ykgKG5xKQJGsZwCpR/VqdkTedVnbt9nhMXu1XLoHYjAm2Ve6Bl+
         rEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298719; x=1794903519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJjN4yOJO47ZPiYrwc/9QIPNcniGJgIrcFp8qD1WpVk=;
        b=AKJXK2n7b1CkB+LgLuTFj1Ajs9eMNeGFmIgMatA7kBcJ1b/SWCfU15r4BnvL4Bunt8
         H+CJpoQcQPuc3ur5D2H20PmwiV13uAqNBuye0IsTQc/y7Apcm5ColgZEZA0fW7TI3TpD
         RkRzUvYjYA2mOIaZuGjqsQbmYnxlxbMJbFbPZ46w5u7fRN+ghdcuFEhws6cT5DPXSj7l
         2tMT00Y6wYeqdgGct68JsuMCCgu/vSp6/DhNB/+IhvpZiDDaohgJzV73aT3FS0DFeBgW
         wFspoeTQnwF8TUlNZm+mn+I7NdBr8a6n4OszB1T0xIUxMI82Eu4K9putaj3FaSSmAlPM
         T+9w==
X-Forwarded-Encrypted: i=1; AL+hErF4EYuPJj5G4CZuCU+tY9UBYvdAAMwR29WA+n1DYAkV+vQqtYDEoLAPcOdYNmZdZGVeZPTna3Oz8g94Mjm3oLP3@lists.infradead.org
X-Gm-Message-State: APuU4Z+5rNVO4oYLncYRoigfhC9l7stVzJJYGDxhlIA2gZjDxeXgZyaL
	sKvjWQzPN9DlU4lV86OnyfMCFOdg/v8vbZKY93VAUQgydpMpG8CSuF4d
X-Gm-Gg: AYBFou2SkIGxQpxqNn3jwndH72W0ha0fRhfZMkiMjBtHhWlcl+s2bBk9H7ZtH9O4NDH
	eXKfJ0xzWcAbuDTLuPYVfgseMtJzaXf1FfYLl8nTQE0SR1E6r3xKHUNw6fbsJVkKZMUn2i5gt31
	W43vH2vAVo6af3Sh6QVgOcnsyQKf7t3JEMH83ck0I+DzrqZcrmH7GQtWqL16n1OSljfKWWLhOwK
	T8ulrZmkRs4rx0UMelXwSNkgRfvKU+2uWdyGfVYHCOCiFGpkkxmMEm61aQBlWNywerD3fHf65Be
	kAe2sN9tvajD6N6jKIBXNIgIiuuTv9y3VEoldHX3yCfTlTJ34prjxAcdCpl5RrkLsYnaQHeGwlz
	KtH+9R4FJ4UEholJr1BHJhthgnmAVkYvw0ejyZgmVgF1INQ4Vd1HnzYwxmiZwXtoAxEcye30vto
	CR3Hwmaziwyu3bBZGEq/8e/NqVrhr4xA318kWP8iYjoCQdjBEdo8wzm9VyzlxJG0pyIfgkmQmd3
	c0SDgIQMjIBCFAKJegYBKpCGkt4TNW2cczCxM8kil+7rkZWom2qkQSML3DW65AJLiW6jZ1uI5IG
	QI80zUFDT0NxAioebPT2ognceXqqwMkVikJEryDnEIFjGjmUb+Iy5CrFeEDJ
X-Received: by 2002:a05:7301:d193:b0:36a:13fd:b5c with SMTP id 5a478bee46e88-3751eb8d9c1mr3960604eec.2.1794298718342;
        Tue, 10 Nov 2026 00:18:38 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm5236759c88.12.2026.11.10.00.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:18:37 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Tue, 10 Nov 2026 16:18:08 +0800
Subject: [PATCH v6 5/9] phy: rockchip-samsung-dcphy: Move block-level setup
 to runtime resume
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-dcphy-rx-v1-v6-5-d681ba20b36a@gmail.com>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
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
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298692; l=2404;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=mM+rLgEKgftG4Li8VSkT3B5/6VzsZyoCu0+g9BozRtQ=;
 b=MhBIYlgHOfxIY0JdSsH11bY+ntMFX2QUl/Z+iUhq/Sj47py5uFQSNEZQ1a0S+/TDMphNcVUxz
 /PMKTJMSDxOBRnNExGVQFfBDNfshgq7qCsOxLRZAFzlsGMu2EG+KYGb
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_001840_242683_6828F12F 
X-CRM114-Status: GOOD (  14.09  )
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

The APB reset and the BIAS references have to be treated as block-level
[1]: both the transmitter and the receiver need them, and they only have
to be programmed once. They are programmed from the transmitter's
power-on path today.

A later change registers one struct phy for each of them, and a second
consumer coming up would then reset the block underneath a PHY that is
already running.

Program them from runtime resume instead, where whichever of the two
comes up first brings the block up and a second one no longer resets it.

This puts the BIAS writes ahead of the per-PHY reset assert, where the
TRM's worked example has them after [1]. That is safe: neither M_RESETN
nor S_RESETN covers the BIAS registers, and the values written are those
registers' reset defaults.

[1] RK3588 TRM: sections 22.4.1 (address map), 22.4.2 (reset values),
    22.6.1.2 (reset) and 22.6.4.1 (D-PHY transmitter start-up)

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 7a009d87a665..d6acc3e2d448 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1346,7 +1346,6 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
 
 	reset_control_assert(samsung->m_phy_rst);
 
-	samsung_mipi_dcphy_bias_block_enable(samsung);
 	samsung_mipi_dcphy_pll_configure(samsung);
 	samsung_mipi_dphy_clk_lane_timing_init(samsung);
 	samsung_mipi_dphy_data_lane_timing_init(samsung);
@@ -1373,10 +1372,6 @@ static int samsung_mipi_dcphy_power_on(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
-	reset_control_assert(samsung->apb_rst);
-	udelay(1);
-	reset_control_deassert(samsung->apb_rst);
-
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
 		return samsung_mipi_dphy_power_on(samsung);
@@ -1667,6 +1662,12 @@ static __maybe_unused int samsung_mipi_dcphy_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	reset_control_assert(samsung->apb_rst);
+	udelay(1);
+	reset_control_deassert(samsung->apb_rst);
+
+	samsung_mipi_dcphy_bias_block_enable(samsung);
+
 	return 0;
 }
 

-- 
2.43.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB13606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 10:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rpgYDPV1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aalB4+hB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=63pVHVdLZ/AAb6QhX+KkOYKHoBRqlXz1mx2wQQLYHRU=; b=rpgYDPV1xVh/hg
	8aTOWJyrrMu4zkyVZsBxxMR54vpqkczFDAHrJ4V7Yk03F9rE3mI3Du7JlsbAoVDhmUCFcMUfhSAZW
	VyXxm1orvbEbq/a7JQlNetPClBCsLbl3218dLJY03lbPkYD9NiRK+9kdMxJs5lcVGm8CFO7JuDrW5
	EbZrS7lCYuwQgJNispDaAa8kh7Pkxn1PBKJeVEDz268rGWK9Mp8QobvzbHXAa8xvgjQc/55whUfZw
	WDrHQmlprMV9+gyvyjPspxI01tW5exYQC905c10BPhj1HldTgMbrv2Mf2mT7fNjGpzLkg947sCXcI
	OIHjt0bWCq70tjAfMC7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSXim-0000000HO4v-26uk;
	Sun, 15 Nov 2026 10:44:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSXii-0000000HO41-2fU0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 10:44:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 66CC441858;
	Sun, 15 Nov 2026 10:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E1A1F000C5;
	Sun, 15 Nov 2026 10:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739464;
	bh=63pVHVdLZ/AAb6QhX+KkOYKHoBRqlXz1mx2wQQLYHRU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aalB4+hBCPAVo2paG9AWhpOHRJeXCGXOzM3qjOe7aCl14dGamAR+qArw60Ki7cjUL
	 8ALEr7F5Bf53KO6yz3RfPxrXfTwKG9w0RfQVTzwmNOf47mZz0XAo+R8aSoPoG5BmZd
	 +vPEEh1CzmBQkZvEpkxU9gLIy9/H7/GdfvUs5jsT4LrDnRchMvfm48nF3uBMUyQRuN
	 fnOEsyaUYzdDT2jREdUDiS0hfsCTuw9Dz1BeFUTp0P+QSs8mkab/UlWw7r/jp6DDOP
	 +80FA42dCIgX257A/7Dm18Loj+AR3M7/5mZIyUhFIcEjvd5iJk207zu84UMLtFQh1i
	 RoluObqF7g9IA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 01/13] arm64: kconfig: let ARCH_BERLIN cover Synaptics arm64 SoCs
Date: Sun, 15 Nov 2026 18:23:40 +0800
Message-ID: <20261115102401.3520-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115102401.3520-1-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Extend ARCH_BERLIN to cover Synaptics arm64 SoCs.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/arm64/Kconfig.platforms | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 49dcd7be82ce..b830161fe68b 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -108,13 +108,13 @@ config ARCH_BRCMSTB
 endif
 
 config ARCH_BERLIN
-	bool "Marvell Berlin SoC Family"
+	bool "Synaptics/Marvell Berlin SoC Family"
 	select DW_APB_ICTL
 	select DW_APB_TIMER_OF
 	select GPIOLIB
 	select PINCTRL
 	help
-	  This enables support for Marvell Berlin SoC Family
+	  This enables support for Synaptics SoCs or Marvell Berlin SoC Family
 
 config ARCH_BITMAIN
 	bool "Bitmain SoC Platforms"
-- 
2.55.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8606606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YTWnTJpd;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O+Clnyg5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Na+yNwADVHtT0+06vQ945iPzbZLRjZ92Pxuevq6zNF8=; b=YTWnTJpddkoLcLH/sxO8IFWFoa
	nvgC158kMeqzftuGcv/aNmQRKZ6kVDv6Ylw2EONhpo6J669dnuTq4CEGzswCtTkg1+HvPj7cWkFxi
	CgAZ+wIUzbe2v4inHb2dZTzt5oKd0uzIVVTKQi3SncOcdWjJitYfebEaR1E4n8ruAClaSWyWzl0LN
	aBp1U2SIqAV1WdAqDZmZTCtbZtOhThNBertAdKHaMPU06wNJtP2CaE7jzv+n6ZRnuerAqi42vQ53F
	pwHitAK6e05aPh1yf0xpoBUSzlxE1f/rs1UTNH1AXXG2b0A5RPmzIoUv9CJNaEpIYvTORF2brCDKC
	Wcvn9tBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTz9N-0000000BVIi-1NrW;
	Thu, 19 Nov 2026 10:13:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTz93-0000000BV9s-3bwi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:13:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8558A45C21;
	Thu, 19 Nov 2026 10:13:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795083213;
	b=syAUVodjAqYS6ly2L3l2kHhb5so2yAqK1Os/k2rGs45jGF2+heOsO4iZ9msCLe8MWtoA
	 UxG2FGaRH3lkOOXZp062KR+sGGqoQaVsQnDG1YE9gujRO0461c+ansmA5kpqgkKjKUjMO
	 CYafMjOz7uR98uris0e6Z2nbjg7XF4E9wr2tIL5VG90EN7kyqOyHijuAKf0UXUVeuYVNv
	 1RJiQC/w6qxswFWDyy/CmBSvItrZ9jr+JiLdFMDZdZOjeIHAsBuzao/8oMR/9MU2rTGGo
	 3uHGTk9dP/zfFAWEaNW8fEP/MYxZx+jUVVmSX8dFt+VI7qiLVFFiOzKDjbSD1/4komg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795083213;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Na+yNwADVHtT0+06vQ945iPzbZLRjZ92Pxuevq6zNF8=;
	b=ETcsbrssLZsWQXJ7vWS/F5h8dh5ueI+0wN0+4PgI/AWNkSZonevGejDLyXVUSiR3LwZL
	 xR3FSqX3d50SEP4RGZdWsd+NiDc4463OUTcKV7NrbpmmFExnPOFTbHyXEsJAFjEAh6oO4
	 AaSmVGuMKPm2h6ZuwAfGWHOiz3YlA4hH6H5gRBr3HIPK/HRydbDrcNvCb9B2canIfGpiD
	 yXpprU0qswxFm3lLRdm7VMG2a2AtZfe625n0NefcN5u1zNh91wbl/HvPH693W8fDCsgBK
	 5E0FSe4mCGk4vBEtPeY5W+1YYBFU6Q3BZG0z1zZ53tyX+ZamCyTHyMslMywPwV8AZVA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 700931F000CC;
	Thu, 19 Nov 2026 10:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083213;
	bh=Na+yNwADVHtT0+06vQ945iPzbZLRjZ92Pxuevq6zNF8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=O+Clnyg5nVIcDjO+G7rudtguFcm3kcq0yW7bByGxke9FjI3V7v78VVubcMjUvlXdg
	 GBjrU9bHscKyW/Xdd1bpy03WoGXW6MXABfxKXUrp5FpdYy0WKMEReHoZdt3vkkaJof
	 p4C5dPhLrfsli4pax9OLv/geGrFKynGZJuRCgrtpKgZwKT+pgsUEFgFfWK+R7TTJMo
	 qP/G/6plSOS3Jyb/2UuiCGkC+guQZ+00Mczca/hnREudkop95VHezsHPUaFD8Bbzqv
	 ewSIG/Mbib/3eSo64CSsufB2wOsQHbludCy3wi5JI78eVrhFSxtydRLety+RIFkIn3
	 3wgMjaKr3z16g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6B95B4B240;
	Thu, 19 Nov 2026 10:13:31 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 19 Nov 2026 18:13:24 +0800
Subject: [PATCH v12 6/6] MAINTAINERS: add ARM/AMBARELLA SoC support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-cv75-soc-v12-6-e5a03cca8b05@ambarella.com>
References: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
In-Reply-To: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795083209; l=1241;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=66/FpPmSuU75AtQewU8cj7mu+Qa/5qamx4Km8ySoeYo=;
 b=R3YlfECIITeopX7N2IEbgRSOL4CEONiWDW+hJvLza+ROw+U+svEleBw6kCXQ7YwdndIxTSZUH
 ezo04rCOAnkDybT3uTsR7gnqT7MtXT0tXu+jCyY89X+gjclnSVaBa/9
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Long Zhao <longzhao@ambarella.com>

Add a maintainer entry covering Ambarella CV75 bindings, DTS and
related drivers.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 803b60ad628f..59e5b32d7a02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2502,6 +2502,20 @@ F:	drivers/clocksource/asm9260_timer.c
 F:	drivers/rtc/rtc-asm9260.c
 F:	drivers/watchdog/asm9260_wdt.c
 
+ARM/AMBARELLA SOC SUPPORT
+M:	Long Zhao <longzhao@ambarella.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	devicetree@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/ambarella.yaml
+F:	Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
+F:	Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
+F:	arch/arm64/boot/dts/ambarella/
+F:	drivers/clk/ambarella/
+F:	drivers/pinctrl/pinctrl-ambarella*
+F:	include/dt-bindings/clock/ambarella,cv75-rct.h
+N:	ambarella
+
 ARM/AMD PENSANDO ARM64 ARCHITECTURE
 M:	Brad Larson <blarson@amd.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.34.1




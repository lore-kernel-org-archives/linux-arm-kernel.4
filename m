Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994BF60A261A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wnKf3uzA;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=uZ8m/1C8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i4f7s/gJ5Ffrl4sG1/yeEUc9OuyhJicCd4di9iHIx/s=; b=wnKf3uzAqRIDre
	zOYIclgkHMCsygoRj8nBoCpXAnjqLrXDelAo4Nd9RF/anLNdjAosfVAJ5UXTD6C+UwBI3pkDMgjK7
	t5EZMtepFE3VZ5StfdTv/7keFH5cS7lrFfFXtv4cjykQSms9FO8aex74JX8io+qaiguaXkG9Jh+bJ
	A77Aea33BXXF21d3OlEJUKr0UFMguLj3DWPyUHdpO7a1iJQN48q1HjnMPyKfZC0cgL8TvHIN9RrFz
	lmG915lximjIcMeNSbfAa9j8+ofFAAqY8EVPbNmhqV4/rcEmLSaKRzn9TsWi6X1YxEBAxhn8ZgENB
	ngvlCwtvjOLgLOfYR2AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWQE-0000000AOhL-3MJz;
	Thu, 12 Nov 2026 15:09:06 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWQ8-0000000AOeK-0M9q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:09:01 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id E8E0A23187;
	Thu, 12 Nov 2026 16:08:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794496138;
	bh=i4f7s/gJ5Ffrl4sG1/yeEUc9OuyhJicCd4di9iHIx/s=; h=From:To:Subject;
	b=uZ8m/1C8yhezyDDHS+q1HhAKbsnFpNfRs7rEnHmN7B+SPTFNFziMxArOX9EVoPR+X
	 aC/qLdLzXcXVVgG6pg9gLtsH0GMLl3fqV8xr0agQ50eOOmx7fahECPLV3Lb931zQ9r
	 /nAzRitE/Q1LUxhL9us2PEl35kG9IOgQDur4Jcfv3+VpxcQsvPp3JkQwSOJm4uhFhg
	 HjukOn7zGrCKI1QAmJQrc/C/02UBMeP9q6jVu0NCRI6x2onI4+DgEorDLYT8VXFu8D
	 Lrlg7bFj9WUjh60OfB5YYkEZ2QV/MJCExRp6km4aWi0OCfhs1hmZ8Ggo2LBvNrZAYd
	 4QQ5WJGdhzJmg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] ARM: dts: imx6qdl-apalis: Add SPI aliases
Date: Thu, 12 Nov 2026 16:08:45 +0100
Message-ID: <20261112150849.177133-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150849.177133-1-francesco@dolcini.it>
References: <20261112150849.177133-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_070900_281962_ACA39E90 
X-CRM114-Status: GOOD (  11.50  )
X-Spam-Score: -2.1 (--)
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The Apalis family pinout defines the SoM interfaces and their
numbering, SPI1 and SPI2 being the SPI buses available to the carrier
board, implemented by ecspi1 and ecspi2 on Apalis iMX6.

imx6qdl.dtsi already numbers them spi0 and spi1, matching the Apalis
numbering. Add the aliases to the SoM dtsi anyway so the mapping from
the Apalis interfaces to the Linux bus numbers in sysfs and the spidev
names is explicit at the SoM level, zero-based with SPI1 being spi0,
and does not depend on the SoC defaults.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index af038ac47226..e880cf876da4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -16,6 +16,8 @@ aliases {
 		mmc1 = &usdhc1; /* MMC1 slot */
 		mmc2 = &usdhc2; /* SD1 slot */
 		/delete-property/ mmc3;
+		spi0 = &ecspi1;
+		spi1 = &ecspi2;
 	};
 
 	/* Will be filled by the bootloader */
-- 
2.47.3



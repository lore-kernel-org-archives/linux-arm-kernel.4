Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92725606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qt9kDNHW;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=GQrVkre9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4BLb/sTmHcdvT/KPX4mCF8s9/Po9DtJLecT3pESMZQU=; b=Qt9kDNHWF/e3nc
	P2WkrByORiPwyVVPP46VGDd6OfxxUiy0yRp52OAKRB8/+zpDI0wB6zMNBnoOUR3lKmdTPH8V3208Q
	dhN/MSFUh9FofYxoXF35b2uB968i7OQ98czByLVKKP2svEzjbCo9+VFGwiGCOJG8oWfHXjRCcbAnk
	iGl4fVSU0y3Ryvj+V1TOTuIEjRP5KWwHPe8sDHBC5Wf9lfXVs+4/Lr5jgkmUwa8fTHmbXjbKR27LC
	2H/ZqzG2xl6wXMMSzEBWnwFKbU6KbwR15ZLOT64X9QC284TL7UDyVOiOJy6iU2hRyY3auhcyx9x00
	YmrYSFNebj2w3KG6pFjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWQF-0000000AOi9-0SHN;
	Thu, 12 Nov 2026 15:09:07 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWQ9-0000000AOeX-13yM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:09:02 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2957F231C8;
	Thu, 12 Nov 2026 16:08:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794496139;
	bh=4BLb/sTmHcdvT/KPX4mCF8s9/Po9DtJLecT3pESMZQU=; h=From:To:Subject;
	b=GQrVkre9+v8hJLbkaFxXKlOzi4d/GqdyAYCwlRboM8YntBXYzqVqru6QODFmonWvB
	 UYIi8nkth7OrhmX01+hZyG604iUDOcq1hD3aLEfjEW1nfBnYLZ/c7mI9KWN4ZCcbwi
	 ZWkoXqDBgC2wJOUsjs5euJUaHMvGDscTjUuuD/HF4j+PqpHW/S+gjLMOb1EvE8VyPO
	 GKL2suoYo8Z/CxisoTw3AR5ELN/SAMJuqq/eXmZEk2GmfIpVchoXIm9h+690PUEOul
	 CYBUZ/SlibCmca0TsiWCFt7rga2k3+kGn3Lq4Dyf7zVfTcK4BqKmbssG4zXeZ7b3K7
	 fCaMFMqXBxFUw==
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
Subject: [PATCH v1 3/4] ARM: dts: imx6ull-colibri: Add SPI alias
Date: Thu, 12 Nov 2026 16:08:47 +0100
Message-ID: <20261112150849.177133-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150849.177133-1-francesco@dolcini.it>
References: <20261112150849.177133-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_070901_491293_650FDAD9 
X-CRM114-Status: GOOD (  12.93  )
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

The Colibri family pinout defines the SoM interfaces, SPI being the
single SPI bus available to the carrier board, implemented by ecspi1
on Colibri iMX6ULL.

imx6ul.dtsi already numbers ecspi1 as spi0, matching the Colibri
interface. Add the alias to the SoM dtsi anyway so the mapping from the
Colibri SPI interface to the Linux bus number in sysfs and the spidev
name is explicit at the SoM level and does not depend on the SoC
default.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
index 1eb1cf2d7395..6de474e4f73b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
@@ -6,10 +6,11 @@
 #include "imx6ull.dtsi"
 
 / {
-	/* Ethernet aliases to ensure correct MAC addresses */
 	aliases {
+		/* Ethernet aliases to ensure correct MAC addresses */
 		ethernet0 = &fec2;
 		ethernet1 = &fec1;
+		spi0 = &ecspi1;
 	};
 
 	backlight: backlight {
-- 
2.47.3



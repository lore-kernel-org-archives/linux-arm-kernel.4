Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98398606A880
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r8LY/+xI;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=ABNK9CUs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r1ul4jZ7Bbm65R+bezx2ySnoUE7BxylsA+WdAUXidRw=; b=r8LY/+xIK8EuHD
	bkdrnherjpR/S7E6jDRc2P1cAZ6eRejMUL/hl2UNTYHfWLbBxTjxXDt5S1TFT8hbrENBmjPKO/RV9
	vgL1C+iKiMBoye05NkdMVDOsuSCHjz7v+m7hicnnl6wmjzhNrglInKrQr6VmRbh0QxAPKphvB0dvS
	rb0MpJytbW7QIdkMfwFGdsA/gAIt7p2qI8no14wGsdH2KzbRawQs227YTlz9cGCUc8QBwQi9urUwd
	HSxvNj5+PPm1AjRlAk/EghL9FYWlq7Ce/csyND7xl2cAGPiKsCXmRWEeNRqfJ0fbvwVnAyx7sMuIB
	zuLSjSbvKYkQPe6bO75A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWQF-0000000AOin-1gJU;
	Thu, 12 Nov 2026 15:09:07 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWQ9-0000000AOet-3oLP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:09:03 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id C3236231CF;
	Thu, 12 Nov 2026 16:08:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794496140;
	bh=r1ul4jZ7Bbm65R+bezx2ySnoUE7BxylsA+WdAUXidRw=; h=From:To:Subject;
	b=ABNK9CUs6TSHXA3A+bjNHHCmtmZOgheZnqdFSPSlkCZmRBOL0li2ZoOytuFLlkECK
	 JbcVOHYwasj4/2UxPvkkMuvioGCdUKu7rO4eE6fP6ZTun6v4/z6Fpqr/pllAyjqG8n
	 oCyeMMnL8KmECw5OjMZwc9EDv1wqRb44OtYk7XO79Gc+ukk9a2991aTAgursdPITYj
	 XUiFkM3IuXUWZMST1AE6DpqkD5R6fpBn+W7Xznk5yGKnRVSyk/YN15nIEpr8nUBz7e
	 k3U39tz0tOJ5Rfp5JgNpgD0KI8MQNgESqGm1jc/4Z655AbSelo9L6eW9aEI5MqI4vH
	 h0nMSnXsxIShQ==
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
Subject: [PATCH v1 4/4] ARM: dts: imx7-colibri: Add SPI alias
Date: Thu, 12 Nov 2026 16:08:48 +0100
Message-ID: <20261112150849.177133-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150849.177133-1-francesco@dolcini.it>
References: <20261112150849.177133-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_070902_142723_09E976DD 
X-CRM114-Status: GOOD (  11.49  )
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
single SPI bus available to the carrier board, implemented by ecspi3
on Colibri iMX7.

imx7s.dtsi numbers ecspi3 as spi2, so the Linux bus number in sysfs
and the spidev name do not match the Colibri interface. Add a spi0
alias in the SoM dtsi and delete the inherited spi2, so ecspi3 is
bus 0 and carries a single alias. This replaces the spi0 alias
imx7s.dtsi gives to ecspi1, which is not used on Colibri iMX7.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
index c4088d3c5ab1..bd66745312a0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
@@ -9,6 +9,8 @@ / {
 	aliases {
 		rtc0 = &rtc;
 		rtc1 = &snvs_rtc;
+		spi0 = &ecspi3;
+		/delete-property/ spi2;
 	};
 
 	backlight: backlight {
-- 
2.47.3



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E427606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 07:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UnCzq58t;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NTME7Xc5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CSvpXGtyEATLlj/2FrXWL2Yf8kgpvuWchRuqAUx0gQU=; b=UnCzq58tgEpepp
	JSlz6Z59gp8riYc4xVqSwDNl3x0lej/oymVBAp5Xm+XKI0tqirMW3CCREca+WPuTJ/Ks8TS87kTWz
	s2Uid06xThrebvX1O9riBuvO8avJtJbvkMBMwrEn7W/pBKy+VbTcdTkAmImn4OYZJwXKDHSQq3cKC
	eTw5OHO6Xwz8df3efTCDf3pWuWkIZjrQRLdxWO6oXALZAW78GuuWlPEu1wJL/X7z50M/butI9iz4G
	Z+Qtdx66jXVhxLiMcWSbNZndi3vDyB2KtvWXKGC186lwE1522UtoBtCY1hQE5UAykubnt0et/NNfJ
	nROUtu7Lik5NOiX4zMRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCoP-00000000Se5-1HTd;
	Sat, 28 Nov 2026 07:25:33 +0000
Received: from out-236.mta0.migadu.com ([2001:41d0:1004:224b::ec] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCoF-00000000SaA-1yzF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 07:25:24 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=n35dCWLwzjQCCqkz64F9jozc879Qt86Z6dajYODYIzY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795850721; v=1; x=1796455521;
 b=NTME7Xc5t5JxMvlwPr+22nZ99syGGiY5b/uK7fVAlIkZ4+I/RrFCpQJ4PlPzTG96FxDZm2N8
 ErNh+LvpG69h5GFc/g3rPKFFBvS6Z63o+da0GHN5T+WfmmW+cd8lwLryUlXMY6sx3Nb6T4TyhuG
 SGO4i6u603wtv/eF3iefcnKw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 566add8d639687ed;
	Sat, 28 Nov 2026 07:25:21 +0000
X-Mizu-Trace-ID: 566add8d639687ed
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sat, 28 Nov 2026 15:23:53 +0800
Subject: [PATCH 8/9] arm64: dts: imx93-11x11-frdm: Correct PMIC interrupt
 type
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-pca945-int-v1-8-f3fe2beb2b51@nxp.com>
References: <20261128-pca945-int-v1-0-f3fe2beb2b51@nxp.com>
In-Reply-To: <20261128-pca945-int-v1-0-f3fe2beb2b51@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Maud Spierings <maudspierings@gocontroll.com>, Joy Zou <joy.zou@nxp.com>, 
 Joseph Guo <qijian.guo@nxp.com>, Francesco Valla <francesco@valla.it>, 
 Steven Yang <steven.yang@nxp.com>, Lei Xu <lei.xu@nxp.com>, 
 Fabian Pflug <f.pflug@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_232523_677172_459E7D92 
X-CRM114-Status: GOOD (  10.16  )
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

From: Peng Fan <peng.fan@nxp.com>

The IRQ_B pin of the PCA9451A PMIC is an active-low open-drain output.
It is pulled low when an unmasked interrupt status bit changes and is
released high only after the processor reads the INT1 register, so the
interrupt must be described as level-low instead of edge-triggered.

This matches the IRQF_TRIGGER_LOW flag requested by the pca9450 driver
since commit 5d0efaf47ee9 ("regulator: pca9450: Correct interrupt type").

Fixes: eb2f28413e23 ("arm64: dts: freescale: add support for NXP i.MX93 FRDM")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
index 33ed26aafde8..d82b0245402d 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
@@ -215,7 +215,7 @@ pmic@25 {
 		compatible = "nxp,pca9451a";
 		reg = <0x25>;
 		interrupt-parent = <&pcal6524>;
-		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 
 		regulators {
 

-- 
2.56.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF655606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 12:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1LdQxQ5u;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nnx0aNUo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DmIn60Bw6yfoa+kgHyaYUXoyqvtZFdxTT5HNPi8NO+U=; b=1LdQxQ5ugQi3pq
	D+J2WvEViZbV3yZia4SuC/AHSxoYfbcBTqn+4areRLb2KGTOGukBuobNhc+4Mz1DzmWS5Jl9vz3OZ
	AW5xTc5jqpUlu3b0v8RKAjZF4bs4Q7baaH4OfDyKxhtxja391HMovUReVufUzlgIFvP2Z//mxO0oe
	kQPysfu/CevJwDwX377atrmvKyhSpzWknlOK06kbEGfr5bsOltung8ym1iGNPhw2l8+REbiY3OGX2
	1c6SL/cr/IEM6iMnmNIw+HPzfBLBElEM+c6lZCbk4gO6qt8PiFQPzoJd5HiO7bvbRCX5QuHQlSeRV
	FspxD1UZENQxWoAtWpWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOAF-0000000F1LV-03yj;
	Fri, 20 Nov 2026 12:56:27 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOA8-0000000F1Ik-3NjH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 12:56:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EBA2FC6221F;
	Fri, 20 Nov 2026 12:56:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40073601B9;
	Fri, 20 Nov 2026 12:56:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DABB711BC0089;
	Fri, 20 Nov 2026 13:56:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795179372; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DmIn60Bw6yfoa+kgHyaYUXoyqvtZFdxTT5HNPi8NO+U=;
	b=nnx0aNUoBzznBrc1wZZc8tT8dsAsn3b4mMknXkFVIZ/kaboJDGfvD/cevEPPDr45zyo/+a
	Jo8pcxMnpGtugalkiaBUNilnKH36mSHFyUFY0imI4vDDPPWt3C+6wbEvB18HekBkzUMIv9
	ogtJLpBd0q0q3qKsSWNCe+gkmIdNLxbfPwVo5G6twsp83D+5cYZp2QLjvx8aD6cXN2LQNb
	nFKPwV5s/UO8jTBQwQT/mJIPkdLKavN53N69KhG5PxccSSi9LAU244+rVGHW3InPcHz7EX
	20yDqeFD0vfG+kUPc5HkaT2/KhHIsmcKP1q6XFvHriGB3RF6ye5D9U7VQWfj7g==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Fri, 20 Nov 2026 13:55:49 +0100
Subject: [PATCH 1/4] arm64: dts: ti: k3-j7200: Fix QSGMII overlay by adding
 SERDES PHY
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-phy-cadence-torrent-ng-v1-1-da2db7125cd7@bootlin.com>
References: <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
In-Reply-To: <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yuti Amonkar <yamonkar@cadence.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Andrew Davis <afd@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>, Chintan Vankar <c-vankar@ti.com>, 
 Abhash Kumar Jha <a-kumar2@ti.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Swapnil Jakhade <sjakhade@cadence.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_045621_003262_A6D362B6 
X-CRM114-Status: GOOD (  10.10  )
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

From: Chintan Vankar <c-vankar@ti.com>

For CPSW5G QSGMII ports, CPSW assumes SERDES to be configured. Since it
may not be always true, add SERDES phys to guarantee it.

Fixes: 496cdc82e05f ("arm64: dts: ti: k3-j7200: Add overlay to enable CPSW5G ports in QSGMII mode")
Signed-off-by: Chintan Vankar <c-vankar@ti.com>
Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 arch/arm64/boot/dts/ti/k3-j7200-evm-quad-port-eth-exp.dtso | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-evm-quad-port-eth-exp.dtso b/arch/arm64/boot/dts/ti/k3-j7200-evm-quad-port-eth-exp.dtso
index 6432ca08ee8e..4824d53c95bb 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-evm-quad-port-eth-exp.dtso
+++ b/arch/arm64/boot/dts/ti/k3-j7200-evm-quad-port-eth-exp.dtso
@@ -32,7 +32,8 @@ &cpsw0_port1 {
 	phy-handle = <&cpsw5g_phy0>;
 	phy-mode = "qsgmii";
 	mac-address = [00 00 00 00 00 00];
-	phys = <&cpsw0_phy_gmii_sel 1>;
+	phys = <&cpsw0_phy_gmii_sel 1>, <&serdes0_qsgmii_link>;
+	phy-names = "mac", "serdes";
 };
 
 &cpsw0_port2 {

-- 
2.56.1



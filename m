Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AEF606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 07:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=488WUJI+;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=d2xfElwZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3SUtTLC1soRDDz6/4e6GIxm8BK2GH1tVXHrXabtckwc=; b=488WUJI+2cMIIR
	ke9SMyd14dLbvgZJcgHg/8pbf9wX8KXA6JMgyzhYOoT2Qq75TX0ortv/uXnRy6wWRU7E/mFVi4JFg
	cqbMC+zcyYhq6OFP0ml+S5rRkVKECtkaRA8Ye/3hYOmV/Bn6c1u7fzYeqbAY6iZqU41KSEsOaL0tG
	es18a096XdrV7ZxhSBJZfPUCMxhsckEuhcJULCYIT8d5Rb+kr3lgeOIGzrjz1eleyZ3momNZjSvr0
	TyTc9AdHsg87aVLpDUN4Ht4eQX6ilUS/Z8OpTI/ml6qE/FBjDkMpP5sy+JBZ7QNkO8pnxajkJ9QHI
	eWtNZgXCGXzZUDXpdO8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCng-00000000SKL-4AS7;
	Sat, 28 Nov 2026 07:24:48 +0000
Received: from out-202.mta0.migadu.com ([2001:41d0:1004:224b::ca] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCnX-00000000SFH-2jWo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 07:24:41 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=SlIIfsBH0x58YJWWrwjSs5tfIKEhQVlucr/vM3GSWRM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795850677; v=1; x=1796455477;
 b=d2xfElwZJWVmqQyyP7hhtFaObYD65sI6e8eJUsTlM1DJothuqtkPLM9GU4MkpHwNKHMhRO9x
 YYXFCv/qc0udm8wUlzYvmk0aEofHRX5bZ9JRddoDIQpeNlpOu5uuNgWv3qRlnKuKCM1ybPxC8T/
 /tCpo57LULQBjm7BqtED8Vdo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e999d6798d851358;
	Sat, 28 Nov 2026 07:24:37 +0000
X-Mizu-Trace-ID: e999d6798d851358
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sat, 28 Nov 2026 15:23:49 +0800
Subject: [PATCH 4/9] arm64: dts: imx91-11x11-evk: Correct PMIC interrupt
 type
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-pca945-int-v1-4-f3fe2beb2b51@nxp.com>
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
X-CRM114-CacheID: sfid-20261127_232439_844202_BDA668D2 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

Fixes: 6772c4cffd87 ("arm64: dts: freescale: add i.MX91 11x11 EVK basic support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index d473c0890048..b178e3d4c3fc 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -337,7 +337,7 @@ m2-pcm-level-shifter-hog {
 	pmic@25 {
 		compatible = "nxp,pca9451a";
 		reg = <0x25>;
-		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&pcal6524>;
 
 		regulators {

-- 
2.56.0



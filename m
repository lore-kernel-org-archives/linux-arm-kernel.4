Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDEC606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 07:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vQbkpp04;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gkw6QUX0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OIWmkoz/ccsbm5cn7EmTYj2aMiZyDkUZdfHw4MfKgFo=; b=vQbkpp04equ2IvGeIWlPd2oXX1
	8ycwGa8i5VLEa7xy6gSma/nwsZXXvKLHS6yHJzhARoU7+STjX2n3I4uR4MxGCJnEp2CDkXAQ/iSeF
	d33imfeJ8aDSoxtPeOU7fSqLyHipmrlzVBEXSPtMY7YRS2RiFHx3IrRAXxjXi1SsG2bdkCTEPZwqE
	S4kbjIMnAsp4WdTjnFSBLmuy2mS1C5baEO3pcuBRQr/ZiieLBsCXfbqJgpgl6j39A+h3JNeTyTkLI
	qq0eZmFhe8LGiPhqIUfuTMlwJkkWWutXXK1SCmrrpr6+nrTzL5hcGXMaFbW5hKgzdTSybF/krexn2
	ciXUWGrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCn1-00000000S7W-0f6w;
	Sat, 28 Nov 2026 07:24:07 +0000
Received: from out-158.mta0.migadu.com ([2001:41d0:1004:224b::9e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCmw-00000000S7B-3SYP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 07:24:05 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=OPu6r00w5pS02VTnfc0Mf76uvr/kyRzj7ytYywT4JJE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795850638; v=1; x=1796455438;
 b=gkw6QUX02l+Z2O4I8nIeNT+rEHcakpT4EEY+wbFl3xqB//oYdbXvzldnENs0K1dmFTnhFwAb
 aw4ms+PG3af52IXVr5GTDxSoPdKB1RoRTMl9Y1apzrcLwNAyfMRZxJYWDFjRk3fkIxglHwibjww
 5j9i6pZlvlb5Zv4unNUtL4JA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 64b7477b175854f2;
	Sat, 28 Nov 2026 07:23:58 +0000
X-Mizu-Trace-ID: 64b7477b175854f2
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Subject: [PATCH 0/9] arm64: dts: imx: Correct PCA945x PMIC interrupt type
Date: Sat, 28 Nov 2026 15:23:45 +0800
Message-Id: <20261128-pca945-int-v1-0-f3fe2beb2b51@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyML3YLkREsTU93MvBJdC2MjU0MTs2RjY+MUJaCGgqLUtMwKsGHRsbW
 1AJnSAjNcAAAA
X-Change-ID: 20261128-pca945-int-8325146c333d
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
X-CRM114-CacheID: sfid-20261127_232404_275467_229D006C 
X-CRM114-Status: UNSURE (   7.42  )
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

The IRQ_B pin of the PCA9450/PCA9451A/PCA9452 PMICs is an active-low
open-drain output. The interrupt must therefore be described as level-low
rather than edge-triggered.

The pca9450 regulator driver was fixed to request IRQF_TRIGGER_LOW in
commit 5d0efaf47ee9 ("regulator: pca9450: Correct interrupt type"), which
is already upstream in v7.0-rc4. Device trees that still describe the
interrupt as edge-triggered no longer match the requested type, and the
GPIO/pca953x irqchip rejects the mapping:

  irq: type mismatch, failed to map hwirq-3 for gpio@30200000!

This series updates all i.MX device trees under
arch/arm64/boot/dts/freescale/ that use a PCA945x PMIC with an interrupt,
so that the interrupt is declared with IRQ_TYPE_LEVEL_LOW.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (9):
      arm64: dts: imx8mp-debix-model-a: Correct PMIC interrupt type
      arm64: dts: imx8mp-skov: Correct PMIC interrupt type
      arm64: dts: imx8mp-tx8p-ml81: Correct PMIC interrupt type
      arm64: dts: imx91-11x11-evk: Correct PMIC interrupt type
      arm64: dts: imx91-11x11-frdm: Correct PMIC interrupt type
      arm64: dts: imx93-9x9-qsb: Correct PMIC interrupt type
      arm64: dts: imx93-11x11-evk: Correct PMIC interrupt type
      arm64: dts: imx93-11x11-frdm: Correct PMIC interrupt type
      arm64: dts: imx93-14x14-evk: Correct PMIC interrupt type

 arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi        | 2 +-
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts          | 2 +-
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi  | 2 +-
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts          | 2 +-
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts            | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)
---
base-commit: e5aad2bdbbee783611d32599f89cea3f12f9593d
change-id: 20261128-pca945-int-8325146c333d

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>



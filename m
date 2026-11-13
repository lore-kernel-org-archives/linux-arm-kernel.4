Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF67E60A383E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=08EBOcTL;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=nselector2 header.b=BLizrRgj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZgGa5bM85EA+WJ5zIF2aZWjfVTWgChQti2lPkPAvdQQ=; b=08EBOcTLtIBeJl
	7L+k9Nfj02DYCmmGYZqZh/kRiQqYbdMEthK93ddqCjcwoZSIgBbAoLg3drZWZT6Zz3RGYVM7rJNLl
	STzYNYV7uLlYOEuWDUnNY8QlyLdl7v6iSIUWH6XfoIG4k0tdxSDFFoVCU/U7hgpwESHsJIbZVge96
	JuKiio2Flw7Sr0/7Kw5oCPCuAwBdFuif0XrAnI/rvob8uo/36S5mHZWm1N7gkev3YcGQ70htQ7sra
	d9Px3Hfe+uzVWLuktkvJsMjZ5oKaazHDJJIqppW1xtLylXXgFOjnu8JTfhd59KokeRNDoie3lKlnR
	AhCryXSiCom9DpvMxx2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRt0c-0000000DMdT-2dH7;
	Fri, 13 Nov 2026 15:16:10 +0000
Received: from inva129.nxp.com ([92.121.32.54])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRt0Z-0000000DMbG-2X4y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:16:09 +0000
Received: from localhost (localhost [127.0.0.1])
	by inva129.nxp.com (Postfix) with ESMTP id 3BE6F607FE43;
	Fri, 13 Nov 2026 16:10:17 +0100 (CET)
X-Virus-Scanned: amavis at nxp.com
Received: from inva129.nxp.com ([127.0.0.1])
 by localhost (inva129.nxp.com [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jpevwBi3rs_V; Fri, 13 Nov 2026 16:10:14 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva129.nxp.com (Postfix) with ESMTP id A47966016F80;
	Fri, 13 Nov 2026 16:02:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva129.nxp.com A47966016F80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com;
	s=nselector2; t=1794582163;
	bh=ZgGa5bM85EA+WJ5zIF2aZWjfVTWgChQti2lPkPAvdQQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BLizrRgjIojD8jND7nEBaASCPTtHxNfPYuGVps1Ge5+POAxyl4ATsdxU5Urw2YGUN
	 d5soraRQNJ8GiBRMvaWJFuTQ6Twi2TXja4gkkWYMI+A+T6UjQbUpjc0Z+qBvgX24IX
	 94Z7Zh8rdzpg8fgDmrLwo/3DSYPc2hBunliyaXMJrQtlJhtQBKixyFzelvAO7O7WVf
	 PlamOJSTakPotwKgeMskHKRj1SlqBP5v6nF8YZ4clF7M4eAsgdtqAA/ZWczVMZD9P8
	 zXiSLcNzghoj1DXArTCxFG2nIdMinrsTAwt7+GXAOpgWYy3dzwJ31OgW2NOKVGtrk/
	 P5MLsRNg4toOA==
Received: from lsv15141.swis.ro-buh01.nxp.com (lsv15141.swis.ro-buh01.nxp.com [10.162.246.138])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 718D5202B6;
	Fri, 13 Nov 2026 16:02:42 +0100 (CET)
From: Claudiu Manoil <claudiu.manoil@nxp.com>
To: netdev@vger.kernel.org
Cc: s32@nxp.com,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 4/6] arm64: dts: s32n79: add NETC IEP18 ECAM node for ENETC PPM ports
Date: Fri, 13 Nov 2026 17:02:35 +0200
Message-Id: <d5ada3955de2cc5a68194e165ffb84deef45c144.1794581338.git.claudiu.manoil@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1794581338.git.claudiu.manoil@nxp.com>
References: <cover.1794581338.git.claudiu.manoil@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_071607_844592_1710CE82 
X-CRM114-Status: GOOD (  11.13  )
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

Add the netc_iep18 PCIe ECAM host node describing the NETC integrated
endpoint bus allocated to the first Linux cohort on S32N79. The bus is
enumerated via the generic pci-host-ecam-generic driver and hosts the
ENETC v4 Pseudo-MAC (PPM) PF and its VFs, which connect internally to
the on-chip NETC switch (not owned by Linux).

The node is kept disabled at the SoC level; boards that wire up NETC
enable it. MSIs are routed through the GIC-v3 ITS (msi-map) and DMA is
translated by the SMMUv3 (iommu-map).

Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
---
v4: none
v3: none

v2:
 - Replaced the 'msi-parent' stub property with 'msi-map', as per H/W spec.

 arch/arm64/boot/dts/freescale/s32n79.dtsi | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32n79.dtsi b/arch/arm64/boot/dts/freescale/s32n79.dtsi
index 94ab58783fdc..65cf65e82832 100644
--- a/arch/arm64/boot/dts/freescale/s32n79.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32n79.dtsi
@@ -122,6 +122,30 @@ irqsteer_coss: interrupt-controller@4ed00000 {
 		};
 	};
 
+	nwss-bus {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x48800000 0x0 0x48800000 0x0 0x4b0000>,
+			 <0x2 0x40000000 0x2 0x40000000 0x0 0x20000000>;
+
+		netc_iep18: pcie@241200000 {
+			compatible = "pci-host-ecam-generic";
+			reg = <0x2 0x41200000 0x0 0x100000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			bus-range = <0x0 0x0>;
+			iommu-map = <0x0 &smmu 0xc0000 0x100>;
+			msi-map = <0x0 &its 0xc0000 0x100>;
+			dma-coherent;
+			status = "disabled";
+
+			/* All NETC PCIe functions */
+			ranges = <0x82000000 0x0 0x48800000 0x0 0x48800000 0x0 0x4b0000>;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.34.1



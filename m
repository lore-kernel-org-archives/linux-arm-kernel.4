Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13956606A896
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 14:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4sr8CPsP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Me8Ddrl4qdedvCqBvHI/CaV+I9ZnUue9ZLooGkUz6FA=; b=4sr8CPsP5AbHbLU1mUFNHYQCKk
	wVuUatZtowrZasjG1GyccdD79bsLfThKwyxZkuNU5uhIqZs5TEBHazw5AZGjRhlUqiHuKPk0dKsTE
	TAryiYJ+E5xRVG8zxFbpWphuoHVfHkRRz5r4743v92R8kFSttg+gnqMoUll55puB+Raix7if8ctZl
	p+JakoJczRPdqDwD+WLyypdRb+r3bpfoO6bYkEJIBRJ3sSb4xkP4M22mZ/pxbCDd7ATUtIcgcSAEl
	aVguY7TeKdTPZzvfEXoGVP6ZBttThCVkY2MwkXigAgDOAoROtDtfBdSY75fMz5GG27X69zbjq4pYp
	ywgyOBiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSFA8-0000000GJrH-42Uw;
	Sat, 14 Nov 2026 14:55:28 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSFA2-0000000GJhx-0vrb;
	Sat, 14 Nov 2026 14:55:23 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSF9t-000000005IO-1BVR;
	Sat, 14 Nov 2026 14:55:13 +0000
Date: Sat, 14 Nov 2026 14:55:09 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: nicolas.dufresne@collabora.com, detlev.casanova@collabora.com,
	paulk@sys-base.io, ezequiel@vanguardiasur.com.ar
Subject: [RFC PATCH 5/6] ARM: dts: rockchip: Add RKVENC encoder to RV1126
Message-ID: <7eb3e4d947b7f8a7b2ec068f15f02662b950f697.1794666330.git.daniel@makrotopia.org>
References: <cover.1794666330.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794666330.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_065522_295681_205B6434 
X-CRM114-Status: GOOD (  11.27  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the encoder with its IOMMU, the VEPU power domain and the three
QoS nodes of the encoder ports. The encoder AXI clock is set to
297 MHz and the core clock to 396 MHz.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 arch/arm/boot/dts/rockchip/rv1126.dtsi | 54 ++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1126.dtsi b/arch/arm/boot/dts/rockchip/rv1126.dtsi
index 74f238e13533c..63705291dd3ce 100644
--- a/arch/arm/boot/dts/rockchip/rv1126.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126.dtsi
@@ -139,6 +139,21 @@ qos_sdio: qos@fe86c000 {
 		reg = <0xfe86c000 0x20>;
 	};
 
+	qos_venc_rd_m0: qos@fe870000 {
+		compatible = "rockchip,rv1126-qos", "syscon";
+		reg = <0xfe870000 0x20>;
+	};
+
+	qos_venc_rd_m1: qos@fe870080 {
+		compatible = "rockchip,rv1126-qos", "syscon";
+		reg = <0xfe870080 0x20>;
+	};
+
+	qos_venc_wr: qos@fe870100 {
+		compatible = "rockchip,rv1126-qos", "syscon";
+		reg = <0xfe870100 0x20>;
+	};
+
 	qos_iep: qos@fe8a0000 {
 		compatible = "rockchip,rv1126-qos", "syscon";
 		reg = <0xfe8a0000 0x20>;
@@ -223,6 +238,17 @@ power-domain@RV1126_PD_VO {
 					 <&qos_iep>;
 				#power-domain-cells = <0>;
 			};
+
+			power-domain@RV1126_PD_VEPU {
+				reg = <RV1126_PD_VEPU>;
+				clocks = <&cru ACLK_VENC>,
+					 <&cru HCLK_VENC>,
+					 <&cru CLK_VENC_CORE>;
+				pm_qos = <&qos_venc_rd_m0>,
+					 <&qos_venc_rd_m1>,
+					 <&qos_venc_wr>;
+				#power-domain-cells = <0>;
+			};
 		};
 	};
 
@@ -630,6 +656,34 @@ vop_mmu: iommu@ffb00f00 {
 		status = "disabled";
 	};
 
+	venc: video-codec@ffbb0000 {
+		compatible = "rockchip,rv1126-rkvenc";
+		reg = <0xffbb0000 0xf00>;
+		interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_VENC>, <&cru HCLK_VENC>,
+			 <&cru CLK_VENC_CORE>;
+		clock-names = "axi", "ahb", "core";
+		assigned-clocks = <&cru ACLK_VENC>, <&cru CLK_VENC_CORE>;
+		assigned-clock-rates = <297000000>, <396000000>;
+		resets = <&cru SRST_VENC_A>, <&cru SRST_VENC_H>,
+			 <&cru SRST_VENC_CORE>;
+		reset-names = "axi", "ahb", "core";
+		iommus = <&venc_mmu>;
+		power-domains = <&power RV1126_PD_VEPU>;
+	};
+
+	venc_mmu: iommu@ffbb0f00 {
+		compatible = "rockchip,iommu";
+		reg = <0xffbb0f00 0x40>, <0xffbb0f40 0x40>;
+		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_VENC>, <&cru HCLK_VENC>;
+		clock-names = "aclk", "iface";
+		#iommu-cells = <0>;
+		power-domains = <&power RV1126_PD_VEPU>;
+		rockchip,disable-mmu-reset;
+	};
+
 	gmac: ethernet@ffc40000 {
 		compatible = "rockchip,rv1126-gmac", "snps,dwmac-4.20a";
 		reg = <0xffc40000 0x4000>;
-- 
2.56.0


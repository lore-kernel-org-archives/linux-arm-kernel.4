Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C4C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OTN/riho;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ehfH0CVM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=42WQvqgp+QaH5oQhmusBg6D+zZ/4xvV/MU8Zg3jcRsE=; b=OTN/rihoOaLmc+
	D9n6j8889OhA4+5OfOz45RRKadnCr1hOb0lUEuravddBNdqCqk7DbMgvWEW2HXc9HQaYJ6nOFLLGb
	R9mPq3hOJccqAW7SJV8MiwgCMEXIt2rd9q846Kft/IAIWN2kvW/q9zi1ko5ujb2umwNuievnmd30c
	/Bh0KsNCMWuMJbhIwOVBdNR7oAX1OLju4vvbpPHQorwRzf6MeSIxUyVEmb5qXQIF9DFBhke05ZgH+
	QVDgS6Uv4u12MlCRnrtPKfES4regtPS3ca49dxgFJ/jgtkPMXOjUD5UyduGPTSxCDf6GZjdVBJ6aq
	6OXP21HyxdomzHejWcVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStnA-00000001wFN-1Kl0;
	Mon, 16 Nov 2026 10:18:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStn0-00000001w9e-0Bqx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:18:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D93E623B6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 10:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717F81F000D3;
	Mon, 16 Nov 2026 10:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824297;
	bh=42WQvqgp+QaH5oQhmusBg6D+zZ/4xvV/MU8Zg3jcRsE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ehfH0CVM5o5rG62dBGoLg32exqjKOmBdYlKyFSVAKPYc2zJVT42WRMYJikxUpkdLs
	 SXV8istAxHa3g9ifQsBkMGoWrXgmt9QDNWeaXw2rkeBmzQi4oQNxuoUdcahVimtB22
	 runqgVok21nmhZ/i0NUW0wsvXokBZ7eLTQF67z9eH0ZFJddlh+UqO32Ga7YJvazAZn
	 RD0amq7f3XGI0QvTzOPzNnHbH2aNAyxIZmvoPZ1lA+R4PN1qE0ioc/VkYY9sleZhVu
	 dFnv8OVpR4TErZaynDsmzj8rpxQ3tUQeQeV2cPiiVX2vkNkITzO+ZH0Vqy9SsQpLVJ
	 C3ej7lwIrW1sQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Nov 2026 11:18:09 +0100
Subject: [PATCH 3/3] ARM: dts: ux500: Remove DB8500 EPOD regulators
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-ux500-powerdomain-dts-v1-3-e0f4459c3ab1@kernel.org>
References: <20261116-ux500-powerdomain-dts-v1-0-e0f4459c3ab1@kernel.org>
In-Reply-To: <20261116-ux500-powerdomain-dts-v1-0-e0f4459c3ab1@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>, 
 linux-pm@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

Delete the deprecated db8500-prcmu-regulators node and all its EPOD
regulators, including VAPE and VSMPS2. Their external consumers now use
the AB8500 or AB8505 buck regulators, so no compatibility regulators
are needed.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi | 103 -----------------------------------
 1 file changed, 103 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
index b3b3cec69656..967444e4a618 100644
--- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
@@ -675,97 +675,6 @@ thermal: thermal@801573c0 {
 				interrupt-names = "IRQ_HOTMON_LOW", "IRQ_HOTMON_HIGH";
 				#thermal-sensor-cells = <0>;
 			};
-
-			/*
-			 * TODO: Delete these bogus regulators and replace with power
-			 * domains.
-			 */
-			db8500-prcmu-regulators {
-				compatible = "stericsson,db8500-prcmu-regulator";
-
-				// DB8500_REGULATOR_VAPE
-				db8500_vape_reg: db8500_vape {
-					regulator-always-on;
-				};
-
-				// DB8500_REGULATOR_VARM
-				db8500_varm_reg: db8500_varm {
-				};
-
-				// DB8500_REGULATOR_VMODEM
-				db8500_vmodem_reg: db8500_vmodem {
-				};
-
-				// DB8500_REGULATOR_VPLL
-				db8500_vpll_reg: db8500_vpll {
-				};
-
-				// DB8500_REGULATOR_VSMPS1
-				db8500_vsmps1_reg: db8500_vsmps1 {
-				};
-
-				// DB8500_REGULATOR_VSMPS2
-				db8500_vsmps2_reg: db8500_vsmps2 {
-				};
-
-				// DB8500_REGULATOR_VSMPS3
-				db8500_vsmps3_reg: db8500_vsmps3 {
-				};
-
-				// DB8500_REGULATOR_VRF1
-				db8500_vrf1_reg: db8500_vrf1 {
-				};
-
-				// DB8500_REGULATOR_SWITCH_SVAMMDSP
-				db8500_sva_mmdsp_reg: db8500_sva_mmdsp {
-				};
-
-				// DB8500_REGULATOR_SWITCH_SVAMMDSPRET
-				db8500_sva_mmdsp_ret_reg: db8500_sva_mmdsp_ret {
-				};
-
-				// DB8500_REGULATOR_SWITCH_SVAPIPE
-				db8500_sva_pipe_reg: db8500_sva_pipe {
-				};
-
-				// DB8500_REGULATOR_SWITCH_SIAMMDSP
-				db8500_sia_mmdsp_reg: db8500_sia_mmdsp {
-				};
-
-				// DB8500_REGULATOR_SWITCH_SIAMMDSPRET
-				db8500_sia_mmdsp_ret_reg: db8500_sia_mmdsp_ret {
-				};
-
-				// DB8500_REGULATOR_SWITCH_SIAPIPE
-				db8500_sia_pipe_reg: db8500_sia_pipe {
-				};
-
-				// DB8500_REGULATOR_SWITCH_SGA
-				db8500_sga_reg: db8500_sga {
-					vin-supply = <&db8500_vape_reg>;
-				};
-
-				// DB8500_REGULATOR_SWITCH_B2R2_MCDE
-				db8500_b2r2_mcde_reg: db8500_b2r2_mcde {
-					vin-supply = <&db8500_vape_reg>;
-				};
-
-				// DB8500_REGULATOR_SWITCH_ESRAM12
-				db8500_esram12_reg: db8500_esram12 {
-				};
-
-				// DB8500_REGULATOR_SWITCH_ESRAM12RET
-				db8500_esram12_ret_reg: db8500_esram12_ret {
-				};
-
-				// DB8500_REGULATOR_SWITCH_ESRAM34
-				db8500_esram34_reg: db8500_esram34 {
-				};
-
-				// DB8500_REGULATOR_SWITCH_ESRAM34RET
-				db8500_esram34_ret_reg: db8500_esram34_ret {
-				};
-			};
 		};
 
 		i2c0: i2c@80004000 {
@@ -1118,8 +1027,6 @@ msp0: msp@80123000 {
 			#sound-dai-cells = <0>;
 			reg = <0x80123000 0x1000>;
 			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
-			/* TODO: delete and replace with power-domain handling */
-			v-ape-supply = <&db8500_vape_reg>;
 			power-domains = <&pm_domains DOMAIN_VAPE>;
 
 			dmas = <&dma 31 0 0x12>, /* Logical - DevToMem - HighPrio */
@@ -1138,8 +1045,6 @@ msp1: msp@80124000 {
 			#sound-dai-cells = <0>;
 			reg = <0x80124000 0x1000>;
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
-			/* TODO: delete and replace with power-domain handling */
-			v-ape-supply = <&db8500_vape_reg>;
 			power-domains = <&pm_domains DOMAIN_VAPE>;
 
 			/* This DMA channel only exist on DB8500 v1 */
@@ -1159,8 +1064,6 @@ msp2: msp@80117000 {
 			#sound-dai-cells = <0>;
 			reg = <0x80117000 0x1000>;
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-			/* TODO: delete and replace with power-domain handling */
-			v-ape-supply = <&db8500_vape_reg>;
 			power-domains = <&pm_domains DOMAIN_VAPE>;
 
 			dmas = <&dma 14 0 0x12>, /* Logical  - DevToMem - HighPrio */
@@ -1180,8 +1083,6 @@ msp3: msp@80125000 {
 			#sound-dai-cells = <0>;
 			reg = <0x80125000 0x1000>;
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
-			/* TODO: delete and replace with power-domain handling */
-			v-ape-supply = <&db8500_vape_reg>;
 			power-domains = <&pm_domains DOMAIN_VAPE>;
 
 			/* This DMA channel only exist on DB8500 v2 */
@@ -1225,8 +1126,6 @@ gpu@a0300000 {
 			clocks = <&prcmu_clk PRCMU_ACLK>, <&prcmu_clk PRCMU_SGACLK>;
 			clock-names = "bus", "core";
 			power-domains = <&pm_domains DOMAIN_SGA>;
-			/* TODO: delete and replace with power-domain handling */
-			mali-supply = <&db8500_sga_reg>;
 		};
 
 		mcde@a0350000 {
@@ -1234,8 +1133,6 @@ mcde@a0350000 {
 			reg = <0xa0350000 0x1000>;
 			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&pm_domains DOMAIN_B2R2_MCDE>;
-			/* TODO: delete and replace with power-domain handling */
-			epod-supply = <&db8500_b2r2_mcde_reg>;
 			clocks = <&prcmu_clk PRCMU_MCDECLK>, /* Main MCDE clock */
 				 <&prcmu_clk PRCMU_LCDCLK>, /* LCD clock */
 				 <&prcmu_clk PRCMU_PLLDSI>; /* HDMI clock */

-- 
2.56.0



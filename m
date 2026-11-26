Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEC2606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wx2Lk6M3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iZPP+QD0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YA+5eXzAu39dXCnzS9V3VNc/CsEscIPke2TJ0P7uJzs=; b=Wx2Lk6M3gxaCLT
	DKMrvVvH5RJF5EHjn/HZCpL/TKh5Iq43iGs3SpPraawKwu7SPpQ+YgnyFRqQeuS0OA0naEgpiwLf5
	/buRGhhC87AeAg8wJgCkYGmFjuxSc3RIZ2GrtYK82srpnNgGFjUhvGZ4BkPy17COgwJ5jYcAG854i
	TfDq7y1+GFR+rsamGzMzPWN4X94nSQ6hdCTh8IEmIfD6HsDnDAbnH+p1vJEPiTjyLOP9ZSkFr+IwY
	HTom9Ds23bUJLVqKZePNJPnQW4XZ1iGZaHuOH3IxxxPq+DMFuWnN6+GwvD5ZNZzT351sxNiscdJzu
	Y+skRGneDLeAUP159LZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNV8-0000000Bg0a-2FV6;
	Thu, 26 Nov 2026 00:38:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUk-0000000Bfji-254Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:37:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E94036015B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2267B1F000D4;
	Thu, 26 Nov 2026 00:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653469;
	bh=YA+5eXzAu39dXCnzS9V3VNc/CsEscIPke2TJ0P7uJzs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iZPP+QD0LaNy8bzxpQWq1e0jm3NLT9wrjFAhkgDubnN2/oOmHsLU0oNDmcQ5rYrDV
	 JUcBbxy1d7KTOANqIRv8oU0ynt9Fq/wfn77zz3J8Yd58xoYLQo/1XqqEXBiZTeSZB6
	 zDXOWMBalzuhmb2AIUzpg/GSNWAANNO5ClqA1LLHXJL6zgxl/0/pJ0h2PxSxvrvYuP
	 /3+17ET3x6dDVTQKXaAan6A0S/PTYnHD6e8ZDy90t/DWBIHRNlx8PFeP5LZoEUBd57
	 VAiESILiXMhjWsC8mXUw3UCijGzhp61UREoCf09ywlqGCV2rnFsyZqpagCPxGtoE5c
	 ha69TkdijBKZQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:23 +0100
Subject: [PATCH 19/20] ARM: dts: ux500: Move addressless devices out of the
 simple bus
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-19-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
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

The PMU, power-domain provider and static CoreSight replicator have
no register resources. Move them to the root, preserving the PMU
interrupt parent and the existing power-domain links.

Fixes: b557457f638b ("ARM: ux500: add CoreSight blocks to DTS file")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi | 111 ++++++++++++++++++-----------------
 1 file changed, 56 insertions(+), 55 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
index 05d91367a38a..1770828a1d69 100644
--- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
@@ -115,6 +115,62 @@ pinctrl: pinctrl {
 		prcm = <&prcmu>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a9-pmu";
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pm_domains: power-controller {
+		compatible = "stericsson,ux500-pm-domains";
+		#power-domain-cells = <1>;
+		power-domains = <&pm_domains DOMAIN_VAPE>,
+				<&pm_domains DOMAIN_VAPE>,
+				<&pm_domains DOMAIN_VAPE>,
+				<&pm_domains DOMAIN_VAPE>,
+				<&pm_domains DOMAIN_VAPE>,
+				<&pm_domains DOMAIN_VAPE>;
+		power-domains-child-ids = <DOMAIN_SVA_MMDSP>,
+					 <DOMAIN_SVA_PIPE>,
+					 <DOMAIN_SIA_MMDSP>,
+					 <DOMAIN_SIA_PIPE>,
+					 <DOMAIN_SGA>,
+					 <DOMAIN_B2R2_MCDE>;
+	};
+
+	replicator {
+		compatible = "arm,coresight-static-replicator";
+		clocks = <&prcmu_clk PRCMU_APEATCLK>;
+		clock-names = "atclk";
+		power-domains = <&pm_domains DOMAIN_VARM>;
+
+		out-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				replicator_out_port0: endpoint {
+					remote-endpoint = <&tpiu_in_port>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				replicator_out_port1: endpoint {
+					remote-endpoint = <&etb_in_port>;
+				};
+			};
+		};
+
+		in-ports {
+			port {
+				replicator_in_port0: endpoint {
+					remote-endpoint = <&funnel_out_port>;
+				};
+			};
+		};
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -259,39 +315,6 @@ funnel_in_port1: endpoint {
 			};
 		};
 
-		replicator {
-			compatible = "arm,coresight-static-replicator";
-			clocks = <&prcmu_clk PRCMU_APEATCLK>;
-			clock-names = "atclk";
-			power-domains = <&pm_domains DOMAIN_VARM>;
-
-			out-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					replicator_out_port0: endpoint {
-						remote-endpoint = <&tpiu_in_port>;
-					};
-				};
-				port@1 {
-					reg = <1>;
-					replicator_out_port1: endpoint {
-						remote-endpoint = <&etb_in_port>;
-					};
-				};
-			};
-
-			in-ports {
-				port {
-					replicator_in_port0: endpoint {
-						remote-endpoint = <&funnel_out_port>;
-					};
-				};
-			};
-		};
-
 		tpiu@80190000 {
 			compatible = "arm,coresight-tpiu", "arm,primecell";
 			reg = <0x80190000 0x1000>;
@@ -357,28 +380,6 @@ L2: cache-controller@a0412000 {
 			cache-level = <2>;
 		};
 
-		pmu {
-			compatible = "arm,cortex-a9-pmu";
-			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
-		pm_domains: power-controller {
-			compatible = "stericsson,ux500-pm-domains";
-			#power-domain-cells = <1>;
-			power-domains = <&pm_domains DOMAIN_VAPE>,
-					<&pm_domains DOMAIN_VAPE>,
-					<&pm_domains DOMAIN_VAPE>,
-					<&pm_domains DOMAIN_VAPE>,
-					<&pm_domains DOMAIN_VAPE>,
-					<&pm_domains DOMAIN_VAPE>;
-			power-domains-child-ids = <DOMAIN_SVA_MMDSP>,
-						 <DOMAIN_SVA_PIPE>,
-						 <DOMAIN_SIA_MMDSP>,
-						 <DOMAIN_SIA_PIPE>,
-						 <DOMAIN_SGA>,
-						 <DOMAIN_B2R2_MCDE>;
-		};
-
 		clocks@8012f000 {
 			compatible = "stericsson,u8500-clks";
 			/*

-- 
2.56.1



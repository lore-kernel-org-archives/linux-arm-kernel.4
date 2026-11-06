Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F5F606D82A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 21:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dotQUs94;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=4gBDhyjH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hX3xdruN8caOfgHo4tlWQ2jg/6Z3Qzk8H8WdcuYaXgs=; b=dotQUs94mlXJgj
	nhrxgD/ZgWfpQglU4kyBjyVX18wHioBzMqdD3zdKGxLJzVJcrj5b548d47DaapEsU+IipOsZSHpGT
	tvH9VZNgi489Lic+Mb77v3WRnvcL6/Oo6TOhwBZNYDA/ltfNFVzSjJ23HUbeA7OlEosf89nAxvq33
	cE0sd2Pzr/dmiHKwuKR7teTZMyVaFlQMTVXTpgX9RrjBVLGmrjpnqWi+weFDGcx81UUmCTZK67JH3
	qxfG8gJDNnV01lcz80qmxpo3MfdfpalKqLM95zyT9D1xJPxO5UFX9VOnZ78k6fPzXFEu/qnOHAwRa
	rkQygHC3ancoZdWfixOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPR79-0000000DddU-3Azr;
	Fri, 06 Nov 2026 21:04:47 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPR72-0000000DdOq-3yYl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 21:04:44 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793999077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hX3xdruN8caOfgHo4tlWQ2jg/6Z3Qzk8H8WdcuYaXgs=;
	b=4gBDhyjH4oTieu2J+BiE7I2yJKH1zSQYZeMWBizUR61G0+rw0k8qTNprGOz8KUqGRlLfmS
	dejimdIOiX1wKbh2+U7yDbrXExJpPjOTFihvMUoFXedNluiP4rv7n3EVqvULHSu/02psc8
	G9kXi6aGmfbmExpc1uXMHMbjursBxyM=
Date: Fri, 06 Nov 2026 22:04:24 +0100
Subject: [PATCH 15/15] arm64: dts: apple: t8142: Add NVMe nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-apple-dts-m4-m5-nvme-v1-15-22f4827b4ece@cyberchaos.dev>
References: <20261106-apple-dts-m4-m5-nvme-v1-0-22f4827b4ece@cyberchaos.dev>
In-Reply-To: <20261106-apple-dts-m4-m5-nvme-v1-0-22f4827b4ece@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_130441_175699_A8FD7724 
X-CRM114-Status: GOOD (  10.20  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the device nodes for the internal NVMe SSD on the Apple M5 (t8142)
SoC. Keep ps_apcie_phy_sw powered on and invert the ps_apcie_sys_st /
ps_apcie_phy_sw dependency to match t8122.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t8142-pmgr.dtsi |  5 ++--
 arch/arm64/boot/dts/apple/t8142.dtsi      | 42 +++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8142-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8142-pmgr.dtsi
index b89c7720cf23..3c4842ab55b2 100644
--- a/arch/arm64/boot/dts/apple/t8142-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t8142-pmgr.dtsi
@@ -801,7 +801,7 @@ ps_apcie_sys_st: power-controller@520 {
 		reg = <0x520 4>;
 		label = "apcie_sys_st";
 		#power-domain-cells = <0>;
-		power-domains = <&ps_ans>, <&ps_apcie_st>;
+		power-domains = <&ps_ans>, <&ps_apcie_st>, <&ps_st0_aus5>;
 		#reset-cells = <0>;
 	};
 
@@ -810,8 +810,9 @@ ps_apcie_phy_sw: power-controller@560 {
 		reg = <0x560 4>;
 		label = "apcie_phy_sw";
 		#power-domain-cells = <0>;
-		power-domains = <&ps_apcie_sys_st>, <&ps_apcie_sys_gp>;
+		power-domains = <&ps_apcie_sys_gp>;
 		#reset-cells = <0>;
+		apple,always-on;
 	};
 
 	ps_sys_st_ocla: power-controller@568 {
diff --git a/arch/arm64/boot/dts/apple/t8142.dtsi b/arch/arm64/boot/dts/apple/t8142.dtsi
index 3663677f7b14..c1a61e56e2b5 100644
--- a/arch/arm64/boot/dts/apple/t8142.dtsi
+++ b/arch/arm64/boot/dts/apple/t8142.dtsi
@@ -489,6 +489,48 @@ serial0: serial@3a5200000 {
 			status = "disabled";
 		};
 
+		ans_mbox: mbox@481608000 {
+			compatible = "apple,t8142-asc-mailbox",
+				     "apple,asc-mailbox-v4";
+			reg = <0x4 0x81608000 0x0 0x4000>;
+
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 1143 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1144 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1145 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1146 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "send-empty", "send-not-empty",
+					  "recv-empty", "recv-not-empty";
+
+			#mbox-cells = <0>;
+			power-domains = <&ps_ans>;
+		};
+
+		sart: sart@485c50000 {
+			compatible = "apple,t8142-sart", "apple,t6000-sart";
+			reg = <0x4 0x85c50000 0x0 0x10000>;
+			power-domains = <&ps_ans>;
+		};
+
+		nvme: nvme@4c5cc0000 {
+			compatible = "apple,t8142-nvme-ans2",
+				     "apple,t8132-nvme-ans2";
+			reg = <0x4 0xc5cc0000 0x0 0x60000>,
+			      <0x4 0x81600000 0x0 0x4000>;
+			reg-names = "nvme", "ans";
+
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 1155 IRQ_TYPE_LEVEL_HIGH>;
+
+			mboxes = <&ans_mbox>;
+
+			power-domains = <&ps_ans>, <&ps_apcie_sys_st>;
+			power-domain-names = "ans", "apcie0";
+			resets = <&ps_ans>;
+
+			apple,sart = <&sart>;
+		};
+
 		pmgr_gfx: power-management@580e80000 {
 			compatible = "apple,t8142-pmgr", "apple,t8103-pmgr",
 			             "syscon", "simple-mfd";

-- 
2.56.0



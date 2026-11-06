Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5DE606D81F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 21:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WIcodptp;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=bT/BQtXo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Q3gp6Avq1u4KULHEJJcxqqSSLUCUEG88RkHz8ESxDdk=; b=WIcodptpoUGMBp
	szND6BQYjjhzVzHD52jJtJZ97E2R6yW2ORRYqUjkNhU2Rh4qhCuh0qogXfztMeWXWGfpnG2bXYDYM
	3P64swECj30J1Uiuz9fqvkWQdscjXd3S6brGW9dlOXsMzVJsvGZElQ9dUMtJjINJCECsADm4HILOw
	kjUKSm1k8U9KsKjbev8j7VKmVq3KoG32/1AR0DeMSYcnza4N6SWS8vlmtBOxas2ERfAmFMmkYUZZe
	Er6dVjQg4rZZd8r/3dpOOCpz59fJz235mHy31jtF8+2V5BE0PBKUgfETkXSbZ9Kxm/FUQn6SVHTIp
	2gakyU79SGwn2T4YJIow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPR79-0000000Ddd1-2RhM;
	Fri, 06 Nov 2026 21:04:47 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPR70-0000000DdOo-3d6L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 21:04:40 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793999076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3gp6Avq1u4KULHEJJcxqqSSLUCUEG88RkHz8ESxDdk=;
	b=bT/BQtXovkizs+c+VsP9NgTvpgd7VCTp/BXmluKo/a3SjIGkra4tSyd9sb4CDLdPLntq4S
	ENQhbgfs2ar5+oWiulN8B9/KflmPMXMBwB89nnaRFrlo12W1NRF9Oy2h5xzJ6DPLEBr+lC
	HVk3kB+9jxx/QKMP7f2cZERkCbXSeEs=
Date: Fri, 06 Nov 2026 22:04:23 +0100
Subject: [PATCH 14/15] arm64: dts: apple: t604x: Add NVMe nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-apple-dts-m4-m5-nvme-v1-14-22f4827b4ece@cyberchaos.dev>
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
X-CRM114-CacheID: sfid-20261106_130439_178971_236241AB 
X-CRM114-Status: UNSURE (   8.92  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the device nodes for the internal NVMe SSD on the Apple M4 Pro/Max
(t6040/t6041) SoCs. Keep ps_apcie_phy_sw powered on matching t603x.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t6041-pmgr.dtsi |  1 +
 arch/arm64/boot/dts/apple/t6041.dtsi      | 44 +++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6041-pmgr.dtsi b/arch/arm64/boot/dts/apple/t6041-pmgr.dtsi
index 7da82f8a036b..029ecd3bda82 100644
--- a/arch/arm64/boot/dts/apple/t6041-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t6041-pmgr.dtsi
@@ -824,6 +824,7 @@ ps_apcie_phy_sw: power-controller@398 {
 		#power-domain-cells = <0>;
 		power-domains = <&ps_apcie_sys_st0>, <&ps_apcie_sys_st1>;
 		#reset-cells = <0>;
+		apple,always-on;
 	};
 
 	ps_jpg: power-controller@3a0 {
diff --git a/arch/arm64/boot/dts/apple/t6041.dtsi b/arch/arm64/boot/dts/apple/t6041.dtsi
index 9110d05c896d..e7c3e33f8f69 100644
--- a/arch/arm64/boot/dts/apple/t6041.dtsi
+++ b/arch/arm64/boot/dts/apple/t6041.dtsi
@@ -329,6 +329,29 @@ pmgr_gfx: power-management@288e80000 {
 			#size-cells = <1>;
 		};
 
+		ans_mbox: mbox@409608000 {
+			compatible = "apple,t6041-asc-mailbox",
+				     "apple,asc-mailbox-v4";
+			reg = <0x4 0x09608000 0x0 0x4000>;
+
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 1530 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1531 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1532 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1533 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "send-empty", "send-not-empty",
+					  "recv-empty", "recv-not-empty";
+
+			#mbox-cells = <0>;
+			power-domains = <&ps_ans>;
+		};
+
+		sart: sart@40dc50000 {
+			compatible = "apple,t6041-sart", "apple,t6000-sart";
+			reg = <0x4 0x0dc50000 0x0 0x10000>;
+			power-domains = <&ps_ans>;
+		};
+
 		i2c0: i2c@429010000 {
 			compatible = "apple,t6041-i2c", "apple,t8103-i2c";
 			reg = <0x4 0x29010000 0x0 0x4000>;
@@ -501,6 +524,27 @@ serial0: serial@429200000 {
 			status = "disabled";
 		};
 
+		nvme: nvme@44dcc0000 {
+			compatible = "apple,t6041-nvme-ans2",
+				     "apple,t8132-nvme-ans2";
+			reg = <0x4 0x4dcc0000 0x0 0x60000>,
+			      <0x4 0x09600000 0x0 0x4000>;
+			reg-names = "nvme", "ans";
+
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 2583 IRQ_TYPE_LEVEL_HIGH>;
+
+			mboxes = <&ans_mbox>;
+
+			power-domains = <&ps_ans>,
+					<&ps_apcie_sys_st0>,
+					<&ps_apcie_sys_st1>;
+			power-domain-names = "ans", "apcie0", "apcie1";
+			resets = <&ps_ans>;
+
+			apple,sart = <&sart>;
+		};
+
 		pmgr: power-management@502280000 {
 			compatible = "apple,t6041-pmgr", "apple,t8103-pmgr",
 			             "syscon", "simple-mfd";

-- 
2.56.0



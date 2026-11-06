Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B63D606D818
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 21:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GVpQ0HtC;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=kHx7me7L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=leZ0DMFlEYwLl56NU7dNF7zQDEc0KXwSFbg2dW83f/I=; b=GVpQ0HtCDjPaSE
	+wEP5x+bzjVhhXCVwIJexSWBygqnJJFBrRA6P17y5sAAFiYDoxhbdxARlYmTNRQMGU973mHzr8Flh
	0NCpHHPJI4BzF6cL2EUl61fiPEbHhejM5hq0eUXan39wzQOOuwo7yaGWKhnTBWBunpihoR45cLe6M
	JCeDw6FivJK38Jj4bg2TpHjYZOlXkLwXWU3yorHjT2BZCXMA6lspSj743MLEu2p+2ySB30/byIekU
	912HuJk/pDr/S930eaCTee6utBnaqfFIu1wmFBc+oV8BE1kG6JLTGkhtNuBlPPqMkbXmLXYEUWFOL
	/CmbrKEl1XF7VmVSGC5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPR79-0000000DdcH-1cnh;
	Fri, 06 Nov 2026 21:04:47 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPR70-0000000DdNi-0UQZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 21:04:40 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793999075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=leZ0DMFlEYwLl56NU7dNF7zQDEc0KXwSFbg2dW83f/I=;
	b=kHx7me7LH4thttAK0jGglb50QEhk+PO/2xZR0ys8N4G87Wd//ubGjiim8fx5UOSJI7p1Pr
	lPwxstiDznlWon1E20V01ewDEPZxwZc7XiBpWQ7FO3SQD+b+WN6rJDnPcFRhrsYdvsBRPs
	2A+MvtNNs8w93MB2v6v/6s96Yq+ucnA=
Date: Fri, 06 Nov 2026 22:04:22 +0100
Subject: [PATCH 13/15] arm64: dts: apple: t8140: Add NVMe nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-apple-dts-m4-m5-nvme-v1-13-22f4827b4ece@cyberchaos.dev>
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
X-CRM114-CacheID: sfid-20261106_130439_057889_33F796C2 
X-CRM114-Status: UNSURE (   8.81  )
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

Add the device nodes for the internal NVMe SSD on the Apple A18 Pro
(t8140) SoC. Keep ps_apcie_phy_sw powered on matching t8122.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t8140-pmgr.dtsi |  1 +
 arch/arm64/boot/dts/apple/t8140.dtsi      | 42 +++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8140-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8140-pmgr.dtsi
index dd43520394ac..ac69e57cc140 100644
--- a/arch/arm64/boot/dts/apple/t8140-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t8140-pmgr.dtsi
@@ -556,6 +556,7 @@ ps_apcie_phy_sw: power-controller@3c0 {
 		#power-domain-cells = <0>;
 		power-domains = <&ps_apcie_sys_st>, <&ps_apcie_sys_gp>;
 		#reset-cells = <0>;
+		apple,always-on;
 	};
 
 	ps_pmp: power-controller@3d0 {
diff --git a/arch/arm64/boot/dts/apple/t8140.dtsi b/arch/arm64/boot/dts/apple/t8140.dtsi
index 3b4f7695552b..4230af506fca 100644
--- a/arch/arm64/boot/dts/apple/t8140.dtsi
+++ b/arch/arm64/boot/dts/apple/t8140.dtsi
@@ -351,6 +351,48 @@ serial0: serial@385200000 {
 
 			status = "disabled";
 		};
+
+		ans_mbox: mbox@389608000 {
+			compatible = "apple,t8140-asc-mailbox",
+				     "apple,asc-mailbox-v4";
+			reg = <0x3 0x89608000 0x0 0x4000>;
+
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 1007 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1008 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1009 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1010 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "send-empty", "send-not-empty",
+					  "recv-empty", "recv-not-empty";
+
+			#mbox-cells = <0>;
+			power-domains = <&ps_ans>;
+		};
+
+		sart: sart@38dc50000 {
+			compatible = "apple,t8140-sart", "apple,t6000-sart";
+			reg = <0x3 0x8dc50000 0x0 0x10000>;
+			power-domains = <&ps_ans>;
+		};
+
+		nvme: nvme@3cdcc0000 {
+			compatible = "apple,t8140-nvme-ans2",
+				     "apple,t8132-nvme-ans2";
+			reg = <0x3 0xcdcc0000 0x0 0x60000>,
+			      <0x3 0x89600000 0x0 0x4000>;
+			reg-names = "nvme", "ans";
+
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 1039 IRQ_TYPE_LEVEL_HIGH>;
+
+			mboxes = <&ans_mbox>;
+
+			power-domains = <&ps_ans>, <&ps_apcie_sys_st>;
+			power-domain-names = "ans", "apcie0";
+			resets = <&ps_ans>;
+
+			apple,sart = <&sart>;
+		};
 	};
 
 	timer {

-- 
2.56.0



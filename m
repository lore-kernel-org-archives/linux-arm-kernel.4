Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0063606D81A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 21:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YUpPaOzU;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=YccW+n0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EfIRKQI8PX+6U6ygvekU+kTb4/7Reb6EURSmwPgXyt8=; b=YUpPaOzUXeMZdy
	42tFliZUeaSDAKjDV31UYUmKGiZi8yyj7agewhYY5H5DjSLNJKkbqH/EURCryZr8Gh0O3D/fcDwxZ
	X8Y7l/PnTLpcO1igcmMt5xkwQ5sNhkVNI+rMdkDrBFE2qclrM74IJbvqXlGS1XJfuGz3Zj4QIZTBI
	jbjBYnRqHwJZoFCsrl8XcLcHbIeRO9V6bsZLkRa+astp5I0bZPZu3b1a8syU/dY2nTk3p0g9ApSWj
	DHnlfcvYgd9GHoFWMUo/4HMpMQKEXeGdbnhHdAjNTr6HhDv67g45xkzF/naIRbocch/7JTuvCq7L/
	P/yBc0oyuNe5SNxgr1rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPR79-0000000Ddbm-14Wa;
	Fri, 06 Nov 2026 21:04:47 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPR6y-0000000DdMp-1Yw1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 21:04:39 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793999074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EfIRKQI8PX+6U6ygvekU+kTb4/7Reb6EURSmwPgXyt8=;
	b=YccW+n0feezvsv2aNOcEnvNT3PUPykUf4qTxWJFaJH4PVkbGvuxDy5is5z1O10LbkL76Qb
	YsF9ss2gkRxOgRoIZmEaLzq+CWRWHh0l5Mku3AsqQ3pBtiVY8rDYXAqoLQ357VQKjUnQlT
	3mgbhFTW3FLzGAVAk0+NMRKvdfhbMa4=
Date: Fri, 06 Nov 2026 22:04:21 +0100
Subject: [PATCH 12/15] arm64: dts: apple: t8132: Add NVMe nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-apple-dts-m4-m5-nvme-v1-12-22f4827b4ece@cyberchaos.dev>
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
X-CRM114-CacheID: sfid-20261106_130436_593595_7C6CB58E 
X-CRM114-Status: UNSURE (   8.72  )
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

Add the device nodes for the internal NVMe SSD on the Apple M4 (t8132)
SoC. Keep ps_apcie_phy_sw powered on matching t8122.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t8132-pmgr.dtsi |  1 +
 arch/arm64/boot/dts/apple/t8132.dtsi      | 41 +++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8132-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8132-pmgr.dtsi
index 6fbf09e8f981..c9deb9b8b096 100644
--- a/arch/arm64/boot/dts/apple/t8132-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132-pmgr.dtsi
@@ -824,6 +824,7 @@ ps_apcie_phy_sw: power-controller@550 {
 		#reset-cells = <0>;
 		label = "apcie_phy_sw";
 		power-domains = <&ps_apcie_sys_st>, <&ps_apcie_sys_gp>;
+		apple,always-on;
 	};
 
 	ps_msr: power-controller@560 {
diff --git a/arch/arm64/boot/dts/apple/t8132.dtsi b/arch/arm64/boot/dts/apple/t8132.dtsi
index e2e79c7e7fd0..e7d27620a9f7 100644
--- a/arch/arm64/boot/dts/apple/t8132.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132.dtsi
@@ -472,6 +472,47 @@ serial0: serial@3ad200000 {
 
 			status = "disabled";
 		};
+
+		ans_mbox: mbox@481608000 {
+			compatible = "apple,t8132-asc-mailbox",
+				     "apple,asc-mailbox-v4";
+			reg = <0x4 0x81608000 0x0 0x4000>;
+
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 1003 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1004 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1005 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1006 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "send-empty", "send-not-empty",
+					  "recv-empty", "recv-not-empty";
+
+			#mbox-cells = <0>;
+			power-domains = <&ps_ans>;
+		};
+
+		sart: sart@485c50000 {
+			compatible = "apple,t8132-sart", "apple,t6000-sart";
+			reg = <0x4 0x85c50000 0x0 0x10000>;
+			power-domains = <&ps_ans>;
+		};
+
+		nvme: nvme@4c5cc0000 {
+			compatible = "apple,t8132-nvme-ans2";
+			reg = <0x4 0xc5cc0000 0x0 0x60000>,
+			      <0x4 0x81600000 0x0 0x4000>;
+			reg-names = "nvme", "ans";
+
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 1018 IRQ_TYPE_LEVEL_HIGH>;
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



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2022606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g34L6ejK;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=is5rjkXy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ig8NpIwfuVm57PMXnS1/HkeHo8NBh9VYFSj4z2Q3cYI=; b=g34L6ejKqdDRKf
	OVnfoZevFgNUVv+UN1LHdrBB3j9nYRHidAoyjCqmYg4bjt6Fa/cSmMmNLruyyYZx6/+oQnPDVTXpP
	m9O04LjmZePQoWnxZdscDDgrvRUsjMD0MgjJkdmLnmT4W/LwnB5p56T06i4YJ2hsky7yTTt2vFblr
	4cGzllybOeDN8sLls22TPkCWjAOeS3BXkdoXJBiirZ2z3fDJNA0Vr/46vcEvtH8Gk80mLB06CPR+o
	dKsslPxweCp+4ZHcTT7eeTE4e/i3LZPdxGWkVRlpvV0YjYTRYBgCzRKNoIRJEGucMEYrs3IjMlUe9
	ABS3rhLepLxo0eA28XbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQFq-00000002hKi-0S3C;
	Mon, 23 Nov 2026 09:22:31 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQER-00000002gmp-2otn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:21:14 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so29082995e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 01:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425651; x=1796030451; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ig8NpIwfuVm57PMXnS1/HkeHo8NBh9VYFSj4z2Q3cYI=;
        b=is5rjkXyAZk/gdPB4hCA9eLzdRJeF4dJxOacloxN7WTUGbkWivoKAbXdJrbzhmU47h
         aZ8IMWwtT5RTbZXiLEGckwB4r6jSUA9/TQMnI6e/2tcr4U5L2YeIrZHCAE7AJ8jUK+kL
         rmkwWQMbgl2/eq0H54pgtakYM3IjSGdk/QfNFY199Ej3ds0aaYhfY/WWYW/7of9dnkvC
         w4JHrrB/Gz3MhSdnJR9pNcgNP0EpFLceYBKkr9ZG4+xlUFn28yq7FX5CYxLWV1GUgd0l
         zf8QCoUpqHZX56sWPCS6SGc5pHR1z6zA5OXCRZLTDS7EETxz6tdXeBXNoEYHupRjiesz
         SKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425651; x=1796030451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ig8NpIwfuVm57PMXnS1/HkeHo8NBh9VYFSj4z2Q3cYI=;
        b=KbsGpgWUXRc1nxqDyePxtMtrjC2nJQamiP5qF7KiTFzlRiHWe+8gOlCYsb0NoSSxoR
         TJXgv4T4QrdZLy/gLYCQTpLA3GQk/lcHI99iIb6CNFbAArZJbPSu69cP3g/eGqOHVEkV
         9qJAg7cdwL83cI6ODmyaAC9MywABl8yCf3CX2udUcqPQn6+GgxVQWC5IVzL0hfUIqDge
         pdqzGtr1g+nCCXxJ9iZkP256RwGKNNSqDzKzUFzjo7+dZjS7tysQU67tq22TGqloGsyi
         qsGGJn8HoMjkikH5LgZUCM2sc9Hn4o0+Jzks0pjHYeMMlVM2OCBqPwlGx1/lboiQaTNZ
         JGVQ==
X-Gm-Message-State: APuU4Z8dUdkWBPCHcqH+30XlUoIHz9KwnhdqiiFSsEt+aVMogCJzPT0q
	FgaNZkSWI06SPUKfQAubaGVw8LLeVovlSDJ+VvKPyVDA7rhi63cWCIqZemeH17U0Aps=
X-Gm-Gg: AZFdTZdf4zL43QeFy6dYCOf2s3OGwwf0Zese7HkzbAr41eMePCStBdoWyKyBif8msmD
	IOUvnlPIVHQErx2NHPiNl5GhFWO8Vb2J8/l/MrXoHAUlna2EfwCzSflPmizcMC7jLnj38RYqi2Y
	NOVzBh0QfQuyCQMsnj7utjeRDp67nHde0hbqE77+AjgKru4hzsCylMbsZV3r5Bn8vAwSKs+EBU0
	yjfu4pRpFe5884f0brx9nn3A2p1q6O2v4x9Y6y49SiiKNdeKopSn3V+568bU0o2PS/eCyVDKWzU
	1HBXGgHqER+1FqHyJPSMj37dBMr6JP20Cfhpknh+hw9IxqejjgZlvqnA/6iIH2lCBdlKiLLEjgG
	0wIeZcd58bfoZFWZGv1o41ykBWN8z4NKpzFJd6rDY3cheIn1ew+addi8ngCNwIkiDB2AGrS2HUF
	rOINTZHkrXEtFedv6ZJY/nIFsrZpJz7F7r/xGIoP7j2Mw+nU7ByaLFIzN2XbN3dqoJJab/bkZGb
	DRa4HgkmKZAF6/hu9kPNN2V8Z/+Ys+S+rCrIOFr58KxqwAcylLJriGqiod9qJRLQXoxxff/VBfL
	aFtjJGAHUE9A7bgNHVLkeCiKK5Wwx13gOolCdOBFDeXNPNB1hXYRQCMM+a2tLWw/TTF9joePrLv
	jI2yMJwXaeJN6vwZniBjP8e4ucKdFnUjWLqciOLt8KLvLtQ==
X-Received: by 2002:a05:600c:1548:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4bb88800020mr245433325e9.7.1795425651076;
        Mon, 23 Nov 2026 01:20:51 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm296458505e9.12.2026.11.23.01.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:20:50 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 23 Nov 2026 10:20:45 +0100
Subject: [PATCH 1/3] arm64: dts: amlogic: s7: add the SCMI firmware node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-upstream-s7-clk-dt-v1-1-95f46d67d8b4@baylibre.com>
References: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
In-Reply-To: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_012106_480301_46680A79 
X-CRM114-Status: GOOD (  13.46  )
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

The firmware of the Amlogic S7 SoC family exposes the clocks it owns
over SCMI. Add the SCMI node, its shared memory and a header with the
SCMI clock IDs.

Acked-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7-scmi-clk.h | 27 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi       | 29 +++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7-scmi-clk.h b/arch/arm64/boot/dts/amlogic/amlogic-s7-scmi-clk.h
new file mode 100644
index 000000000000..71630bc94531
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7-scmi-clk.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 BayLibre, SAS.
+ */
+
+#ifndef __DTS_AMLOGIC_S7_SCMI_CLK_H
+#define __DTS_AMLOGIC_S7_SCMI_CLK_H
+
+#define CLKID_DDR_PHY_OSC			0
+#define CLKID_USB1_PLL_OSC			1
+#define CLKID_TOP_PLL_OSC			2
+#define CLKID_HDMI_PLL_OSC			3
+#define CLKID_USB0_PHY_PLL_OSC			4
+#define CLKID_USB1_PHY_PLL_OSC			5
+#define CLKID_USB0_PLL_OSC			6
+#define CLKID_ETH_PLL_OSC			7
+#define CLKID_ADC_PLL_OSC			8
+#define CLKID_CPU_CLK				9
+#define CLKID_DSU_CLK				10
+#define CLKID_GP1_PLL				11
+#define CLKID_ACLKM				12
+#define CLKID_PWM_G				13
+#define CLKID_PWM_H				14
+#define CLKID_PWM_I				15
+#define CLKID_PWM_J				16
+
+#endif /* __DTS_AMLOGIC_S7_SCMI_CLK_H */
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 64440df4f542..69dec312e7d6 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 #include <dt-bindings/power/amlogic,s7-pwrc.h>
+#include "amlogic-s7-scmi-clk.h"
 
 / {
 	cpus {
@@ -109,6 +110,34 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	sram@50f6000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0x050f6000 0x0 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x0 0x050f6000 0x100>;
+
+		scmi_shmem: sram@0 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0x100>;
+		};
+	};
+
+	firmware {
+		scmi: scmi {
+			compatible = "arm,scmi-smc";
+			arm,smc-id = <0x820000c1>;
+			shmem = <&scmi_shmem>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;

-- 
2.56.1



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74AD60A2611
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 16:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WDwNLIdJ;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ZO+hpJBh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=a35Mq+RYpt2dEaWC1d1eJMfVyB9If3Q8Pl622VJ/HUQ=; b=WDwNLIdJzNHsClaL+BYSOhqwD3
	CKelUZzb5xA3CS5tkvfrnbCmGH1hlV5EgoQwtyzUrSIkdu/pVlPOCYud1sPQqTaVprlADKd/XfWwK
	gDmg0DGdZJqROw5JmkoX0YUfrhUZtizynsqs4vLHNnu5uoKQebeJqh5UG9KbcHJ0+EaMXDYwD0cVM
	+1lzl6D6gtfcfV+P93tYA3xoVe2l7HYH7ozjB/J02VgnCjkKBZu5EXo8fmAkPuod8imZVXcetBsS2
	Wag3ja1Y/peZRY9GOlqTKjtag4MDpf411a/4ONFZSaHcnnN+6KiMPzp8o4CH1y5P9Jyl6pxKZEccS
	DXbABOZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUREB-0000000FWoV-1cyn;
	Fri, 20 Nov 2026 16:12:43 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURDb-0000000FWk9-3keB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 16:12:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so11664305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 08:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795191126; x=1795795926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a35Mq+RYpt2dEaWC1d1eJMfVyB9If3Q8Pl622VJ/HUQ=;
        b=ZO+hpJBhDYuAgOQ6eL/seuYpsMyaSJBmPb5G3UHZEVO+4K/zZzH/kTZj/8BE2SOk70
         b3RMNLHbhqenrquhET/3ZCD6iKC41YnIpKBVqkEsCv9/3+cqIPWXd88WhnIgL27algtj
         90hgJCPYIjjiPzVAtyd57dLr4YYzij/zB53Z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191126; x=1795795926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a35Mq+RYpt2dEaWC1d1eJMfVyB9If3Q8Pl622VJ/HUQ=;
        b=VBnWoWzRlfcOlTfRpvWIC79pErsdoNCsRjfBvfeAgIXh8zzQKNFENHMH3tO3YV4qT7
         NsKV+dalRtm3tSst30SjZzB7Fn6z062C0Dwcqhc8Cc6B/tPYvtPI0K9R79LhW9QvuGir
         M0gR9GYt88aZPkN+krucBZvrpo8CeBf7p7SyaybSFdlH2qyQFklcDF8485h0mcAXH0Cw
         DVaz7s4Za3pJKMvwMoLFEucFldmCU1E4q22gYAOXNs7PFoylia1vF5fnh7r4rMoj2GQ+
         vmavz3ej3SwccWApVl825jqUhYeie2dDpxp1nl7cIE9DOxj0Ul/d3ljgQAY3GLEDRxaT
         /YhQ==
X-Forwarded-Encrypted: i=1; AL+hErFC0WooOkFr1/JuE136rgbA+85IJ8G5hFFo8YOtZz0kbwgPDOZSKQCd7P3zURO0dGnnwbMrrpNSeC9PsCsyHOjc@lists.infradead.org
X-Gm-Message-State: APuU4Z86gq4i2xbg/EbgVnY8Wd39p7G8W9WtiZMwEgOq9zH3Me0NDpWn
	LdsLpDbSvG+hB+vEMdjOTi6le0Cw1iGrNLxJq9ztNve5AvzNkfXmjs8lMv4D1wbi3Ow=
X-Gm-Gg: AYBFou1UGXV3btCIMXlgOKP5GIpI4bMF/ScWJqtrfV7D9JET67dEhk1uC8ekkTL2RDL
	tm4t6IttrMtvv6ak3nBHe6MkM7txKsnRlZRGd4gUfzcehvQMXZ6AAq4tPSvTmUisY3K9iAt4NHU
	6df+PuybCmJHuudubB6HcHbx76/dxicGrmTHGddOvrcbgzKWVUwh4ZW36j/8tcoSsZ8vRI8YnKK
	G5/jBh9JWAP5LvAKqZaKi+/J8CpVreJXEvUxim3px1UWN9zv8RQskNs4juPpt/qEdFiS9QeU5hZ
	9QYu5ArI63YW/wCfuAat3FZ9a1tbX+6bSviN8DVmWtxyS1m6X7tvQ7mLrUqzvDGoIrVtybtQe07
	29V6ZlEbcbRAfveQM4ACYKLztf40j7KIkS3+PgSNOQ1PFiy4fgwTlbK7OqTPSFTRXI1odiYHyF5
	Yewej05OsPOZgvw4ToV1FlhHWyUVDEnmblDBYW2s0SnhgWEuhuEbqlDniBgFVq36MAvYJmqBrlH
	uQMQEfPVagyg8vs6u8Yu2YAYiPqTmsDEHZa7t8uBvFvjQWtBE6u7dsEqeztcEEIsfs28/Xgfg1b
	WofysP/f6mtfd0+Y5E29QpapdC/lnzm5o793wC5vpwZRKKoiEZqZ2FfnD6TLFS+lOwD0rnrgHs4
	8KO9GQfHc8/+kk06K7ajKNFyW6UzKL99IP2zRpcspJEnLf6ZMy4I=
X-Received: by 2002:a05:600c:a15:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4bb88938a62mr81026755e9.28.1795191125848;
        Fri, 20 Nov 2026 08:12:05 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm143459745e9.3.2026.11.20.08.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:12:05 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: imx8mn-bsh-smm-s2/pro: add boot phase properties
Date: Fri, 20 Nov 2026 17:11:53 +0100
Message-ID: <20261120161159.1944199-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_081221_521833_A54F37CA 
X-CRM114-Status: GOOD (  10.81  )
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

Add boot phase properties to the resources needed during the boot
process.

The BSH SMM S2 and S2PRO need UART, watchdog, PMIC, GPIO and boot
device access.

Tested on BSH SMM S2PRO with U-Boot v2027.01-rc1.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 .../freescale/imx8mn-bsh-smm-s2-common.dtsi   | 22 +++++++++++++++++++
 .../boot/dts/freescale/imx8mn-bsh-smm-s2.dts  |  2 ++
 .../dts/freescale/imx8mn-bsh-smm-s2pro.dts    |  2 ++
 3 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index d20393c2d901..5515236d3c09 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -77,10 +77,23 @@ ethphy0: ethernet-phy@0 {
 	};
 };
 
+&gpio1 {
+	bootph-pre-ram;
+};
+
+&gpio2 {
+	bootph-pre-ram;
+};
+
+&gpio4 {
+	bootph-pre-ram;
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c1>;
+	bootph-pre-ram;
 	status = "okay";
 
 	bd71847: pmic@4b {
@@ -95,8 +108,11 @@ bd71847: pmic@4b {
 		#clock-cells = <0>;
 		clocks = <&osc_32k>;
 		clock-output-names = "clk-32k-out";
+		bootph-pre-ram;
 
 		regulators {
+			bootph-pre-ram;
+
 			buck1_reg: BUCK1 {
 				/* PMIC_BUCK1 - VDD_SOC */
 				regulator-name = "buck1";
@@ -244,6 +260,7 @@ bluetooth {
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -280,6 +297,7 @@ &wdog1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdog>;
 	fsl,ext-reset-output;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -326,6 +344,7 @@ pinctrl_i2c1: i2c1grp {
 			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL			0x400000c2
 			MX8MN_IOMUXC_I2C1_SDA_I2C1_SDA			0x400000c2
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_i2c3: i2c3grp {
@@ -346,6 +365,7 @@ pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
 			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x040
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_uart2: uart2grp {
@@ -369,6 +389,7 @@ pinctrl_uart4: uart4grp {
 			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX		0x040
 			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX		0x040
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc2: usdhc2grp {
@@ -414,6 +435,7 @@ pinctrl_wdog: wdoggrp {
 		fsl,pins = <
 			MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B		0x046
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_wlan: wlangrp {
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
index 11a1ba5bfdb7..5add6a8e1c59 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
@@ -21,6 +21,7 @@ memory@40000000 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -43,5 +44,6 @@ MX8MN_IOMUXC_NAND_READY_B_RAWNAND_READY_B	0x00000056
 			MX8MN_IOMUXC_NAND_WE_B_RAWNAND_WE_B		0x00000096
 			MX8MN_IOMUXC_NAND_WP_B_RAWNAND_WP_B		0x00000096
 		>;
+		bootph-pre-ram;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
index 475cbf9e0d1e..b48905a9b4dd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
@@ -85,6 +85,7 @@ &usdhc1 {
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
 	bus-width = <8>;
 	non-removable;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -133,6 +134,7 @@ MX8MN_IOMUXC_SD1_DATA6_USDHC1_DATA6		0x0d0
 			MX8MN_IOMUXC_SD1_DATA7_USDHC1_DATA7		0x0d0
 			MX8MN_IOMUXC_SD1_STROBE_USDHC1_STROBE		0x090
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
---
base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
branch: imx8mn-bsh-smm-s2-bootph

-- 
2.43.0



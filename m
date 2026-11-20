Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94546606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 08:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IzYQ6Zux
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cYchM3oZ++2Ujm+8cyxvkhBnotq5TY4DS45oyevJ/6I=; b=IzYQ6ZuxibzimEKI++XUWdndOw
	n8MNRVcevx++RrL6Va+LO68WYo35FtZ053X8qkWFVn5EEPNEYgh8KPUOY5K+kL0WG1NLSLBYtQYq4
	nDolqYLHjbxM2OqErjzs6szLpr8ynK81oGdMLBsM0MJ6+z/hHuzJEp/OCppeCHpsAedu6NgEA9HkP
	W67049uxkIdX3yurYPirYto2F/ogifmyEqlQLftMm2b+WHMEAqKzhjntCQDp6Jg1jBoH3he5w4+4s
	vyzXHPgrfztTvgDHqHbfMstuK5AW/OkBVj/leXjEEgV5dlQCPyWJzXoXCulrQyBv+NoqDisIOTPSC
	NcoMUZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJgN-0000000EIeU-25tQ;
	Fri, 20 Nov 2026 08:09:19 +0000
Received: from [64.106.246.77] (helo=mailsc.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJft-0000000EIRT-1r3l;
	Fri, 20 Nov 2026 08:08:53 +0000
Received: from rd03-sz.software.amlogic (10.28.11.121) by mailsc.amlogic.com
 (10.8.11.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 20 Nov
 2026 00:08:46 -0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Rob Herring <robh@kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-can@vger.kernel.org>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH 3/3] arm64: dts: amlogic: a9: add CAN controller node
Date: Fri, 20 Nov 2026 16:08:20 +0800
Message-ID: <20261120080820.3340646-4-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261120080820.3340646-1-zelong.dong@amlogic.com>
References: <20261120080820.3340646-1-zelong.dong@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mailsh.amlogic.com (10.18.11.5) To mailsc.amlogic.com
 (10.8.11.35)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_000852_127038_5EC19D4A 
X-CRM114-Status: UNSURE (   7.91  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zelong Dong <zelong.dong@amlogic.com>

Add the CAN controller node and its pinmux states to the Amlogic A9
SoC device tree. Enable the controller on the A311Y3 BY401 board.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 .../dts/amlogic/amlogic-a9-a311y3-by401.dts   |  7 ++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi   | 25 +++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
index 503e38a29ce6..dffcdd4c35d0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
@@ -136,3 +136,10 @@ &spisg_e {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spisg_e_pins_z>;
 };
+
+&canbus {
+	pinctrl-0 = <&can0_pins>;
+	pinctrl-1 = <&can0_pins_sleep>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
index 509dd1c37a5d..7c3734c4d23f 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
@@ -605,6 +605,20 @@ spisg_e_pins_z: group-spisg-e-pins {
 						drive-strength-microamp = <3000>;
 					};
 				};
+
+				func-can0 {
+					can0_pins: group-can0-pins {
+						pinmux = <AML_PINMUX(AMLOGIC_GPIO_A, 18, 3)>,
+							 <AML_PINMUX(AMLOGIC_GPIO_A, 19, 3)>;
+						bias-disable;
+					};
+
+					can0_pins_sleep: group-can0-pins-sleep {
+						pinmux = <AML_PINMUX(AMLOGIC_GPIO_A, 18, 0)>,
+							 <AML_PINMUX(AMLOGIC_GPIO_A, 19, 0)>;
+						input-enable;
+					};
+				};
 			};
 
 			spisg_e: spi@50100 {
@@ -677,6 +691,17 @@ i2c8: i2c@3a4800 {
 				clocks = <&clkc_periphs CLKID_SYS_I2C_M_I>;
 				status = "disabled";
 			};
+
+			canbus: can@3a8000 {
+				compatible = "amlogic,a9-can";
+				reg = <0x0 0x3a8000 0x0 0x383c>;
+				interrupts = <GIC_SPI 82 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc_periphs CLKID_CAN0_PE>,
+					 <&clkc_periphs CLKID_CAN0_FILTER>;
+				clock-names = "can_pe", "can_filter";
+				power-domains = <&pwrc PWRC_A9_CAN0_ID>;
+				status = "disabled";
+			};
 		};
 
 		gic: interrupt-controller@ff800000 {
-- 
2.47.1



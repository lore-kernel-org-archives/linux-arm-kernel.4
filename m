Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A8060A2614
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ysE/sSIR;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vd/Jxw9Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7fnh/1KmjFjEPtr//fod/I5Z9kbTxg0SKyfXY+qNzcY=; b=ysE/sSIROuSbAF
	dMWJCNZ+4AyCnDkepSpQ2ybRnJjQ/mhR/wSWHt2oUR4nDLIpf7x8woFWNr3I+sk+4Mn7DeewCO+D/
	zi+i5OVffGSeiiVEM8PBflJ4TiVUe8zywUVnptAkxhIo6qbr/FeQXUiFBvyXooEBC7T/L/yjVbxgn
	Ru/FpfBDeISPEvvgvEs3v/o5PEBvHT9V1GWVFnojhjuYiTDWtrt0zmAX7jduWGdY1f4/JawHUbAlH
	58VmbXIiCXjNVfxBanEvgeeJiiDfj7GxPmPfjJKWkS/uCqdDKdwXsH11I8oo9/vzTrEd4I8dX9f7M
	S3JNfn+c0PpYml+J0luA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8hx-00000006sOj-3Oc2;
	Wed, 11 Nov 2026 13:49:49 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8hv-00000006sMi-0JsN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:49:48 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-8b360828905so32043417b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 05:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404986; x=1795009786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7fnh/1KmjFjEPtr//fod/I5Z9kbTxg0SKyfXY+qNzcY=;
        b=vd/Jxw9QFUMyDrMrkxXTal4Osh46CuymxwZk/CLQ2PYJ6L7AkAI9hdGWddcuWNqr+X
         siH6U1q95u5ry8pDg7Uf3OQpdDis4yPAYHU2/q2EOOFqNW7Hu6/WtgQyBRJ7bonjsbeP
         gt3V30WO9h7VlvNJhPVkPRnwpp5+vfMK6bagTTuUHqDHdbZPqIYrR7WsqC6vIqlYWuH5
         FYA5izGU/41+ekwbagtcTHDN9zGEEd/O7jJAT9RHA3tS19T2CjCqzJuEQxcU0oBv5j6l
         4/xlPTR5NCu1z7JT5DesJGkn72H72gBbtSVcnbFPmp2vl9cVSt0viJCeRrAOcjjSsace
         /PvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404986; x=1795009786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7fnh/1KmjFjEPtr//fod/I5Z9kbTxg0SKyfXY+qNzcY=;
        b=bTGFAKVQJNc+cA5ln4TD0G1+UU/3mnKUUbftP6UYnrGfQcxl2zGMD1Bglb4l6lGCQM
         3M2FiFEJWSjghy01ZA2xjIny++csJtmLRHp6aqTG5MivjOm76GR2D/6RG1nDfNeiDAXi
         E9TBbecYsrI5j9rkO8BP3zjxzbUiu6qGJMP3AZ2LQ/3AkK2BK6Wu/nPOPMeLFB3nWNhG
         EWwKcLpGsehMFkVRmGY3B/HptW0Zb7KHCPpMVsLrAIenIe6h6lutqgQhp7JBrvMg7Qzh
         3UQdXXt8C3RsDCynjaXThnZXVgCAzKzk7SEabzAETsBKVyM4feM/+I1m6PQHrVRKAZii
         3v9Q==
X-Forwarded-Encrypted: i=1; AL+hErHFXI3eiBvJkhIzz1DJyQm4IEZh0PDhosp6Jx0yYWUORuv7re1Qsi8438HlhXhArFO54w3qkQspQH+p3/q+FCb6@lists.infradead.org
X-Gm-Message-State: APuU4Z8BDcIQ+2qV07EzBbrGLSF9jhsajmBv7Mdn63c0uWjr03SUl2F6
	qkLInvVMjr0fReF9/tD/oDyx0wMWRh2NzNGwfK0sYxTWUGxauMXbGQX+
X-Gm-Gg: AYBFou1aXpWytxQ+mVR3che8qZR4ajnUGZAtWV9BxqiFqmV9Iz3GFMpxRjVUUiHJp76
	o4dpOYY9lx2GAwcbF9VssxdOK9nlQLc7dZ6kEh1jeZed4KP8wRKzepk5qsrWXAmL5DmtIXAMbFT
	EvaidygPO4Xnxir5vV2nQC87q2MlVb2IZmn1QJKQBWYeR+Q83wEi/LC1jB59d+k1BHI32hOTlVa
	bs09bQRbCerS7gSp0yOPyb46tT7mICg6nW78y66TYulTEIsNPnKpbtLvjm0Vvv/1sk0ZWsuNPF0
	drsawIm4p5ftmBmRhKc2lqNnSP6oILHOJq1X32j4HLEocY7CRcGndcrG5+nhpoGKFCzQP7UjmgY
	oD10FzxoLxqX4Bo21WIzczHii5/laIds4FKR8tU3jSoEzlP9Ika1DLFHXU+eTQAzVIwGFVf8ZXQ
	MwgJQZnEi+kuVZkgsg9lpyqJ1kd/jgQU+3Yz9/6VJO+IC0G+yVAb/JssQTxtvDXqqDTgZyOqCVn
	evqAIR/TfCdPLEwZ7wBwAP9JoWWtlDC4LW/oHwUiFIB/bgruJHKBEUyLWaZubLt6clxD80DIXBW
	BC9sqos+vvCMC8BKQ1SRwc3e7Ay6zt0KZ0LB2rAOOsGIoGe8KiHYI1M8Ts9P7cTSzDAUyNWHCFm
	3fDi60AnVPbdNL2a6loB/lCVuwof/PLS+TMuTEscQdpwDLbRbqmQs7jGL2FcNnhve+aWVzhoPlg
	o=
X-Received: by 2002:a05:690c:86:b0:8b3:2445:889b with SMTP id 00721157ae682-8b3a81d8df2mr17180577b3.91.1794404985437;
        Wed, 11 Nov 2026 05:49:45 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393426f13sm44519817b3.34.2026.11.11.05.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:49:45 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: allwinner: add Radxa Cubie A7Z board
Date: Wed, 11 Nov 2026 10:49:16 -0300
Message-ID: <20261111134919.90264-3-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_054947_140951_E5032F8B 
X-CRM114-Status: GOOD (  15.98  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the device tree for the Radxa Cubie A7Z. Describe UART0, the AXP318W
PMIC over R-I2C0, MMC0, RTC and the bank supplies. It is based on the
Cubie A7S DT.

Unlike the A7S, this board uses BLDO5 for PG and a SY8089 regulator for
the PMIC's BLDO and CLDO inputs, and the microSD card-detect line has an
external pull-up, so no internal pull-down is used. ELDO1 only supplies
VDD2L for LPDDR5 and this board uses LPDDR4, so it is not described.
SWOUT1 only feeds ports D and J on the 40-pin header, so it is not kept
always-on.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7z.dts   | 286 ++++++++++++++++++
 2 files changed, 287 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 792152525b43..2eee91dcbd77 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -69,3 +69,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7z.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
new file mode 100644
index 000000000000..ab3d3d70f9ff
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
@@ -0,0 +1,286 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/dts-v1/;
+
+#include "sun60i-a733.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Radxa Cubie A7Z";
+	compatible = "radxa,cubie-a7z", "allwinner,sun60i-a733";
+
+	aliases {
+		mmc0 = &mmc0;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_ps: regulator-system-power {
+		compatible = "regulator-fixed";
+		regulator-name = "ps";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	reg_ldo_input: regulator-ldo-input {
+		compatible = "regulator-fixed";
+		regulator-name = "ldo2v5-input";
+		/* SY8089: 0.6 V * (1 + RP11 / RP6), 30k / 10k. */
+		regulator-min-microvolt = <2400000>;
+		regulator-max-microvolt = <2400000>;
+		regulator-always-on;
+		vin-supply = <&reg_ps>;
+	};
+
+	osc32k: osc32k-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu4 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu5 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu6 {
+	cpu-supply = <&reg_dcdc3>;
+};
+
+&cpu7 {
+	cpu-supply = <&reg_dcdc3>;
+};
+
+&mmc0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	/* PF6 has an external 10k pull-up and reads high with a card. */
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
+	disable-wp;
+	max-frequency = <50000000>;
+	no-1-8-v;
+	vmmc-supply = <&reg_swout2>;
+	/* The 3.3 V path uses VCC-IO; no Port F voltage switching yet. */
+	vqmmc-supply = <&reg_swout2>;
+	status = "okay";
+};
+
+&osc {
+	clock-frequency = <26000000>;
+};
+
+&pio {
+	vcc-pb-supply = <&reg_swout2>;
+	vcc-pc-supply = <&reg_cldo5>;
+	vcc-pd-supply = <&reg_swout1>;
+	vcc-pe-supply = <&reg_bldo1>;
+	/* CLDO5 feeds VCC18-PF; the 3.3 V path uses VCC-IO. */
+	vcc-pf-supply = <&reg_cldo5>;
+	vcc-pg-supply = <&reg_bldo5>;
+	vcc-ph-supply = <&reg_swout2>;
+	vcc-pj-supply = <&reg_swout1>;
+	vcc-pk-supply = <&reg_bldo1>;
+};
+
+&r_i2c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_i2c0_pl_pins>;
+
+	axp318w: pmic@36 {
+		compatible = "x-powers,axp318w";
+		reg = <0x36>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		aldo156in-supply = <&reg_ps>;
+		aldo234in-supply = <&reg_aldo1>;
+		bldoin-supply = <&reg_ldo_input>;
+		cldoin-supply = <&reg_ldo_input>;
+		dldoin-supply = <&reg_ps>;
+		eldoin-supply = <&reg_dcdc9>;
+		ips-supply = <&reg_ps>;
+		vin19-supply = <&reg_ps>;
+		vin23-supply = <&reg_ps>;
+		vin45-supply = <&reg_ps>;
+		vin678-supply = <&reg_ps>;
+
+		regulators {
+			reg_dcdc1: dcdc1 {
+				regulator-name = "vcc-3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc2: dcdc2 {
+				regulator-name = "vdd-sys";
+				regulator-always-on;
+			};
+
+			reg_dcdc3: dcdc3 {
+				regulator-name = "vdd-cpub";
+				regulator-always-on;
+			};
+
+			reg_dcdc4: dcdc4 {
+				regulator-name = "vdd-gpu";
+				regulator-always-on;
+			};
+
+			reg_dcdc5: dcdc5 {
+				regulator-name = "vdd-cpul";
+				regulator-always-on;
+			};
+
+			reg_dcdc6: dcdc6 {
+				regulator-name = "vcc-draml";
+				regulator-always-on;
+			};
+
+			reg_dcdc7: dcdc7 {
+				regulator-name = "vcc-dram";
+				regulator-always-on;
+			};
+
+			reg_dcdc8: dcdc8 {
+				regulator-name = "vcc-ufs-io";
+				regulator-always-on;
+			};
+
+			reg_dcdc9: dcdc9 {
+				regulator-name = "eldo-input";
+				regulator-always-on;
+			};
+
+			reg_swout1: swout1 {
+				regulator-name = "vcc33-lcd";
+			};
+
+			reg_swout2: swout2 {
+				regulator-name = "vcc-io-card";
+				regulator-always-on;
+			};
+
+			reg_aldo1: aldo1 {
+				regulator-name = "vcc-pl";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-name = "vcc-pe-pk-mcsi";
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-name = "vcc-lvds0";
+				regulator-always-on;
+			};
+
+			reg_bldo4: bldo4 {
+				regulator-name = "vcc18-codec";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_bldo5: bldo5 {
+				regulator-name = "vcc-pg";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_cldo1: cldo1 {
+				regulator-name = "vcc33-18-usb";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_cldo2: cldo2 {
+				regulator-name = "vcc18-hdmi";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_cldo3: cldo3 {
+				regulator-name = "vcc-pll-dram";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_cldo5: cldo5 {
+				regulator-name = "vcc18-pf-pc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_dldo1: dldo1 {
+				regulator-name = "vcc-efuse";
+				regulator-always-on;
+			};
+
+			reg_dldo6: dldo6 {
+				regulator-name = "vcc-ufs";
+				regulator-always-on;
+			};
+
+			reg_eldo6: eldo6 {
+				regulator-name = "vdd-cpus";
+				regulator-always-on;
+			};
+
+			reg_rtc_ldo: rtc-ldo {
+				regulator-name = "vcc-rtc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&r_pio {
+	/* PL powers the PMIC bus itself; firmware must keep ALDO1 enabled. */
+	vcc-pm-supply = <&reg_aldo1>;
+};
+
+&rtc {
+	clocks = <&r_ccu CLK_BUS_R_RTC>, <&osc>, <&r_ccu CLK_R_AHB>,
+		 <&osc32k>;
+	clock-names = "bus", "hosc", "ahb", "ext-osc32k";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
-- 
2.43.0



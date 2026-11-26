Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07917606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lnc37jC7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3fUcWHc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=urUrC8vOrMcPIBkoArInjGyKwk2LYSJhIaWR1xtUK1M=; b=Lnc37jC7Gs3/Sj
	ZWgGEHZo/Uedv7NET/uaYmW6xW8QuMOST7pKvR6pjtgPccE1OaQLyaoNtGH98gEC9M6SSPAF8Gdy2
	T+Yaywd+GGHJTX3j86tRD53FgorYSerPJxY5xPbckujY8IjsqWcTLW1opBnwit9BWDP81OaJJ62Xt
	V4mKlgQxSSoB/u8YBsqtdSShrre03acUN73m0U681JlruNYpT53PtpJRjwDwK+dCXSPyHjiFs//JI
	fbdn4AQ9RrstPwTMOOvHBIGMPxWqK8nh8NKeuoDN9e30iLkFTWvb6jsupApWuLQJd+pYFilgCrr0Q
	jDazjX13ER+TI2y5p08A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgCK-0000000EU7w-1gZZ;
	Thu, 26 Nov 2026 20:36:04 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgC9-0000000EU0J-2er4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 20:35:57 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-85a5455bd3cso4062025a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725352; x=1796330152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urUrC8vOrMcPIBkoArInjGyKwk2LYSJhIaWR1xtUK1M=;
        b=q3fUcWHcfmDGLx0uzbwYs7UZcK+kS7OdIGrbxMh9RvlwYC5ElK/NMkG52fjtl9cKjl
         KnePPJ+/weQ5u1+UfB7ty0V03H3pCwVdpFBdZcmXzoxCghNHZlntLP/qFAmAZpUFuu55
         okmIwAYoGuUNZsebwbQUCEKO6UroViVpojJPr8MKDWUKNq0aJkmUZMB3KvCu37qdVLj+
         FymCX2laf9NFpdbtCIXlwa0VF3UWWa28yx1FP0Ctuq5LccyRP7H4RJ+0hmF7uRhydL4R
         5VNPSAoJF2LBMxWpCGQnBrW6RJozQG87fbJswhhjI1nfqM88GDw2DuyXmAZq0TUqYE8N
         Nepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725352; x=1796330152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=urUrC8vOrMcPIBkoArInjGyKwk2LYSJhIaWR1xtUK1M=;
        b=IkZznIUzaBEWFKjWTfWh7bpn+J+SpOlVKoR6zCZzwfSptkI+wFvM+A0b1Xhnu/sZ9h
         PBK1ZEe4zSPbOuShYzpvQCi2MsZuTa93cQHaS4MqODs+ia0lM3bRNRgde+uHZQ2FSQn3
         rr7uXsTfd0jdZtKICCgN7dFqhjrDyqisXYOvsiSp9GEOS05yNTwMK+6it6nFP3cpYtOr
         rIdGY6O/tVjERdXjEqfxrNeBurbflgTbKGCEkmQ93XtE1SL4u9geOC3uCbhdTlQTP68J
         yWjHzpbCANs5amyhxQEB0/YXxbSC09YK0CC4Uv7xDnhxgPhEavTEIOIuFOZb2QVLLPGc
         txXg==
X-Forwarded-Encrypted: i=1; AL+hErG/qhomBt9Jkw3B6QInCF6/Z7n8P9LPrZPnDzHT5A5OJ7nQ/rfLVn64YQUM1kSCXQsX/0cYjopc3ZvhjfNbtU9Q@lists.infradead.org
X-Gm-Message-State: APuU4Z+BWQO2oU90s9qErqgl93bLTafKcJage4I1TVCe1ea4Vf9+YncJ
	Y2e8NXiuwI4dPXEXZk3RlPHua3/RPQkGW0lOCCTHvTEqo9LDeGdXpLny
X-Gm-Gg: AZFdTZdkFRMXExAHT0l4g8Mb/yjMlONOayTCAXzVCQGFCtvRGrFdIy+eQBpHz+C8VGd
	futEyZvaWtbVjWgTTeUDiS/LYF3tHUol20D+Ug6OGeGq2P3Xlci4VdztzzP4RNR955gOK2emukV
	b+2YpsQM+9JpweymebJvrYmvmFm6M+7f4jt0klJlgpK20I0J6FCNeJbO2qe0ekgxdczCibvrhk6
	Ac8V+A6WwhTWhph+MgNvqyxcjzkaaXmRu9vXiDfa63kEq869NyH2IMbnfwNIhQdBaWMylMxe+Li
	O4wswXO6PB71ntJnod3X3vIdPSUtlczkofLZlZdBGLzGb7ySnraW+ZWShE/ZgFrTUVxdN/VuNNS
	2NN1Qg9aUIpAZRS8CDviRupQFrP5zsIsSqHQHmKxo1ugMvspVpZ9sl79dHtaTqcYqKrrbCfekq2
	1U9cpdmFqYTUOJOpjXZv5H5uGnx/WW2fBAvsyC0XewlEcnz5gZDnKcA0A0nqNtzU72HDICCK1lX
	wz32HzloE/mEzHsvATFtgfdGLxy0Pc0El9GjVAQJRQQDkDtfJy/cCK8/GYIB/GGJvnVJ9nzs99a
	Oq4tPEgHvWGflbhk/8bfiW8I9PXv1xITlgzfsjM+1JtnIJoFBRJhYqGKk61aUePlu0+FdtOY/d+
	xUIZzrw==
X-Received: by 2002:a05:6830:a8b:b0:862:a391:3257 with SMTP id 46e09a7af769-86315a2d8c7mr20892844a34.28.1795725352411;
        Thu, 26 Nov 2026 12:35:52 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863169105b7sm16806490a34.22.2026.11.26.12.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:35:51 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: [PATCH v6 3/5] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Thu, 26 Nov 2026 15:35:49 -0500
Message-ID: <20261126-a733-cubie-a7s-dt-v6-3@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_123553_709979_F7A30036 
X-CRM114-Status: GOOD (  18.52  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable the serial console, PMIC and microSD slot for initial Cubie A7S
bring-up with vendor firmware, using the new common A733 description.
Describe the oscillator inputs and power tree using the Radxa A7S
v1.10 schematic, sheets 4, 7 and 8. Keep the boot-critical supplies
enabled. Sheet 4 shows VCC5V0_SYS feeding DCIN and the PMIC PS output
feeding the buck inputs and UP11. Set DCDC9 to 1.240 V, the boot
firmware selector read back on the board for the ELDO input. Keep
ELDO1 enabled at the firmware-selected voltage while the VDD2L range
for the fitted memory is being confirmed.

Use the Radxa 5.15 BSP CPU and GPU OPP envelopes for DCDC3/5 and
DCDC4. Use its regulator readback for DCDC2, BLDO1, DLDO1 and ELDO6,
consistent with sheets 4 and 8 and the VCC-MCSI entry in the A733
datasheet.

Allow 0.50-0.60 V on DCDC6, covering the 0.50 V LPDDR5 and 0.60 V
LPDDR4X VDDQ options on sheet 5. Allow 1.05-1.10 V on DCDC7,
covering LPDDR5 VDD2H at 1.05 V and the 1.10 V DRAM rail shown on
sheets 4 and 5. The BSP readback was 0.56 V and 1.08 V, respectively.
Both fall inside the bounds, so those selector values can be kept
after DRAM training. Set the LVDS0 supply to 1.8 V per the A733
Datasheet v1.00, table 5-2, and leave its enable under consumer control.
Omit the unused UFS and codec regulator nodes (schematic sheets 4 and 6).

Use SWOUT2 for the card and the Port F VCC-IO path (sheets 4, 7 and 13).
Firmware must select the 3.3 V PF path for use with MMC0. CLDO5
supplies the separate 1.8 V input. The controller uses fixed signalling
with no VQMMC regulator and advertises no UHS modes. Describe the
active-high card-detect line on PF6 and its pull-down.

Add the PM2 power and PJ26 status LEDs, and the BL24C16F on I2C0 as
shown on sheets 7 and 16. The EEPROM is at 0x50 in Radxa's 5.15 DT.
PC7 drives an inverter that pulls the EEPROM's write-protect pin low.

Keep ALDO1 always on for Port L, which powers the PMIC's own bus.
Omit the Port L supply phandle, as on the Cubie A5E: requesting
it would require the PMIC regulator before the PMIC can be reached.
The A733 pinctrl voltage-mode fix is required for the bank supply
connections.

Link: https://dl.radxa.com/cubie/a7s/hw/radxa_cubie_a7s_schematic_v1.10.pdf
Link: https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38be8d3c1ee851019795/configs/cubie_a7s/linux-5.15/board.dts#L372-L384
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Changes since v5:
- Distinguish the 5 V DCIN supply from the PMIC PS output and rename
  the fixed LDO input regulator. Rename and move the 32 kHz clock.
- Order the regulator nodes, set DCDC9 to 1.240 V and omit blank
  lines before status. Keep ELDO1 without voltage bounds.
- Remove cap-sdio-irq since sunxi-mmc already sets MMC_CAP_SDIO_IRQ.
- Norman's v5 hardware report is linked from the cover. The revised
  supply graph and DCDC9 constraint still need a hardware run.

 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 333 ++++++++++++++++++
 2 files changed, 334 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index da39f02252d4..9d1e740ff19e 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -69,3 +69,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-cubie-a5e.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
new file mode 100644
index 000000000000..98a878a2d739
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
@@ -0,0 +1,333 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/dts-v1/;
+
+#include "sun60i-a733.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Radxa Cubie A7S";
+	compatible = "radxa,cubie-a7s", "allwinner,sun60i-a733";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	osc32k: clock-osc32k {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		power-led {
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 */
+			default-state = "on";
+		};
+
+		status-led {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&pio 9 26 GPIO_ACTIVE_HIGH>; /* PJ26 */
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	reg_ldo_input: regulator-ldo2v5-input {
+		compatible = "regulator-fixed";
+		regulator-name = "ldo2v5-input";
+		regulator-min-microvolt = <2400000>;
+		regulator-max-microvolt = <2400000>;
+		regulator-always-on;
+		vin-supply = <&reg_ps>;
+	};
+
+	/* AXP318W PS output, routed back to the PMIC and to UP11. */
+	reg_ps: regulator-ps-output {
+		compatible = "regulator-fixed";
+		regulator-name = "ps-output";
+		regulator-always-on;
+		vin-supply = <&reg_vcc5v0_sys>;
+	};
+
+	reg_vcc5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0-sys";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
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
+&hosc {
+	clock-frequency = <26000000>;
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pg_pins>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "belling,bl24c16f", "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+		vcc-supply = <&reg_aldo1>;
+		wp-gpios = <&pio 2 7 GPIO_ACTIVE_LOW>; /* PC7 via Q2 */
+	};
+};
+
+&mmc0 {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
+	disable-wp;
+	no-1-8-v;
+	vmmc-supply = <&reg_swout2>;
+	status = "okay";
+};
+
+&pio {
+	vcc-pb-supply = <&reg_swout2>;	/* via VCC-IO */
+	vcc-pc-supply = <&reg_cldo5>;
+	vcc-pd-supply = <&reg_swout1>;
+	vcc-pe-supply = <&reg_bldo1>;
+	/* PF uses VCC-IO at 3.3 V, with CLDO5 as the 1.8 V input. */
+	vcc-pf-supply = <&reg_swout2>;
+	vcc-pg-supply = <&reg_aldo1>;
+	vcc-ph-supply = <&reg_swout2>;
+	vcc-pj-supply = <&reg_swout1>;
+	vcc-pk-supply = <&reg_bldo1>;
+};
+
+&r_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_i2c0_pl_pins>;
+	status = "okay";
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
+			reg_aldo1: aldo1 {
+				/* Port L powers the PMIC's own I2C bus. */
+				regulator-name = "vcc-pl";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-name = "vcc-pe-pk-mcsi";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-name = "vcc-lvds0";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_cldo1: cldo1 {
+				regulator-name = "vdd18-lpddr";
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
+				regulator-name = "vcc18-pc-comb0";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_dcdc1: dcdc1 {
+				/* Board 3.3 V loads and the SWOUT1/2 input. */
+				regulator-name = "vcc-3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc2: dcdc2 {
+				/* System and DRAM core/PHY supply. */
+				regulator-name = "vdd-sys";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc3: dcdc3 {
+				/* Powers the running Cortex-A76 CPUs. */
+				regulator-name = "vdd-cpub";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc4: dcdc4 {
+				regulator-name = "vdd-gpu";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <960000>;
+			};
+
+			reg_dcdc5: dcdc5 {
+				/* Powers the running Cortex-A55 CPUs. */
+				regulator-name = "vdd-cpul";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc6: dcdc6 {
+				/* DRAM PHY and LPDDR4X/LPDDR5 VDDQ (via RP15). */
+				regulator-name = "vcc-draml";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <600000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc7: dcdc7 {
+				/* DRAM PHY and LPDDR5 VDD2H (VCC-DRAM). */
+				regulator-name = "vcc-dram";
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc9: dcdc9 {
+				regulator-name = "eldo-input";
+				regulator-min-microvolt = <1240000>;
+				regulator-max-microvolt = <1240000>;
+			};
+
+			reg_dldo1: dldo1 {
+				/* SoC eFuse supply has no SID regulator consumer. */
+				regulator-name = "vcc-efuse";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_eldo1: eldo1 {
+				regulator-name = "vdd2l-lpddr";
+				regulator-always-on;
+			};
+
+			reg_eldo6: eldo6 {
+				/* Standby CPU and USB supply. */
+				regulator-name = "vdd-cpus";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+			};
+
+			reg_rtc_ldo: rtc-ldo {
+				regulator-name = "vcc-rtc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_swout1: swout1 {
+				regulator-name = "vcc33-lcd";
+			};
+
+			reg_swout2: swout2 {
+				/* VCC-IO to the console and microSD. */
+				regulator-name = "vcc-io-card";
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
+	clocks = <&r_ccu CLK_BUS_R_RTC>, <&hosc>, <&r_ccu CLK_R_AHB>,
+		 <&osc32k>;
+	clock-names = "bus", "hosc", "ahb", "ext-osc32k";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};



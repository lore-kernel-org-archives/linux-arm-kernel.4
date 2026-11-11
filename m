Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D14606B7BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 18:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UpfqfC1Z;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZ65QaD9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z0f4UdFcdCIjne4UCGJfkh/TdN8nWfrGk1TSR9G6FV0=; b=UpfqfC1Zh/5yoi
	svH1PV9/n5BVBPwNt/jedofSNiaFG5okPP8L7xMNwkH9pf0C/kCeprV8950nCktmWXkAjaMjiP5++
	uKxi7y/4PJ0G13hBHsD1jiJNdySTPjw6K3nAmJaTBPkjxZ1g/dJjFYd5ien0aZkPd6nQF+EYePKiL
	nYkmxdyk7vrMUhbDzBmku+S0jkzYZUKDguhWa3PvtWQPKpL6H55VpXbHUfb3mddjxAhhVkwNat/Ap
	ZP+d4eh9Z7gS8jVhnWJ9vcyxdOgCYEu2eb879Lp3UANZjYK9bh7eKfgAEvd7MuuRPxUxKvoBouz2b
	hxdQa8Ew0jUz13eoCiMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCvZ-00000007OBl-3Wwg;
	Wed, 11 Nov 2026 18:20:09 +0000
Received: from mail-oo2-x07.google.com ([2607:f8b0:4864:31::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCvT-00000007O7H-3sog
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 18:20:06 +0000
Received: by mail-oo2-x07.google.com with SMTP id 46e09a7af769-8210db80578so972903a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 10:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421203; x=1795026003; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z0f4UdFcdCIjne4UCGJfkh/TdN8nWfrGk1TSR9G6FV0=;
        b=FZ65QaD9F+33+GprB44ap4oA4he0LRc9qHD5tYD39tkFjzfVw8Zw0N7Lqo6ygi2YGO
         aWWBgOnC4WsfDuLpb20NgqGVKe2EW+7/gBt0ob7NKboBSRxic6+8UXdfZzo9WQVnLSas
         HM8FNTvTMd5frqP49kkv69NDjjdNmMIR+drOkW/WsKZXLjwL/fGI1eQmgfwNHGywsW0B
         WObU5oCMRufWkrbFNysX1NOu3d+hpJ9wemmFJbUsGQkHj5InqvEQFd9D235ZAojJbxI/
         5Df17iN29x9MJvkUJj+dZn2cBgZY7q3LMaMcy/HvWu6HMF7bPHKH/1xqNqd5eCGJNfkJ
         SEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421203; x=1795026003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0f4UdFcdCIjne4UCGJfkh/TdN8nWfrGk1TSR9G6FV0=;
        b=nlEvNWz39x5zoMMBzOVI/tSFZpv2AEnTfDa8HUDPhxiRDviMlI5TMMnu1Hy0Jo6STP
         Sqn6lmLZSeGocQHNeNzG60eGSJxs2EQ0Ej3S2dpKn8NUCc/MG2sOX5zQvXx+jN3Ov9Lc
         H+1UWuuOWItdctlyXHUEchXX4Z3VKHHosc+N2XNiAKNp9Fc1GVRuqozGTeEdJlEXobnt
         PocAlymaJSIFGYcV6p9BTfGU91Zf8A9gGFMN68S8cIvTwSZck0O44MIHGdvih4ILu04e
         wG+pZ8dtaD8dwcUD0VYVSe5OsRE8AkLCJxBJ/flhz/XsV+XmfcStMAAQElFXvwx0o2Eb
         1vIw==
X-Forwarded-Encrypted: i=1; AL+hErFs+0Ow1UOYVSkgQN9Xs37I3i/nBPCaAhMYotbaW1bwTSkc0+VEuT2FkVsW5Z+PL/PdezkPOYNw4f8rGusTkNO3@lists.infradead.org
X-Gm-Message-State: APuU4Z+YHJQGmBWoZMxYRs7dht5t9xwNnUG2IpdgQopq9gOX7btFcH4v
	4NuqmzbMBfXh2n0pGOFfpbMBIyxzMZ1OVpCVNJ3g2amVS1PUdmVkBT2VBjFfLJCskUY=
X-Gm-Gg: AYBFou3kw5QkBq0jk21KYYobP/j6vKgyBdyMwg8INs3d5jHbFt3he8Rj71f/BJxCJXN
	zlUXFBZ1tCZaTcaemPg15prpYVtZrZQ/0h3uC1zwbtAXdpo4rz8Zgxr5L/KmMg3BMsNNu+u9Gsl
	0al0/zNsOSbBOgoMkqof4yl5HYzIb+dFDTJXGjOJmhyWB0bYtdCNM8L+5uK0a2I6++VQAnK+S0Y
	6oFaK6+iwQ35L1kSrRAW+pLFWH49y/C/tD36KMptuWfB1A9+z8um6+zbnsqvRiMiIV01sPiNGDm
	gggasfobLM8BcETDrO+ue1LS2uvSA5h5khqbuPVv3YwMT3lbdEqoiYCWpd7KeeePDEAIlHqrzM0
	HRFmvoHR8w+H1uuqZ0S+4wl7NbG7C8/pg2/UKPxuoqN+wtfNrXnr4qIlMQRYiyfTe+e0zh6CeoG
	VhuqEnTepK03QOQb95ziKWBqsDsXjALHm/WDSDbT4nVzWI0YXsPLtiH5bhpDd8vJyu9XiUk6+eU
	1kInAODaxrqlbMFOenFNsgBGntNm1Kr83bQDoZCuLfipjjPWt+ZlxGDSUFcLxIyVayCUnp3pHTc
	CY//oSgz7Fr7+9u2g2L1q78V2VeCDDRoDSwuBx22j00rb/xcYqPfYTQT+cT32OJbMMWBl7/lP5m
	NOZIRf3ziywiCemXJvo+hIDbl6/DIdAv8HtPpbEG1yw==
X-Received: by 2002:a05:6830:441e:b0:822:b69c:ff69 with SMTP id 46e09a7af769-860f28de64cmr2729842a34.21.1794421202523;
        Wed, 11 Nov 2026 10:20:02 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:20:02 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 11 Nov 2026 12:19:51 -0600
Subject: [PATCH 2/5] arm64: dts: mediatek: Add MT8173 Amazon suez
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-2-77b47cdea702@gmail.com>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=18179;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=hCf0Jfx8ZicMF1WTD0P/zCRw3DvlUgDhQImb5eIckQ0=;
 b=RY9o7ybffNTQKDMVPTpRLshVcJJMO0tdVsbaThAPYQbdI2oK4R43TV67pIs3N7uh8RR9elNfI
 SLIrYBKrJrABHN2ewRW7Dpz8FQL7HPKV9y4Jv/hmHKJ/8xqPW7hrEIv
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_102004_061883_DFBDD681 
X-CRM114-Status: GOOD (  18.46  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a device tree for the Amazon Fire HD 10 (2017), codename suez, an
MT8173 tablet with an MT6397 PMIC and 2 GiB of RAM.

This supports the eMMC, the microSD slot, the micro-B port as a USB
peripheral, the panel and its backlight, the touchscreen, the
accelerometer, the light sensor, the charger, the lid switch, the power
key, CPU frequency scaling and the board's skin thermistors.

The board needs a PSCI 1.0 firmware, such as upstream TF-A. The stock
BL31's CPU_ON never powers on the secondary cores.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 arch/arm64/boot/dts/mediatek/Makefile              |   1 +
 .../arm64/boot/dts/mediatek/mt8173-amazon-suez.dts | 676 +++++++++++++++++++++
 2 files changed, 677 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a86fb313b1a9..ec85d7c49d0d 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -93,6 +93,7 @@ mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18-dtbs := \
 	mt7988a-bananapi-bpi-r4-pro-cn18.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-amazon-suez.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana-rev7.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
new file mode 100644
index 000000000000..6fd7777eb491
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
@@ -0,0 +1,676 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2026 Ryan Brue <ryanbrue.dev@gmail.com>
+ */
+
+/dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "mt8173.dtsi"
+
+/ {
+	model = "Amazon Fire HD 10 (2017)";
+	chassis-type = "tablet";
+	compatible = "amazon,suez", "mediatek,mt8173";
+
+	aliases {
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
+	lid-switch {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hall_pins>;
+
+		switch-lid {
+			label = "hall-effect-sensor";
+			gpios = <&pio 124 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			debounce-interval = <20>;
+		};
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x80000000>;
+	};
+
+	backlight_enable: regulator-backlight-enable {
+		compatible = "regulator-fixed";
+		regulator-name = "backlight_enable";
+		gpio = <&mt6397pin 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ramoops@90000000 {
+			compatible = "ramoops";
+			reg = <0 0x90000000 0 0x80000>;
+			console-size = <0x40000>;
+			record-size = <0x8000>;
+			ftrace-size = <0x20000>;
+		};
+	};
+
+	/* Board skin thermistors: 10 kOhm NTCs under 39 kOhm pull-ups to 1.8 V */
+	thermistor-0 {
+		compatible = "murata,ncp15xh103";
+		io-channels = <&auxadc 0>;
+		pullup-uv = <1800000>;
+		pullup-ohm = <39000>;
+		pulldown-ohm = <0>;
+	};
+
+	thermistor-1 {
+		compatible = "murata,ncp15xh103";
+		io-channels = <&auxadc 1>;
+		pullup-uv = <1800000>;
+		pullup-ohm = <39000>;
+		pulldown-ohm = <0>;
+	};
+
+	thermistor-2 {
+		compatible = "murata,ncp15xh103";
+		io-channels = <&auxadc 12>;
+		pullup-uv = <1800000>;
+		pullup-ohm = <39000>;
+		pulldown-ohm = <0>;
+	};
+};
+
+&cpu0 {
+	proc-supply = <&mt6397_vpca15_reg>;
+};
+
+&cpu1 {
+	proc-supply = <&mt6397_vpca15_reg>;
+};
+
+&cpu2 {
+	proc-supply = <&mt6311_vcpu_reg>;
+	sram-supply = <&mt6397_vsramca7_reg>;
+};
+
+&cpu3 {
+	proc-supply = <&mt6311_vcpu_reg>;
+	sram-supply = <&mt6397_vsramca7_reg>;
+};
+
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "boe,tv101wum-nm0", "novatek,nt51021";
+		reg = <0>;
+		vdd-supply = <&mt6397_vgp6_reg>;
+		avdd-supply = <&mt6397_vgp6_reg>;
+		havdd-supply = <&mt6397_vgp6_reg>;
+		reset-gpios = <&pio 105 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_pins>;
+		backlight = <&backlight_lcd>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi0_out>;
+			};
+		};
+	};
+
+	port {
+		dsi0_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "evervision,ev-ft5726";
+		reg = <0x38>;
+		interrupts-extended = <&pio 14 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&mt6397pin 12 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_pins>;
+		vcc-supply = <&mt6397_vgp3_reg>;
+		iovcc-supply = <&mt6397_vgp4_reg>;
+		touchscreen-size-x = <1200>;
+		touchscreen-size-y = <1920>;
+	};
+};
+
+&i2c1 {
+	mediatek,use-push-pull;
+	status = "okay";
+
+	mt6311: pmic@6b {
+		compatible = "mediatek,mt6311-regulator";
+		reg = <0x6b>;
+
+		regulators {
+			mt6311_vcpu_reg: VDVFS {
+				regulator-name = "VDVFS";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1393750>;
+				regulator-ramp-delay = <10000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	accelerometer@18 {
+		compatible = "bosch,bma253";
+		reg = <0x18>;
+		mount-matrix = "0", "-1", "0",
+			       "-1", "0", "0",
+			       "0", "0", "-1";
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	bq24297: charger@6b {
+		compatible = "ti,bq24297";
+		reg = <0x6b>;
+		interrupts-extended = <&pio 9 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&charger_pins>;
+		omit-battery-class;
+	};
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	backlight_lcd: backlight@2c {
+		compatible = "ti,lp8557";
+		reg = <0x2c>;
+		enable-supply = <&backlight_enable>;
+		dev-ctrl = /bits/ 8 <0x47>;
+		init-brt = /bits/ 8 <0x64>;
+
+		/* In the order the vendor kernel writes them */
+		rom-14h {
+			rom-addr = /bits/ 8 <0x14>;
+			rom-val = /bits/ 8 <0x0f>;
+		};
+
+		rom-13h {
+			rom-addr = /bits/ 8 <0x13>;
+			rom-val = /bits/ 8 <0x01>;
+		};
+
+		rom-11h {
+			rom-addr = /bits/ 8 <0x11>;
+			rom-val = /bits/ 8 <0x06>;
+		};
+
+		rom-12h {
+			rom-addr = /bits/ 8 <0x12>;
+			rom-val = /bits/ 8 <0x2b>;
+		};
+
+		rom-15h {
+			rom-addr = /bits/ 8 <0x15>;
+			rom-val = /bits/ 8 <0x42>;
+		};
+
+		rom-16h {
+			rom-addr = /bits/ 8 <0x16>;
+			rom-val = /bits/ 8 <0xe0>;
+		};
+	};
+
+	light-sensor@23 {
+		compatible = "liteon,ltr559";
+		reg = <0x23>;
+	};
+};
+
+/* Consumes the VPU, which is disabled below */
+&mdp_rdma0 {
+	status = "disabled";
+};
+
+&mfg_async {
+	domain-supply = <&mt6397_vgpu_reg>;
+};
+
+&mipi_tx0 {
+	status = "okay";
+};
+
+&mmc0 {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc0_pins_default>;
+	pinctrl-1 = <&mmc0_pins_uhs>;
+	bus-width = <8>;
+	max-frequency = <200000000>;
+	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	hs400-ds-delay = <0x14015>;
+	cap-mmc-hw-reset;
+	non-removable;
+	mediatek,hs200-cmd-int-delay = <30>;
+	mediatek,hs400-cmd-int-delay = <14>;
+	mediatek,hs400-cmd-resp-sel-rising;
+	vmmc-supply = <&mt6397_vemc_3v3_reg>;
+	vqmmc-supply = <&mt6397_vio18_reg>;
+	/* HS200 tuning fails on the default MSDC50_0 parent */
+	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
+	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL_D2>;
+	status = "okay";
+};
+
+&mmc1 {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc1_pins_default>;
+	pinctrl-1 = <&mmc1_pins_uhs>;
+	bus-width = <4>;
+	max-frequency = <200000000>;
+	cap-sd-highspeed;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	cd-gpios = <&pio 1 GPIO_ACTIVE_HIGH>;
+	vmmc-supply = <&mt6397_vmch_reg>;
+	vqmmc-supply = <&mt6397_vmc_reg>;
+	mediatek,hs200-cmd-int-delay = <4>;
+	status = "okay";
+};
+
+&pio {
+	charger_pins: charger-pins {
+		pins-int {
+			pinmux = <MT8173_PIN_9_EINT9__FUNC_GPIO9>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
+
+	hall_pins: hall-pins {
+		pins-hall {
+			pinmux = <MT8173_PIN_124_KPCOL2__FUNC_GPIO124>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
+
+	mmc0_pins_default: mmc0-default-pins {
+		pins-cmd-dat {
+			pinmux = <MT8173_PIN_57_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
+				 <MT8173_PIN_58_MSDC0_DAT1__FUNC_MSDC0_DAT1>,
+				 <MT8173_PIN_59_MSDC0_DAT2__FUNC_MSDC0_DAT2>,
+				 <MT8173_PIN_60_MSDC0_DAT3__FUNC_MSDC0_DAT3>,
+				 <MT8173_PIN_61_MSDC0_DAT4__FUNC_MSDC0_DAT4>,
+				 <MT8173_PIN_62_MSDC0_DAT5__FUNC_MSDC0_DAT5>,
+				 <MT8173_PIN_63_MSDC0_DAT6__FUNC_MSDC0_DAT6>,
+				 <MT8173_PIN_64_MSDC0_DAT7__FUNC_MSDC0_DAT7>,
+				 <MT8173_PIN_66_MSDC0_CMD__FUNC_MSDC0_CMD>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		pins-clk {
+			pinmux = <MT8173_PIN_65_MSDC0_CLK__FUNC_MSDC0_CLK>;
+			bias-pull-down;
+		};
+
+		pins-rst {
+			pinmux = <MT8173_PIN_68_MSDC0_RST___FUNC_MSDC0_RSTB>;
+			bias-pull-up;
+		};
+	};
+
+	mmc0_pins_uhs: mmc0-uhs-pins {
+		pins-cmd-dat {
+			pinmux = <MT8173_PIN_57_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
+				 <MT8173_PIN_58_MSDC0_DAT1__FUNC_MSDC0_DAT1>,
+				 <MT8173_PIN_59_MSDC0_DAT2__FUNC_MSDC0_DAT2>,
+				 <MT8173_PIN_60_MSDC0_DAT3__FUNC_MSDC0_DAT3>,
+				 <MT8173_PIN_61_MSDC0_DAT4__FUNC_MSDC0_DAT4>,
+				 <MT8173_PIN_62_MSDC0_DAT5__FUNC_MSDC0_DAT5>,
+				 <MT8173_PIN_63_MSDC0_DAT6__FUNC_MSDC0_DAT6>,
+				 <MT8173_PIN_64_MSDC0_DAT7__FUNC_MSDC0_DAT7>,
+				 <MT8173_PIN_66_MSDC0_CMD__FUNC_MSDC0_CMD>;
+			input-enable;
+			drive-strength = <6>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins-clk {
+			pinmux = <MT8173_PIN_65_MSDC0_CLK__FUNC_MSDC0_CLK>;
+			drive-strength = <6>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins-ds {
+			pinmux = <MT8173_PIN_67_MSDC0_DSL__FUNC_MSDC0_DSL>;
+			drive-strength = <8>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins-rst {
+			pinmux = <MT8173_PIN_68_MSDC0_RST___FUNC_MSDC0_RSTB>;
+			bias-pull-up;
+		};
+	};
+
+	mmc1_pins_default: mmc1-default-pins {
+		pins-cmd-dat {
+			pinmux = <MT8173_PIN_73_MSDC1_DAT0__FUNC_MSDC1_DAT0>,
+				 <MT8173_PIN_74_MSDC1_DAT1__FUNC_MSDC1_DAT1>,
+				 <MT8173_PIN_75_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
+				 <MT8173_PIN_76_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
+				 <MT8173_PIN_78_MSDC1_CMD__FUNC_MSDC1_CMD>;
+			input-enable;
+			drive-strength = <4>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins-clk {
+			pinmux = <MT8173_PIN_77_MSDC1_CLK__FUNC_MSDC1_CLK>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <4>;
+		};
+
+		/* Pulled up so that an empty slot, which grounds it, reads low. */
+		pins-insert {
+			pinmux = <MT8173_PIN_1_EINT1__FUNC_GPIO1>;
+			bias-pull-up;
+		};
+	};
+
+	mmc1_pins_uhs: mmc1-uhs-pins {
+		pins-cmd-dat {
+			pinmux = <MT8173_PIN_73_MSDC1_DAT0__FUNC_MSDC1_DAT0>,
+				 <MT8173_PIN_74_MSDC1_DAT1__FUNC_MSDC1_DAT1>,
+				 <MT8173_PIN_75_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
+				 <MT8173_PIN_76_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
+				 <MT8173_PIN_78_MSDC1_CMD__FUNC_MSDC1_CMD>;
+			input-enable;
+			drive-strength = <10>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins-clk {
+			pinmux = <MT8173_PIN_77_MSDC1_CLK__FUNC_MSDC1_CLK>;
+			drive-strength = <10>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+	};
+
+	panel_pins: panel-pins {
+		pins-reset {
+			pinmux = <MT8173_PIN_105_MSDC2_CMD__FUNC_GPIO105>;
+			bias-disable;
+		};
+	};
+
+	touch_pins: touch-pins {
+		pins-int {
+			pinmux = <MT8173_PIN_14_EINT14__FUNC_GPIO14>;
+			input-enable;
+			bias-disable;
+		};
+	};
+};
+
+/* DISP_PWM is on the main display path, although the backlight is on I2C */
+&pwm0 {
+	status = "okay";
+};
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6397";
+		interrupts-extended = <&pio 5 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		mt6397rtc: rtc {
+			compatible = "mediatek,mt6397-rtc";
+		};
+
+		mt6397clk: clocks {
+			compatible = "mediatek,mt6397-clk";
+			#clock-cells = <1>;
+		};
+
+		mt6397pin: pinctrl {
+			compatible = "mediatek,mt6397-pinctrl";
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		mt6397keys: keys {
+			compatible = "mediatek,mt6397-keys";
+			mediatek,long-press-mode = <1>;
+			power-off-time-sec = <0>;
+
+			power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+		};
+
+		regulators {
+			compatible = "mediatek,mt6397-regulator";
+
+			mt6397_vpca15_reg: buck_vpca15 {
+				regulator-name = "vpca15";
+				regulator-min-microvolt = < 725000>;
+				regulator-max-microvolt = <1125000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+			};
+
+			mt6397_vpca7_reg: buck_vpca7 {
+				regulator-name = "vpca7";
+				regulator-min-microvolt = < 700000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <12500>;
+				regulator-enable-ramp-delay = <115>;
+			};
+
+			mt6397_vsramca15_reg: buck_vsramca15 {
+				regulator-name = "vsramca15";
+				regulator-min-microvolt = < 931250>;
+				regulator-max-microvolt = <1150000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+			};
+
+			/* The A72 cluster's Vsram despite the name; cpufreq couples the pair. */
+			mt6397_vsramca7_reg: buck_vsramca7 {
+				regulator-name = "vsramca7";
+				regulator-min-microvolt = < 931250>;
+				regulator-max-microvolt = <1150000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+			};
+
+			mt6397_vcore_reg: buck_vcore {
+				regulator-name = "vcore";
+				regulator-min-microvolt = < 700000>;
+				regulator-max-microvolt = <1125000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+			};
+
+			/* 150 us per suez_evt/dvt, not the 115 us of evb and elm. */
+			mt6397_vgpu_reg: buck_vgpu {
+				regulator-name = "vgpu";
+				regulator-min-microvolt = < 700000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <12500>;
+				regulator-enable-ramp-delay = <150>;
+			};
+
+			mt6397_vdrm_reg: buck_vdrm {
+				regulator-name = "vdrm";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+			};
+
+			mt6397_vio18_reg: buck_vio18 {
+				regulator-name = "vio18";
+				regulator-min-microvolt = <1620000>;
+				regulator-max-microvolt = <1980000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+			};
+
+			mt6397_vtcxo_reg: ldo_vtcxo {
+				regulator-name = "vtcxo";
+				regulator-always-on;
+			};
+
+			mt6397_va28_reg: ldo_va28 {
+				regulator-name = "va28";
+				regulator-always-on;
+			};
+
+			mt6397_vcama_reg: ldo_vcama {
+				regulator-name = "vcama";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+
+			mt6397_vio28_reg: ldo_vio28 {
+				regulator-name = "vio28";
+				regulator-always-on;
+			};
+
+			mt6397_vusb_reg: ldo_vusb {
+				regulator-name = "vusb";
+			};
+
+			mt6397_vmc_reg: ldo_vmc {
+				regulator-name = "vmc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+
+			mt6397_vmch_reg: ldo_vmch {
+				regulator-name = "vmch";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+
+			mt6397_vemc_3v3_reg: ldo_vemc3v3 {
+				regulator-name = "vemc_3v3";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+
+			mt6397_vgp1_reg: ldo_vgp1 {
+				regulator-name = "vcamd";
+				regulator-min-microvolt = <1220000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <240>;
+			};
+
+			mt6397_vgp2_reg: ldo_vgp2 {
+				regulator-name = "vcamio";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+
+			mt6397_vgp3_reg: ldo_vgp3 {
+				regulator-name = "vcamaf";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+
+			mt6397_vgp4_reg: ldo_vgp4 {
+				regulator-name = "vgp4";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+
+			mt6397_vgp5_reg: ldo_vgp5 {
+				regulator-name = "vgp5";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+
+			mt6397_vgp6_reg: ldo_vgp6 {
+				regulator-name = "vgp6";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+
+			mt6397_vibr_reg: ldo_vibr {
+				regulator-name = "vibr";
+				regulator-min-microvolt = <1300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+		};
+	};
+};
+
+/* The micro-B port is also the charger input */
+&ssusb {
+	vusb33-supply = <&mt6397_vusb_reg>;
+	dr_mode = "peripheral";
+	maximum-speed = "high-speed";
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+/* Consumes the VPU, which is disabled below */
+&vcodec_dec {
+	status = "disabled";
+};
+
+&vcodec_enc_avc {
+	status = "disabled";
+};
+
+&vcodec_enc_vp8 {
+	status = "disabled";
+};
+
+/* Its firmware never starts here, and its suspend then fails every system suspend */
+&vpu {
+	status = "disabled";
+};

-- 
2.56.0



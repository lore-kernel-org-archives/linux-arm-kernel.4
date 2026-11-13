Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD32E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M2FI6Zek;
	dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=Ox0bFsAL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NwR3ZK+dpWHuEemJ/KF8Oep+ReBdvcqp5qFB2zRlnOs=; b=M2FI6ZekXn7NRL
	vShrKCuSscwvQhIhE3zMY3F5RjppcyE09lnBZgebvmbbbZoV7tqSuwd8IFwv9HL+Pi+QTIC8z2LQ6
	gsIktUOHkpBh8VIdS2GzXpV2hF4xj63rC4S3B3mJRmCQl7U8PhOLGBUaWvm+4EZi2sEgv3nB8QehK
	4pVq+4acTcZysBtlDNtMx7+XmRmexnNBqlbgZDxaR6P3hnn65RX26HHemdjMr8yF3LVXjo5ZFkY6c
	a3zY1gLoX5iHgEpbRpwhdvTAOijXguWHoWPeNaaSE7Hk+EsC4je6bzvK/CFgqnEZ+DKo5x3zWjRaK
	GVrTB4yz1nfWB072TGIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRseQ-0000000DFho-2W7d;
	Fri, 13 Nov 2026 14:53:14 +0000
Received: from smtp-bc0b.mail.infomaniak.ch ([45.157.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRse4-0000000DFK7-3RiL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:53:02 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jR0c00rW7zD2F;
	Fri, 13 Nov 2026 15:52:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1794581567;
	bh=NwR3ZK+dpWHuEemJ/KF8Oep+ReBdvcqp5qFB2zRlnOs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ox0bFsALlOMRbUap1XpX+WRVX9TYHqYr1BTeeahRyoNYtG4M7IjNBc/rVuzYaZjSp
	 S1mLIb5FsYhZPDF+8P9FATPzg9kH3i+hQa1ls/6vszKxVLjvZhL/N29/qn5AP8DWdk
	 d4Oz3x+OMlrIVl1OXxpCR2LE9qGBCNXSAjgk9UL1DtJ1ODmrLUb7ZHdlZl8okDetyi
	 umxpFzr39/PxnNPceeq3lW/Od/ZeZh8U8P95Zh2m7eSOLlK8QX9HD0MKjCL/W2mJbm
	 qDVCX5vRX46+ARYqieEsfiU6p+uaQ7O6zw0CjETtWZMYDbtZqOu0EHYzBEIfngRkK8
	 X86692Amz/LFw==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jR0by754Czlwj;
	Fri, 13 Nov 2026 15:52:46 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 13 Nov 2026 15:52:23 +0100
Subject: [PATCH v2 1/2] arm64: dts: rockchip: enable OV9281 CAM0 P14 on
 RK3588 Jaguar
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-jaguar-cam0-cam1-v2-1-3e9377e3c882@cherry.de>
References: <20261113-jaguar-cam0-cam1-v2-0-3e9377e3c882@cherry.de>
In-Reply-To: <20261113-jaguar-cam0-cam1-v2-0-3e9377e3c882@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_065253_076181_65C419D8 
X-CRM114-Status: GOOD (  14.86  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

RK3588 Jaguar has two proprietary camera connectors, P14 and P15. This
adds support for the only camera module we currently have for this
connector, on P14.

The camera module has a 2-lane OV9281 camera sensor, an IMU, a
magnetometer and an EEPROM.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/Makefile              |   5 +
 .../dts/rockchip/rk3588-jaguar-p14-ov9281.dtso     | 120 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  36 ++++++-
 3 files changed, 160 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 442d322a20cf7..cf977e883c374 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -204,6 +204,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-h96-max-v58.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-can1-can2-uart4.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-ethernet-switch.dtbo
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-p14-ov9281.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-pre-ict-tester.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-lubancat-5io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-mnt-reform2.dtb
@@ -336,6 +337,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-can1-can2-uart4.dtb
 rk3588-jaguar-can1-can2-uart4-dtbs := rk3588-jaguar.dtb \
 	rk3588-jaguar-can1-can2-uart4.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-p14-ov9281-p15-ov9281.dtb
+rk3588-jaguar-p14-ov9281-p15-ov9281-dtbs := rk3588-jaguar.dtb \
+	rk3588-jaguar-p14-ov9281.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-ethernet-switch.dtb
 rk3588-jaguar-ethernet-switch-dtbs := rk3588-jaguar.dtb \
 	rk3588-jaguar-ethernet-switch.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar-p14-ov9281.dtso b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-p14-ov9281.dtso
new file mode 100644
index 0000000000000..bb4ce6718fa26
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-p14-ov9281.dtso
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Cherry Embedded Solutions GmbH
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/rockchip,rk3588-cru.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&csi_dphy0 {
+	status = "okay";
+};
+
+&csi2 {
+	status = "okay";
+};
+
+&csi2_in {
+	csi2_input: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		data-lanes = <1 2>;
+		link-frequencies = /bits/ 64 <400000000>;
+		remote-endpoint = <&cam0_output>;
+	};
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	clock-frequency = <400000>;
+	#size-cells = <0>;
+	status = "okay";
+
+	magnetometer@1e {
+		compatible = "st,lis2mdl";
+		reg = <0x1e>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <RK_PC7 IRQ_TYPE_EDGE_RISING>;
+		pinctrl-0 = <&cam0_imu_int3>;
+		pinctrl-names = "default";
+		vdd-supply = <&vcc_2v8_imu>;
+		vddio-supply = <&vcc_1v8_s3>;
+	};
+
+	eeprom@50 {
+		compatible = "st,24c64", "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+		vcc-supply = <&vcc_1v8_s3>;
+	};
+
+	camera@60 {
+		compatible = "ovti,ov9281";
+		reg = <0x60>;
+		assigned-clocks = <&cru CLK_MIPI_CAMARAOUT_M1>;
+		assigned-clock-rates = <24000000>;
+		avdd-supply = <&vcc_2v8_cam>;
+		clocks = <&cru CLK_MIPI_CAMARAOUT_M1>;
+		dovdd-supply = <&vcc_1v8_s3>;
+		dvdd-supply = <&cam_vcc_1v2>;
+		pinctrl-0 = <&cam0_rst &mipim0_camera1_clk>;
+		pinctrl-names = "default";
+		reset-gpios = <&gpio0 RK_PB0 GPIO_ACTIVE_HIGH>;
+
+		port {
+			cam0_output: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csi2_input>;
+			};
+		};
+	};
+
+	imu@6a {
+		compatible = "st,lsm6dsr";
+		reg = <0x6a>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <RK_PC0 IRQ_TYPE_EDGE_RISING>;
+		pinctrl-0 = <&csi0_imu_int1 &cam0_imu_cs &cam0_imu_sa0>;
+		pinctrl-names = "default";
+		vdd-supply = <&vcc_2v8_imu>;
+		vddio-supply = <&vcc_1v8_s3>;
+	};
+};
+
+&pinctrl {
+	cam0-p14 {
+		cam0_imu_cs: cam0-imu-cs {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_output_high>;
+		};
+
+		cam0_imu_int3: cam0-imu-int3 {
+			rockchip,pins = <1 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		cam0_imu_sa0: cam0-imu-sa0 {
+			rockchip,pins = <1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		cam0_rst: cam0-reset {
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		csi0_imu_int1: csi0-imu-int1 {
+			rockchip,pins = <1 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&vicap {
+	status = "okay";
+};
+
+&vicap_mmu {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 0446834e84d5d..99baf89167d35 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -40,6 +40,16 @@ aliases {
 		rtc0 = &rtc_twi;
 	};
 
+	cam_vcc_1v2: regulator-cam-vcc-1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_vcc_1v2";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vcc_1v2_s3>;
+	};
+
 	chosen {
 		stdout-path = "serial2:115200n8";
 	};
@@ -123,7 +133,26 @@ vcc_1v2_s3: regulator-vcc-1v2-s3 {
 		vin-supply = <&vcc5v0_sys>;
 	};
 
-	/* Exposed on P14 and P15 */
+	vcc_2v8_cam: regulator-vcc-2v8-cam {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_2v8_cam";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&vcc_2v8_s3>;
+	};
+
+	vcc_2v8_imu: regulator-vcc-2v8-imu {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_2v8_imu";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&vcc_2v8_s3>;
+	};
+
 	vcc_2v8_s3: regulator-vcc-2v8-s3 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_2v8_s3";
@@ -437,6 +466,11 @@ &i2c1 {
 	pinctrl-names = "default";
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2m3_xfer>;
+	pinctrl-names = "default";
+};
+
 &i2c6 {
 	pinctrl-0 = <&i2c6m4_xfer>;
 	pinctrl-names = "default";

-- 
2.56.1



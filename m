Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4D7606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uY13j457;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hGWMf1lk;
	dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=ZQuENgGV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x15c4RWQyZd3P3XWS5iWIOHM9youpfWPrHBtj/xpwJs=; b=uY13j457xUwrO6
	/JHfTBFgfRW0dwl1OYYscjP5h4mOu6faa+2fbgR4ze0/5S/I0DmLx8h9z9Stm8HUEU+3iBjVW2ZHO
	Hd9xPzt48egSY6kDWygsBTJLDe08O+EopesBKtA5jux0xWSFDYKlhjXMEELeTTFPrMq4b6dVAqZB4
	Hjjy47Wlc0BZQ9vXOEWU8a/mS1leGMuS9rcedqnATU1UxqiqT+JsL4U04rA7m/QadpWkGzbERhi+r
	+bGj72aBYGRF8Uh71jGoNFEDlTBnooZo7wntmX/1YEh5AH0KEBUyf7WzfFhty+AJ8hTWBfKNbEfbY
	hmaqYj3pmK2G+go9AHnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRseC-0000000DFWL-42jF;
	Fri, 13 Nov 2026 14:53:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRse7-0000000DFRo-2PvH
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Nov 2026 14:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=x15c4RWQyZd3P3XWS5iWIOHM9youpfWPrHBtj/xpwJs=; b=hGWMf1lkWpHDtHYRNMkVI9LcU8
	VW1jOvGJvg9J3ByU1HPilL6c2mlThgCu0RlFSVMxeeDuCXnfXXf3n+E5VuJDlLP3NItSnEm61pd/J
	I2AE3knFnVektDNxeFj/gZPK1B3x8BTOOXeio8kNh2m95h9mbUcXk8MlomP4m6/7o+m+tUYuM7lVz
	u9Jc4HtSV60Vqaesd3OnAUt6u325c4gQITObhhs1mXCtltZyxkgWUA7oY441PfE7KvKwxlM+Mar5H
	LyKb0yp0g+z486LzeGkl/Lh/Dw+u6/ArH5AGQePw5wrwkxnQYV/ez5xKSwgwwLAv3q75U9aQsPGRZ
	ft1um6Qw==;
Received: from smtp-190d.mail.infomaniak.ch ([2001:1600:19:d548::190d])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRse4-0000000BPLh-2Nw5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:52:54 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jR0c11v7TzFgH;
	Fri, 13 Nov 2026 15:52:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1794581568;
	bh=x15c4RWQyZd3P3XWS5iWIOHM9youpfWPrHBtj/xpwJs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZQuENgGVmSOmWaut1R7uWdqbIQ6qVS/7CNF/69Uy4+rkSNiDf2doV3KumepG6sRNO
	 euH0vFObNVUPQCsnp3UWGH9hZbXgqEtylrFFsgvE9uEkT8LFS4RL4c+H6OV1EHiGyp
	 lj2TEyD1N9tKiB+/KFd6MqRc50FvEghF8t6FFOJ4Gg3vrDQa4j8/VJVoIVJd8/IQ7E
	 k3CQZD3tKyxAysjRcbukO8pwVsRlxUwa07MC9jjcUpDzOQdkL7v2vkQVLwOB8bJSQn
	 KLE/lzBsd6hw42SLXZOjVPWeM+aiQvWx0UmHnDk89OscoyS1LcRh+SfLj0GquTl4Vg
	 m5G0tDvaxRE/g==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jR0bz6QKHzmtk;
	Fri, 13 Nov 2026 15:52:47 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 13 Nov 2026 15:52:24 +0100
Subject: [PATCH v2 2/2] arm64: dts: rockchip: enable OV9281 CAM1 P15 on
 RK3588 Jaguar
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-jaguar-cam0-cam1-v2-2-3e9377e3c882@cherry.de>
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
X-CRM114-CacheID: sfid-20261113_145252_678685_F4B28673 
X-CRM114-Status: GOOD (  14.86  )
X-Spam-Score: -0.2 (/)
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
connector, on P15.

The camera module has a 2-lane OV9281 camera sensor, an IMU, a
magnetometer and an EEPROM.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/Makefile              |   4 +-
 .../dts/rockchip/rk3588-jaguar-p15-ov9281.dtso     | 119 +++++++++++++++++++++
 2 files changed, 122 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index cf977e883c374..e89e3123cb719 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -205,6 +205,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-can1-can2-uart4.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-ethernet-switch.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-p14-ov9281.dtbo
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-p15-ov9281.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-pre-ict-tester.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-lubancat-5io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-mnt-reform2.dtb
@@ -339,7 +340,8 @@ rk3588-jaguar-can1-can2-uart4-dtbs := rk3588-jaguar.dtb \
 
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-p14-ov9281-p15-ov9281.dtb
 rk3588-jaguar-p14-ov9281-p15-ov9281-dtbs := rk3588-jaguar.dtb \
-	rk3588-jaguar-p14-ov9281.dtbo
+	rk3588-jaguar-p14-ov9281.dtbo \
+	rk3588-jaguar-p15-ov9281.dtbo
 
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-ethernet-switch.dtb
 rk3588-jaguar-ethernet-switch-dtbs := rk3588-jaguar.dtb \
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar-p15-ov9281.dtso b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-p15-ov9281.dtso
new file mode 100644
index 0000000000000..507fca0948243
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-p15-ov9281.dtso
@@ -0,0 +1,119 @@
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
+&csi_dphy1 {
+	status = "okay";
+};
+
+&csi4 {
+	status = "okay";
+};
+
+&csi4_in {
+	csi4_input: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		data-lanes = <1 2>;
+		link-frequencies = /bits/ 64 <400000000>;
+		remote-endpoint = <&cam1_output>;
+	};
+};
+
+&i2c7 {
+	#address-cells = <1>;
+	clock-frequency = <400000>;
+	#size-cells = <0>;
+
+	magnetometer@1e {
+		compatible = "st,lis2mdl";
+		reg = <0x1e>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <RK_PB0 IRQ_TYPE_EDGE_RISING>;
+		pinctrl-0 = <&cam1_imu_int3>;
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
+		assigned-clocks = <&cru CLK_MIPI_CAMARAOUT_M2>;
+		assigned-clock-rates = <24000000>;
+		avdd-supply = <&vcc_2v8_cam>;
+		clocks = <&cru CLK_MIPI_CAMARAOUT_M2>;
+		dovdd-supply = <&vcc_1v8_s3>;
+		dvdd-supply = <&cam_vcc_1v2>;
+		pinctrl-0 = <&cam1_rst &mipim0_camera2_clk>;
+		pinctrl-names = "default";
+		reset-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
+
+		port {
+			cam1_output: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csi4_input>;
+			};
+		};
+	};
+
+	imu@6a {
+		compatible = "st,lsm6dsr";
+		reg = <0x6a>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <RK_PC4 IRQ_TYPE_EDGE_RISING>;
+		pinctrl-0 = <&csi1_imu_int1 &cam1_imu_cs &cam1_imu_sa0>;
+		pinctrl-names = "default";
+		vdd-supply = <&vcc_2v8_imu>;
+		vddio-supply = <&vcc_1v8_s3>;
+	};
+};
+
+&pinctrl {
+	cam1-p15 {
+		cam1_imu_cs: cam1-imu-cs {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_output_high>;
+		};
+
+		cam1_imu_int3: cam1-imu-int3 {
+			rockchip,pins = <1 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		cam1_imu_sa0: cam1-imu-sa0 {
+			rockchip,pins = <2 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		cam1_rst: cam1-reset {
+			rockchip,pins = <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		csi1_imu_int1: csi1-imu-int1 {
+			rockchip,pins = <2 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
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

-- 
2.56.1



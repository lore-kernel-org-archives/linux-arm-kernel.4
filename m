Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEB9606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g5KQDwtz;
	dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=KBXagnVY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+/Nvrr/kmurSuoSNX/nrEDXJoBt1+szlAZyD/QS6ioM=; b=g5KQDwtzK55Emv7sF12KFe6omL
	Bax59vVZ/qEppGIaQzMQMWPRPFvLbmF1kO7d+p67vj2dYKnNj9afnvPvPrpAKnFKrUpNg+SX4zp//
	ZqlG7CWZA8N89vOVqBOCH3BKDQpHuO0qCHsfb40fBGFYalbiJkuflWyzCqZXNCmN8leVWWLMRQy0h
	r7el2hhmxj1BAm6+hjjNLgdAY/0qdPXFrx3w20QZQTvJohLRuXwAxHEAnMrk8OjsfHHXQRP6ctSP2
	dcOxfXlpKP95Ysg63n8BVGj3NKCdocNyupJZq32RNMbJO/thqw+nnP99MeJ9LqszLB5OMlGcAtqmx
	UC1x9wbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULRs-0000000EYUS-3cT2;
	Fri, 20 Nov 2026 10:02:28 +0000
Received: from smtp-bc0b.mail.infomaniak.ch ([45.157.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULRp-0000000EYSC-3CZ0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:02:27 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jW9qZ74zFzg1G;
	Fri, 20 Nov 2026 11:02:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1795168938;
	bh=+/Nvrr/kmurSuoSNX/nrEDXJoBt1+szlAZyD/QS6ioM=;
	h=From:Date:Subject:To:Cc:From;
	b=KBXagnVYzai5Hyt8cvC07l1zCVwAJfI7bJuefebIm04Yswvtlg2Oy+r/VCdrllwGA
	 a1mFXDsDmRBRIcSGtmPnmvsUmUL5RqBFMEVM+bsmpOW5vCdbhVgaYN5Fq5jYB7UQ/U
	 nqer/b7iAiYvdgu1vvC9aj5LfKEqhka6bmue6CpmuzqR5KtRK/s7MxTMGYtNInhpau
	 FH6UePtEPU6aiERO7EoYhz4GuXvzETXqXHp5pe9EH7brhHCi/NlYiHvr+mgzP8Fwrf
	 yMx86+BQzZLZszUb5O7GWwqlzKF0vBzwCevjlSVV47BvPgCk0Ud84XEzaFwy09Xi70
	 GJlLx7/ONkYlw==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jW9qX6x17zX7X;
	Fri, 20 Nov 2026 11:02:16 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 20 Nov 2026 11:02:03 +0100
Subject: [PATCH v3] arm64: dts: rockchip: support camera module on Haikou
 Video Demo on RK3399 Puma
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rk3399-puma-haikou-video-demo-cam-v3-1-5183b29527f4@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/5WOQW7CMBBFr2LNmkEZGxImK+6BWDj2pHFRMLKJR
 RTl7lXohmW7/NLTe3+BLClIhlYtkKSEHOIdWmV2Ctxg71+CwUOrQFe6JqoMppsxzPiYRouDDbc
 4YQleInoZIzo7oj/VndSGLZPATsEjSR9e78bl+rvz1H2Le27ijRhCfsY0v08U2rj/9AohIdsDe
 25Ohrvj2Q2S0rz3Aluv6A8j/cmokVAasq43VdOz/jSu6/oDSEF/tTYBAAA=
X-Change-ID: 20261103-rk3399-puma-haikou-video-demo-cam-d86be639a91e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_020225_938876_8D3BD43A 
X-CRM114-Status: GOOD (  13.35  )
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Quentin Schulz <quentin.schulz@cherry.de>

The Haikou Video Demo adapter has a proprietary connector for a camera
module which has an OV5675 camera sensor and a companion DW9714 focus
lens driver.

This adds support for the camera module on RK3399 Puma module fitted on
a Haikou devkit with the Haikou Video Demo adapter.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Camera only works once the ov5675 driver is adapted[1] to work with
24MHz MCLK. With the similar work done for RK3588 Tiger[2], we now have
all our modules supporting the same set of features when used in
conjunction with Haikou Video Demo.

Same request as made in [2], please only merge this once the OV5675
series[1] is merged.

[1] https://lore.kernel.org/linux-media/20261026101646.2450051-1-heiko@sntech.de/
[2] https://lore.kernel.org/linux-rockchip/20261026102027.2451025-1-heiko@sntech.de/
---
Changes in v3:
- added missing #address-cells, #size-cells, reg properties to
  &isp1/ports/port@0,
- Link to v2: https://patch.msgid.link/20261113-rk3399-puma-haikou-video-demo-cam-v2-1-e71acf307f92@cherry.de

Changes in v2:
- added missing #address-cells and #size-cells to &isp1/ports,
- Link to v1: https://patch.msgid.link/20261103-rk3399-puma-haikou-video-demo-cam-v1-1-9a49d97839b5@cherry.de
---
 .../rockchip/rk3399-puma-haikou-video-demo.dtso    | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
index 141a921a06e47..925b4bb88f1b6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
@@ -16,6 +16,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 
 &{/} {
@@ -100,6 +101,12 @@ &i2c1 {
 	/* OV5675, GT911, DW9714 are limited to 400KHz */
 	clock-frequency = <400000>;
 
+	focus: focus@c {
+		compatible = "dongwoon,dw9714";
+		reg = <0xc>;
+		vcc-supply = <&cam_afvdd_2v8>;
+	};
+
 	touchscreen@14 {
 		compatible = "goodix,gt911";
 		reg = <0x14>;
@@ -122,6 +129,57 @@ pca9670: gpio@27 {
 		pinctrl-names = "default";
 		reset-gpios = <&gpio4 RK_PD6 GPIO_ACTIVE_LOW>;
 	};
+
+	camera@36 {
+		compatible = "ovti,ov5675";
+		reg = <0x36>;
+		assigned-clocks = <&cru SCLK_CIF_OUT>;
+		assigned-clock-rates = <24000000>;
+		clocks = <&cru SCLK_CIF_OUT>;
+		avdd-supply = <&cam_avdd_2v8>;
+		dvdd-supply = <&cam_dvdd_1v2>;
+		dovdd-supply = <&cam_dovdd_1v8>;
+		lens-focus = <&focus>;
+		orientation = <MEDIA_ORIENTATION_FRONT>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cif_clkouta>;
+		reset-gpios = <&pca9670 6 GPIO_ACTIVE_LOW>;
+		rotation = <180>;
+
+		port {
+			cam_output: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <450000000>;
+				remote-endpoint = <&mipi_in_cam>;
+			};
+		};
+	};
+};
+
+&isp1 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			mipi_in_cam: endpoint@0 {
+				reg = <0>;
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <450000000>;
+				remote-endpoint = <&cam_output>;
+			};
+		};
+	};
+};
+
+&isp1_mmu {
+	status = "okay";
 };
 
 &mipi_dsi {
@@ -145,6 +203,10 @@ mipi_in_panel: endpoint {
 	};
 };
 
+&mipi_dsi1 {
+	status = "okay";
+};
+
 &mipi_out {
 	mipi_out_panel: endpoint {
 		remote-endpoint = <&mipi_in_panel>;

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git master
change-id: 20261103-rk3399-puma-haikou-video-demo-cam-d86be639a91e

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>



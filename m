Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CEA606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4+QyhHut;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iLDqJjZj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hDdzGyyUm8Hc15zcIjN0Non0VUWJmRzS3/4uJqPKrXo=; b=4+QyhHutbMUKrl
	fEtfGGQfVWqEkMSD3bAI40adhBn7hem0H70hbgm0tcAwPimI035sbbt+0JGxLY00r3Hb+RPImg9/m
	cCbCjBpdnkH0/8DFZpJ+ngr/+Zeun3GoL2L2trB45+t/J0lzxBYgoVf49LT2ILko0Vk+1NA9MdyQz
	2+Rim/ECqawxpalSkb0DX0Cm94DDMUX02RXEQrw0W3rnx49CreQNheevhK1SU/vz6e90nP7Qg9JhO
	AUDevlOw2Aa+FdoKq4WGnJhMmTm8AcOdG3PeAN7w+tJ3zkX0Ilx8mW16kfSbrWUvL7qs/UgWe9+f6
	c8Ij2oTrdsjznPFChMBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBd-00000007XkV-3o0e;
	Wed, 11 Nov 2026 19:40:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBR-00000007XaY-2Npt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:40:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D25B41209;
	Wed, 11 Nov 2026 19:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBDB1F00A07;
	Wed, 11 Nov 2026 19:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426037;
	bh=hDdzGyyUm8Hc15zcIjN0Non0VUWJmRzS3/4uJqPKrXo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iLDqJjZjyhX5HyCtluNW82kEvHx0OhEkl9ImfgZJk3PsMkBXxmJiZW1wErryldws2
	 4DG/91DMYsVCLuVMJK9xhtXrlQUI2a4ErOB7nd3KBJmGOcOd0BMZp3PetRlYwlhjNZ
	 0LzDBiUUHTL4nKFS/s9Gkm2i5wPhIXOnDHWTjTqsUEQhwdmHhHV84fql+aJQa10rx6
	 B29ShsLEukuXxcvJPKNN11MOfs+dnJitQp+5ZGGAyb1jtoIbvO5sZ8gA2JP63RaVdQ
	 2/pftyhYVmipWR08GuhUsqMeJEGDVfRf2rqKrvyDPj1CYfGmCosOz/rq7w2eK1+pQ0
	 24b40AYtQTZNw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:18 -0600
Subject: [PATCH 08/12] arm64: dts: hisilicon: Move non-MMIO nodes out of
 simple-bus nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-hisi-v1-8-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
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

Move non-MMIO provider nodes out of the soc simple-bus nodes.
This includes HiKey GPIO range helpers, Hi3660 and Hi3670
reset controllers, Hi3660 and Hi6220 thermal zones, Hi6220
stub clock and USB PHY providers, and static CoreSight funnel
and replicator graph helpers.

These nodes do not have register ranges of their own, so they
don't belong under an MMIO "simple-bus".

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../arm64/boot/dts/hisilicon/hi3660-coresight.dtsi | 138 ++++++++++-----------
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi          | 117 ++++++++---------
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi          |  26 ++--
 .../arm64/boot/dts/hisilicon/hi6220-coresight.dtsi |  69 +++++------
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          | 110 ++++++++--------
 .../arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi |  10 +-
 .../arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi |   8 +-
 7 files changed, 236 insertions(+), 242 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
index 4c6a075908d1..7862a03c3094 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
@@ -9,6 +9,73 @@
  *
  */
 / {
+	/* An invisible combo funnel between clusters and top funnel */
+	funnel {
+		compatible = "arm,coresight-static-funnel";
+		clocks = <&crg_ctrl HI3660_PCLK>;
+		clock-names = "apb_pclk";
+
+		out-ports {
+			port {
+				combo_funnel_out: endpoint {
+					remote-endpoint = <&top_funnel_in>;
+				};
+			};
+		};
+
+		in-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				combo_funnel_in0: endpoint {
+					remote-endpoint = <&cluster0_etf_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				combo_funnel_in1: endpoint {
+					remote-endpoint = <&cluster1_etf_out>;
+				};
+			};
+		};
+	};
+
+	replicator {
+		compatible = "arm,coresight-static-replicator";
+		clocks = <&crg_ctrl HI3660_PCLK>;
+		clock-names = "apb_pclk";
+
+		in-ports {
+			port {
+				replicator_in: endpoint {
+					remote-endpoint = <&top_etf_out>;
+				};
+			};
+		};
+
+		out-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				replicator0_out0: endpoint {
+					remote-endpoint = <&etr_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				replicator0_out1: endpoint {
+					remote-endpoint = <&tpiu_in>;
+				};
+			};
+		};
+	};
+
 	soc {
 		/* A53 cluster internals */
 		etm@ecc40000 {
@@ -303,43 +370,6 @@ cluster1_etf_out: endpoint {
 			};
 		};
 
-		/* An invisible combo funnel between clusters and top funnel */
-		funnel {
-			compatible = "arm,coresight-static-funnel";
-			clocks = <&crg_ctrl HI3660_PCLK>;
-			clock-names = "apb_pclk";
-
-			out-ports {
-				port {
-					combo_funnel_out: endpoint {
-						remote-endpoint =
-							<&top_funnel_in>;
-					};
-				};
-			};
-
-			in-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					combo_funnel_in0: endpoint {
-						remote-endpoint =
-							<&cluster0_etf_out>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-					combo_funnel_in1: endpoint {
-						remote-endpoint =
-							<&cluster1_etf_out>;
-					};
-				};
-			};
-		};
-
 		/* Top internals */
 		funnel@ec031000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
@@ -395,40 +425,6 @@ top_etf_out: endpoint {
 			};
 		};
 
-		replicator {
-			compatible = "arm,coresight-static-replicator";
-			clocks = <&crg_ctrl HI3660_PCLK>;
-			clock-names = "apb_pclk";
-
-			in-ports {
-				port {
-					replicator_in: endpoint {
-						remote-endpoint =
-							<&top_etf_out>;
-					};
-				};
-			};
-
-			out-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					replicator0_out0: endpoint {
-						remote-endpoint = <&etr_in>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-					replicator0_out1: endpoint {
-						remote-endpoint = <&tpiu_in>;
-					};
-				};
-			};
-		};
-
 		etr@ec033000 {
 			compatible = "arm,coresight-tmc", "arm,primecell";
 			reg = <0 0xec033000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index 374aa173bec6..9f0b5d5b97cb 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -334,6 +334,65 @@ IRQ_TYPE_LEVEL_LOW)>,
 					  IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	crg_rst: crg_rst_controller {
+		compatible = "hisilicon,hi3660-reset";
+		#reset-cells = <2>;
+		hisi,rst-syscon = <&crg_ctrl>;
+	};
+
+	iomcu_rst: reset {
+		compatible = "hisilicon,hi3660-reset";
+		hisi,rst-syscon = <&iomcu>;
+		#reset-cells = <2>;
+	};
+
+	thermal-zones {
+		cls0: cls0-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			sustainable-power = <4500>;
+
+			/* sensor ID */
+			thermal-sensors = <&tsensor 1>;
+
+			trips {
+				threshold: trip-point0 {
+					temperature = <65000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				target: trip-point1 {
+					temperature = <75000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&target>;
+					contribution = <1024>;
+					cooling-device =
+						<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&target>;
+					contribution = <512>;
+					cooling-device =
+						<&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -346,13 +405,6 @@ crg_ctrl: crg_ctrl@fff35000 {
 			#clock-cells = <1>;
 		};
 
-		crg_rst: crg_rst_controller {
-			compatible = "hisilicon,hi3660-reset";
-			#reset-cells = <2>;
-			hisi,rst-syscon = <&crg_ctrl>;
-		};
-
-
 		pctrl: pctrl@e8a09000 {
 			compatible = "hisilicon,hi3660-pctrl", "syscon";
 			reg = <0x0 0xe8a09000 0x0 0x2000>;
@@ -378,12 +430,6 @@ iomcu: iomcu@ffd7e000 {
 
 		};
 
-		iomcu_rst: reset {
-			compatible = "hisilicon,hi3660-reset";
-			hisi,rst-syscon = <&iomcu>;
-			#reset-cells = <2>;
-		};
-
 		mailbox: mailbox@e896b000 {
 			compatible = "hisilicon,hi3660-mbox";
 			reg = <0x0 0xe896b000 0x0 0x1000>;
@@ -1115,51 +1161,6 @@ tsensor: tsensor@fff30000 {
 			#thermal-sensor-cells = <1>;
 		};
 
-		thermal-zones {
-
-			cls0: cls0-thermal {
-				polling-delay = <1000>;
-				polling-delay-passive = <100>;
-				sustainable-power = <4500>;
-
-				/* sensor ID */
-				thermal-sensors = <&tsensor 1>;
-
-				trips {
-					threshold: trip-point0 {
-						temperature = <65000>;
-						hysteresis = <1000>;
-						type = "passive";
-					};
-
-					target: trip-point1 {
-						temperature = <75000>;
-						hysteresis = <1000>;
-						type = "passive";
-					};
-				};
-
-				cooling-maps {
-					map0 {
-						trip = <&target>;
-						contribution = <1024>;
-						cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-					};
-					map1 {
-						trip = <&target>;
-						contribution = <512>;
-						cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-					};
-				};
-			};
-		};
-
 		usb3_otg_bc: usb3_otg_bc@ff200000 {
 			compatible = "hisilicon,hi3660-usb3-otg-bc", "syscon", "simple-mfd";
 			reg = <0x0 0xff200000 0x0 0x1000>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
index 0db1849a2878..835b6a620548 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
@@ -139,6 +139,19 @@ IRQ_TYPE_LEVEL_LOW)>,
 		clock-frequency = <1920000>;
 	};
 
+	crg_rst: crg_rst_controller {
+		compatible = "hisilicon,hi3670-reset",
+			     "hisilicon,hi3660-reset";
+		#reset-cells = <2>;
+		hisi,rst-syscon = <&crg_ctrl>;
+	};
+
+	iomcu_rst: reset {
+		compatible = "hisilicon,hi3660-reset";
+		hisi,rst-syscon = <&iomcu>;
+		#reset-cells = <2>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -151,13 +164,6 @@ crg_ctrl: crg_ctrl@fff35000 {
 			#clock-cells = <1>;
 		};
 
-		crg_rst: crg_rst_controller {
-			compatible = "hisilicon,hi3670-reset",
-				     "hisilicon,hi3660-reset";
-			#reset-cells = <2>;
-			hisi,rst-syscon = <&crg_ctrl>;
-		};
-
 		pctrl: pctrl@e8a09000 {
 			compatible = "hisilicon,hi3670-pctrl", "syscon";
 			reg = <0x0 0xe8a09000 0x0 0x1000>;
@@ -194,12 +200,6 @@ media2_crg: media2_crgctrl@e8900000 {
 			#clock-cells = <1>;
 		};
 
-		iomcu_rst: reset {
-			compatible = "hisilicon,hi3660-reset";
-			hisi,rst-syscon = <&iomcu>;
-			#reset-cells = <2>;
-		};
-
 		uart0: serial@fdf02000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x0 0xfdf02000 0x0 0x1000>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
index 3f387f4cf5e0..7d540cb040d3 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
@@ -9,6 +9,39 @@
  */
 
 / {
+	replicator {
+		compatible = "arm,coresight-static-replicator";
+		clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
+		clock-names = "apb_pclk";
+
+		in-ports {
+			port {
+				replicator_in: endpoint {
+					remote-endpoint = <&etf_out>;
+				};
+			};
+		};
+
+		out-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				replicator_out0: endpoint {
+					remote-endpoint = <&etr_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				replicator_out1: endpoint {
+					remote-endpoint = <&tpiu_in>;
+				};
+			};
+		};
+	};
+
 	soc {
 		funnel@f6401000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
@@ -60,42 +93,6 @@ etf_out: endpoint {
 			};
 		};
 
-		replicator {
-			compatible = "arm,coresight-static-replicator";
-			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
-			clock-names = "apb_pclk";
-
-			in-ports {
-				port {
-					replicator_in: endpoint {
-						remote-endpoint =
-							<&etf_out>;
-					};
-				};
-			};
-
-			out-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					replicator_out0: endpoint {
-						remote-endpoint =
-							<&etr_in>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-					replicator_out1: endpoint {
-						remote-endpoint =
-							<&tpiu_in>;
-					};
-				};
-			};
-		};
-
 		etr@f6404000 {
 			compatible = "arm,coresight-tmc", "arm,primecell";
 			reg = <0 0xf6404000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 21eb268b5731..8bb74b4274a9 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -249,6 +249,61 @@ timer {
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	stub_clock: stub_clock {
+		compatible = "hisilicon,hi6220-stub-clk";
+		hisilicon,hi6220-clk-sram = <&sram>;
+		#clock-cells = <1>;
+		mbox-names = "mbox-tx";
+		mboxes = <&mailbox 1 0 11>;
+	};
+
+	usb_phy: usbphy {
+		compatible = "hisilicon,hi6220-usb-phy";
+		#phy-cells = <0>;
+		phy-supply = <&reg_5v_hub>;
+		hisilicon,peripheral-syscon = <&sys_ctrl>;
+	};
+
+	thermal-zones {
+		cls0: cls0-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			sustainable-power = <3326>;
+
+			/* sensor ID */
+			thermal-sensors = <&tsensor 2>;
+
+			trips {
+				threshold: trip-point0 {
+					temperature = <65000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				target: trip-point1 {
+					temperature = <75000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&target>;
+					cooling-device =
+						<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -298,14 +353,6 @@ medianoc_ade: medianoc_ade@f4520000 {
 			reg = <0x0 0xf4520000 0x0 0x4000>;
 		};
 
-		stub_clock: stub_clock {
-			compatible = "hisilicon,hi6220-stub-clk";
-			hisilicon,hi6220-clk-sram = <&sram>;
-			#clock-cells = <1>;
-			mbox-names = "mbox-tx";
-			mboxes = <&mailbox 1 0 11>;
-		};
-
 		uart0: serial@f8015000 {	/* console */
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x0 0xf8015000 0x0 0x1000>;
@@ -769,13 +816,6 @@ i2c2: i2c@f7102000 {
 			status = "disabled";
 		};
 
-		usb_phy: usbphy {
-			compatible = "hisilicon,hi6220-usb-phy";
-			#phy-cells = <0>;
-			phy-supply = <&reg_5v_hub>;
-			hisilicon,peripheral-syscon = <&sys_ctrl>;
-		};
-
 		usb: usb@f72c0000 {
 			compatible = "hisilicon,hi6220-usb";
 			reg = <0x0 0xf72c0000 0x0 0x40000>;
@@ -872,46 +912,6 @@ i2s0: i2s@f7118000 {
 			#sound-dai-cells = <1>;
 		};
 
-		thermal-zones {
-
-			cls0: cls0-thermal {
-				polling-delay = <1000>;
-				polling-delay-passive = <100>;
-				sustainable-power = <3326>;
-
-				/* sensor ID */
-				thermal-sensors = <&tsensor 2>;
-
-				trips {
-					threshold: trip-point0 {
-						temperature = <65000>;
-						hysteresis = <0>;
-						type = "passive";
-					};
-
-					target: trip-point1 {
-						temperature = <75000>;
-						hysteresis = <0>;
-						type = "passive";
-					};
-				};
-
-				cooling-maps {
-					map0 {
-						trip = <&target>;
-						cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-					};
-				};
-			};
-		};
-
 		ade: ade@f4100000 {
 			compatible = "hisilicon,hi6220-ade";
 			reg = <0x0 0xf4100000 0x0 0x7800>;
diff --git a/arch/arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi b/arch/arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi
index b801a48041f9..dd1426c4eada 100644
--- a/arch/arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi
@@ -7,12 +7,12 @@
 #include <dt-bindings/pinctrl/hisi.h>
 
 / {
-	soc {
-		/* [IOMG_000, IOMG_123] */
-		range: gpio-range {
-			#pinctrl-single,gpio-range-cells = <3>;
-		};
+	/* [IOMG_000, IOMG_123] */
+	range: gpio-range {
+		#pinctrl-single,gpio-range-cells = <3>;
+	};
 
+	soc {
 		pmx0: pinmux@e896c000 {
 			compatible = "pinctrl-single";
 			reg = <0x0 0xe896c000 0x0 0x1f0>;
diff --git a/arch/arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi b/arch/arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi
index 8f7bf80e6ece..cd924a091214 100644
--- a/arch/arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi
@@ -6,11 +6,11 @@
 #include <dt-bindings/pinctrl/hisi.h>
 
 / {
-	soc {
-		range: gpio-range {
-			#pinctrl-single,gpio-range-cells = <3>;
-		};
+	range: gpio-range {
+		#pinctrl-single,gpio-range-cells = <3>;
+	};
 
+	soc {
 		pmx0: pinmux@e896c000 {
 			compatible = "pinctrl-single";
 			reg = <0x0 0xe896c000 0x0 0x72c>;

-- 
2.53.0



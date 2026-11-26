Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6973F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 21:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qWwoiXZj;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pAoTlF1J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4iGg5XMVGlXwhaaIBet1cpm1QfD+VB5UjTjNYIbHbFQ=; b=qWwoiXZj6FF3MT
	pQANuq9+K9IGptOXZwzuvSncsN+prrZ6nAvss+DDEWFEAOw3pDU5HU4ummHIj0w23bjzY2HNqtJVC
	C1MPrvBZjUGCinE2B70BN0KyTTBFqzf73/Nu/qbuFrqeZg6PL51tzheLqRYmNA+XJKJ1cOjBjDDB7
	TFkcdw6xfPsn2+HcMiqrFuxMQJg6iGqEA9wQRsP6VcSZX1ShXOC76ummV3g1aAE8PhS5fnjv7jpHn
	V3/aqqXmx8WaEhcNG9fpsnpBuij7Hv0RwXV4tYGNIMkFqZTCBxx1bK1s9GDDmvQ9vW2DmUjM8mezc
	RjfZsSSp8fdJqNYmdrWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhP3-0000000Ebgc-0zVv;
	Thu, 26 Nov 2026 21:53:17 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhOn-0000000EbbQ-0qk3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 21:53:02 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4a42b34e930so6544574f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729979; x=1796334779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iGg5XMVGlXwhaaIBet1cpm1QfD+VB5UjTjNYIbHbFQ=;
        b=pAoTlF1JjYp24HxZKt3Mj6pXGfB7QP0JcfFlt1Wcr26h0LfPgYcW2k76Hvtxyb3M68
         qjq87FEA+x0GJSVaWYElbybU+ElOLDdjAq2Ea3fei0b0czpsdbE2S3Cn4Jmzin9eaVt1
         1/GUmh1cgoBrF/DIXFZ6rKfQDV5GRtz9nMy8Gp8cvo2DsbzsHG2szX56GZr/7nnlUcV4
         0fe7WlHPbuAiZiiFWAubar/4Nrcm/HI43ftCX7LTTq12ThSzRNrMLwKEH2jBQ5zJ1X4F
         LMXst5uCL+Arw7dNDOOLs1xFEa+86BN2wK5tL8b/pUB1lzD03G32xnMMkQ9iTCuoH1w2
         wiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729979; x=1796334779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4iGg5XMVGlXwhaaIBet1cpm1QfD+VB5UjTjNYIbHbFQ=;
        b=UWQMlnrd6fNAjkZq++Sr7wUV9bT+E+ZAJDKjoi8m9zWRMISpFoTrRwUGlMRpaTeERc
         Jg8Cd83lJ9K5bkEaH7JgLggA9lCVTyjS1GBCRCsfoZAKDvg7a24+UVPeSER5kWBudw1m
         T8kCRBLUzui072YqVMZAMLrqe83T5yDZ/K7PFq1rrgvP4T7fWJgjRQEtYr3XhvAABskh
         sUoLDY9xLJ0nOlRq5qTLN2HhDsnqejozX4+IFkh2VFo+xLPK2l1MUS0AZN5MAKJ+1xR9
         gzQHmIPPs8Ryf4XnY+fC6StOx/4o/ZYYhJyoV8GkcYojut5D+Nk0DXz38e2a7d1BUWyE
         HGTQ==
X-Forwarded-Encrypted: i=1; AL+hErGcXfJ0yWPddN/WkASZqAe759rMoxHaBsUYvNH/s6pu+EpzjUuOGa0RgyX9puFjmSJl58MbNu/tRh3Z6g/EmEKX@lists.infradead.org
X-Gm-Message-State: APuU4Z+0Q9jNapQQfVPm+NLZDmMVQhfeg/wKSFaBTN1zwrFOFaKBD2Eb
	xYCBmUxy72Wfmta4vlOE+sTBIm6H7c321QjiCTuZ57M/EO4cEGtlHfmrO0rW2w==
X-Gm-Gg: AZFdTZf/ClnJI/b8ZmkNcpfUYz1cDs7LPbclxsxApWKcwSdbVWdV0+Z1cA4l7yBD+Cy
	2FGnDrpkTq2YZO7NVU/3/UDoVs9nXx1PMfePpcbcWL46g99b6he/fz6uajYHwzXfDWn5XpU4ZZc
	PcBH4CVPItiYTCt4AAN5qroZ3VrS022bVtLTz7jDmTaj8/sMoBMNEPt/bWFisywrkJW3h8xjwp+
	Pd4jqQUbkDTj56780niHesPwHnc/STBbzMDnyHGPwS1B58YFDM0vWljRmKrsPx6DxNWckK8ULUs
	UCSFyffQVNBnMfy2nKVUNe2WKkbBUT54/7TEso4rmsyAA908QusH4iN6+NEvp6pbhZTvedJtwU+
	RJDbC9LvtGJG6/HVD/GL7JtUoRYxie20EB6q/vlJZU5E3AxiG9vUIl8D/t+WypxmGw0tTzOXfrp
	75L5JtlyHKoLGcJPI4IYj1HxUYJXLUHra7jw1KOLOHQ1bAyxPfPaMkDn+U6+/IHPLnctvmY64wf
	0+NSJVQ6fz+1AUong5voxIfiSx+UEHLpN5xIPIwUBYsa8CHAnje3++/iDALslzJk46Tf4XzvCNJ
	5cJ4ucLfcYy7FD4MZ50XKlLHorTSUCXgWSu3876tHMFHtebtDkfXlFqYqZpkyrJfHXkasvgknKe
	W7HSqeJ5pSlDS53zz+EoEyYM3inY21EwEXpIGhwQcBUeSSnrw5SyWtYrgTKq9hrIfMQ91oKp7dz
	pn5HrcbRMwjVncUrGp8c055eWdB9so7vjsSRaFKyb8iNI3zMK7PBsv+7PUaMtc1Ky94GPuDCS1L
	n+Ey0gXBTtoHvEVzm9a3EPr3U3fKcoqpoCSnRfNjg==
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id 5b1f17b1804b1-4bb88809950mr458713105e9.17.1795729493210;
        Thu, 26 Nov 2026 13:44:53 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:52 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] arm64: dts: allwinner: h616: Add display pipeline
Date: Thu, 26 Nov 2026 22:44:32 +0100
Message-ID: <20261126214433.3562326-11-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_135301_333613_D5DB6D86 
X-CRM114-Status: GOOD (  12.00  )
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

H616 contains a display engine 3.3 with two mixers and four TCONs.
Add the display pipeline DT nodes for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 420 ++++++++++++++++++
 1 file changed, 420 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 93c3b8279241..d7ed84d3c121 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -7,8 +7,11 @@
 #include <dt-bindings/clock/sun50i-h616-ccu.h>
 #include <dt-bindings/clock/sun50i-h6-r-ccu.h>
 #include <dt-bindings/clock/sun6i-rtc.h>
+#include <dt-bindings/clock/sun8i-de2.h>
+#include <dt-bindings/clock/sun8i-tcon-top.h>
 #include <dt-bindings/reset/sun50i-h616-ccu.h>
 #include <dt-bindings/reset/sun50i-h6-r-ccu.h>
+#include <dt-bindings/reset/sun8i-de2.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -94,6 +97,12 @@ l2_cache: l2-cache {
 		};
 	};
 
+	de: display-engine {
+		compatible = "allwinner,sun50i-h616-display-engine";
+		allwinner,pipelines = <&mixer0>, <&mixer1>;
+		status = "disabled";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -150,6 +159,84 @@ soc {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		bus@1000000 {
+			compatible = "allwinner,sun50i-h616-de33",
+				     "allwinner,sun50i-a64-de2";
+			reg = <0x1000000 0x400000>;
+			allwinner,sram = <&sram_c 1>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x1000000 0x400000>;
+
+			display_clocks: clock@8000 {
+				compatible = "allwinner,sun50i-h616-de33-clk";
+				reg = <0x8000 0x100>;
+				clocks = <&ccu CLK_BUS_DE>, <&ccu CLK_DE>;
+				clock-names = "bus", "mod";
+				resets = <&ccu RST_BUS_DE>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
+			planes: planes@100000 {
+				compatible = "allwinner,sun50i-h616-de33-planes";
+				reg = <0x100000 0x180000>;
+				allwinner,plane-mapping = <&display_clocks>;
+			};
+
+			mixer0: mixer@280000 {
+				compatible = "allwinner,sun50i-h616-de33-mixer-0";
+				reg = <0x280000 0x20000>,
+				      <0x8100 0x40>;
+				reg-names = "display", "top";
+				clocks = <&display_clocks CLK_BUS_MIXER0>,
+					 <&display_clocks CLK_MIXER0>;
+				clock-names = "bus", "mod";
+				resets = <&display_clocks RST_MIXER0>;
+				allwinner,planes = <&planes>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					mixer0_out: port@1 {
+						reg = <1>;
+
+						mixer0_out_tcon_top_mixer0: endpoint {
+							remote-endpoint =
+								<&tcon_top_mixer0_in_mixer0>;
+						};
+					};
+				};
+			};
+
+			mixer1: mixer@2a0000 {
+				compatible = "allwinner,sun50i-h616-de33-mixer-0";
+				reg = <0x2a0000 0x20000>,
+				      <0x8140 0x40>;
+				reg-names = "display", "top";
+				clocks = <&display_clocks CLK_BUS_MIXER0>,
+					 <&display_clocks CLK_MIXER1>;
+				clock-names = "bus", "mod";
+				resets = <&display_clocks RST_MIXER1>;
+				allwinner,planes = <&planes>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					mixer1_out: port@1 {
+						reg = <1>;
+
+						mixer1_out_tcon_top_mixer1: endpoint {
+							remote-endpoint =
+								<&tcon_top_mixer1_in_mixer1>;
+						};
+					};
+				};
+			};
+		};
+
 		gpu: gpu@1800000 {
 			compatible = "allwinner,sun50i-h616-mali",
 				     "arm,mali-bifrost";
@@ -978,6 +1065,339 @@ ohci3: usb@5311400 {
 			status = "disabled";
 		};
 
+		hdmi: hdmi@6000000 {
+			compatible = "allwinner,sun50i-h616-dw-hdmi",
+				     "allwinner,sun50i-h6-dw-hdmi";
+			reg = <0x06000000 0x10000>;
+			reg-io-width = <1>;
+			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_SLOW>,
+				 <&ccu CLK_HDMI>, <&ccu CLK_HDMI_CEC>,
+				 <&ccu CLK_HDCP>, <&ccu CLK_BUS_HDCP>;
+			clock-names = "iahb", "isfr", "tmds", "cec", "hdcp",
+				      "hdcp-bus";
+			resets = <&ccu RST_BUS_HDMI>, <&ccu RST_BUS_HDCP>;
+			reset-names = "ctrl", "hdcp";
+			phys = <&hdmi_phy>;
+			phy-names = "phy";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				hdmi_in: port@0 {
+					reg = <0>;
+
+					hdmi_in_tcon_top: endpoint {
+						remote-endpoint = <&tcon_top_hdmi_out_hdmi>;
+					};
+				};
+
+				hdmi_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		hdmi_phy: hdmi-phy@6010000 {
+			compatible = "allwinner,sun50i-h616-hdmi-phy";
+			reg = <0x06010000 0x10000>;
+			clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_SLOW>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_HDMI_SUB>;
+			reset-names = "phy";
+			#phy-cells = <0>;
+		};
+
+		tcon_top: tcon-top@6510000 {
+			compatible = "allwinner,sun50i-h616-tcon-top";
+			reg = <0x06510000 0x1000>;
+			clocks = <&ccu CLK_BUS_TCON_TOP>,
+				 <&ccu CLK_TCON_TV0>,
+				 <&ccu CLK_TVE0>,
+				 <&ccu CLK_TCON_TV1>;
+			clock-names = "bus",
+				      "tcon-tv0",
+				      "tve0",
+				      "tcon-tv1";
+			clock-output-names = "tcon-top-tv0",
+					     "tcon-top-tv1";
+			resets = <&ccu RST_BUS_TCON_TOP>;
+			#clock-cells = <1>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_top_mixer0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_top_mixer0_in_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mixer0_out_tcon_top_mixer0>;
+					};
+				};
+
+				tcon_top_mixer0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon_top_mixer0_out_tcon_lcd0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_lcd0_in_tcon_top_mixer0>;
+					};
+
+					tcon_top_mixer0_out_tcon_lcd1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_lcd1_in_tcon_top_mixer0>;
+					};
+
+					tcon_top_mixer0_out_tcon_tv0: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&tcon_tv0_in_tcon_top_mixer0>;
+					};
+
+					tcon_top_mixer0_out_tcon_tv1: endpoint@3 {
+						reg = <3>;
+						remote-endpoint = <&tcon_tv1_in_tcon_top_mixer0>;
+					};
+				};
+
+				tcon_top_mixer1_in: port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+
+					tcon_top_mixer1_in_mixer1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&mixer1_out_tcon_top_mixer1>;
+					};
+				};
+
+				tcon_top_mixer1_out: port@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+
+					tcon_top_mixer1_out_tcon_lcd0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_lcd0_in_tcon_top_mixer1>;
+					};
+
+					tcon_top_mixer1_out_tcon_lcd1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_lcd1_in_tcon_top_mixer1>;
+					};
+
+					tcon_top_mixer1_out_tcon_tv0: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&tcon_tv0_in_tcon_top_mixer1>;
+					};
+
+					tcon_top_mixer1_out_tcon_tv1: endpoint@3 {
+						reg = <3>;
+						remote-endpoint = <&tcon_tv1_in_tcon_top_mixer1>;
+					};
+				};
+
+				tcon_top_hdmi_in: port@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+
+					tcon_top_hdmi_in_tcon_tv0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_tv0_out_tcon_top>;
+					};
+
+					tcon_top_hdmi_in_tcon_tv1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_tv1_out_tcon_top>;
+					};
+				};
+
+				tcon_top_hdmi_out: port@5 {
+					reg = <5>;
+
+					tcon_top_hdmi_out_hdmi: endpoint {
+						remote-endpoint = <&hdmi_in_tcon_top>;
+					};
+				};
+			};
+		};
+
+		tcon_lcd0: lcd-controller@6511000 {
+			compatible = "allwinner,sun50i-h616-tcon-lcd",
+				     "allwinner,sun8i-r40-tcon-lcd";
+			reg = <0x06511000 0x1000>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_LCD0>, <&ccu CLK_TCON_LCD0>;
+			clock-names = "ahb", "tcon-ch0";
+			clock-output-names = "tcon0-pixel-clock";
+			#clock-cells = <0>;
+			resets = <&ccu RST_BUS_TCON_LCD0>, <&ccu RST_BUS_LVDS>;
+			reset-names = "lcd", "lvds";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_lcd0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_lcd0_in_tcon_top_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_lcd0>;
+					};
+
+					tcon_lcd0_in_tcon_top_mixer1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_mixer1_out_tcon_lcd0>;
+					};
+				};
+
+				tcon_lcd0_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		tcon_lcd1: lcd-controller@6512000 {
+			compatible = "allwinner,sun50i-h616-tcon-lcd",
+				     "allwinner,sun8i-r40-tcon-lcd";
+			reg = <0x06512000 0x1000>;
+			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_LCD1>, <&ccu CLK_TCON_LCD1>;
+			clock-names = "ahb", "tcon-ch0";
+			clock-output-names = "tcon1-pixel-clock";
+			#clock-cells = <0>;
+			resets = <&ccu RST_BUS_TCON_LCD1>, <&ccu RST_BUS_LVDS>;
+			reset-names = "lcd", "lvds";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_lcd1_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_lcd1_in_tcon_top_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_lcd1>;
+					};
+
+					tcon_lcd1_in_tcon_top_mixer1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_mixer1_out_tcon_lcd1>;
+					};
+				};
+
+				tcon_lcd1_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		tcon_tv0: lcd-controller@6515000 {
+			compatible = "allwinner,sun50i-h616-tcon-tv";
+			reg = <0x06515000 0x1000>;
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_TV0>,
+				 <&tcon_top CLK_TCON_TOP_TV0>;
+			clock-names = "ahb",
+				      "tcon-ch1";
+			resets = <&ccu RST_BUS_TCON_TV0>;
+			reset-names = "lcd";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_tv0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_tv0_in_tcon_top_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_tv0>;
+					};
+
+					tcon_tv0_in_tcon_top_mixer1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_mixer1_out_tcon_tv0>;
+					};
+				};
+
+				tcon_tv0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon_tv0_out_tcon_top: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_hdmi_in_tcon_tv0>;
+					};
+				};
+			};
+		};
+
+		tcon_tv1: lcd-controller@6516000 {
+			compatible = "allwinner,sun50i-h616-tcon-tv";
+			reg = <0x06516000 0x1000>;
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_TV1>,
+				 <&tcon_top CLK_TCON_TOP_TV1>;
+			clock-names = "ahb",
+				      "tcon-ch1";
+			resets = <&ccu RST_BUS_TCON_TV1>;
+			reset-names = "lcd";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_tv1_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_tv1_in_tcon_top_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_tv1>;
+					};
+
+					tcon_tv1_in_tcon_top_mixer1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_mixer1_out_tcon_tv1>;
+					};
+				};
+
+				tcon_tv1_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon_tv1_out_tcon_top: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_hdmi_in_tcon_tv1>;
+					};
+				};
+			};
+		};
+
 		rtc: rtc@7000000 {
 			compatible = "allwinner,sun50i-h616-rtc";
 			reg = <0x07000000 0x400>;
-- 
2.43.0



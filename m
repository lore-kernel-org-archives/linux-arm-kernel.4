Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AAD606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 17:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n6WvkyLm;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=uvLDirgr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sHP2oF/bjdk4Sr2x8S+jhHLHTWdyktVHIEfvBs5hv5Y=; b=n6WvkyLmXr2SaoEYnANJKH3ARZ
	tWXUAUGqOUPUUVg0r425hZEwLWp46Uqgmsvacvv6LRAqAX6vwyoT3w0a8/wxKK2mzQz3rlERni1G/
	l4ZMCvqZbXPPFPPMZpxI/5SOhMHHgLV0+6Eb+oVd/cPeLt0aX68YNoNg6uty/jnJ8sp73OmuGmvBJ
	OcHlz3DAcsE0jCZv3K7SIQ/zhu+LrEF2KL0FiScYv6hbYoF9PceKf+rlbKsiE/q9DMWasajaN3Y0c
	0776TdqUJEFBl57FIRUKpPHkdWRnSJjDOBdgoDfb2wudVe6oF/KvBsjObddao7Q+inBkkzmIjOw9g
	SVYBWX4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPO7J-0000000DJ5s-019J;
	Fri, 06 Nov 2026 17:52:45 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPO7G-0000000DJ4i-26vw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 17:52:43 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-49376eb635fso340554f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 09:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793987560; x=1794592360; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sHP2oF/bjdk4Sr2x8S+jhHLHTWdyktVHIEfvBs5hv5Y=;
        b=uvLDirgr4cPRloX0hPzBxk78EzJdZbYyw2+2W9hbi9ovUsXGYX+kWDvfBmi3MVWR2W
         rHzRKdEU+e9C2sRjxORASFdQQx2ccEl6XJmIS0GJzX1SwbP1XmDX9mc7BYUKy0+4eyFm
         BiJxmZUZYJrkqNyn9ZGWA9l/WkM7vCmG4NG4oLK8OMK6B1s7CLv6oeT4gqHVKzyf8XnR
         2HLsKWEH45tBaog66T1FY2T0pJ00cqxj2dDG4cfxj1KiEYYlBgYUJkVwBUPDpDEkKvck
         eT4shi1JZykYhTg6FY7c5vZgiZMZoHcbz2+X8edWv+rwOPpP8kqKKbA2bbUiqVUc9B3o
         MDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987560; x=1794592360;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sHP2oF/bjdk4Sr2x8S+jhHLHTWdyktVHIEfvBs5hv5Y=;
        b=DP9Ft5+Sko8GeUDzxzh+RDO28+ufBTd/+GwOBdRP1YBdBZkS3zh7Qx3QKMCu5KRTO8
         91SJUxZFG6N9iyujBo3+2D8c++AO/FpkcW0e7EUn1izNUg1/t3O94aybL0M/7CVEjsk+
         OtZ5xsQkRdi+OxOZ+908gFrUKLZy2tBTjnAMQmJ/INIXfAFbFFMbgTRax0C5wr6ITG+o
         3cs1B26SC/fyiv5SUJQd7Mt4p+i+A32thxhFCSxskUvNK53bNSlcYegiFLd5cB98XSNj
         9RBuzH31mu+Kdcm66U3+F9Ro6n+xFRj8L5Jq0E3Bwk35gn7NPY/OU42VzSCRSJdyf6Lw
         sUcw==
X-Forwarded-Encrypted: i=1; AL+hErEaR0hWNzgngCwLO0iYCQPv9ZirCfuV14ASGpdq1+Z35vNe8GS2LNbOvku5BB1ACX48Ky90cF1H+xQ/DbSuFxNf@lists.infradead.org
X-Gm-Message-State: APuU4Z+3VdlTIB79Al7KWuekILfzxH29mpcnGS9O0oFJYI2M1/Rtcl1/
	H/gI1Q84pWWoW63btz88bcKQhdA+t/QxBgvpB5EaTDV8FGB071hS6+nPzI0icfk10FM=
X-Gm-Gg: AYBFou0lizryMZTdoPowiPaAGQ+INybEe3APErEFQpDQi/T/ex4PmABSLmCqtm8IuYU
	lTlHDMoDfgPOOqAb7yRF4t9Jw05ynyzavL9XdcnbM0yDtw7b9QWWVQWTPrW0dcT/muJu/QG68Fx
	SgImF7uKQTLtebiRRY/Uy6i/64pfVilTDky5vyPJhvc5Um447DOWN8Wlb+xbDb536BtAqoXp6+n
	ilcfDt6YQVNra2ahT9aUwZ8UPE05p7zkpgLTLTV/5U0C/ufH2Z45ITo4r/ocJphTaf6CMybLb74
	JAPr7wscB5gCEo6NNGCD/a2vySRncuCfPXMNdkevEtHJ20NWLdHrjADaCyFBgbfQJahJVE8TKIf
	7m4gknElz/V8ySC3qC2IS3bRwefn8Z1XLfQmkIhag0Whuf6bSVlKofLGJ6MmAgZnJC0FSf/1tZY
	k9mn1y9r5YBQqnCIgrIMkBjze3U02a7Op9ljxnG9gf6fr3QB5VVGtWOzD0icPNDk857lqehI5xp
	ySsaWMDd1I4QizkwalviEcZ2UWWc7VOw2FZi6oSVhaY0B4YRzxOrIidrwt1jBIFIpnIuHTqU9FY
	Yye2jCqeeb9YjDQHJKMz/tJMSa4TCgudi6VZ2lUMbChf7fCa6BHpv+9U+BM81saHEjPvZGHNSqw
	jKomJ4Go7sA==
X-Received: by 2002:a05:6000:4b17:b0:48e:4561:8a17 with SMTP id ffacd0b85a97d-49275fe4f50mr6153448f8f.16.1793987560021;
        Fri, 06 Nov 2026 09:52:40 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d6382dsm4427671f8f.19.2026.11.06.09.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:52:39 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 06 Nov 2026 21:52:35 +0400
Subject: [PATCH] arm64: dts: rockchip: Describe the Type-C port on RK3576
 EVB1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-rk3576-evb1-husb311-v1-1-99c2f57ea2a5@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm3S8jMQr2JcMGMHqgmaKRATw
 t0ZZfkt3tvAJKkYXIsNkqxq+p4y+FJAGPtpENRHNpRUOmZymF5V0zqU1TOOi/mKGYkkhhjrvqM
 OcvlJEvX7v97up23xTwnzbwX7fgDI0qS2dwAAAA==
X-Change-ID: 20261106-rk3576-evb1-husb311-00efcff4a808
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5103; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Bsdyugnk6OoKTZGf3182OVL5hFUwb7G3DqCpOh/DVH8=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9E356PT+1Oc+onVHtN5c/m+fkZfEfbN/o3K4unBac9
 spw9eeVHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1piHD/0jlzK8xASsOlqnsPih7Ujw6X1Byvvb29dkyOWdP9cVbqzMynN3n+Cw
 3NoajdvvXrhNybAnxvYlB1670fhav3FKXwf+WBQA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_095242_577191_5A809A0E 
X-CRM114-Status: GOOD (  14.31  )
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

RK3576 EVB1 has its USBDP PHY routed to a Type-C port with a HUSB311 CC
controller and a fixed-voltage VBUS supply.

Describe it in the device tree, including the wiring for both the USB and
the DP side.

This makes the data roles follow the Type-C port's negotiation, so the
port stops being host only. It also leaves the VBUS regulator to be
managed by TCPM instead of being hardwired via the tangentially related
phy-supply on a USB controller. DP lanes are also muxed dynamically by
the USBDP PHY based on the Type-C port's negotiation, so the hacky fixed
lane muxing also goes away.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 150 ++++++++++++++++++++++-
 1 file changed, 147 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index f83d129f96f1..a9b27cdb2dfa 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/usb/pd.h>
 #include "rk3576.dtsi"
 
 / {
@@ -334,6 +335,22 @@ &combphy1_psu {
 	status = "okay";
 };
 
+&dp {
+	status = "okay";
+};
+
+&dp0_in {
+	dp0_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_dp>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&usbdp_phy_dp_in>;
+	};
+};
+
 &gmac0 {
 	clock_in_out = "output";
 	phy-mode = "rgmii-rxid";
@@ -772,6 +789,58 @@ regulator-state-mem {
 &i2c2 {
 	status = "okay";
 
+	usbc0: typec-portc@4e {
+		compatible = "hynetek,husb311", "richtek,rt1711h";
+		reg = <0x4e>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA5 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
+		vbus-supply = <&vbus5v0_typec>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "source";
+			source-pdos = <PDO_FIXED(5000, 2000,
+						 PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
+
+			altmodes {
+				displayport {
+					svid = /bits/ 16 <0xff01>;
+					vdo = <0x00001c46>;
+				};
+			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					usbc0_hs: endpoint {
+						remote-endpoint = <&usb_drd0_hs_ep>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					usbc0_ss: endpoint {
+						remote-endpoint = <&usbdp_phy_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					usbc0_sbu: endpoint {
+						remote-endpoint = <&usbdp_phy_dp_out>;
+					};
+				};
+			};
+		};
+	};
+
 	hym8563: rtc@51 {
 		compatible = "haoyu,hym8563";
 		reg = <0x51>;
@@ -944,6 +1013,14 @@ usb_otg0_pwren: usb-otg0-pwren {
 		usbc0_int: usbc0-int {
 			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
+
+		usbc0_sbu1: usbc0-sbu1 {
+			rockchip,pins = <2 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		usbc0_sbu2: usbc0-sbu2 {
+			rockchip,pins = <2 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
 	};
 
 	wifi {
@@ -1008,7 +1085,6 @@ &u2phy0 {
 };
 
 &u2phy0_otg {
-	phy-supply = <&vbus5v0_typec>;
 	status = "okay";
 };
 
@@ -1051,13 +1127,74 @@ &ufshc {
 };
 
 &usbdp_phy {
-	rockchip,dp-lane-mux = <2 3>;
+	mode-switch;
+	orientation-switch;
+	pinctrl-names = "default";
+	pinctrl-0 = <&usbc0_sbu1 &usbc0_sbu2>;
+	sbu1-dc-gpios = <&gpio2 RK_PA6 GPIO_ACTIVE_HIGH>;
+	sbu2-dc-gpios = <&gpio2 RK_PA7 GPIO_ACTIVE_HIGH>;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usbdp_phy_ss_out: endpoint {
+				remote-endpoint = <&usbc0_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usbdp_phy_ss_in: endpoint {
+				remote-endpoint = <&usb_drd0_ss_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			usbdp_phy_dp_in: endpoint {
+				remote-endpoint = <&dp0_out_con>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			usbdp_phy_dp_out: endpoint {
+				remote-endpoint = <&usbc0_sbu>;
+			};
+		};
+	};
 };
 
 &usb_drd0_dwc3 {
-	dr_mode = "host";
+	usb-role-switch;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			usb_drd0_hs_ep: endpoint {
+				remote-endpoint = <&usbc0_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			usb_drd0_ss_ep: endpoint {
+				remote-endpoint = <&usbdp_phy_ss_in>;
+			};
+		};
+	};
 };
 
 &usb_drd1_dwc3 {
@@ -1079,3 +1216,10 @@ vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi_in_vp0>;
 	};
 };
+
+&vp1 {
+	vp1_out_dp: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp1>;
+	};
+};

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-rk3576-evb1-husb311-00efcff4a808

Best regards,
--  
Alexey Charkov <alchark@flipper.net>



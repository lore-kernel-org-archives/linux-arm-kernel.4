Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421EE606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 19:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dpy1SSt3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYP0n5Mp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nvA1lxZEpIqjWhYL3aA6OSO2sYeOAGbwAuUAZj8n0+c=; b=Dpy1SSt3PyIvoq
	STuKAgkCDTfmcTW0zCueB/X3isQHaTaOsbGsSgbiS8hKMIuBoshr+naTderMxhoRJ40K0XGQqZDGg
	RSGFUsChLZ6lPOUSnM7bKAGTUGoJJHdbeL5fK49ZENlBOqAX/te9Z0pOnqOt1RSwutQXqKq2cTpva
	h/IpqAhtD+vZTwyxQZBvtKnoKalGnH7+DEn4cu1YVr2I6UMBqssCOKiKmUXSIUdl2fv3jWQWAvbEX
	hbTFIfqTnivos7cVeStUMdf1CtgvpknPq2czOcD+CoZ/CxJtze64UYOgCtEHhNT8y76hugiXMrOCd
	XGod0GJd7YUiYhdsA2KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrYT-00000004udX-0Wey;
	Tue, 10 Nov 2026 19:30:53 +0000
Received: from mail-dy2-x0a.google.com ([2607:f8b0:4864:36::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrYQ-00000004uaQ-0lhl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 19:30:51 +0000
Received: by mail-dy2-x0a.google.com with SMTP id 5a478bee46e88-36d73027aedso1492835eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 11:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794339049; x=1794943849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvA1lxZEpIqjWhYL3aA6OSO2sYeOAGbwAuUAZj8n0+c=;
        b=lYP0n5MphL+1oBcmBvXASyZNYSrZuL/+dGZbDVhqKEsnbTCq2G5mfXtr83LrvGkD8c
         9ZabP+LlWfrGl1X/SbYd8t3Fu2Lo63tsWCMb3ilZkpdWlgf/Ox3A7h6QyE1/SSA49JIt
         sN1w9HUaveBHbTsiAkw/SRRjgC7BlRN/H6rsUFrxSfDRXtTX1m3ZEsk8eaRhxxX+DKF9
         /H1+oZw8fe7kK0KGGQUUmnuOpyqE596NCJrPL/5fWJAR7UbV8ku2X61IZ1g7Oh2EOr/y
         uCCvAozVMS5DpyMOFKPYHCws2JU1cBE2R4vEmPGetTHiqLoEh2bD4kw0P8nPkaQmkg2f
         C8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339049; x=1794943849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvA1lxZEpIqjWhYL3aA6OSO2sYeOAGbwAuUAZj8n0+c=;
        b=EAvDc3rThR7vahzQ+P6nd3gunlcw9ZURW3XiKxu+7ATmIgV5UHkc6+tbmsLuw4PPmg
         7etRsJOLOxPo2hSOhGsZQJwT1PXNq4uFOWCJ3PRtxrBZuduV4QWQHdyQ9ymk3dlK4W7h
         EIld2wRLFt2m5aasTVTJDviyX/zKS/6o1u7Usa+4czmbTux7kjwqgA10kmjwPGSfuzM2
         B6dFf0EpFQl8xPs4fyFCaN4OKk7JQasaABH7D3TazGX62gzGWVo08Y/6z3hBdQo4teNj
         Yu21bCvvOqhn0EYB2/UnkDVu+ceRKp+8guGBVjoYFLeFuU2+NBeoar60FvNuWZpp+rkB
         oT2A==
X-Forwarded-Encrypted: i=1; AL+hErFeK2/pURBopD8srp/HZ8sxJj+2VA4eueGv80gxXFz+xgyeNQV6BkmER4HQiXcObeLrevV2ojjH4/svuW5dBFcT@lists.infradead.org
X-Gm-Message-State: APuU4Z8c6A7PSkAFUB/mfpntpXDkkloAEH5ukxu3v/+yKdy6GKN+TJ1+
	rxnX2pBnXBIAkh7/NeM9/Xuw4137+c2HoAI7D6E/KUGht4CEL/btlgn8ZfRAxnJW1EaolQ==
X-Gm-Gg: AYBFou3/lUib5K3ghCjB5UU+hArzg5H6F3Rf1IXtOX4TCGU/VfSA0AxHFYKYE/KSN22
	WMVySm8drvEtB8jeuojyiwHIYo4QAL5Jxjl2jUjx2lZ9xdjZXdDLUyyV48oUCdWrfNkcDYsbuou
	1S4E6fCnQGGX4mE1mLPEFPf7EomRVBRYFzShwfARFaPF8vBTej2EKyaesxu4mIGNzbkheBvCIpg
	0wFvB9bYZoAHg0aGO9F0twK3oMQR878DtAFkgaNgpQYe6vxsyUhPpP7Yjk99OTH6RBmHMs6MmBe
	Iujs8XKLIHnrT5BqdZ7PF1zvVv8qVUiAHTeLeQe6FZQt2OrTBr/WL4Q0zE4BdTrEkdm5Sqo59PU
	qi6ZeSvya0pHto0fD92xi6TFZ3JryyzibRW3QCRPTg7MPnA15z1eynKVjhnmFrkfWRnWennAfkG
	Cogz921gxUndZBiZb9mcblu+HOqD32JkiyCa3yMBXV+8RRu1FY/PwYWLSfHaqApgvedWG657cOZ
	q9jytCIGlgsRp/UliJ5ZnsvrsH+oruLGAsDTvsuru/0WCN3+zCinMdtAjniYrUCvEdIBvpbggP8
	wGB96Nwvzl+KU4Psdr9AL4vs77D8V0bzvzARmKrlwv88bA5wWg==
X-Received: by 2002:a05:693c:8814:20b0:36f:4615:9747 with SMTP id 5a478bee46e88-37680a5d9e4mr395559eec.0.1794339049150;
        Tue, 10 Nov 2026 11:30:49 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ad6f11csm7730435eec.0.2026.11.10.11.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:30:48 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: rockchip: add USB-C DP altmode support to LubanCat 4
Date: Wed, 11 Nov 2026 03:30:28 +0800
Message-ID: <20261110193028.512456-3-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110193028.512456-1-cyan2254650260@gmail.com>
References: <20261110193028.512456-1-cyan2254650260@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_113050_254596_0B5E5489 
X-CRM114-Status: GOOD (  12.86  )
X-Spam-Score: -1.9 (-)
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

The Type-C port on the EmbedFire LubanCat 4 supports DisplayPort
alternate mode through the RK3588 usbdp combo PHY (usbdp_phy0).
The sideband use (SBU1/SBU2) AUX signals are routed through two DC
switches controlled by GPIO4_B3 and GPIO4_B4.

Add the DisplayPort alternate mode entry (SVID 0xff01) to the USB-C
connector and connect connector port@2 (SBU) to usbdp_phy0 port@3.
Configure usbdp_phy0 with mode-switch and sbu{1,2}-dc-gpios.  Enable
dp0 and connect dp0_out to usbdp_phy0 port@2, with dp0_in fed from
VOP2 VP1.

Tested driver stack registration on LubanCat 4 hardware:
- dw_dp bounds successfully to display-subsystem;
- DRM DP connector card2-DP-1 is registered and reports disconnected;
- typec_displayport registers the DisplayPort altmode driver;
- usbdp_phy0 registers the phy-switch and phy-mux.
Physical DisplayPort link training and monitor video output are pending
verification with a physical USB-C to DP sink/cable.

Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 .../boot/dts/rockchip/rk3588s-lubancat-4.dts  | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
index a94aaddb2..6c5a942df 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
@@ -323,6 +323,13 @@ usb_con: connector {
 			source-pdos =
 				<PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
 
+			altmodes {
+				displayport {
+					svid = /bits/ 16 <0xff01>;
+					vdo = <0xffffffff>;
+				};
+			};
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -342,6 +349,14 @@ usbc0_ss: endpoint {
 						remote-endpoint = <&usbdp_phy0_ss_out>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					usbc0_sbu: endpoint {
+						remote-endpoint = <&usbdp_phy0_dp_out>;
+					};
+				};
 			};
 		};
 	};
@@ -857,6 +872,9 @@ &usb_host2_xhci {
 
 &usbdp_phy0 {
 	orientation-switch;
+	mode-switch;
+	sbu1-dc-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
+	sbu2-dc-gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
 	ports {
@@ -878,6 +896,22 @@ usbdp_phy0_ss_in: endpoint {
 				remote-endpoint = <&usb_host0_xhci_ss>;
 			};
 		};
+
+		port@2 {
+			reg = <2>;
+
+			usbdp_phy0_dp_in: endpoint {
+				remote-endpoint = <&dp0_out_con>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			usbdp_phy0_dp_out: endpoint {
+				remote-endpoint = <&usbc0_sbu>;
+			};
+		};
 	};
 };
 
@@ -895,3 +929,26 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi0_in_vp0>;
 	};
 };
+
+&dp0 {
+	status = "okay";
+};
+
+&dp0_in {
+	dp0_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_dp0>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&usbdp_phy0_dp_in>;
+	};
+};
+
+&vp1 {
+	vp1_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp1>;
+	};
+};
-- 
2.56.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046E2606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w/cmEiwz;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=J8xHpXZ0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l7FztdzFHxqU1nbusRsPYGsX/uBT6CT4nw2wRBYgCtw=; b=w/cmEiwzjS8Awv
	ShuysEBLqcUwQzJN8yoWSKxfeEedz4+c767Qm+O6P+Ujyzdc5f6TXLpUNn0yXX0G9k7VR9gyYXQNf
	VIOJbWt1jXynRskPu74Hhxylzx6NPXH9m/8ctAY/65soy4bmlyM7ky6rtsCumDj9L8LZIQTTZErpg
	G8XzhrjWIS8S5SdzfbKeNHCspniEgCYEx4tYytcLRHXoSUCpazUadQfrobzZSJcDah9oIy9iiW2e9
	iHT3a/Kmaezywu50d0kxC6aMppzJRbIxOgABNZeSsk8Mfcl5oBlHa9teaOr0KvmAqkiz9k5fkMfH6
	5TptnHtYyUECtqsc/v7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtYq-0000000Fgfx-2f1i;
	Fri, 27 Nov 2026 10:52:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtYU-0000000FgQe-25qd;
	Fri, 27 Nov 2026 10:51:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795776708;
	bh=9E2x1LUH3yCRqvxf0O4/U2wLcXTXtQpAgPUIDrh2sUg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J8xHpXZ07C0EH81jSHkxTEOWU39MvqudlKMRNzJtw5RQX7ZfNbuS/5JFLTAQAG3Is
	 WWyJN7h9iSN1ZrfXbHenJS9HQhYpGCA9hPn5f40UfIQnGO4KnaOw9eHWgIi2aMyzmF
	 eEMQoOfQN4forrrm/r0xdboFG/fwCDogeFSRhPl7DW7XKfhktCaupZEMKMHflsq2Mz
	 lYUepct5erRZva2q5+yXTzNgpDFfR+fbTc7SMuHXmYcviLfjuPjmddk0UDM6V04cGq
	 0Cn7B70YOYzmM3ll55vAr4wVA3TYBC8PVM7orj+jV0InvWmIsXZFA0N68Z7CnRI2ID
	 0BptI52wUVgog==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 48AB817E07B5;
	Fri, 27 Nov 2026 11:51:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0A284480031; Fri, 27 Nov 2026 11:51:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 27 Nov 2026 11:51:40 +0100
Subject: [PATCH v2 03/11] arm64: dts: rockchip: Fix USBDP ports for
 Indiedroid Nova
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-rockchip-usb-c-dp-altmode-v2-3-77ee78869307@collabora.com>
References: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
In-Reply-To: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2088;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=9E2x1LUH3yCRqvxf0O4/U2wLcXTXtQpAgPUIDrh2sUg=;
 b=kA0DAAoB2O7X88g7+poByyZiAGsJYMOhJfaTz3Pp47KI4dijSWdtJ8llGgPXsoX2I3sZeK/xJ
 4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCWDDAAoJENju1/PIO/qa5bQQAJ5f
 5H5HK9xA7sR3Q0u3ZLebGMxNQ8d9gMVBsCX+UyHg3cluJpLFJs0GJ3Cqr57lwAXl9mfzq+WGSh3
 ke5MzfAIwl3lTFHVOqZPss5QURm2zCnFtoOzftaqv8tCfCHdxL92tW9GsODFegDpjOL8pTS5YwJ
 IJoA8+jwGAkXftJfVc2qDcKBoweV9AUEExkQGGLlcwIUfwp9O5is1Iw057iPFrv4Fa0qmV9D7QF
 1NRyRZ6l7t1JzWJR0ryLzGsGE3CswFAyqakgPC4bsIsiak/Wm/L4KnDzsRVCzVm0E/EPrwp2nJl
 HF8qkcOUT8wy7fjzY3+nJ2y53Wa249/EU+yBhZ/UlOoImDmGub0RjH9eWQ/nlp0QiNU77HD2Z20
 ZoAuv/h8L7B8bNFuZfKOgaSqt/ysGqttaRbKRDBgmtHCN5JdtzFh9edZcGv1gb2Wl7OnFaDssDp
 IdxlDq6gGC9sPVSODlZ+xn571sz1kJ6rpi12JeiCkQ3ykNJmdHM+6tzjBPNIbS4Qv7GdIX15ls3
 V6ge8lNCxwRx1ZpGBrxQgEEQoWU7NeeE6cnD7a0MldDsSMxVPlKAlcL+4n22BbJYuiE7sTcm+K9
 jEV32ciSjpbXJL2MKdRZyHvc9oY/dpjm0bgoJ/Xsq/SK47cBciN3IIAJfKU9oIbMwAojxYd9XOs
 BaoOA
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_025150_803753_0F1196EB 
X-CRM114-Status: GOOD (  10.95  )
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

Fix the USBDP PHY ports description for the Indiedroid Nova, so that it
follows the documented ABI. The current binding confuses endpoints with
ports and makes no sense at all.

While at it drop the rockchip,dp-lane-mux property, which makes no sense
for USB-C as the DP lanes are routed dynamically based on negotiation
via the USB-PD protocol.

Cc: stable@vger.kernel.org
Fixes: 7230cdc1fc3c ("arm64: dts: rockchip: Enable USB-C DP Alt for Indiedroid Nova")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  | 31 +++++++++++++++-------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
index c775f82c0624..59b95461df57 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
@@ -1059,31 +1059,42 @@ &usbdp_phy0 {
 	mode-switch;
 	sbu1-dc-gpios = <&gpio4 RK_PA0 GPIO_ACTIVE_HIGH>;
 	sbu2-dc-gpios = <&gpio4 RK_PA1 GPIO_ACTIVE_HIGH>;
-	rockchip,dp-lane-mux = <2 3>;
 	status = "okay";
 
-	port {
+	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		usbdp_phy0_ss_out: endpoint@0 {
+		port@0 {
 			reg = <0>;
-			remote-endpoint = <&usbc0_ss>;
+
+			usbdp_phy0_ss_out: endpoint {
+				remote-endpoint = <&usbc0_ss>;
+			};
 		};
 
-		usbdp_phy0_ss_in: endpoint@1 {
+		port@1 {
 			reg = <1>;
-			remote-endpoint = <&usb_host0_xhci_ss>;
+
+			usbdp_phy0_ss_in: endpoint {
+				remote-endpoint = <&usb_host0_xhci_ss>;
+			};
 		};
 
-		usbdp_phy0_dp_in: endpoint@2 {
+		port@2 {
 			reg = <2>;
-			remote-endpoint = <&dp0_out_con>;
+
+			usbdp_phy0_dp_in: endpoint {
+				remote-endpoint = <&dp0_out_con>;
+			};
 		};
 
-		usbdp_phy0_dp_out: endpoint@3 {
+		port@3 {
 			reg = <3>;
-			remote-endpoint = <&usbc0_sbu>;
+
+			usbdp_phy0_dp_out: endpoint {
+				remote-endpoint = <&usbc0_sbu>;
+			};
 		};
 	};
 };

-- 
2.53.0



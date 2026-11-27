Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EECE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SW6CPFer;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=lz6n/JXN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1DlHF+TG+diBHxqaKfK6dO3gBALdslzaCeDZ1j4rHbQ=; b=SW6CPFer5bq71u
	fycaAl8DCzddQgbshvIx5fbqI2a0LhBWZyNs2ZNHwu8Fpg7ZOO+nG+Ns2VSRWxdG7NyEaTAWnCGb4
	X3+jyt6g/TnzwjrCA/vcgbhL0gBwPXWn8fgVwaHmBsUdYQqLW5INYBUubOztq9U3p7vkM/m6bfoxa
	D2vHF9/v1DyOcm9MrUPNINyBWMO3EobnuH4y480bUY81LwDbyCUo0ACaXrTrGLnuPh3RdQA/c9GFh
	5zvlhyE2AWrGgHGfs6OB6aLTQRzRJRUXbDQzoM2pDYfjy9fM6zlZuz5HIyhVRwPX+rp8ArBnHFDJ5
	AHXI2tLxmxLXOMh86dNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtZ3-0000000FgoK-1tSG;
	Fri, 27 Nov 2026 10:52:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtYU-0000000FgQg-2ZNI;
	Fri, 27 Nov 2026 10:51:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795776708;
	bh=rvAzhRQQIy5kioDrJ9LSE0UkREav53+yjYJAByOmgb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lz6n/JXNkpKFWEGlDqo0bOMfK0R00OheiLKCR1zKh1MoUMPKwXaQNAjurmjyj58BX
	 yUPEQAeFD3f0A1+TOuc2ujVBq4cXPSRzo7cReGqsoCfQUgt5eUH65TGi16rEW5C1nz
	 Sst4AyI+l1/7cvpq8STZHBeVkzT5nyrGUmVONmjsBHOD4l/LIql/ZSQzBfLVCfR3if
	 rDvc81oJzZmUkyHvUjQR3i+IaZDepG3PHHENLDm+TL2SCYRDHBt6bqmgffuqtgIQav
	 1H6ef0Za/SK+9yedQkdn9hIfX1EYTuQSR50RkgkN8mVIG6ZcSTX6JzKB+yDNZXEz9T
	 mrQ9DlN9zv1Xg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 477F617E079B;
	Fri, 27 Nov 2026 11:51:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 082AC480030; Fri, 27 Nov 2026 11:51:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 27 Nov 2026 11:51:39 +0100
Subject: [PATCH v2 02/11] arm64: dts: rockchip: Fix USBDP ports for
 LubanCat 5IO board
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-rockchip-usb-c-dp-altmode-v2-2-77ee78869307@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1816;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=rvAzhRQQIy5kioDrJ9LSE0UkREav53+yjYJAByOmgb8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsJYMPY+N5iE7Wy7BRePrRobZRlTv2UYSg0l
 Yvk/pO9Z9cCfYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCWDDAAoJENju1/PI
 O/qaxQEP/Rf1Z7z8t1a0pUY3pWN7dh2jOZjTcLfI6RVTjTFbRbblDrQq0V8l4kCfqS0lCCSYmhL
 sk6yb513yOLtSImSq+sKxso78662375IczXbhjgGHIwdXbz7vnWe3E7eALccO4pUx0Ezz3R7zAn
 REsAqOQJlCu+y8bQiSHGf+VsVKrQwCrnIuFh1k9tkcOcnAyvT7VkNcpctsiFpXiPGjqPdFzzmtn
 S3rjgrg4PrsOULU/p647vXkDYKgcSQ+nIpqrUPuxwXlzYYJ9JVucAhHrzZpFxlhBkx5Lr0LM2Yz
 l+GBhE7YdGcTH7ibCRIGcE16W/wToR5nCJBriwmwj9NwW7uHdzA29GwCR7Pb13suSEUVzlge5Vi
 v69mhS4cyg8EUWmJTUujjlICG8PAg9OFth/DQt+Tv6gbjv5j9ZbpUVUPuSq16gO39AXQas6Qp70
 Dr67+9OJOatvpIbkgQ/dIrrq6zpYkXWHByX5mo9wkcRLn4sjE3f10/oZorMW/p1I+KP+lRg7tps
 XnbfOj3t+7X+lzAnqla5hCJI0Eom85U9Ss1Yu6FFkV7LyuO3wGR2tQvV50czEMLKs7GHIYrgcEt
 nPr3mUONbxFF9uIYHRc8RJTW4mpvqtThZUb5WFB8qPeibF7/xaDNx+1IoWdYOtSP2SMeqwWzKrF
 FCNlB27kolk6K/JK+Zb43Jg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_025150_846979_054FD428 
X-CRM114-Status: GOOD (  10.58  )
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

Fix the USBDP PHY ports description for the LubanCat 5IO, so that it
follows the documented ABI. The current binding confuses endpoints with
ports and makes no sense at all.

Cc: stable@vger.kernel.org
Fixes: f7b576f35356 ("arm64: dts: rockchip: Add LubanCat 5IO board")
Tested-by: Cunhao Lu <1579567540@qq.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../boot/dts/rockchip/rk3588-lubancat-5io.dts      | 30 +++++++++++++++-------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts b/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts
index b0f262599cc8..71d640c939c6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts
@@ -915,28 +915,40 @@ &usbdp_phy0 {
 	sbu2-dc-gpios = <&gpio1 RK_PB1 GPIO_ACTIVE_HIGH>;
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



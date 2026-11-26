Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00891606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 01:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S+KkHbY1;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=JfmMqe1r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mtUBC6/m0Zu7OYn16xzfDA11NZA/v4uRUN4jFDRXbkE=; b=S+KkHbY18K1HtM
	2gaS34u0HC1BzDwwZ4iiENHfHkzfuYeEOuOY+47drLhTb4HCZdjTM5oUNPhLuC325unitnMEVqN7Y
	GCQ8cyNgeVk3MEYcv3O3YlpAlsb9rruXF1O1K6pAEVFecq9hHQrStJsOb7dIkFk2qB9tyekR/1oRf
	8zXRmpq253DzjqlRp377ReFdpXt6Q/SsFZdzPwgWlYY+KKx3GCATjr1GEfAUSTgKwEp6j8XRph4uU
	ZgqTpUAC/h/aH1hx766YRdaeW5a2VQviBh64D9lkBHE4cSpwAL/lF7hNFdC9xNuprFz0XkowQx2dx
	lgAiiST0uJBdoPn85w8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWO5Q-0000000BlmA-14mu;
	Thu, 26 Nov 2026 01:15:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWO5I-0000000Blex-2nmi;
	Thu, 26 Nov 2026 01:15:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795655734;
	bh=/OBXVRm4Itt0j+vC8V7NOOp9RQyMJyPKLRmuxzwIJEQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JfmMqe1rtVSAtDKkBpzZ1k9AN0mTE8NxoQaQL9a+rnm4s+03ZuBxMrCQzC4PDmLli
	 wcRgJHb6ADnybe157eB/lSm4j1/lkzmD9Y2eKO6Sigxxr39JO9qdOAi8LY/YZkJqtx
	 NfPuy5DXByJboro86mZ5m5VgcDzgDtUMABu7Fwn9fhZVDtBRKsYHGo6egh9ju59msG
	 YmPCPM0bX9uWxqy+cp6rD224xHb9e1UvJm1UL1OBhHT/3J2hMN+GD8ONBzQXY3gTsn
	 p9H5xHRau0oOE2immmf2+uA84x3EQ12sAbnKmvLbGP35+Bv10RHFpDY/Wds4Iu9qJB
	 pAs1NkRteVvvA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1329017E1090;
	Thu, 26 Nov 2026 02:15:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C053E480030; Thu, 26 Nov 2026 02:15:33 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 02:14:30 +0100
Subject: [PATCH 02/11] arm64: dts: rockchip: Fix USBDP ports for LubanCat
 5IO board
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-rockchip-usb-c-dp-altmode-v1-2-7991eb5bb426@collabora.com>
References: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
In-Reply-To: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1774;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=/OBXVRm4Itt0j+vC8V7NOOp9RQyMJyPKLRmuxzwIJEQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsHiDVzDULS+/CrK3i+WJj9iG1Oz5GA83fsN
 qFHbntwa+8wnIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrB4g1AAoJENju1/PI
 O/qagLQP/3pxrqjsBVFTF6HfNsJPblpX7ftZMyq7UZHJ1hGyhGBR+HLdQFTbg/TaM3GZXo3xTgf
 626hmBqjzY4Ia8fNv5jMUyE4vZlLVKVS6yr1xXXDk4prPzYxf4V+x0JSQLVunvxEVkYk6NR5bVr
 qKYG+UDVcbEJhWgyadPQDjD04P7VEP7q+1qfLkAiJazXWKWF78isz0yshy4gQuKj/pDhPVsjgCR
 4NgjPgpVJJxb0wd+xMuyLVJA1B/6KkLR/YKs0CH2uNV0wRzRf7tX0WZztMMQV3ZgpRCUoRTZOFV
 K5CoYpFsgw07BXBfBAAg6Cp0m9EkYXFaHWTJMc/+GhBgPcl7j7o+Kvj7yG89YnTsThRsQx2fYmO
 JX8bezGYz/KCGpi0adNtnyPku6BjvfT8WEhWthIRruO5ooDmPEMt4AvpW3muHmPg1CPbDtbiD2/
 kueMpmeO831NEEMiMYZyeQpIX8J338W8y+pIGceyWqg2OQ1TLDuk7irefAJICgkPx6N6bXHFvC1
 DTAHjrs/X9boavfvIb1Ej+ZfEFOxMxwbB3IOzlVezxuClMdx6MkJf7RdGmAiKOwe5lPe8hpww+l
 ifXKkqojX477Ik9weB90Ra8bgUgFq/GvmvsJXArSUtY3mZKX17h1MXwIZx9rkBDDy/stHiT7TSZ
 iwJvDJpo+Mo9TxbdXom0rmg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_171537_443529_8FA80604 
X-CRM114-Status: GOOD (  10.80  )
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



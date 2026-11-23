Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BC3606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x3g+TyzV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zI8cJXWL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KrFGWAp7BWRf3gdxkQzLizSlPFj0AMgOjQiOaX8cNIY=; b=x3g+TyzVUoPF+t
	Q4fNxQpBSlpYkMLjaORIaojG2DANEDJtJexOxpXuSpdIQQxmCNNDeTNeRAt8ViVNIY7BcN2ujiBeU
	OProEvbwqF8ElPu7KWKo1MvpdUOnn5pASO2cC/SWL3U19JYrjkiZM+R0OHK9bDmt42LnYw7Tbvksk
	LY9q1fc7vZOcoWC+HO8XQTje8l6d/rxLr3webijj62vXKO2ywPvYxY1k5CEwXTDrb9J+M8jF4wzkW
	WbY2LroX3D0d2K/jfbCfv6G/SGm96P//sY4Gg9JbZUHAeJtnUKxEpmx8YKse9VtJgAUHvQ0QNeDJf
	Yrnu7S+HsFWQ/ZgNssJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXN7-00000004HFt-0116;
	Mon, 23 Nov 2026 16:58:29 +0000
Received: from mail-dy2-x08.google.com ([2607:f8b0:4864:36::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXMe-00000004H8c-2YLs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:58:04 +0000
Received: by mail-dy2-x08.google.com with SMTP id 5a478bee46e88-3678f64d078so4223866eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 08:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795453080; x=1796057880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KrFGWAp7BWRf3gdxkQzLizSlPFj0AMgOjQiOaX8cNIY=;
        b=zI8cJXWLgOvuoPXKS7zBNrDPaz5/THuW2ZBzVlHVQiK5IQVGAMuJQoQVknOh2GrkXl
         e96S69z/aXaW/1N+1vCScSEInP9o4/B60wwAci8bFDTnnwHeKVQL987Dk7uxLC8kCZSf
         QFHTzmB8t+ADnEzPhUUuawqNU5GpGDJfyQahNttAai00im5tqypdo6qpJIftxfj+HbVc
         OzJG2OaUKF7hHjdompc0gltByvAAd+16HzIupjiirWgSHK+NPZraLfxT2Vqf0241yzMu
         vd0xNkICJ0nnZYucAS6V9aS1148Tz5g7jSc22hFYy/tjtfGdhG21etHW8Ah3imoxseJW
         /31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453080; x=1796057880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KrFGWAp7BWRf3gdxkQzLizSlPFj0AMgOjQiOaX8cNIY=;
        b=ZH8zJF0rdT++DGWwkJPIxdV1+sd5RhXJuDY7GqvUAs6MillSKwYG+M8FI42MrEklQ6
         P9cNLrvph4QXIcCpPNGxldJfLMWWtoOhfjPpmDdJ/egRCeU81w7Z6YMFZixLn3hg9AMR
         FdMksug0xqwnd9jCINxZBaYokLbW0rL9SGuh4QekblJx0HFtqH7bDGP7yjieztjcMtjW
         PQQwAzG7AdyHVBfHKbxjm8QP4KBHDfdiHnqXVkhR6bj8CSIwBPnGD+WPZhv5c21kK9qR
         swrQ5sv115kugeh7aFcaxsKESjSOwYspWqm8RniNn+Ahq2qi38RFC28dlIxY0cuJWIyv
         WdZg==
X-Forwarded-Encrypted: i=1; AL+hErEAc8YqEU232flECTyDAypEsZWt7D948I6Mn5I2CCBr9HXP0d8WBczSxC1LFPVEgPG9B7Nlg361gQ8dgPhgNaIx@lists.infradead.org
X-Gm-Message-State: APuU4Z8tlMygoULznfWS9qQAiSpKp6+Co8z5CkKppstWIGxRkbbfmeuH
	NlGzxTzdCg9oXgcEW7kEURT1AhmBh9F3Zv8+ApT96XnEvOMhxikxhuuV
X-Gm-Gg: AZFdTZfuTcxJCqyqgRBEnn137xjlv+u9H0wrOSNVsKw6ktRy8o57uZ8FSkdT5bF/SqK
	Tj1dmbHyVnikPYz+UQzGJWOzoc8QQtvexJZkEgxhMUzSso1zSoiWmIojkIA1OnnjImHGSt+Ezs1
	tPxEC0d3Nnl1i1pc/UpHev4W7BfeUeDkrKa6kCkjmXrU9tYXW1HRHRYSqNSTZ9RlVWmCeuUGFrz
	v9713LPHO+B1geQ2iwlJJ8UJsteU4Wz7ONiv+XlUvx2KsC2uxHnvR9uMJRg0BmEDpAfvN5HQEi2
	bYr6dLqxT/qVie5fsBoTadxe16mzS0O/YtPx9fXVHD0Ia8zRukSqfnqiceQm7vuqXDOb557BJSF
	YGBqfSjXG/c4fL2WpymHiHaLu+4JISK8dxIv8msG0vKFpcHJ7H7mijqa6pZD5jxsMifnfnvpodH
	o98NEzTw6eNV/Ga8C4X7W2AJul/Z6798gkLi0iZqtyd2p8vGtdrIkDagXrdAquX/AwIICvflfk7
	jP5ZZHXeXUwi+RxLZUe8Gy+kiNB0w/mthIeWgr3J6ho3QEMgcUc+NwSVRTstLAp9W+ssgvNi8L2
	26SoaanOqOws5Sudp9lKvRoY6Bxz84b6TAZS19yOcJOUS+7ykcaDQG5yC5Tol+tNfq/1SB8Pd4x
	ydfCy
X-Received: by 2002:a05:7300:339a:b0:36a:18e2:64c with SMTP id 5a478bee46e88-3856fd5bf6bmr12682498eec.11.1795453080055;
        Mon, 23 Nov 2026 08:58:00 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm13315280eec.0.2026.11.23.08.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:57:59 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v13 2/3] arm64: dts: rockchip: rk3568-photonicat: add RGMII PHY LEDs
Date: Tue, 24 Nov 2026 00:57:02 +0800
Message-ID: <20261123165703.667564-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123165703.667564-1-coiaprant@gmail.com>
References: <20261123165703.667564-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_085802_052160_6694DACD 
X-CRM114-Status: GOOD (  10.34  )
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

The Motorcomm YT8521SC RGMII PHY on the Ariaboard Photonicat has two
front-panel LEDs wired to it. Describe them in the device tree so that
userspace can control and monitor them through the LED class.

Both LEDs use the "keep" default state, so the PHY's built-in LED
behaviour is preserved until userspace overrides the trigger.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 983cf3d0a135..3cc05f08f429 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3568.dtsi"
@@ -391,6 +392,25 @@ rgmii_phy: ethernet-phy@3 {
 		reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_LOW>;
 		rx-internal-delay-ps = <1500>;
 		tx-internal-delay-ps = <1500>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+		};
 	};
 };
 
-- 
2.47.3



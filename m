Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00601606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nl5OpSJn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zK7isIo7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5rrMQra0cZM9+1upaJuZrzcLt5QpE789pWlJu6nut9k=; b=nl5OpSJnodIPqp7XxGS4eszCnW
	lW65/Ave52iaVC3TEfKVzcH+/n1nGlM0C9DTeKgPgvyH+578g0PleMaGkCjA7zhiO+VRIKxJF4nuF
	KQZ4WD0kSF4o9dTD5KsmQ8Vnw/ykqHjxoFc6Wv3wEBAfpsY+1F5MaU+I4bA3JE/nQFi44IPWtblI3
	xrIRUc8IA0IRW6wOcjdmqJUQfP62Fda50BqzNWq9VyUS3/KnBuKOrttj6afMA7AEm94RsEdLm2ceb
	WKBm3vkJUbfgTGLwgYbEvVSJm2LqQCEj929f1uAyIUB36xgymedCgW/eBNIlTWHh7iA7dBUO359SL
	b2FI+Vpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMuO-0000000Ep0V-1BsU;
	Fri, 20 Nov 2026 11:36:00 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMuM-0000000Eozr-0gHr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:35:59 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so377366f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174556; x=1795779356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5rrMQra0cZM9+1upaJuZrzcLt5QpE789pWlJu6nut9k=;
        b=zK7isIo7lcjJtHj72DJapXuArQHNA6JyPIj0/UX+QWMmKlBA62PmBDVxdV43j3EZC0
         A0Y1oVLfjxemDWYyX3jwUrTBmXG06Aacpn0uPn/+eLaXosDEo3/ngpdxSLTPdUcqeZ8y
         szWtplTUn/1gdwpr4LR/yv5qaSTXXXWMBXNeyh3I1vBHgjDfcyYjGodaW9kJf+/U6WDz
         3kvJ5mZksIvWiEVDSc4d8pDXa9z9WrNYSh/bdZgyX430uobBR+brhl10OyUTsNxYVvlR
         ch1Z7igPLoGtdfahkPq4z3yIgsXkFZl8b7hEjOAcCQWfMVD3yej84uxLVV+D7TXCFnm2
         VOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174556; x=1795779356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5rrMQra0cZM9+1upaJuZrzcLt5QpE789pWlJu6nut9k=;
        b=m8pHpc0RYRlBxRT25djvrADVqxDh0Ch6utTSx9APZQLkCBp3Mu/9lYk62NNMAuTz/O
         hn8usAe9M04808QyO0oDbHULppYy9CuultzRNEssoewjXYjOwHDlVeILzUn/KLsX4FbV
         Lr7LlgmDfHvTMf6zlj8XAxulgWIGb5+YPnT+sclNtpPCSU8Vhg2nBgWpn+9SCYFOY88K
         s2Cb5DDuKYzboeHxiqpXw61r6mNXqkOQ/Ol/3RYjgIYtP4NfotJHXFUrQuUDxma/s/wW
         Fgwf6EDh3SfO/3UWUj2qjV0Da1XMF227uNw01ZmgnAWjPxCD2TxvXkmiHNgv1crrJcdR
         dhoA==
X-Forwarded-Encrypted: i=1; AL+hErH3BrhZBuiw947Dw1Jbe1bN0LKf4kuRssU8GmqvzLW59rY6wwvWmtcsrVSYlFSZfvUGoXlMozqihfQKQa4wlSjP@lists.infradead.org
X-Gm-Message-State: APuU4Z9pQbQxSiMYpRWgdSnZLP47HZ+SERCAlI66J/qw21sQp0hAShA+
	SL4Ga5C63FagMNfzoY5U3DIue56Srn0VDRLrTejLGhCQKrwxbtQ0fY5W
X-Gm-Gg: AZFdTZdmds9V9BLncNWJzLxljvPHBs4eiUcp6MlyeMCXrS37N2o0qRamuJCV9BUUFoU
	GIjt7CH+MXt5hesc74FssvpF7ouE7kTg1YeOKdtDTWkre6/Fg3Pebc0u3jBAbtVvFkB/+SAWJjg
	gHpdQLIf3vC92Drfq2j869AaLo+48CGyWXRbSBOHW//OYzFndFSU15qn1+iuybBjdC1UtkP21Sj
	qgFiJBkgxC+p4v0KPvhXKg7PM7Uks8B2uTyc1qEqDni1woHi0o7l30NhQNUjmkRZGDGTC8xp+S6
	YDqDfDBNPI8Uwwe+blL5BYP2h3pQEwm5P1++k2oEHrHtRGvWzMoULX9Qig+xOlFI8/8+Nu/PVNC
	RXLLvacAzBj4JpVDYFGCv4ubki40GSqw+Cikmsgj2dApXfURnlqHvK4pGUPDojkMvga3iBwDBtG
	yxifK2EqDF1BIcwxcnxeHpOtIVe97ARzhwUq/3a22pGx5COXH4wwLYnj6SR+Ow2CtcUv4N4lsWe
	4W/ezuq/5pGo1HQ7P/XrazLTS6Dd7gD+zqBfHj0xbZaY9BILAsPuP8GQN99XqBUSEOs7KswpOvz
	+biKviJyGkeEftUKuzRUwMe3hw5Z8odEdfZ3huXhoMdw27CQ3v6ndu2ytU5BqW9IQKOXK1PFwzM
	=
X-Received: by 2002:a05:6000:46cb:b0:48e:4300:c6d8 with SMTP id ffacd0b85a97d-4abb3d2bf37mr4464668f8f.35.1795174556179;
        Fri, 20 Nov 2026 03:35:56 -0800 (PST)
Received: from debian.tailb81abf.ts.net ([213.152.28.84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f1b2sm4735728f8f.25.2026.11.20.03.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:35:55 -0800 (PST)
From: MidG971 <midgy971@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Midgy BALON <midgy971@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: rk3568-rock-3b: describe the Ethernet PHY LEDs
Date: Fri, 20 Nov 2026 12:35:55 +0100
Message-Id: <20261120113555.1402132-1-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_033558_463943_16D8A0EC 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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

From: Midgy BALON <midgy971@gmail.com>

The ROCK 3B RJ45 jack carries two LEDs wired to the RTL8211F PHY LED
pins.  Describe them in the PHY nodes' "leds" subnode (binding:
Documentation/devicetree/bindings/net/ethernet-phy.yaml) so that
PHYLIB_LEDS instantiates one LED classdev per pin; the RTL8211F
driver drives them in hardware via led_hw_control_set (e.g. the
netdev trigger with link / rx+tx modes: amber = link, green =
activity).

Tooling disclosure (per Documentation/process/generated-content.rst):
the DT hunks in this patch were drafted with AI assistance (Mistral
Vibe), then reviewed by the author and verified on a ROCK 3B board:
the two PHY LEDs appear as stmmac-*:amber:lan / stmmac-*:green:lan
LED classdevs and drive the RJ45 jack LEDs via the netdev trigger
(amber = link, green = rx/tx activity, HW-offloaded to the PHY).
Signed-off-by remains with the human author per the DCO.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 9eef59ef7d07..8ffd393cbfb6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -605,6 +607,22 @@ rgmii_phy0: ethernet-phy@1 {
 		reset-assert-us = <20000>;
 		reset-deassert-us = <50000>;
 		reset-gpios = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_AMBER>;
+			function = LED_FUNCTION_LAN;
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+		};
+	};
 	};
 };
 
@@ -615,6 +633,22 @@ rgmii_phy1: ethernet-phy@1 {
 		reset-assert-us = <20000>;
 		reset-deassert-us = <50000>;
 		reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_AMBER>;
+			function = LED_FUNCTION_LAN;
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+		};
+	};
 	};
 };
 


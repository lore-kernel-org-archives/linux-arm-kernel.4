Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79B0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YqT/y28Q;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtTwDStN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1w51x/PKCtrb5fNAPvfXEuoWbCAe37FjN4HnJ6V/8YM=; b=YqT/y28QuJlZYn
	ifk01KOUM2uLr6OZp6vfr8W2dPyP+zcvA5OhDbsQDpPgxzancroNwGOgAlHo0QRhe0h3SgoVls7u1
	hUHLvhCxVrlsGhYq1ZqNBu1BzHvBZIF18+gpiI3kwCIuoSSiNxPrF2nH2p0pmuC4SBwZW0IAxyw42
	K0xpyVD1Y3pEHk5zrM6thMEXum70BqLXuBCWXV0/UGCoqBKxduWj5uBnyTfyg9f7z9y2PseIOdr/N
	1ZwvUZF+C2I34utGSn1auoQWheYOn2Hb1yZXQwxzdMVDknqAy5lOxk1zdxiE58CJQsmtqMdzo3WoE
	nPZvT/JIQekG8fr6dQNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXN7-00000004HGA-0SLd;
	Mon, 23 Nov 2026 16:58:29 +0000
Received: from mail-dy2-x0a.google.com ([2607:f8b0:4864:36::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXMi-00000004H9q-1Hl3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:58:07 +0000
Received: by mail-dy2-x0a.google.com with SMTP id 5a478bee46e88-33e48934fa8so662827eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 08:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795453084; x=1796057884; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1w51x/PKCtrb5fNAPvfXEuoWbCAe37FjN4HnJ6V/8YM=;
        b=PtTwDStNgPa8hjTaBuuBAYfc46F21f1JqGB0GzGjRUb5cuqnfV8m2IvLdj7KdQPx39
         V4qjP2XIBghS6xW/zJQEget3EtOQq2FvJoOfP9WUlqlkYJD+7Y5nH/M2eEgy1L0rxBir
         pwFAlgKvNNZk71tmgZYo4+v7uLslDEUZaN3eH6rCoJJxety1YzZO9N9CqtzYKsNBhHGm
         dPzwQDDE6ucToYLyilH6jeQXlCpapSy6UPeI1QtzkYClxaUdIIYVRL+/QGL7t5UUZ0gp
         8GXrbqhQseon43tz+gWTwctU2zKmgkVn66ldpOjj0nEpMzBz80ZUVlx57vuuGV1tef6Q
         qUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453084; x=1796057884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1w51x/PKCtrb5fNAPvfXEuoWbCAe37FjN4HnJ6V/8YM=;
        b=uQY0vaCPmHPp5zZNTpthN/DDOkqF+/t5MtgxiFjR6u0qa44+31QRRSnduokP8IKq9P
         7JMu1YpPSCcVDLdtk6MmBAZBZxmEdZrUd6/tYLK3F1Z+JCk7MqImpA9T3KsPm6hBDa0N
         hW7wydwodns7In3hAaCE+pQh/gG49bxUAB3zBZ/MCoYONUUFpFEJ4VuglrHmscaM33av
         yJCiorqQIKosviTt7ELhjbgJYvrSr7fSxNYcvo3iMn8ZEMYoqNcmFpE6zRTVwH4vtfZo
         keBzTyGbt+x414KpoDrLSwY/FpHYcjgfxf0mYakQSYHJjAEanrZcQddSOt3PkZjx0L69
         p+IQ==
X-Forwarded-Encrypted: i=1; AL+hErFN07spj/5+rzZsuMQzhIf1RdeF0OBM9qaRUSbmoAFUj0ViGAwcMrM8jkKhTt5R5Wbuxoh21pfqrWlxRV/Mefku@lists.infradead.org
X-Gm-Message-State: APuU4Z9FcZAEN77+AkgzEqd/MSd/jFA09VQ9vPZjWjVCMKpsum7L8JT8
	vDnX7BYDNJOvriPTypn+cRs5Ps0RzGzUXgwm6NVXCVsBg685BLc8vKM2
X-Gm-Gg: AZFdTZfC/GGzakjleIaabOZgfUxSW8xjTobVnt0k77AyKHoZlgOmLsEGWdFf6sTd5w2
	6BeA4OiKC/KATmzNNVyzJAugcdQAktD7gOpXFqqPCC3ueUtGEczae8aGKTZetLSWttcJZHvTfvp
	A5gsBCuiE035GD5X8GPGIvvZPrcuKi+pDwoeK8+AYspS1bq0NAw1LjsadVXorIEFpIph60HDfvf
	y23GDlbzunae1CAmhot1uPe/z/V5iX+g5goRBMRrCEXsYDip7M/AWeZDpp5WTeQfyXwwQi22XLY
	CftZKgjRhCCaxJXCIUfBQck41k18B3Zmr60YPYyoEB7akN4oE8TI+pvyiL8gitVdh4BQIc5HJXH
	wao9ieLxLG4lH5BiQX8ZoIJbLMuw902aeYgpXnRKUgLVQnMXagMn0E/Nxa77PZe7HflvIA14fxD
	m7mQp0q6y+D+LBdjLyPo7IsPJCVrh9zBXO0Wk7k+lJock4Ii5VPX/afjqXI+h9oFcUyIzUOYuIy
	fTFAgg6aUl4SI9+B/7uNAlPmDEKvF7j0LcG2W9f0AbVlTqzQ4+lTA0grjxborJG3+wXec9Zo1UY
	QwXnQTg/d0gwhWwVnRwOozElawLbCdrv+WNPVb1c9/vzAAkCy+/owJWM0xo=
X-Received: by 2002:a05:693c:88cd:20b0:386:a16d:1bce with SMTP id 5a478bee46e88-386a16d1cb0mr6943823eec.36.1795453083560;
        Mon, 23 Nov 2026 08:58:03 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm13315280eec.0.2026.11.23.08.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:58:03 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v13 3/3] arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
Date: Tue, 24 Nov 2026 00:57:03 +0800
Message-ID: <20261123165703.667564-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123165703.667564-1-coiaprant@gmail.com>
References: <20261123165703.667564-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_085804_515603_27A51E9C 
X-CRM114-Status: GOOD (  13.25  )
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

The Ariaboard Photonicat connects a Motorcomm YT8521SC Gigabit Ethernet
PHY to GMAC0 through the RK3568 XPCS using an SGMII link. Enable the
required DT nodes to make this port operational.

The 125 MHz GMAC reference clock is generated internally by combphy2 and
is modelled as a board-level fixed-clock, since it is specific to this
board's SGMII wiring. Configure GMAC0 to use it as the RX/TX reference
clock.

Enable the XPCS node, route combphy2 to GMAC0 through
rockchip,sgmii-mac-sel, and reference combphy2 as the SerDes PHY.

Add the MDIO description for the YT8521SC PHY, including its reset GPIO
and LED configuration.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 55 ++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 3cc05f08f429..522778a36423 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -41,6 +41,13 @@ chosen: chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
+	clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "clk_gmac0_xpcs_mii";
+		#clock-cells = <0>;
+	};
+
 	hdmi_con: hdmi-con {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -283,6 +290,7 @@ &combphy1 {
 };
 
 &combphy2 {
+	rockchip,sgmii-mac-sel = <0>;
 	status = "okay";
 };
 
@@ -302,9 +310,18 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
-/* Motorcomm YT8521SC LAN port (require SGMII) */
+/* Motorcomm YT8521SC LAN port */
 &gmac0 {
-	status = "disabled";
+	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>;
+	assigned-clock-parents = <&clk_gmac0_xpcs_mii>;
+	managed = "in-band-status";
+	pcs-handle = <&xpcs>;
+	phy-handle = <&sgmii_phy>;
+	phy-mode = "sgmii";
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_miim>;
+	status = "okay";
 };
 
 /* Motorcomm YT8521SC WAN port */
@@ -383,6 +400,35 @@ &i2s0_8ch {
 	status = "okay";
 };
 
+&mdio0 {
+	sgmii_phy: ethernet-phy@3 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x3>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_LOW>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+		};
+	};
+};
+
 &mdio1 {
 	rgmii_phy: ethernet-phy@3 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -653,3 +699,8 @@ &xin32k {
 	pinctrl-names = "default";
 	pinctrl-0 = <&clk32k_out1>;
 };
+
+&xpcs {
+	phys = <&combphy2 PHY_TYPE_SGMII>;
+	status = "okay";
+};
-- 
2.47.3



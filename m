Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E23606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 21:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LYPjH6rM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2vhAuAVpa8bLQKhZqhfpCnxxLm6mtOuKgnkVHvsFWxs=; b=LYPjH6rM3abVVo
	9CShPiqivZUvnMcTLsuDDnsrlMZrajgdfQ3pPujoWVv1YUtz6H4B+wj6Jwrhv0SEUHs3STr3jly69
	hXl2OB+eDU13foaKZNhrMqUxNstFfF4H6vQoyNl+kRKE5gU/Bknuah0CScnpqhZwNphWXe5v5j0UY
	GaeCieSCHZuOK2hiUU2+4xliZ3Sgeg+PODW//gCZgIs2zYpe61fP1eWi3QVeg9cvdWLop2UfRd24n
	c8thD0vShgKyIczmKpAFfhkyeL3TWoDomQlG9mTLhLNzoBPgBj3Rt1qOrXTgUdDnxN4yWvoGTu+CM
	YZ9VuvQKABWcrviaqCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsgb-00000000LxS-22VM;
	Sat, 21 Nov 2026 21:31:53 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsfx-00000000LWd-17TF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 21:31:14 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49465892f7bso1561101f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 13:31:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296671; x=1795901471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vhAuAVpa8bLQKhZqhfpCnxxLm6mtOuKgnkVHvsFWxs=;
        b=BEGYQ1gb3a27TXQFZw+9Orhq7Veu1ePUlY18Q+Z/vhHqK/rZyTgx/IKSpyvNb0yREB
         gxq7eLE5x6cNZYl2Db0BRhppKU9kA3KHuHIBwQnxm0DFZg5HYON0WU5S9Ocdv4BOv9hg
         3sBMRnublQmRrHGgWe4GY9nqm6XUlMLMLIKC6omqTk+uy2TziPYPvHNa8jlUFmNb0/uy
         dgd+ZCgmY6ZINJIB4mmpukhpISAFBVIs+FCyXF6dXncNAbDThH1AP4PURw9zE5pokQ7D
         cF53lg30d349kPT81D/plVV8UTRiqRtNDzquefIl0noW1bwdRi+vbF6EjSM4oVlGt6ZL
         Xuow==
X-Forwarded-Encrypted: i=1; AL+hErHA6GByRHY+3wjOoeiF7IZigKiTC6+anrfb6s4grtu2+4ErXAyPBwB7Ja6bc2jAU3R1n+D/6YJR7VPQRXmWx7iW@lists.infradead.org
X-Gm-Message-State: APuU4Z+RFNPj2WSDJAbXiYWEa+Jh5UiA14Dedy4PgBvZ7omV6A08F9E6
	aVP0fubKOQ7sGeCK9Fp193xRYtWKgr1DaWIAyTyMwVJ08vA+AuP7njI/
X-Gm-Gg: AZFdTZeIxiGA83KmC0vCvMzI9o5IzpjAJpSp6eq+mzz6EGVCKjcs7lVPZC8eq1n9krZ
	LMX+RPSk7SKQycgb2k6TBoP4fzkWm54+CniD3oH4K3GzujmRqiO82LwnABMs+kW19hXIuppfWka
	7XJhL0wK2FEe/GCImUTU1heLwxzOztAjA3c52tiVb95ivaQ/CPjFmnshwGEdUz8wNlXdpjQ4OvH
	ZZ3V5F6PnsS5DrlC2JHyCXx6HeUtskFc9qdDL4u0cJoiyV3I5bko/3eq/NZ1ftXPg5a9OhvFGgp
	MTuvddkyroP2SQm5TdSCDowPnBhfPE1xzReW9c7jrMuwNQfWQnWQUPvMVrInaW+lMqksViu2vag
	jTZnNR6d2Fwib8ogtxiYZrnACVHpO0XC11RMHruHNQatrIu4PrIDi+Jilk0QabF7sVCxJ2mrHt1
	CcmQp8VjJ/2x5WMFlECBICkjz74FwlToaaoCUdNXvyLGQhFiO9aDciqiE7x+92idXZLhxhuJttp
	MAVTjkiAGkb+k+fukhwZFds3em+POP1VPySFDb/vgckNnQIh4QUOn7cjbhP+ZuVHVSn2QDsdImo
	wv4ZXuxIQ8lEztZzuHInfH08bHDw1YYi2ezFm1kj3uhR/95pvRXS8k70g1xEf0yekPzao4bNJ5z
	SqKkSaaJ7wRGRX//BSEEFYO8=
X-Received: by 2002:a05:6000:4617:b0:487:27f9:840 with SMTP id ffacd0b85a97d-4abb59e2898mr14146074f8f.53.1795296671234;
        Sat, 21 Nov 2026 13:31:11 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:10 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Sat, 21 Nov 2026 21:31:02 +0000
Message-ID: <20261121213102.143130-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121213102.143130-1-tanure@linux.com>
References: <20261121213102.143130-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_133113_420401_D01B9610 
X-CRM114-Status: GOOD (  12.21  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The board carries a Realtek RTL8211F gigabit PHY on the external
management bus, connected to the MAC over RGMII. Its address pins
strap it to 1; it also answers on 0, the RTL8211F broadcast address,
so the vendor tree lists 0.

Enable the controller and the management bus multiplexer, hand the
controller the ethernet pins and point it at the PHY. RGMII needs a
delay on each of its two clocks. The board traces add none, so the PHY
adds both, which is what rgmii-id asks of it.

The PHY interrupt is on GPIOH_6, so link changes are reported, not
polled. The reset is an RC network on the board, not a SoC pin: no
reset line.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..7b86ab2579aa 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,28 @@
 	};
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rgmii-id";
+	phy-handle = <&external_phy>;
+};
+
+&eth_phy {
+	status = "okay";
+};
+
+&ext_mdio {
+	external_phy: ethernet-phy@1 {
+		/* Realtek RTL8211FD-CG */
+		reg = <1>;
+
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <GPIOH_6 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &i2c_m_ao_a {
 	status = "okay";
 	pinctrl-0 = <&i2c0_ao_d_pins>;
-- 
2.56.1



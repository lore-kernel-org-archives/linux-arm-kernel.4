Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55738606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EXTvNuBi;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=bMg2mIcz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CYESoVgfwgsRsCvBatykAecmK7pBObqxccBDfQWhhIo=; b=EXTvNuBiXNFc0L
	xcS6xPjDbNK1IK/40wr2Dxh81D40lIXt6EV+i8wh1DKanQVUldm0oUXbQNHBxBQtbfNOKGQWavsZ9
	k2eovxDJjnGuyrnoVYR+IiUPFR6zcdHmSAdsx28rG/msD3FECRQ31rhTjHe6nEZI6Hj8zZwkPjibU
	Pd7q5oO/eCOLk6lGWh3xOmOFH/ElwOqHQZNXpq6wMdLAankesCtLQLO3etNRo0sq1zNePk3omdoTa
	/6DCzo0688rtkaqoAbC8UYgdFCljcR5wHdh2KqAVVYqr/uQznQ7oLlo6K60PTWG+Pyq9cu9a6pad+
	+glFEfU/dumfnrl/PXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMC1-0000000EfEB-47SU;
	Fri, 20 Nov 2026 10:50:09 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMAT-0000000EeYE-3ONR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:48:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so5484715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 02:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795171712; x=1795776512; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CYESoVgfwgsRsCvBatykAecmK7pBObqxccBDfQWhhIo=;
        b=bMg2mIcziaRM2Jh6m4ZDv8q/coG7JWRyu8E+U8OynNIoMCyJEDdywX5b3jIPjETpP1
         MyvJ7cnCy88T4JSjONQrlBA1teTJpfbEW3ZthRHK2zdTSNF92OojkyUVcrbWCAzciAut
         agZ0WjTxwi578xgDRIfnKv7CrBCMwX3GC3RYoyGbvD5n5EnHGfHLE5fsnJ44BfXqSKnp
         DyE2p96BzJvFa5y1VngFMKI4uIev6FBtZMOsC0JA3fir3U/sqScnTxuO0wZc/VF6UBFZ
         4pqSqdVrvk5BGIaAJLreOuTZEKLcLMgOaUeOkQafshHD+mQSkzimyR4InjT3y40rq/mW
         bzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171712; x=1795776512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYESoVgfwgsRsCvBatykAecmK7pBObqxccBDfQWhhIo=;
        b=iXAsy3UZlXaPJMW70OHSydRjOvcGMISWoOX6OPGgTgCHSzrU53sAby0KxlfUVY+y7+
         Ud149Cs45MKGL+Ut4bkak5qEiXnYO/DeLUJnpceKAhS2Ral82S2qHcvwpLJY4miUcpux
         BVxOGa2OKG9D+r9f/X8oXx+9jAuVN7WQWMxHvm6da/vKXbMG8yXY3/eau2BktkzYZRUT
         IyiiTAz25UsTWqQMZC4chSv0WDhY4SnUc2Q1HPBNVJCFiwdPik8ewIIquSHSo+CMob6i
         X3jFwvmIEAHL42lItP75mAh9fXKf0l2rjFFw4z2bGTvrCpfUlAQVJDGrHtulz8g41aLz
         vJbA==
X-Forwarded-Encrypted: i=1; AL+hErGRSQwNtvvMzKg4/bC4C0DQAi5xrDbz+phuszj523KH7Hq/t603vBnOlz/UecZqIoIhjdfmS8agez18KAd8U1NC@lists.infradead.org
X-Gm-Message-State: APuU4Z+YJmESIQLfHqxwuBEIwzCRdspTd4faTE9HPRB1HDSihU00pNaK
	bH95tKyncIHkgkYgBdGMyZWLV4ODVlWvq7Bo2+Gs2+SWG248gxB6uVYK833YgDbM94g=
X-Gm-Gg: AYBFou1G5AZDdHFkd4lf8+11BiKR/uIKM40JMobjwheQmRe6zox4jYGSPTTmWpCYXv2
	LCm7O+ZIHsN2DyILUbbYtCRfe9ftAOzlnPghb4oh2KIa2hwiXlXpymTuc9/oJqcQ/2jcT2BL4at
	gcNJZ9flQfGKPa/EUm+LucRwpOQtYSJvWLal7C6BrD4Ul5+AsJw3oCuq5hdxSbj39YyjY1HgxSU
	jQ5Zzj/4Uo07HhO/oRjAcrsp+PQoDdoWpv5cqLiG0HedI5+AMRLqX+Mih2V4Ttpi2KQbY2upJU0
	I11TjH00TNbLCDUV4XAOtnXno7gQY5QuU9Rc8o+qU5T31UnREMw+OLqyaP5J4xjvXkfHZ/JfsXa
	7HYXWm4P3M82DjlDfwKlzESnnbA34x5qOZEdy6ouv53ZMGYrdDvACdaMNqryK1r49sjzqmGTiy/
	WY29xqo9BBlXk5flGQ7Lfigmjn03wK7hrarMiBDKEd2g/Np0lkimwqvDx9EsCKEJJCukGzPbPO8
	55ydDlpDbVcM/E1zu4Sv9A3qIyNNqHjBus+iDPkEQCVVY8bTTF+0g6plkCLjo+zsE2IQKUZNL+x
	xdTFo+ctG2ccuTgVml8k6dwHDQuu+re2CQvzcsZjOH6eKjjOnR4gtrgyPLUaNmz5QXLjlrIIerP
	7hMIrlvCK
X-Received: by 2002:a05:600c:848d:b0:4bb:52d8:73ef with SMTP id 5b1f17b1804b1-4bb88940f1bmr56043855e9.34.1795171712233;
        Fri, 20 Nov 2026 02:48:32 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f14f1esm38161425e9.2.2026.11.20.02.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:48:32 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 20 Nov 2026 14:48:15 +0400
Subject: [PATCH 7/7] arm64: dts: rockchip: Shorten Sige5 Ethernet PHY reset
 to datasheet timing
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rk3576-phys-v1-7-6382cd14e3dc@flipper.net>
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
In-Reply-To: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1421; i=alchark@flipper.net;
 h=from:subject:message-id; bh=udM5Uz76VRJ4rdTS0/vqmjrYLFd8GBP+/ltQgETwpHk=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQzqOY+Elj+wdS9+l3iOzMXGWtjuc/xlgmpgYvLqxKie
 EWUpxR3TGRhEONisBRTZJn7bYntVCO+Wbs8PL7CzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCcFvLGRlu3N9xb9b5u0b3UoyZZkc8Zz0Xad3Gp2PVaeHvsSeH/xM7w//ozg1Rngo
 r/VVd321fl3/uzOyZxzQ1RH2Ovt8pIPBbLogVAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_024835_552543_A823F1CD 
X-CRM114-Status: GOOD (  10.23  )
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

Use the RTL8211F datasheet minimums for the PHY reset: hold PHYRSTB low
for 10ms, then wait 30ms before the first register access (Rev. 1.1,
section 7.17). With 20ms/100ms every reset of a PHY keeps its port from
coming up for 80ms longer than the PHY needs.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 45a4489863bf..3e7158ebdab4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -780,8 +780,8 @@ rgmii_phy0: ethernet-phy@1 {
 		reg = <0x1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&gmac0_rst>;
-		reset-assert-us = <20000>;
-		reset-deassert-us = <100000>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <30000>;
 		reset-gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
 		realtek,aldps-enable;
 	};
@@ -793,8 +793,8 @@ rgmii_phy1: ethernet-phy@1 {
 		reg = <0x1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&gmac1_rst>;
-		reset-assert-us = <20000>;
-		reset-deassert-us = <100000>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <30000>;
 		reset-gpios = <&gpio3 RK_PA3 GPIO_ACTIVE_LOW>;
 		realtek,aldps-enable;
 	};

-- 
2.56.0



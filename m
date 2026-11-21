Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4434A606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AeckQ21n;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sCf2LaFn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LYx7WQ2dST+Wao6Q5mfg9jnAzXBRpmGNPpjAkBgVZCY=; b=AeckQ21nF3IGmY
	0piIhDK+RXAjYPuePllaa9cjNJlhGDz4+4u8GZB0veP/pQReKH2JG2prB/+JAmMRtlVtxZYOp61TG
	mzomm2mf/3DuNNcXu19TegtGZFOkEwv7UORxRLN+OoXXV8/qQAndXc7+nVLDbg1hwtlf6kBGOg8mE
	JLu1w6Bob5qnTZ9jAzLVBqZIeWWErBikgmF6kkT5GRmwDG1MiSy//I6dD7VKzeA1Jn/vp9bloyjMI
	/HfmPaR/xEugRy0WR2rtD7J/bHe6edCVSU3JEDH0ehm+P8TJierCF6Srvr8wzQrcLzcayBR5uBgmQ
	VI4spI/N+ZddhGKF2z3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYxc-0000000GVvn-0i6i;
	Sat, 21 Nov 2026 00:28:08 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYwa-0000000GVFM-0hY8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:27:11 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so897541a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220823; x=1795825623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYx7WQ2dST+Wao6Q5mfg9jnAzXBRpmGNPpjAkBgVZCY=;
        b=sCf2LaFn45G0HjnBPPaI0tdsJP+VQG6tC+zNOEIbvre/9TpKXuvMK0xkAPTkd2Gnh4
         TAYRmybowI2utJFi/svqq+UmVvDxWsumzcCovn1qKXTZnjG+F4c9GscwioRx2BKK+11c
         DOXtk5GkCHbEJmVmF7PiwbY8HPcSwoA4wPAEVQZHPLj3lC2A0ZCY7LSUtM97ZRGX0lox
         gI4beufUBepMWwRf69fOsRqYNAZGWiTes6o4P+QpdHK9ZQOQw6fCrvn4QBjJHWBSQkkc
         7dyXvMFCXUQdfK1LtaA/BcHsBf879rNyPGH6H3RmH7UBZ//9A+KImwQNb4w8yNHc7F99
         CdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220823; x=1795825623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LYx7WQ2dST+Wao6Q5mfg9jnAzXBRpmGNPpjAkBgVZCY=;
        b=mHAaI0UJRKAdXsjKodot84tRyPZ6WhQsJ+zfFG0nDQL+6LgUB7TiUEYSLpqdcB6043
         OOPX9rnWMFgz/3+JtCD7X40qm6vw3yHol0lm9NXIzzA7asZMqyHmNB/J+GxS6e6FqrQs
         mXRztfI3jWcfE5hq/WXYmPdVc45yIZYmXN9AQzE9T/q3eUJ8B5dEZyLvoUfuU+kE2kfj
         o69kz7E7Nb6Wh0ZtUFtUZB+9BFirSraEPnkemX1vAPIq3Qb+gGv9NVoRf25/6lu89ZiJ
         LC+1s/xzXdRp8eP0roOTD3ElGeN/m4EcZNOIoC0h/bRzBNraUNPSogEvitynFx1997Aw
         pgTQ==
X-Forwarded-Encrypted: i=1; AL+hErH8wRN6AAfluoqM15INHa6HScxU96b3uyqVRcrHWHVDAGkrWAq7uOar4ygLrIGgTo9PZskLd3jwmS/cFNNGraQ8@lists.infradead.org
X-Gm-Message-State: APuU4Z8IbnEie1C6oCXrQ09dnve3tAfgSAN58W9PCD0d3Gt9Y5+VeyJs
	lF0j7F2O9W1K7WHfPRh1Gtq+cUUmoq/2bUl2yJL83caN3zvSfhfxZrkr
X-Gm-Gg: AZFdTZecnxxu4cdDk2DEPP+fioGfVBbPyauQFpQlCbCuHDrPHJ6wDLYTeeL0uVmc2T2
	SyeqSGTaPpewW/OzImpAZS6IGBBilmIE+xOXg4GvN4P18+n1TqRVX87nMCJwNMZcQB0FCZ4eU8x
	OZm/gO4XTdIyZCPmO0rNoizAMFbM8dTYVig5SWxzkHrGlPPOuguWW784VorneQaDYo6UbyIg45Z
	bO2YorBVHv+qOWWdxPLq0nHyl4jtIQreHm33PiJ/Xhi4yzKYN6Gv1jQeuXMaQ7CvkaUegPqg05Y
	rRgv3n5waZxRVdpCYvTkvLBNw1l9XVm5dR0IkZ91/LPoIddFKzmWWMJk5kTP6dgBvodOr9YEGDI
	sRreaxAiteqGJX2px237iyKfryPcjmv96dPJzo5Ex4+AxazRoBaN85fFd4SWR3hT3+2qpTLVpMM
	qlSxgOb3zoAkquE8T60Ac6z1Gg4tfAO+XXRdOA28G9zxnrAd6cxBviay2MCqV3gm4AH4id2quTK
	HtsnZyILvl49hUpuMBRD/FUJHZ7rQMtq8B5Ohn31QahmugNbIPz3Y9omZB4q9B7lW+dPuuswvpi
	N4U9Yrp2lBQzUqJt1bPxpueXL09RCxH60S733yCHJiJXyPX/UL0Rh8BNx26LzoyeuGF455cLxTS
	+OX1YcASp80LmTTsqI+nFAv3QCIg/RySTAYaOBr34T77puZciGk9BWTEknB0gHLDbfMBI5zHny4
	vgEQ==
X-Received: by 2002:a17:90b:3d4d:b0:3b4:691:d073 with SMTP id 98e67ed59e1d1-3b41c95b0c2mr4589920a91.55.1795220823173;
        Fri, 20 Nov 2026 16:27:03 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:27:01 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 21/22] ARM: dts: BCM5301X: use gmac2 as the CPU port
Date: Fri, 20 Nov 2026 16:26:01 -0800
Message-ID: <20261121002603.25254-22-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162709_984534_E8D11385 
X-CRM114-Status: GOOD (  15.97  )
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

Port 8 is the switch's IMP port and connects to gmac2, which is present
on all Northstar SoCs. Several boards with a single CPU port use port 5
(gmac0) or port 7 (gmac1) instead. Switch them to port 8 and assign the
nvram MAC address to gmac2:

- AC87U: the MAC address is assigned to gmac0, but port 5 is disabled
  and port 7 (gmac1) is the CPU port, so the interface that carries the
  traffic never gets it.
- SR400AC, Luxul, R6250 and Meraki MR26/MR32: port 5 is the CPU port.
  R6250 had no nvram node, so add one. gmac0 got et0macaddr through the
  SPROM fallback, which gmac2 (et2macaddr) would not.

The Meraki port 5 fixed-link only repeated the bcm-ns.dtsi default, and
bcm-ns.dtsi already describes the port 8 fixed-link and links port 8 to
gmac2, so drop it.

Boards that use several CPU ports, and boards whose MAC address is only
known from the SPROM fallback (Buffalo WZR-600DHP2/WZR-1166DHP/
WZR-1166DHP2, BCM953012ER), are left unchanged.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4708-luxul-xap-1510.dts   |  6 +++---
 .../dts/broadcom/bcm4708-luxul-xwc-1000.dts   |  6 +++---
 .../dts/broadcom/bcm4708-netgear-r6250.dts    | 18 ++++++++++++++++--
 .../dts/broadcom/bcm4708-smartrg-sr400ac.dts  |  8 ++------
 .../dts/broadcom/bcm47081-luxul-xap-1410.dts  |  6 +++---
 .../dts/broadcom/bcm47081-luxul-xwr-1200.dts  |  6 +++---
 .../dts/broadcom/bcm4709-asus-rt-ac87u.dts    |  6 +-----
 .../dts/broadcom/bcm47094-luxul-abr-4500.dts  |  6 +++---
 .../dts/broadcom/bcm47094-luxul-xap-1610.dts  |  6 +++---
 .../dts/broadcom/bcm47094-luxul-xbr-4500.dts  |  6 +++---
 .../dts/broadcom/bcm47094-luxul-xwc-2000.dts  |  6 +++---
 .../dts/broadcom/bcm47094-luxul-xwr-3100.dts  |  6 +++---
 .../broadcom/bcm47094-luxul-xwr-3150-v1.dts   |  6 +++---
 .../dts/broadcom/bcm53015-meraki-mr26.dts     | 19 +++++++------------
 .../dts/broadcom/bcm53016-meraki-mr32.dts     | 15 +++++----------
 15 files changed, 61 insertions(+), 65 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
index 72e960c888ac..3375b234fc9b 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
@@ -61,7 +61,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
@@ -83,7 +83,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -91,7 +91,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
index 750e17482371..26ac2f2ed5a3 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
@@ -68,7 +68,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
@@ -86,7 +86,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -94,7 +94,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
index 2bdbc7d18b0e..81c2e6652a27 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
@@ -26,6 +26,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -83,6 +92,11 @@ button-restart {
 	};
 };
 
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
 &usb3 {
 	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
 };
@@ -120,7 +134,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -128,7 +142,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
index 03f4a6d37a67..60661dde8ca5 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
@@ -128,7 +128,7 @@ &spi_nor {
 	status = "okay";
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -161,14 +161,10 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
-		};
-
-		port@7 {
 			status = "disabled";
 		};
 
-		port@8 {
+		port@7 {
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
index 0198b5f9e4a7..2b152115d03e 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
@@ -61,7 +61,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
@@ -79,7 +79,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -87,7 +87,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
index 73ff1694a4a0..b5664216dcef 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
@@ -110,7 +110,7 @@ &usb2 {
 	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -146,7 +146,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -154,7 +154,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
index 2fed02ebb1d7..4114c6eda1ac 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
@@ -71,7 +71,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et1macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -108,10 +108,6 @@ port@5 {
 		};
 
 		port@7 {
-			label = "cpu";
-		};
-
-		port@8 {
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
index e374062eb5b7..00aa28a2e70e 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
@@ -65,7 +65,7 @@ &usb3 {
 	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -105,7 +105,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -113,7 +113,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
index 3a33705c2969..04420ebf056a 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
@@ -59,7 +59,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
@@ -98,7 +98,7 @@ port@1 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -106,7 +106,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
index cf95af9db1e6..765b74919fcd 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
@@ -65,7 +65,7 @@ &usb3 {
 	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -105,7 +105,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -113,7 +113,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
index 992c19e1cfa1..eb4bdf8c9c7e 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
@@ -55,7 +55,7 @@ &uart1 {
 	status = "okay";
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
@@ -73,7 +73,7 @@ port@0 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -81,7 +81,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
index 4d0ba315a204..d5436d70ecbf 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
@@ -105,7 +105,7 @@ &usb3 {
 	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -145,7 +145,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -153,7 +153,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
index 8e487f60a2cc..64d3634d130c 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
@@ -76,7 +76,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -136,7 +136,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -144,7 +144,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts b/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
index 08abfdc63d18..890945a5690b 100644
--- a/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
@@ -58,17 +58,17 @@ &uart1 {
 };
 
 &gmac0 {
-	status = "okay";
-
-	nvmem-cells = <&macaddr_board_config_66>;
-	nvmem-cell-names = "mac-address";
+	status = "disabled";
 };
 
 &gmac1 {
 	status = "disabled";
 };
 &gmac2 {
-	status = "disabled";
+	status = "okay";
+
+	nvmem-cells = <&macaddr_board_config_66>;
+	nvmem-cell-names = "mac-address";
 };
 &gmac3 {
 	status = "disabled";
@@ -137,12 +137,7 @@ port@0 {
 		};
 
 		port@5 {
-			label = "cpu";
-
-			fixed-link {
-				speed = <1000>;
-				full-duplex;
-			};
+			status = "disabled";
 		};
 
 		port@7 {
@@ -150,7 +145,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts b/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
index 45bd27906f29..d6dc448b2849 100644
--- a/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
@@ -104,15 +104,15 @@ &uart2 {
 };
 
 &gmac0 {
-	nvmem-cell-names = "mac-address";
-	nvmem-cells = <&mac_address>;
+	status = "disabled";
 };
 
 &gmac1 {
 	status = "disabled";
 };
 &gmac2 {
-	status = "disabled";
+	nvmem-cell-names = "mac-address";
+	nvmem-cells = <&mac_address>;
 };
 &gmac3 {
 	status = "disabled";
@@ -178,12 +178,7 @@ port@0 {
 		};
 
 		port@5 {
-			label = "cpu";
-
-			fixed-link {
-				speed = <1000>;
-				full-duplex;
-			};
+			status = "disabled";
 		};
 
 		port@7 {
@@ -191,7 +186,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
-- 
2.56.1



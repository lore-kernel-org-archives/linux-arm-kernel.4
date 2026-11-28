Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D0E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 06:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D5XmsKaI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VeX8djY7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YAlAXhBa+PmydqxcAx6HQ5xcH/PcqJHReLdO4gxPARw=; b=D5XmsKaIRuNQCqqN3ZV57Qi/hf
	0vnBjk74M8jTM46DSoQX+6fMS3zxBVFZNpg5UigyistWsXkeXoHJ1HLigkYdRl7wmIkemM0n2JDlA
	Pjrxca2Uc6E97VZNRgbRrlkzKpLQr4Kd4oe0KU4r8VISPalkJUX4Ifa9GefgJ3UEihdjc7scvrZdt
	AOvfTR5qUOcK68r0zxahIwNfmytvCMRRik/chIfb0E6rfQqFVrn1cSQsx0/SfW2fLbQDW7f2xfF/P
	skUk58e7DrkowBgX2t2AZ8eIBADbz3GE5e/28JIf06p99oLlQV9eEIj3nyM6rFZOOkjsV/0An05e2
	oGj5oeZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCFl-00000000Qjx-15Iu;
	Sat, 28 Nov 2026 06:49:45 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCFi-00000000Qix-3HEq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 06:49:44 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso3976169a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 22:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795848581; x=1796453381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YAlAXhBa+PmydqxcAx6HQ5xcH/PcqJHReLdO4gxPARw=;
        b=VeX8djY7jYjab5y78rtr8hnHfsSlxGTj7E5oCFfw/9M3fOJJ1a3io4FAIvpX7xkHe7
         EQvuJBM+WukRx/vUP5go7TvhCbrLlSbcEjWRfHRBVd7bWK7wh/qgjyVmtq47mimJ5Lec
         yGQttvZN85mXMTpIqC8CMR31LLwF0Uch+CZ4K/SdGmlWK882QzzeQwBLEACFXPyEgIc7
         Y8xXsTvYPu7GIG1IoV9hUiXRzn5n0IbnBDCJDnpF4qjGBtvR5zdNmwGqiIChA2qA0qCL
         xH/Bn1W6CDIIrsxsxps6x22xCaWoWPJICkTLWRVb2P43GbwQU5YT3vbui104S1DJub2Y
         SD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795848581; x=1796453381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YAlAXhBa+PmydqxcAx6HQ5xcH/PcqJHReLdO4gxPARw=;
        b=DUHEchOgVqdrHOpUMsoXus6n96RcRzwWFY7voB03AR/zz9BN5+UyAgU3caEA4x4cRn
         jar5fQR/kyEhVwrprRrtgmn4UTqq+yicy0XATJjL+yT/6WDivbn5zIsDI8UnShWsU9os
         jjm0lbeEvKEBPqTDHCWsbIqNlNzwxc/JudDgQLijiRiNb9F5HHfr9i08bnCG1K11YWZC
         /a25MFONV9a+ZKPyRA+ah2y1sn7nS4DcBdQI80rWQeZC7TlvA5h1JSE02vXPazVTM8sq
         hgB1pvMSgshpSxPZ2ecCOURhB9brS1ylvkhTRWAJq8PE5zuMOvJ8DD7SZsmIIMB50EY6
         8KHQ==
X-Gm-Message-State: APuU4Z+bJIMXpl6X/0iVpe3q6cxOErweapqvoR47wKtZowlXD49MyMZI
	yQaxJ/SgI+KBzQURGVZ+Twu+UxBDwnl7RipdRYemTEQ2ub759WFGctuv7bHS0w==
X-Gm-Gg: AZFdTZczTqd7CqUwLymiFbXFUy1uOtYOiq0WWeT+8zpW9D8ifJvAfdV+snAggqSjI7M
	BXtn8A9/9BshbP7/hL9p2mA51FmChkwgoEYFpsgURax/jBtcTM10CgjhZfP3n2kuRd8+O7kzqvP
	vMe1Ou2ragB17d1KnkIcavD1nnVrJvefyvJaoFv4aGlBegybHhPeD0vOqL5mUycMbawmgSJkFqn
	PEn8WW6Rx+KxJDHXFbChxqaM/9IeT1+Xguf1luyCvJXyuPoxPMbTuxMywBLNi9IBsnlgaltUYCB
	Dfl81FL0kKH95wA8UZMnDiKqpbzuPbAJ6KKmr+aqa8EubbYqvLY95UL/3M3w4XRg5HzoqmoYI4J
	fKmbZck/eyJYoESFg5v8ycEDnnGJRWIo7ADcKNraALqIwdz24ecqWrcTaMdnwsCNzM+MEzdLZHk
	aRcNUGFAIU2yqi76z1pGNT6uqefLWLJ1TmxljEqBF0kHWD8+KzWeZj48flN5+sR7N3etAJs3c/u
	lQZl+GuYd/bAxSoBD75JzXTlSE0583hitz9wkCT2gJUJ0nQHkW5L5lFKw0Zxrn2ZQdv0F6O/Kz/
	GzSCn0EbXlW4OBhuDSsKB1ic74h9xdxyZ3jPh3M84Q803Uw4jaCmlpXoZkCPkzNeeFOLC6Aue9y
	ATQ1gS7ZmRDa5j7hq2xE9nHvxk3Hk3MuNwz0vZXSlLhE6b5stezoSNkNrLMv+A4FYclCWfQYrCH
	0V4Q==
X-Received: by 2002:a17:90b:4a48:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3b41c7b5fb3mr26034655a91.1.1795848581098;
        Fri, 27 Nov 2026 22:49:41 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b217a5bsm19909406a91.0.2026.11.27.22.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:49:40 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH v2] ARM: dts: helios5: sort pins alphabetically
Date: Fri, 27 Nov 2026 22:49:38 -0800
Message-ID: <20261128064938.9951-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_224942_826828_EFA974E5 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

Rename some pins to have helios prefixes for consistency.

Also use hyphens in fan pinctrl node names.

dtc W=1 warns about the underscores in the fan pinctrl group node
names:

  Warning (node_name_chars_strict): .../helios_fan1_pins: Character '_' not recommended in node name

Use hyphens like every other pin group in this file. The labels are
unchanged, so no references need updating.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: sort pins alphabetically instead of just fixing fan1 pins
 .../boot/dts/marvell/armada-388-helios4.dts   | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index d4ed47ae73c5..50a80ae659c4 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -164,7 +164,7 @@ expander0: gpio-expander@20 {
 					reg = <0x20>;
 					vcc-supply = <&reg_3p3v>;
 					pinctrl-names = "default";
-					pinctrl-0 = <&pca0_pins>;
+					pinctrl-0 = <&helios_pca0_pins>;
 					interrupt-parent = <&gpio0>;
 					interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
 					interrupt-controller;
@@ -268,18 +268,32 @@ usb3@f8000 {
 			};
 
 			pinctrl@18000 {
-				pca0_pins: pca0-pins {
-					marvell,pins = "mpp23";
+				helios_fan1_pins: helios-fan1-pins {
+					marvell,pins = "mpp41", "mpp43";
 					marvell,function = "gpio";
 				};
-				microsom_phy0_int_pins: microsom-phy0-int-pins {
-					marvell,pins = "mpp18";
+				helios_fan2_pins: helios-fan2-pins {
+					marvell,pins = "mpp48", "mpp55";
 					marvell,function = "gpio";
 				};
 				helios_i2c1_pins: i2c1-pins {
 					marvell,pins = "mpp26", "mpp27";
 					marvell,function = "i2c1";
 				};
+				helios_io_led_pins: helios-io-led-pins {
+					marvell,pins = "mpp49", "mpp50",
+						       "mpp52", "mpp53",
+						       "mpp54";
+					marvell,function = "gpio";
+				};
+				helios_pca0_pins: pca0-pins {
+					marvell,pins = "mpp23";
+					marvell,function = "gpio";
+				};
+				helios_phy0_int_pins: microsom-phy0-int-pins {
+					marvell,pins = "mpp18";
+					marvell,function = "gpio";
+				};
 				helios_sdhci_cd_pins: helios-sdhci-cd-pins {
 					marvell,pins = "mpp20";
 					marvell,function = "gpio";
@@ -294,20 +308,6 @@ helios_system_led_pins: helios-system-led-pins {
 					marvell,pins = "mpp24", "mpp25";
 					marvell,function = "gpio";
 				};
-				helios_io_led_pins: helios-io-led-pins {
-					marvell,pins = "mpp49", "mpp50",
-						       "mpp52", "mpp53",
-						       "mpp54";
-					marvell,function = "gpio";
-				};
-				helios_fan1_pins: helios_fan1_pins {
-					marvell,pins = "mpp41", "mpp43";
-					marvell,function = "gpio";
-				};
-				helios_fan2_pins: helios_fan2_pins {
-					marvell,pins = "mpp48", "mpp55";
-					marvell,function = "gpio";
-				};
 			};
 		};
 	};
-- 
2.56.1



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D00E606A6B9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PzIHQWMt;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=diAsVFVB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2HdtJ+XqX5lO5ERYLerHM0E2jrL7YBGV9T/0hIoeKbQ=; b=PzIHQWMt4d9U18
	EikQFHlFGXHD6Kce0zCHlklPAMuxssSQmTimD53qGBn5TQuPtij8pYwNTolcNlRZOVibJd/1NVcIR
	MLby4rF0dYEaV3bRchIHxdkhm2xMbkanKixROwd8CCpMw8Zf61SW0e2Hg51XsjKGBLjYWRl8RishD
	XCvxu7E1K5kTRxjx6zaiWa5qwGjwcj6MF2J1rPreodYPN/5prjxOOkAPsYRm4aBLhH9CpodtuMEGy
	nFD39H7tR9gpzCYy8W1KWisZQD+UCk1MDNwUrq7ycXLzBUyxhvSbF5eaY+gJ3b3cZ/zybFvBRAHvQ
	hmKj8UoQAlYaCMmWFzlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYx9-0000000GVTq-2R0S;
	Sat, 21 Nov 2026 00:27:40 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYwC-0000000GV62-3f6T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:26:42 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso182450a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220800; x=1795825600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2HdtJ+XqX5lO5ERYLerHM0E2jrL7YBGV9T/0hIoeKbQ=;
        b=diAsVFVBSiP6SWJ62T9erRBWm8lmrsfStdtNpE0FUu8KcYGoodfaMew7BDoOeeeCW7
         LcOeAwotMst5ObHFLMyplpbDGDrbxJiyKu+O+RqTuN2GyVCMreZ6LfZU4NYv8xN4b54m
         dCg+H1o1gwLFL7KlR5JZ44h2zIkk+tLdIDl22XDAvIIOqf0dxq3ypktiY8HhzGk53z8m
         GYACvt6foODJ3Ulm7wB/ZIuArX76WQ5/Cg958pUwTfVQ6ofbw+xXKI7IubBgTd1U/5Zy
         yral7LzcfCZAoGQvdD1tLkM9Et60nsDU7RJEj8jk3QFpkBzC2Jafnu/qCZ/jk0gTxJni
         XugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220800; x=1795825600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2HdtJ+XqX5lO5ERYLerHM0E2jrL7YBGV9T/0hIoeKbQ=;
        b=XV8qglp3Ta3BJ+qUxzxtig+bW9aflUjmXMf7X2Rgpa6QVuhH37ONd+9asaemK1bLw4
         H3mKtsny32h1DZo9m/1XUlfH83tR49FeI6kYAt+M/MwyKE8Wv6ZuCGIOgLg1fMLA5fr5
         S8WIKNIP+Rcnyexp/SsRFz8XcoWusAWKIVAIPB9a2/kO+E6BMM1TeFpXvaRoZA5LhGVE
         CXJ4gDIkuou4H+IzIaVdyIcDcd/LPMTCXNyX5ql2Mh394XtYr5JBdGOIhZ7uAlylHMPp
         8wI0LxNXCqHcwdLQTIRgPUFPPq4mZ2xEoBRMgIA3MAEn02ofvt/2DZV1tuaNGvIG9bOO
         C+Dg==
X-Forwarded-Encrypted: i=1; AL+hErHfOPJ443FeL8X/W/qitzizTxO0PtkZDh6hLDNO5l5IPu5/kEfr5THEDKbWHz/uWj0dWly+tEHE8Q5AS5L/EhrQ@lists.infradead.org
X-Gm-Message-State: APuU4Z+pscz7rFgdzcFOiEdIhVmj2HkYSEiA9AQIvIBxmGiHUbn7dTYO
	j110E3wvP5XENQS++TE6AezER4uvl5u86XgTUQs+pyqmz2ZygVQrPAMS
X-Gm-Gg: AZFdTZcNaCU1d9G3f4gbzm+2FV75r+Eu9r/dYqRU7OiROlpZcWP5clpk6evAUoKcIv4
	2qaxhTUWEHb9OPcOHhiUGFywv/sMVISJstEF6/2R9mRbEFRSsknFQ97KBIW8hWL2UPU01g0VS7o
	+HlliMnLg5hw5qJsfDzD/E3zmufk2fQBAFf2WtkA+5AgaituHxQhg6OAo2RSsr+124MCyHcisy3
	fnTXy1aAAHnu0iUR+eljbs3fhfRU4CdSD8EsFLr9/P/cHzOt2IzibzuaIoyLjZ/XiTnUr1SRcL2
	2oJmWOT3DZ65VTeRy+zflzE0B+WM2JX4MUJ8suMIkRBiba5z8OHwLX5vsREKavMpOs0UoOgvN0z
	DxVf7DXU/UL9jmg2SPpr1BFUyNpdOtT5jJo1aqX8uKVyt/9bp/DmdZVroab2hKQtEgMs5uBtWnP
	SesS6BLneMjupIWyB2VvfGI4deRQs7CsF+sjEcE1E1zFbB61CYk8x+1qsgdG6gFaNbfxNINq1Co
	3/ZsHmgCkc3nwD9ttcMnjwyR6dxVEqIUpmDpdg8wG1Gzs9F2EfHpfMfpSxcCO7F54C8EB6tenqo
	WdLtQ9VmBJxGiKoHyo32httVwnwNYGClQksnZGqW/asaygGHcRHOY+fBX8se3bekzQ+CyJYu9ns
	jSBbUoc2n4wHHG0973j/lU2X/KePUhAEZBMRATPZsPyhZWcFMARD3hVLWROGv0SsvAQFsTZgrgO
	0vtd3BRYE7FmJe1oY+HwXw66c=
X-Received: by 2002:a17:90b:388b:b0:3b3:b8dc:5e0b with SMTP id 98e67ed59e1d1-3b40a5a4cffmr4844165a91.14.1795220799842;
        Fri, 20 Nov 2026 16:26:39 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:39 -0800 (PST)
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
Subject: [PATCH v3 09/22] ARM: dts: BCM5301X: R6300 v2: add nvram node
Date: Fri, 20 Nov 2026 16:25:49 -0800
Message-ID: <20261121002603.25254-10-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162641_557342_E388DB55 
X-CRM114-Status: GOOD (  12.04  )
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

Add it and assign its et0macaddr cell to gmac2, so the MAC address
doesn't have to be set from userspace.

The nvram partition follows the 512 KiB boot partition and is 1.5 MiB,
as on the R6250.

gmac2 connects to switch port 8, the switch's IMP port, which the next
patch makes the only CPU port.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
index 55f0d9e90d5f..1b99fe442dda 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
@@ -25,6 +25,15 @@ memory@0 {
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
 
@@ -90,3 +99,8 @@ &usb3_phy {
 &usb3 {
 	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
 };
+
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.56.1



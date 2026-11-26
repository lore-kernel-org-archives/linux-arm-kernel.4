Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6515E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 02:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ODPasi0b;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pYMxnzeP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mQaio9L9ug+jKjYJ3hcWUzFKycXEqXxJ+P6cR4tntRU=; b=ODPasi0bVxrZrB
	z6nlCFBZKDXM6KMBd48OWvbva3bZEl0wP1Zr3raVhJtjGr/421scNXKIiRhkvINhAqcvlkar/tQ+V
	BmnkaMOyNZnZN2RK0/MGGFqvBHBf0+M7BAo5X6iuQ7E/6Lw5ZMEbFuHOfz21bZVlaCGD5lmi52eX0
	gqDAdviaw5Wlg0AMTfTsh8ykbJB/1VoLqOIPr7jO5KZCC4KA3QRhZq9xQK1S1q/gujyOl+GBfBA86
	AlXHAYJfxtr83Fjj3RndUus0EPq1ASRScja3tkdI9KHzZVMMVdFc24sPvbeVPx5KP9/5z695UmTNv
	08mHSNkOHVahwrybetnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPOH-0000000BvE6-1f1k;
	Thu, 26 Nov 2026 02:39:17 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPO4-0000000Bv8X-0KCr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 02:39:05 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so3268585b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660743; x=1796265543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQaio9L9ug+jKjYJ3hcWUzFKycXEqXxJ+P6cR4tntRU=;
        b=pYMxnzePTU7Sar9WJ5w+eThbb9BiSz+m8S1E92On+HJwS4mQfptQApkPDDK6BNTEaC
         1NsxReXNB9nFd2Dm5IEnY35reimMigbgbxMk50nj3aUE3qp2A1Ty4Q3mtvvENc+QEkry
         gGGFKOMIDd9Id/QDyuH3e3mx7JrLNX5m9KJtZEHEOtF7XMLh2Uh93c1xwPnC37GeQmG6
         VNWqi1m/W+9/V0XupMZRMUZh79IPM4WoDKxtU0uGKD9MUmaByswbKVt+N6/qxB5KOEyI
         Hng0s9TiU1brTJol6fSqf+dAXJA150kJEh5TFg40UM1I5yctowKCGmtpqjAE4DSdXbXL
         jdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660743; x=1796265543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQaio9L9ug+jKjYJ3hcWUzFKycXEqXxJ+P6cR4tntRU=;
        b=AiaCxJgQZ31F6r0ZwDWb6T4AQW2misOxPyonYGOFGYOAhZv/e8zAIQK5gjsE2vryY/
         3wMANeDcxDG7YOJF/luH+6rSmHQGhpRMXEfqEf/yIrBwn63Qtwaek7JttNuTIY7ZZamb
         q4NbMd1T1uoJPpw8+kG6fUOkGVGFs7e+HWHip5Kr8dIKr+Br7F9QGQkbgE4MWwYk430y
         sSb4/mYFnU+xyslstkKCK8IXYYwoIBzNlTzuhkuw/DG/vIOlnJ7x9yPUNdHDwcCwtdjZ
         HrfXxwKv7SkGij7KVyEH8/q5sxtSk5Dbuct4i8aAqQc6xwCPvOtfQxHTwTM8p/gnkxOq
         RQLQ==
X-Forwarded-Encrypted: i=1; AL+hErGonW5VjLVOQbQf0klUBQwm4VI6IJdjAlMujWgb7Tsh17lWcXdpfjOz1QXAonv4P0KVgUANF4spGW7ZcyohygjS@lists.infradead.org
X-Gm-Message-State: APuU4Z9cyFX1vezRwpU6bs/ZxnQ94ZiLFnSXUsQ2M9IWU/u8VXdfgLQ2
	TLXbpz1jjQeCsA0M7QqrfqVqiw5D6idxhXz2mhJyPv7cgo9iBsZf+iw8
X-Gm-Gg: AZFdTZf+pz1r/LoqiQZBLPu/hkksQXCZ3yWdsmyTVM6kKagkGXicoNGDzzT5gmsnAp9
	jT3jrZxauhOtGknQZS4NATSiqiCtjQGltdxvJI1OsSwHpzTaqs+Mv2g7+cws/hbRkOZ+WNjoubB
	Y9g5BXnoXMEIeckl0fLtV8J2HluCT2mQiq20B7jnP++pkidP8oLYIOmsW6CZ56UytVjXTfhsyHw
	+qMcN7CgB/6Ix/Z/EuVkgzQSyvxKlggFK3EDdnERqEmZjiNnlznXMqAQDhfg/zz+udKBBY6Z2cB
	f2J017vK1Q36UmsiTm7h+WA1n+EL9loKB9un/FiqaHGNYywEQFxW8IxLbEMwr3D+grObmPV0u9C
	4tKEaJ0EhVIyNPlHdePt0l065VxEc3nPkrgYVw0AC+niGTXXIgnZQqXG0bLgTZ6mNX8iP62A1dX
	fB7kEEZhlGW/IoYNvo6woOHeX5U8C2LnnK4sqcMLsgraOv48xHhKTrkIQLMYbBsPV6M4szI6Lo/
	FC4nBAvOcvY53jnDpEHGV8aXFihFX6SaWbSE5dWp0lj+f5knEN6yXuS44haKQRicPP/90yRA5bk
	nt427uDS1GPhDlyZBAlLI7xNM59Coqj5oEWwDbX/ekbuKjFhsc2PRv91sbtgPDGhdPhFNHzc303
	UZYxpgLJbyNh6QTiy1cgdNFTqdmXFKzhjAdxFbvFFyev+0GrmvGcpd9JsCi6zAIWEA90tBoYHEG
	GSGw==
X-Received: by 2002:a05:6a21:3983:b0:3e2:97ac:274e with SMTP id adf61e73a8af0-4014e74c103mr22772772637.65.1795660742975;
        Wed, 25 Nov 2026 18:39:02 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm9909018a12.19.2026.11.25.18.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:39:02 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...)
Subject: [PATCH 3/7] ARM: dts: helios4: drop the unconnected EHCI controller
Date: Wed, 25 Nov 2026 18:38:52 -0800
Message-ID: <20261126023856.767961-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126023856.767961-1-rosenp@gmail.com>
References: <20261126023856.767961-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_183904_133881_F601B638 
X-CRM114-Status: GOOD (  13.01  )
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

Both USB 3.0 Type-A ports (U4) are wired to the xHCI controllers: port
1 uses USB2 UTMI 1 and SerDes lane 1, port 2 uses USB2 UTMI 2 and
SerDes lane 5. USB2 UTMI 0, the port of the EHCI controller at 0x58000,
only reaches the microSoM B2B connector ("for mPCIe0") and is not
routed anywhere on the Helios4 carrier.

Enabling usb@58000 therefore registers a host controller with nothing
behind it, and the VBUS regulator was attached to its usb-nop-xceiv
PHY rather than to the ports it actually powers. That regulator (U18,
RT2875) feeds both Type-A ports, is enabled by PCA9655 I/O0_6 and
reports power good on I/O0_5. It is already marked always-on, so it
keeps working without a consumer.

Disable the EHCI controller by no longer enabling it, drop the two
usb-nop-xceiv nodes (the usb3 one was never referenced), and correct
the expander pin descriptions.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/marvell/armada-388-helios4.dts   | 20 ++-----------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index b87e3f8fd12d..b86b85e9d0ab 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -138,17 +138,6 @@ fan2: j17-pwm {
 		pinctrl-0 = <&helios_fan2_pins>;
 	};
 
-	usb2_phy: usb2-phy {
-		compatible = "usb-nop-xceiv";
-		vbus-supply = <&reg_5p0v_usb>;
-		#phy-cells = <0>;
-	};
-
-	usb3_phy: usb3-phy {
-		compatible = "usb-nop-xceiv";
-		#phy-cells = <0>;
-	};
-
 	soc {
 		internal-regs {
 			i2c@11000 {
@@ -156,8 +145,8 @@ i2c@11000 {
 				 * PCA9655 GPIO expander, up to 1MHz clock.
 				 *  0-Board Revision bit 0 #
 				 *  1-Board Revision bit 1 #
-				 *  5-USB3 overcurrent
-				 *  6-USB3 power
+				 *  5-USB3 VBUS power good
+				 *  6-USB3 enable
 				 */
 				expander0: gpio-expander@20 {
 					/*
@@ -268,11 +257,6 @@ sdhci@d8000 {
 				wp-inverted;
 			};
 
-			usb@58000 {
-				usb-phy = <&usb2_phy>;
-				status = "okay";
-			};
-
 			usb3@f0000 {
 				status = "okay";
 			};
-- 
2.56.1



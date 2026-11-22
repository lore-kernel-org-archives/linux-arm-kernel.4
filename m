Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C88606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 09:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WRgbWX26;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EoQtbtSu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1hkM21HuHsoo/xKTtTZspcbr8ShtbfKXKLIxiD4q2iM=; b=WRgbWX264kF/Qj
	xK8V2EWtRSWNGCg6g3Tfii5e81/i1FX7nBO/LPdnQ3Oq/pSEfhELsPpFkObcvFOPQPUzfg6gLNuX2
	9wlg+YNLnkRQhETSQFIwjj8ytH4vnG2HBgTYIV4HkyLA4mqWJdIyT+hjRyv0OVn10hptVRKJS34pz
	LPwwT3W/+VZNpRe41NImGB6xEFccGjMmg3DFJAzqTpgE6GyBmSCPsdv/FagytzSJpb1fB3fKZSAuO
	OnfJGmAT8czCyuqPpgVSopHJ8Y8NoTIwMPqLu3ABAD7cyU2DzqkS2Xy5Bt2Dxo48mpnj+2Qth2rpU
	xYXc22wr0pKqMZWhznUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4Fj-00000000w1Q-4AZx;
	Sun, 22 Nov 2026 09:52:56 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4FR-00000000vwx-33iH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 09:52:41 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cde1479f76fso1461299a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 01:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795341157; x=1795945957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hkM21HuHsoo/xKTtTZspcbr8ShtbfKXKLIxiD4q2iM=;
        b=EoQtbtSuS3IR9lxFY9gnu5Ba6Jf4L3HlmXKrEr97DK8ouXoWLZfwbKFF6c1Cobhzh8
         jPyrpyWAnJdJ2COb4lz7RsXmeQfB4otGaQ5NgOJnT1gEjc/OfrounfzDu7nWUfTssxRt
         Wt6l1prNZwAFZ7b9Fun6SDmyGgFir6UJNzhvN2ef+J8isdI+jiGeLf6tf8nRageQGtUt
         zt/itddQSeXK+zKLJ8+AOMcU4VVlVet8NIITs/zgWMfNrRAIVdps7hYiM/Z44KkLRRtA
         e89HC+b4HrLfn5v1v8oKH2jBe91jyd1C1sVGkUgjfuunP9a2L6F5MHc8MIpaYZHEiyTr
         SKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341157; x=1795945957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1hkM21HuHsoo/xKTtTZspcbr8ShtbfKXKLIxiD4q2iM=;
        b=Rh0+In05BccpHS5kpydXOApt89aW21lJh2BahN0vw2/t3Uq0M3Wsiq1y4mHfbDUwfs
         70v98/qgy2YJtGDEVz7axIximge2WHr+GN8ToHAfLVeUhJVBd9joDC0mamby7q4C/1rQ
         DKxkYNQP40UZBIfpcOBuSjmLiM6nKonDnUB9n+zS19YNYjOSXsm27MyHPd7auRq5F8PO
         l6Uai1yKiDjJyldTu9l6JQU4CEH3Fn3mKnV5GwGxWf9iD+FmLb3x7YhmomNxL72TZm0b
         vdBXJ/AEgRyPm4Uh7bjx+aAf0QX7k1hDUInvzMI0yKyuNT5MesOlusmwSo6QZSPbpOs3
         Y8XQ==
X-Forwarded-Encrypted: i=1; AL+hErHskx6M5ahafkFHKvC03dysWb6jSrwDl/Az+rW84PyCIcB4Eq/IbPWPUytg+/wMK9dDgFuY/9Nfvcrei6N94lX3@lists.infradead.org
X-Gm-Message-State: APuU4Z+AbQEXEh8sY5+KqpsuSB7g2zpL/ZyEj8sRh4jYCj4T7piS0g0T
	NW5OI8ffMnMLUkLk2V/pekpHPSY97yKc9rZ0OgFW7Z15uHq68ClCOKBZ
X-Gm-Gg: AZFdTZe3oNI5JIUDFHsCGOT5VLpva2Jr2OpBMBqCjHTrp9+WX6jUkOCoSOb3IADHW/u
	bErzA8DqxN0I0Hh3ogLftjhQUD8Vz/WglHI275s2fNY728bAZW7ZiLCmk4LS1xNkctm3EhqH4mN
	MBFPEbj07HotPUf0ewtjt/uX8ikZv4DzRU4x/cWBU12Qw90QfpO+nwZXUrt0IDuKFX29f76jmwB
	CZlzW3BPk5ajLy73q27h3p9o+q6TFnLMK6xBHSfp841cvgO6xha+rz6Hw2+rK7onEOMjQM4OhCr
	ocVhkCaRYo0o/fGi4/MqgT0IOYUrjDEk3vub8mzVpVX/Z2/63cFOcsMB6CmoNLkctI5IrDzSikm
	flaGdTrx86jYd0YrwIpAlriyt4AJal9MYPxy0tEOjPcJgEgfytHBQvYXea5TkCY60Y24RqkrGzx
	OSIBPxbmItUOWhgQFb45bPuu5XFZpxXu5cX19v7ggB2UNf31hrAYLP2AV1WVQeeKgPt3wCDh93W
	KiGNv2FfiNYmBQWFetWMMNG2cNyj8H3jcag/ZTnZamEWDQX/xCXKhq81lGT53BqRrSnKzohk2D8
	hQtxwjONIBC6nkMzh+1iMuhR6ZJBdaY2Op+s8eDT2zxRbX7EYmM=
X-Received: by 2002:a05:6a20:cc0b:b0:400:a999:d213 with SMTP id adf61e73a8af0-4014c25005fmr8350276637.23.1795341156757;
        Sun, 22 Nov 2026 01:52:36 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm3289722a12.18.2026.11.22.01.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:52:35 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	robh@kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH 2/2] ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi Model B
Date: Sun, 22 Nov 2026 03:52:25 -0600
Message-ID: <20261122095225.200916-3-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122095225.200916-1-artem122novak@gmail.com>
References: <20261122095225.200916-1-artem122novak@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_015239_909577_D4918EC5 
X-CRM114-Status: GOOD (  10.89  )
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

Replace the deprecated LED fragment with a board-local gpio-leds
node, preserving the ACT LED GPIO assignment and configuration.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
index 72764be75a79..040ba7f45216 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
@@ -3,7 +3,6 @@
 #include "bcm2835.dtsi"
 #include "bcm2835-rpi.dtsi"
 #include "bcm2835-rpi-common.dtsi"
-#include "bcm283x-rpi-led-deprecated.dtsi"
 #include "bcm283x-rpi-smsc9512.dtsi"
 #include "bcm283x-rpi-usb-host.dtsi"
 
@@ -93,8 +92,17 @@ &hdmi {
 	status = "okay";
 };
 
-&led_act {
-	gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
+/ {
+	leds {
+		compatible = "gpio-leds";
+
+		led-act {
+			label = "ACT";
+			gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
+			linux,default-trigger = "heartbeat";
+		};
+	};
 };
 
 &pwm {
-- 
2.56.1



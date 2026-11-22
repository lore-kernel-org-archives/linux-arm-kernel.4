Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A98606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 10:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2o5ChDvo;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5B7zCs7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oCpV49nOga8AoZMY7yHg06vfkscs7oJjLDcTlwIf7nA=; b=2o5ChDvoktH/S8
	3XC8eWn6Vk+Hr+h26e1/y703/ZVvB1X67pBvCUbn1XQt0cNa6ak6CvVqWNoQNF89GdCnnyx5G5mzZ
	Ns6Fh/BawGxiLeo59NFZNOH2QgFLIojp9J08tl+P3m8CtQCM8KA2tF42sL7eyCrXsg8YUiIhjXBh1
	SfsfmP9HRGmgoUjzEldL+l/qy9PvMBPIgPNujVpkKqdc/qQMQ31fp57h0XkqN5O0JNX5JX7l6ZvMW
	dudanDsiEcp0iphcsya36lcJ8gVPWxY2TOU4NfbQuu2s4EoxPROiVGkQacbXv3uRVW7DFwU/hmNTw
	frdIQp0JcSZvr+HViVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4eP-00000000xba-29Kk;
	Sun, 22 Nov 2026 10:18:25 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4eB-00000000xVw-1Ekg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 10:18:12 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cddac941ed1so899136a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 02:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795342690; x=1795947490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCpV49nOga8AoZMY7yHg06vfkscs7oJjLDcTlwIf7nA=;
        b=Z5B7zCs7hKTZTyqxXu1T3V7+Ma7b4rpOgND2+unj+784Bse8gmZueozscT7VM3+Uxb
         OoH88FfVr0XV5QwCemlqwNx8wmyLHr/Fg4SFAc0KnovZDF1X79uB89HjY1IgWnt/md64
         jFYJZF8jJ8GEcV/yOZj0iLU1cENKcfzlkcRUsV+AwR8BEFOPelTK/DWYUKuIMLAGOVHU
         rPfgK0LvHM+XDoTH5MKiui4Z7kxPZWQt1V5OBxku1KrmQXBNDXLtQyIPVfFmDfgbDUHL
         PbqCXCSTbr1s6q+L9uvnEibXrCdKpFnbMpTrP0l5bImQJnUjKsb3oz6l7yszacSaes7t
         0/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795342690; x=1795947490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCpV49nOga8AoZMY7yHg06vfkscs7oJjLDcTlwIf7nA=;
        b=xbu/TrI4JMy8uXqDdd912BhD9Noxmne4xjXXDy8Ep6x5dBEehagQdjHETi/v6r2lVN
         n2XW8uASh5dlfY4/7qG66ZfM9u4FcNOB1+fdt/V8JX/iQwFaqiy4+T/ouNIZNzWJJZ4M
         SE1zq12KkoHa4Bkcj/AfC7N4iCFJtKsQJP0/SlGSlTRZFaGi5B6ZtlkUls7VsqU1ePpb
         +oPxNt9SHp4MSHzBoMW6yhg1ujBPMI/wkgADP/vPBioI5P9+SlwUm/P9AyEnyhwlgMdo
         C1QbtH8E/wjajwI6fuSXOqsVMLjhVl9DCiRtNgxkfUAZeR0flVwe+1HGy8pkmu4tW+nC
         o+zg==
X-Forwarded-Encrypted: i=1; AL+hErHz+w2MIKot/NaPB0w8u4pA0l9NrFqIq1YxcYYcRZOP2mwfMyL5GNHUs0kEU0UgkqZ9czIojNIqPUI/5edI96t9@lists.infradead.org
X-Gm-Message-State: APuU4Z/6EAo6J12d8ANk//a+VkiktYkg7tyNT8s5aW/KwXa44lTnqaeQ
	90/0Stc6LgwVR+SIbuN9ZW6ZNdhB1v0jVbOJjO8nMR4u1/ywHzhwmF+Y
X-Gm-Gg: AZFdTZeqrk0e2pdkHb3F5bl1TDIRhmENqM6ZDaxdJ41e9QdC5nDZKRsO2t1nkytLHKt
	84tXZweLkr/dFEFaJAfF1G4J0L5/dC3M3tDcsv2z/UIOlk8g5Sw4izviJuvksotJ0FfRDaSdDAh
	uol1DoJMJnXAisR9xhd1aXCckINKGAAJi8sQSLBQHjwjmPmuSCtVqljOXjXRAhdVXFOFNAif1DQ
	aIouXcOwe41J3dbLbq/VrVcLwxrYC3Mt/McKNT85AbIomQxptjElcuUvu/Gaiqf3G2dgy+oDVmn
	rUE6fqzUQoMN9G/dk4PJQjNkwe+UpVOMZA1mTVR2iswMyY2tTkvYw85bB+qgTlXHBADWCvES9dH
	VZh9FfcboYAA5amMC9IWvltii9rDhBGz5CkjUStKxApzjzeb2G3EFPWTBFLuuzK6C3FKBuonzCZ
	QFjrEO6vhPiVsLKTazqmkE3+El7/mauWIrjbUFpwDhG4fXmTb2XFV9IebqfDEZgymu5IxHFbtCH
	J5SP28AhfdUi0EWAUYG7mVqnLUIDJJ8rnQWGgDx/WajGqdArxVvrs79YoEQS4tFd8/Mo2BkqbOt
	VanYisPjEC0pftk3vCofoBl/uzztJ0SCTzKIzSdanBgeigPBSvQ=
X-Received: by 2002:a17:90b:1fc4:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b41c98a43amr7026493a91.52.1795342690497;
        Sun, 22 Nov 2026 02:18:10 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm14953787a91.17.2026.11.22.02.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:18:09 -0800 (PST)
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
Subject: [PATCH v2 2/2] ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi Model B
Date: Sun, 22 Nov 2026 04:17:59 -0600
Message-ID: <20261122101759.206056-3-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122101759.206056-1-artem122novak@gmail.com>
References: <20261122095225.200916-1-artem122novak@gmail.com>
 <20261122101759.206056-1-artem122novak@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_021811_386260_7F1D2F60 
X-CRM114-Status: GOOD (  11.16  )
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

Preserve the leds and led_act labels when replacing the deprecated
LED fragment with a board-local gpio-leds node.

These labels are exported as device tree symbols and may be referenced
by overlays.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
index 72764be75a79..660814ce851b 100644
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
+	leds: leds {
+		compatible = "gpio-leds";
+
+		led_act: led-act {
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



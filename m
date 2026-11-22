Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A395606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 09:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HxkAC0Vo;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nrGijSJF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FzzE7HZCozxGjLrr7Gn9UqXhwvi6GyDdNSIP0zo32Hg=; b=HxkAC0VoYalSdSl+Z7zhuGoIir
	bMxrn7jEWJsjVr/hQbuMlwYFpE++3+/Jm8cbgjR0fZ1XNR7ppshEBobbbCR6aZj9KvAQf8YkYnWdF
	5wHeS65uzCLpPbhOIDf4E/d8YPx7mh2utF0wwaM2UIMaTLu0PvLDAV39jI+GVrXyDnwqyofNvs40g
	Z6FGYPg1zNhedluRyO8UPzmJ5DtTH7z9gb+2U/Q0Dh/Enl/OugNrvhhHQ1tvEEuo3MSv2ncdsV+HT
	nBFKAq1pg3/r5mk0MwGprQf+9qtZt5ZWOqUhov8NvMD9CM3eInJdKoVeH1+jBliV7V+LSvRU05Cib
	ZxwM0XpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3YJ-00000000t34-3Pm5;
	Sun, 22 Nov 2026 09:08:03 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3YG-00000000t2N-0Jsa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 09:08:01 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so1011599b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 01:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795338479; x=1795943279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FzzE7HZCozxGjLrr7Gn9UqXhwvi6GyDdNSIP0zo32Hg=;
        b=nrGijSJFodKotFZ7WKti2TbhJ4St4Wxfec8IgLmzhCfHypF4Xq+IjK76P7nv18nUI7
         Num1nMxIdydCZ2Smj2e9WKvgXAOM2rKtFWeyrbZ/8HTFBwImRN3hJE8W48hOYPX1KSF2
         usabMzoV235mGaqGTZlI348ovl4Dn4oU0Q91WUU+uZW7WzUTQH8ygelEoRNXfrbIHXxz
         TXOep4ED8oU9M9Ccsd/W1hpj/OtK/CE5ARafxclu0V9G6Q92KHE/Qp7rbrLZ3IDVgepC
         +wXuODSiACTe+mrZJV2apY7iruG+vMgBvB+QPkNFfWPEtjSqFDDYD93yDES3TPHyWHP0
         4Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795338479; x=1795943279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FzzE7HZCozxGjLrr7Gn9UqXhwvi6GyDdNSIP0zo32Hg=;
        b=A/SqD2gPNsVw9tdfm1XQZPLHAMwSnlbeLTEzztiEfjEnoVZdyC+2dbvX3SRWyYoL8w
         8j2yYb0REkM7kYaY9L4vq5FUE7OwWlIsYit8KdB+dJvfwHQGZvOIJyGY0K/AakDU0RMZ
         6eWAc5oRz/jvPxSS9jm732Xtc/qXR1rMwzNypY20gl6+SeBkdiXcIdSFqCZ2yeRw7eTl
         ux3xcDw9RFYulJioBnhXHM60rmG37bG35BQKvixNd+ycF7xlAsQHL0+DpQrnPTtA0E0I
         sZnuiSCQEpzcjEWuP2pi6HxPnycIvPTyIus29FSc4MGCMK1jRWAwN5dpw+ZlEGLe40pa
         o76w==
X-Forwarded-Encrypted: i=1; AL+hErHzALDN48FzBrrzUPu8DHGxQV4rbw6CoKNmIXrMSjLDwi/9mC3LbrM6ijhUTYFb4RdPTHmGMR5buVlX85rpuQ52@lists.infradead.org
X-Gm-Message-State: APuU4Z9NRNizjSx6sWbQP2BgYV9agTQ6vm1LxdUgGZduSmFIqS8t0g2u
	uk0vZ0VzPvGnz1Or2g/xXpMvDCdLt3tDTzDeIfq+rN+OllvnUu/DXNbf
X-Gm-Gg: AZFdTZcssVqVn5KKjnFFdXXqe5uFG38hqFHlsNCLsRqwZv3EB7ErTFpAulL1SgU4WH3
	baQHu4BvhjDuaWSD4mLgLGnmEL6XRN6Y3eZrWTD5sGhCG5L+airX36ar/I86yp2mFvP8UpkZPdn
	a11u2nrSPUQZQajYVcqY3zGHgLwuwueN6j8pgQ0AtA2U0R7A9OKVDpfImk9dGNCEgnzfXv/8w/3
	v2RTXr7eyvdecJihU2Hj4xlOxpx7RP0ZMmD4xnsnPCaKd/j/oK5EGjq51Ug1Oz+eivnji7+PAxD
	92/atsYOrhufc9TaRUl8+LtDMSL2pR/blRTeFmGPjuvvj+KCe32eVuDpqIj0b4c/JMNsQ4aW562
	2CMyuHNE+x/e1lj7nvtbRf42+2DMMgGccJRfEjdhDn9xiMALRFYbDy0HZlRpk5mDSF8rZ8PPg9g
	Qud4bjS6KJeOhatmhsugYlO+vZxj04sEnHLS+YGFFho4L7ixr5EEIwTIzckPKYbInkGO09VGXko
	GFpXGhL1Zsgw8eKLNChVZ1HGx4wJSdmmWBl2YhJjjvmVqXAQPG3modTHpqNjtTdhIv8FQcxJHvo
	YaqL2HMSaawkEfLKHb+dQM32Ov2k+7+x+Qtsl1u7uiUWW/GP6Ss=
X-Received: by 2002:a05:6300:8811:b0:3f9:b4c0:d3bc with SMTP id adf61e73a8af0-4014c94a9dbmr7480537637.24.1795338479155;
        Sun, 22 Nov 2026 01:07:59 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c86d821637sm3892624b3a.0.2026.11.22.01.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:07:58 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: florian.fainelli@broadcom.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] ARM: dts: bcm2835: remove redundant CM1 LED node
Date: Sun, 22 Nov 2026 03:07:54 -0600
Message-ID: <20261122090754.193072-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_010800_139248_B103FC29 
X-CRM114-Status: UNSURE (   8.50  )
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

The CM1 device tree include already configures the activity LED
through the &led_act override. Remove the redundant child node
under leds, keeping the CM1-specific GPIO assignment intact.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1.dtsi
index 750cd76948e3..7554903323ed 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1.dtsi
@@ -6,12 +6,6 @@
 #include "bcm283x-rpi-led-deprecated.dtsi"
 
 / {
-	leds {
-		led-act {
-			gpios = <&gpio 47 GPIO_ACTIVE_LOW>;
-		};
-	};
-
 	memory@0 {
 		device_type = "memory";
 		reg = <0 0x20000000>;
-- 
2.56.1



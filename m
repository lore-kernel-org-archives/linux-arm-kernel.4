Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF44D606A334
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 09:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BKIgdEYs;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=idKZGflq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yUikuj1FyLUCHY3Zwx8GuKGSSsj8GL2KV6hgZCKg5AY=; b=BKIgdEYsQK/XXL
	x+FBmT1zsikITuKWz3/YlhKqZSA/y8vusdGFXRuKI6J8eUUT4If+gqipFqm97uxdxwBwbgG2pB7Ni
	hMVGvDC0+qjCTy1K5ytiW/c5U+4eK+DEBY+t2dDNSw75M5F1/g55bkrPDZDQTo7odJZKub2dJP2Le
	zrdYqPYACsQMAwgWe+TqdNEV5j6Vx+nAmvY2M8iMdvUPRLEnrC7SdUlZJTA9gVPPr7bMXEeTNVMij
	77kX8SEJOF4kyFwqLLmdsP7DsoCJhevNyr/+0Zutuhg3sr/paBgD71+/RBvAsZJTuQSfGP8VkWc+X
	BULevqVwt3rQkct/OWCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4Fc-00000000vzw-3AJI;
	Sun, 22 Nov 2026 09:52:48 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4FO-00000000vwM-3grV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 09:52:40 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2f03f3631b2so12649135ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 01:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795341154; x=1795945954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yUikuj1FyLUCHY3Zwx8GuKGSSsj8GL2KV6hgZCKg5AY=;
        b=idKZGflqY3gexXkbUM+eKBCFdSVZkLepD3CYOu01QW4CX3ZgfVfR2jPO5DzYc/RfhU
         9iNxSmxrTUpBXIM7+6UChl9u9VcS8zaSsp5BEIOHRBkD+45LdSy2fTT6iFsfV2LrffGj
         q76D1+Zt6X4qBQLDP9xaZnAx7N1YyluUGhfhClYN5zyoNXPx/r714qL+Pw5equpzfXnK
         KFgE+oxemYy2sHXIROWABX/+G1tiKYE40fmLqTjNroY1zZWjqz1JMXULrt4bb1iybK0w
         KRwUWmm4bGRdB7q/gQeB6pz9Ss4hyDBPduH8GCChD2hgEx25APf7efccepXr/RgtSwc/
         zA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341154; x=1795945954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yUikuj1FyLUCHY3Zwx8GuKGSSsj8GL2KV6hgZCKg5AY=;
        b=ucrwgd4afWBi/al6mGuGeaZxnZhsUfz+FxLLes9qvHRV2Hapa5HZ+TB6vtBJGkoW8G
         t89lBmYgumE1IQ77MtExF0Ldq79PE+mrRTgmjP7QrAbOtIMu+AWAVV2jHQii7ICffY8I
         YtI2mAjsqty5x10tLxLz/RJHv03u5EwDDjtkyWOwJUQRW8pn1R0dhEhWlmjG4yLLnEDb
         GYr6sF2JF9dZUqcqnmCtYApsn6Vxq7jiY9BGFkHf4/9vQaeUY1IblZIHZWx+qHVPvVwK
         dQ4iK9/OqbIb709muCPWyd38hPIsXcz+r1s9SZg54x4MidSd1/iO9OuO8lwUTXlUCnsn
         Ou1A==
X-Forwarded-Encrypted: i=1; AL+hErH2NSBkdDBW1twqTeBzsUp32mnl/iTMcuP5B/fo1VzX3EP1IhvgNDHr6gKOZste5IpNMeBMQ8AMbX49W7/WSBzv@lists.infradead.org
X-Gm-Message-State: APuU4Z//E5QO/N1/D+R7HUVLuBjKx8DHtZ5P7po3eq96OZOzFg9KvWo4
	D8Y+GpZrgOES1b/M5Vfy7hFKydPFlhtWFv5R45+ykwen5fuj0N46dR/tU+cu7i4O0b0C0g==
X-Gm-Gg: AZFdTZf/HGClNtf/JVLWwwPkE55J267znP8qfkJKkvhV1H/TG7HQjvaD7mIXxWpV+sp
	IhJa12A8Zt25AY2pFhvW504AOBU9irU5rJp2UorFGTjvZEVhVgGo22ifjxlVHjie1jlUjO/yC0P
	98PnN3SNuclfemjqbnD+iRKotCcUtJ9ImPJXpA1dPaHsFDwf4AtFnKsh8NR9+vKclmfFTLrS0Wf
	OYIWJjnA5eI1E+B2ZWUow7wKu3whQ6jE4Llg9j2hn3BWjHECVWcOQx1ShAhZ2A45Qv6wyM2rucT
	rj1IzAnJSKiekzaK0cGqJNzqV0Td9oLUsmxjbBp9gsJ0xNJAKfyjGaBDE4NylK/AlP+G97sW8wH
	HPtGdJ0ZkyUfmeO7mfsuL9XvsmN2KI3jOjRPpZ39FvlnWO56/Zcdk7AfbunMzgZy6VXKCNaxE+t
	ONkueJZ7RCQ/FQE51RWqOd2uho6CPTI68sQEzFitK7A6qrcV1faX+CYquIIoveEN4z/8TUTGZQg
	iceUBJ38rjG1ZDUJwgTbEYOaaNixPEed1DGpNXPUKiDZWDfOTFtqq4rsVzuUNzHK2HG250pqAbU
	/nRVuk5+oCb1l6F6qrGgrWgsXfyb6zmBAVNhWJv0VpWFak3R9/o=
X-Received: by 2002:a17:90b:3e48:b0:3ac:adce:60ad with SMTP id 98e67ed59e1d1-3b41c98a343mr6261954a91.22.1795341153927;
        Sun, 22 Nov 2026 01:52:33 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm3289722a12.18.2026.11.22.01.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:52:33 -0800 (PST)
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
Subject: [PATCH 1/2] ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi Zero
Date: Sun, 22 Nov 2026 03:52:24 -0600
Message-ID: <20261122095225.200916-2-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122095225.200916-1-artem122novak@gmail.com>
References: <20261122095225.200916-1-artem122novak@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_015236_950019_CE1B2132 
X-CRM114-Status: GOOD (  11.14  )
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
 arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
index 539c19c10946..9364695055b4 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
@@ -7,7 +7,6 @@
 #include "bcm2835.dtsi"
 #include "bcm2835-rpi.dtsi"
 #include "bcm2835-rpi-common.dtsi"
-#include "bcm283x-rpi-led-deprecated.dtsi"
 #include "bcm283x-rpi-usb-otg.dtsi"
 
 / {
@@ -101,8 +100,17 @@ &hdmi {
 	status = "okay";
 };
 
-&led_act {
-	gpios = <&gpio 47 GPIO_ACTIVE_HIGH>;
+/ {
+	leds {
+		compatible = "gpio-leds";
+
+		led-act {
+			label = "ACT";
+			gpios = <&gpio 47 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+			linux,default-trigger = "heartbeat";
+		};
+	};
 };
 
 &sdhost {
-- 
2.56.1



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9052606A339
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w+s5OX7F;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HnA4xkZm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OTgHFbj2wY5TghLiWIYijNXspkdDjNg1qUeCJ/ElGvc=; b=w+s5OX7Ffnx1aw
	5i9kdAfcmu/9sL9nZJPwQWyhx2cvw96aizfhZvbIrNvQ+OB/oNFUY9jgBHNjYd7X6bU6+Ont7I+x5
	ol+AoJANel2XzMdG5PUFsxCwxnQLku/0IGtOGShFh76MH8ojRe4J4ixekFV1dg919NagrPwjsL3Jb
	yyhdlTASuPhmJgjhBwgC4W9naKSeH70lpWukSQitmSmsC2R/S4AjCcO4p1CS4VHQqHH/sBCz4DS+N
	vPzdQheYslFxV3vOoZcrgmpBzw8cwAfOMuEtC9H7Dg8lYchRBLkWNQjQ2ex6x3++D4M8Mph3AjIH0
	SzHhP0SoJCtz5umBj+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYxE-0000000GVZO-0859;
	Sat, 21 Nov 2026 00:27:44 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYwJ-0000000GVAA-3yIL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:26:54 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8b2382bf051so837745b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220807; x=1795825607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTgHFbj2wY5TghLiWIYijNXspkdDjNg1qUeCJ/ElGvc=;
        b=HnA4xkZmrri8H2dJ2kQ5lwnmQ+4eoCj0VovyOXCUm66brdVloYuaCxhnt8uFRtTNXw
         A6Tw1epl9qlqeOLyzKHRJvPbJVmKsR00QSH3jYGU/7JxqiXfFbCLFODNIU5akPnnjwCt
         BGWC3SHj1r6URp55IvZxcZZOOyZd8zGj+2EhwlIlEeChy38U9KXNClREFS7I4yXNSjRv
         BLeD5oPK1H9aFx469TUN+thiq197qMi0yu+oXJiulf4b7Z9pKTymnc4cGNcQbUz1+qNl
         8BHRGCsyypeA9a7r88166VU7RqteZuOgM93bPd3OcYQ1AXKwYiC74r8HNpSz0ypGHXDe
         p5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220807; x=1795825607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTgHFbj2wY5TghLiWIYijNXspkdDjNg1qUeCJ/ElGvc=;
        b=W4eSCIwRmyzOXKPQvOFcn60COtE2XJEEjup9k0bTrfg4CzNOTXCPuJiiqSJNFT1L1p
         SeqDBPrbkPYgPk2eMUqYuf8fW6kQfphA0tc22ft9ELrkvox2xcBZjFM7rNF4/N9Rtkmk
         D8BBQLjv4FuWY/7RML1CKVVwbD8hsiTJGOkz2+Ww5qFEcHI6L2DxX2/9rDq5finDcntr
         H/24aBQXvHOYNL5N0G4Wc+jzteiEuDALEvIEnu58rD5+lkeHuKt6qntFbnVBNTdR02LK
         7qRlKv0wZUoK/lQve+6BRat3Ob+YIMBUFh2GPEjDKpb6KOHf7h9RDOTqSa6ZHbGQjvGr
         BoDQ==
X-Forwarded-Encrypted: i=1; AL+hErHf4gFgcmMekdpxR3OGej3YwStw9f4Aa5ZxN9A7FuRK1M/wAUomUQ8c4QwHbTyXHofWXbZgyaRyQAO1n0CyRqBX@lists.infradead.org
X-Gm-Message-State: APuU4Z+njVCeZs3maUk9oTBLuNuCa5s/U5v3u3h9apIRWDsDwwqTXA/y
	W+5G38dTcqLhdnUeY1AoOU+ceV36oDuoSC/358SVL3P6gMV4a2WSxK55
X-Gm-Gg: AYBFou0iSxUsdvvRrRp+lGnOrKOhjVcXidWV4Xzj+opCaYyOr2hwyycp/9ZQoo3X0S6
	KgZkHCMMCEjJn2o48n6nzywlkJlCiTwHJVig8g/APaCGer0xtA2J005hEhI8iHmjjQ1zpDdF8lR
	9hhP0zzYDrVBakwsUQkdlefklNDKwuyWmlkchlXO5tMskQ1dsDeSDZZ2KClUA4SaWPzdnxUiyXR
	w4yuYcuteLfzEQMOsJw+tDljBQhMmp3K6tswj/lwHg5Jc4gkJR4cbF0R9398w9aZdRxzFupUw3a
	dAoFZ8XyQzSoOwdBkzA090gDkTw69L9dbx3QNlsMbUAGZvZN2RPme4qfAOSEXCxSOgn0CtLgifT
	Sr6Xlpvi6eG+OKoFUmG2wjo2uOa0Tgze42+WWaS63qA72R0PkmuYjHFzRczJq3dIK3PP7ZMHmUT
	fDGmsup2vzg7dombqMwGkVoq7QD68bzf0Ve5sD9RigZGCzrx1PSXo8wqPEuMZPiLODspPBJaBil
	CpGxNvKu5Kti00WnPDUfkIz7uZkbmSNOwnqizq5ZSs4Z2dsUUR5390KNcfOmE+ovj7LXaabRwwR
	i9C/e7oE1a1hsZSoAkdJjH/gP95KXmJkgaiJkvgk4YYKaOv5LWnxM4cUYVzqyF3TJ7C5JlUQNu9
	yIozKj8r6vt30TIE8LxQyN2rbvSNERcnjncY0gxJONLKcaUvjRPNtjd9a5jgINfccIaSKxXBBW3
	AcLQ==
X-Received: by 2002:a05:6a21:3b8d:b0:3eb:2f53:bdc6 with SMTP id adf61e73a8af0-4014b564525mr5328137637.23.1795220806943;
        Fri, 20 Nov 2026 16:26:46 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:46 -0800 (PST)
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
Subject: [PATCH v3 14/22] ARM: dts: BCM5301X: R8500: specify switch
Date: Fri, 20 Nov 2026 16:25:54 -0800
Message-ID: <20261121002603.25254-15-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162647_990149_C3CD05E1 
X-CRM114-Status: UNSURE (   8.97  )
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

Add labels to clarify which port is what.

Also set the WAN MAC address from nvram, which is offset by 1.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm47094-netgear-r8500.dts   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts b/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
index d312afdb750f..2518f25b0eaa 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
@@ -108,3 +108,40 @@ &gmac2 {
 	nvmem-cells = <&et2macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+
+			nvmem-cells = <&et2macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@1 {
+			label = "lan1";
+		};
+
+		port@2 {
+			label = "lan2";
+		};
+
+		port@3 {
+			label = "lan3";
+		};
+
+		port@4 {
+			label = "lan4";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1



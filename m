Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBB2606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=paW8fId3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdr6JCZZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ne2ANG2AcfQBisFLtvaPDWEXZjvBiN9ucVQ2DRwlTus=; b=paW8fId3COb4Lr
	nKlK2XmVeiboCLgNDWmi5PvSdPYlCrohGtJCNdNkPJAwz11c4cWsSAkESEl8ylEcsulxBpbDshSgM
	BFWmxZbpio9Ra1JACZutsp0xO9uyvTvVH2QRyEOwIKdH6l0wa/sstSCZAm7LbOKzes9Rr1LnHlnqp
	KAHXTA0bTgwZJBZHcMqk+poj3pIrik9gMqRTRPXHjs39QQiEJuNBvm4baSpkYO9qi3HlbB2+Z76Fm
	AWwgacIH7I1u5iorNp3CBkHt2D/Zsin9lmFQr1Ij8nMDOGPZga+s+1o2ZLywcj3TyISq3CUcxbrGP
	FQk6/unTYZQxXT7mDKFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYxP-0000000GViO-3Uz9;
	Sat, 21 Nov 2026 00:27:59 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYwM-0000000GVAm-0dpZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:26:58 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1332494a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220809; x=1795825609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ne2ANG2AcfQBisFLtvaPDWEXZjvBiN9ucVQ2DRwlTus=;
        b=kdr6JCZZLuH46EMe4JhljAjxVyX7DVIm6/VeAdoidqCZrGQygmDp93OfZ38mxM2oGo
         Lc7cRHwp7/WyZFkRCQm+mTWVt3M1JJKBKBMqjmnNjhP5uoFRZxJmL8esFUWbk+9G7PxA
         XrEsrQUm3BiJrFKH8BuIr6UyEmyD8pJ64LrNw4Hq51pZmgct+en4ZSjA+CXH7oSwzskl
         OZ9bsTNZ5FDfIbGyBFQ70bQr4JXD63vZuMO68z4l/c7fTxarhMJzxxAo9UwdJmiNmC8X
         dTCVHJlYMwQ2z5y4a4MeWi7aKVJrbgWzyb+klnStM7Kjmd2l0s9PqVT4T62ejw8Y56tj
         pPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220809; x=1795825609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ne2ANG2AcfQBisFLtvaPDWEXZjvBiN9ucVQ2DRwlTus=;
        b=NVX+b5xPiR3NIA/g+djMKJumw1y8uZvP4KrYMDqjwBUl5XULThmhKLKCMMGcCtIC/f
         auYsm3Uh5z52AaSJdPngQvbjEuFcQQCcFzvMw2SOs4xrryo+Hvb6InDCN8l0o4TIyuT1
         l61+iW5cBieJQ/tbKRKpQd1voG0Z3fK/zsN4zwjoqA2+fzRNxlj+eLsuhxJiPWDN+ZN8
         lY9wsEHkGtml/RJ5M/Fmcy/i+heGMmEyXa3Q1e2VExAcMqtKOm+giCY9v8i+eaDX7gja
         dWgYBgELhzckYaKXqD+TFWSulK6QQ9fYt1EJSVZ6oe1BZMV2CqrTmR3gLqf899IFtHi0
         TbfQ==
X-Forwarded-Encrypted: i=1; AL+hErHB9DPIAUlCfqIwqtCzrdfNsMXvLxfFLaLi8QqxVnDmF0D+llmpZXSIZ0f+QbTlJHsXIUVM41mR5gW1hzOhyyZD@lists.infradead.org
X-Gm-Message-State: APuU4Z9p+RFsv4bMTVJVlMCKeGFZBoi9KX5eHo+OEk874ON8oWUU4qLx
	FNsFuuMAhtiSUMzgTMSeAbIm7aQwi2FSJnXncE9eVBqjwmwHpR+wi0bm
X-Gm-Gg: AZFdTZflnnxULn7vYh6pHXCNAdZvBfFiQLI7SROsshdKjAUO/hPwa4h0yYg4vweXLvs
	w5KUV4mSZ+g+DvgMA2+qPyMGyyuvLrlxlKoH9O1HcSVf+d7RTVlff9QGM7qcHard9iaYInwFEcG
	gcmysvU4oYhpRwzjl5nqs2Kgkwkp7hqyswOTzujs6hzsWoLleN4jHOBBRwI7+Tr1cAMcfiS57Sz
	21M+JbiSjrE/tYUC2CBXf/XAPxWLHlychW2Iq+bkB78sjMC6NmLhs/1iQQmLwUm3v6yGa4Kvt+f
	AE+srVqyw5P75Raz/daVDL3Sj1p4Z8IR2sN8t4Rq/oeEMyXLlWJuDdb8gmkxSTCunJcWk3w6L6X
	/OC9UQhKR5AWhaOhBFW77iQEVBzeDsG08Tj5kVq+z9H/EZKVcCDdAaHQbMAH2L57dV27A+XinVH
	RruU3SzbhrddA9SyPt6W7yhMx4KLJSu54oy6NTRGVHVLjVe+wIoHEvOTqZXZjTVSgW1pV5cUpUA
	YoRKttdgN4BR9J2MdIKXsYlj3BccZSVnpbEkquCJRBXQkuIibDvYIyBhVQJJDNfvO1ptc0bpMV3
	mJh0bBVWzusuygmh4vISwaZBIIkeqFFzfMVmBib1LP/z8+6PKtMd1AyoJwaUVUEyf65goyZaC5N
	JwT98l91PXozuc7VWSx95lrpWruDsQVRea94sEnDbZ7eeJC+z6lfl/BtqJ/M4Q47LmlTHREiHTT
	7EZg==
X-Received: by 2002:a17:90b:3d4d:b0:3ac:95d7:2fa5 with SMTP id 98e67ed59e1d1-3b41c959e14mr4595823a91.44.1795220809250;
        Fri, 20 Nov 2026 16:26:49 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:47 -0800 (PST)
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
Subject: [PATCH v3 15/22] ARM: dts: BCM5301X: WZR-900DHP: specify switch
Date: Fri, 20 Nov 2026 16:25:55 -0800
Message-ID: <20261121002603.25254-16-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162654_784163_601671F6 
X-CRM114-Status: GOOD (  10.69  )
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

Use port 5 (gmac0) as the CPU port. No MAC address is described for the
board, so gmac2 would get the SPROM fallback et2macaddr, which these
boards do not set, while gmac0 gets et0macaddr.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm47081-buffalo-wzr-900dhp.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts
index 7655e4ff2d1c..6cb27ea2dd94 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts
@@ -107,3 +107,41 @@ button-restart {
 &usb3_phy {
 	status = "okay";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "lan4";
+		};
+
+		port@4 {
+			label = "wan";
+		};
+
+		port@5 {
+			label = "cpu";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+
+		port@8 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1



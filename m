Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C85606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MMuIq3mm;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EWcRjuZb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a+6eCIHLWHFY3nDB/Vr0c1/yRrGzwmD3XbYPRK1ugF0=; b=MMuIq3mmA3BIRI
	1UN/ALVOne+7ZaW/vkj+o+69PqsTSW4qvINNv0q4OQjhuvVw6PFrDFXcjWI3sUL7TFJWpi9sY8IEs
	ON1j6VgLeSfY1escj2Atn/lB0XUJPaRldi0kyWBsgjUvmDBWyumDFHLvCu0G4tds4MyQtD/E57FFm
	Bl7mwcPruo+G0kIPBDWnGK2ZVKScNNkekQXF35zCJALGjb6lK7XD3UzvVoup4Q3rYhFntsmYA2aoF
	BaZN43UOzZpihY3fIf9aB1B18BFByCMnQSo7iK3WJgjxhs+mDZbTszh8OrAFAoNZuIrWYjB3TlTBB
	1rEpA1EF5BQ38ttPD6Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvY-0000000BFhE-3Tqx;
	Thu, 19 Nov 2026 08:55:32 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvU-0000000BFcC-06K4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:55:30 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-5364d86f7f0so23705981cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078527; x=1795683327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+6eCIHLWHFY3nDB/Vr0c1/yRrGzwmD3XbYPRK1ugF0=;
        b=EWcRjuZbdTu+ormSLq83ZtxptH3iwJpo+h43CmDb7mB1rEH9htSLi8GxwFYlmI2XTv
         toJ5NPknQQRAFf3C+WKKDhnU02TAo8+3juB0Lr/JWx6hXGIinR314kNbz3/EmWRMyaEv
         tBjnVMOxdylfY1WW0woLN3El3PGxUW2C8KVMY+awbibrGulGDXmej8G8m4hSL5rL9JBT
         /pNBfOFZtOgduxsTz0sKPB1BKnsAvlC1RyW1iQ07PkrCJwi+xA9R4/Ms0aC/9jiKQX4M
         2Ev9NyB9D6fs6AIDo0oc6cBpeFsQ9tsSJxXp0kLCIuxFrWPv+k/fJyraQX3q6zISO13P
         qgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078527; x=1795683327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a+6eCIHLWHFY3nDB/Vr0c1/yRrGzwmD3XbYPRK1ugF0=;
        b=UxiToObJ2kRmzqqq7aa9KZD7NY0/8KfyuS/BD1/+L/U87qDgAJtrATyD6xDL5xNYGl
         2WDY+fXiVfz9k+yBKzwqqrwU8nn+RU/nVekTp3zGxVLfpGBrjdrND6j0nDi5bmZn+5nJ
         8MJb1KUe6HGSwbrp4+hBk/kuaaT1gqu80U8zlYdmPO7mxn+VyxM1jF8PHDIsMCbYWHOA
         g1eiV4CeDv5ZhlCRiEcRjh0er8k1aEbOHw4ppvT9YJmWtl4AsCWWxBw02KOG+Mf/ZKOI
         KG4rLDHdDMW9iocJFw1LC6dn9cMODz7mDjNXJa8aGz2KAgi4MoXKR3PTDgh9A2pntGMA
         ijZQ==
X-Forwarded-Encrypted: i=1; AL+hErHA3BfMjke4Bg/hEUL4mkuUu5XzoBOQOzjMAxgZiv2j48GYYoC4c+QYxwmkBwioz8uBlVPmP2zJTEzARMhSko3a@lists.infradead.org
X-Gm-Message-State: APuU4Z+spPUcYti2La3ykEoza6s7c1uV/zCHZ4CAhcJZonrLP7RQmmiz
	2KRdH5hhnNJPZdEX9WfwVM3rs3uFAeLj2ws4MOwzdZfkQYInw2K+fBaA
X-Gm-Gg: AYBFou1UeeNQCfn6yEInI6vq72gn67y1sM0MwPYstuvE6/yOn6z3tFQ2skVf/hEjiOE
	Jt3YKBnOhlD1fvjvpn3lFJ30bpwKcReESYvLAlm0BCwoR8ehKSixlrSOQzCKP3gyloLkr6LbPMz
	2xsv+phaDBvG+AOhZ3SaLKA0UxRreSi4NZ6DRE3DoZ5ygrLiZipBVFNXB8+MInZP2lom3FxB6an
	E/wkl06foIjR8U+ugjJOOiA427Fszg5eb9ycF3A+Qa8sdkpg/WAp8RwTWT8Z/xVK4qUgFVUCAiE
	/lJ2DJEhBBhfE252KN83T+bjld20Z7OTaCl6GBp2CMJYDw0MmxZ/gYydhe+I8SPDjkfwVZyWJeq
	Sgr9UAoVJ2MfbPxbpU9MGoF8dNVAvHkcc6JM+pr3PuvdK6x5lZCDwk5qW4E5wGpuQxpJ/jUt+wy
	ESu3uXQ5ZljZLskqYCXVwyBM9BV4Ah/Q3k3CeQNHP3AE8rpUEp5rElMgstsT7R5OJKQbHWM83Bz
	2IwwkzKpLboMU9/I0rLZwgUIVIQHQL1dDrBo+7udcvyJo0erF9PXF8a5mADDV+etCt1hjt61vgP
	VR6iXgDhUwg0Jx8DhXsomtlYa6xVxzJTC4EZVtXMc+uJOhXIzfieHX2W/qHXPWB40b8oARLGjkb
	eo1wXRAo+UN9m8Xf+Ak7iEtZaNa1M37BbJHBD8xmR7ZF8qrAXq+68Su2KRMZnBeUkGggG7Z6Yy6
	VlOSqtvDP58DD2H/RqkurbFFvW
X-Received: by 2002:a05:622a:418a:b0:536:72b4:b84a with SMTP id d75a77b69052e-55d5a5d835bmr88421461cf.42.1795078526913;
        Thu, 19 Nov 2026 00:55:26 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:26 -0800 (PST)
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
Subject: [PATCH v2 08/22] ARM: dts: BCM5301X: phicomm-k3: specify switch
Date: Thu, 19 Nov 2026 00:54:38 -0800
Message-ID: <20261119085452.75708-9-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005528_067523_D13B785A 
X-CRM114-Status: GOOD (  11.18  )
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

bcm-ns.dtsi specifies a default layout that is not correct for the
K3, which has three LAN ports and a WAN port on switch ports 0-3. Port 4
is unused, so disable it. Also allows setting the WAN MAC address
properly.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm47094-phicomm-k3.dts | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
index 5b9250976f13..018faf90fd4d 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
@@ -52,6 +52,43 @@ &gmac2 {
 	nvmem-cell-names = "mac-address";
 };
 
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
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@4 {
+			status = "disabled";
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
+
 &nandcs {
 	partitions {
 		compatible = "fixed-partitions";
-- 
2.56.1



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A15A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s248N3Dq;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZostzSPs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g7LvXprZ/vz+Q/G9AvsSv7/CGyIQlR7jfrthV6hVVOc=; b=s248N3DqAS6BvD
	Ti70SHy+x4OK7FVSe51aSjOtxdPZaZKvutqU4CScmOZwc3tYUOt9vBL9thnmWnabY9vGHZ0o+VpGW
	TRPYXEqWZI+PzkoOkry6GmVaYzTM93VpnVwAmyvOg9AsVrSMYBN0CEPzvWPOr8tFtFChahshqsyTC
	8CmqtX3mDOAijNuwoWaiXqNCfz8XB+6iHOfoa5zFKO42YSdUhtTx6fWWanNgoQrbk6LtXhVK/x0/8
	HxD9+SRTL7P8ryaG71tiXXlGi4aIG3wVt6wIG00YPple7EGwMMUugXqgHoCyLi6ZquX7aGtp9EesK
	s3ciW5TXv42VDeOJf0pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYXW-00000007m3B-3G8g;
	Wed, 18 Nov 2026 05:49:02 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYX1-00000007lgk-3qDz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:48:33 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-382ecd5cf2cso225689eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980911; x=1795585711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g7LvXprZ/vz+Q/G9AvsSv7/CGyIQlR7jfrthV6hVVOc=;
        b=ZostzSPsxoPFEr7ntt+C2PVFYy65TiW/RKGlrm0WEyRd8NZbnuZwRXfUFCsgvM7msa
         XCcU6+3ZC0kvosYQ+1sDzzzVIvS5CEUL5tNR6SJRUa9GfOS6SFM9EDEppxpHipOYn6x1
         JTRpLjjadpO0ZCrOOR+ZcpDKipAlEiZpv3PGN4bXDxxJJAja1wbqOMioxx5AaN54M4lF
         EG12Jc2RqXN0RXSE+a+kSbnppB3ZovIteaPpT9QRKCkWvVpjYz8YpDwQf32MhCVywe24
         SjZCnvJqml6EasCXvlg0pGLzkfRnoAkNKD6BVb7jEMUfj7GDJZtggeWBtY3bKzJkp00k
         x6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980911; x=1795585711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g7LvXprZ/vz+Q/G9AvsSv7/CGyIQlR7jfrthV6hVVOc=;
        b=wsHUHSTo72jNK1u224H9CB4WGNlrE6f+9eujU2hdYvpblnI0ZQCFjuYyThqyghUgOu
         FIXMA8rAsszz1eXxc01KrWHD1YZ6Mw0zEpMf/w7OHBeR79wGnw3lDtKFbaeRCW8abD4a
         CPXaPmEljGaSWt02eS8gEpPbzB1WZkocITcexE+G+FvyVqqx9SCGXpkvbFd6p9cs9X1K
         C1AeF2Rr1g/6QvGpJj8h5kSG6hcHUfvAcihX9yIbhrX7BO9V8QlNKlzB61VjHSykL8Co
         x0uhu93hvvw5uK0exHMBdCq0DzM3lzGFwRebWv/1aStQ40OGqIxcZr16N2PM9XnechKP
         wTHA==
X-Forwarded-Encrypted: i=1; AL+hErF1p/uP6Gg829dylw7klOl2G4rz0WKfXrgUXWH9OZNu4YcetfLAmda1NJi3W+MvZCacQiKtZeKX+eCc5l2dG8yS@lists.infradead.org
X-Gm-Message-State: APuU4Z8elUKbf57GPGB2LtfO8JUpuiNDGeCRbigKOO+xWs8wgIbBE9hD
	KoSkcpWffm3R3tN1ivHpw/qtz4BnW0O33ZpF9MvGosLWiVKkFbI0iFwu
X-Gm-Gg: AZFdTZdv6KIweBscmNJyOMoe6TLYWIaml0l6BQRbMG+kiQ/dq8VtgfKEdFh0Zyq87Jx
	+wnY3Xz3bxoqUikvO1v16GuHzpjmr++degedOHp7Pd0z903OGqLoqHpGk4khHp8TSXcUTuuD4W0
	+yJKBCV4xQujMhJvKGnt3dRLSPx0CJqazLzNrDYRNF8xViXCkK3ZiLRemUp4Lr1F4SfiaoJzCvb
	4qIHCGuP5vKsGpAeJP/P/xdnTYZcr7hs49UeV+GDrBmja+Z/GqeZA6qgfwGX6tKrb1xMsYXRfD2
	8KHwMBUTyPtARYOk3cb9ZmcoFMLAwPs8F2TFweXvVKfnflTFVwJmrwane5dhyl5JMOFBGarV+6a
	ZnvFDvLR8XMqROi0cvcFm00aIPEwGMPUKmQTICSQhKAZd+V9zEoS4yc1xpKyoxokvBLvOcpg87c
	7eKGZ2bOIpUKrIYbTPCgXl9uY985ZT9Fn3CtLHCgQ3CBCC28ESCUm12KeYX9X02U/aAqEdi4urD
	9KSDYJCS1dMusEkLz2bI4IjowBBhL+sdb9KKbHxPwIwddPYUFXlBBY/UMcIZxy3b4fZImLXfIgA
	N5I/XYi2Mc8jDrgKmFC1xlcDC5PVQ9ce4Fx2g3IXY1tDnTP+secks6gyolgqDgg8SYm4pNIHj7D
	F4K1GBRiVGsispmmE4xd5PhhDqw6wGn0bV6l5xQrhvBSnjF+UfH0c8RSzpv1i+5FfpF1ouxkDXP
	5HYQ==
X-Received: by 2002:a05:7301:da86:b0:36c:fdba:ee36 with SMTP id 5a478bee46e88-38281810090mr1512676eec.12.1794980911310;
        Tue, 17 Nov 2026 21:48:31 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:30 -0800 (PST)
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
Subject: [PATCH 10/17] ARM: dts: BCM5301X: SR400AC: use gmac2
Date: Tue, 17 Nov 2026 21:47:51 -0800
Message-ID: <20261118054758.132233-11-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_214831_991801_4F189C61 
X-CRM114-Status: GOOD (  11.72  )
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

Use switch port 8 as the CPU port instead of port 5. Port 8 is the
switch's IMP port and connects to gmac2, which is present on all
Northstar SoCs. Move the nvram MAC address from gmac0 to gmac2 to match.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
index 03f4a6d37a67..60661dde8ca5 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
@@ -128,7 +128,7 @@ &spi_nor {
 	status = "okay";
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -161,14 +161,10 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
-		};
-
-		port@7 {
 			status = "disabled";
 		};
 
-		port@8 {
+		port@7 {
 			status = "disabled";
 		};
 	};
-- 
2.56.1



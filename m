Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AFB606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AhgEOSB/;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=jPXawbVW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=soyV8ujwdcUS92i+ptIIRwGgm+3063ycjFG8wPF9I2s=; b=AhgEOSB/gMdYFW
	90KiHCgad+cSl/R9bpuI8EjyF+nEm6EfipIvDwpm20NqxtsjvdgJHQ9jDmyT0OusVu/jTI2+tVdNX
	f8SJ33BuB5NVBFB0SQKnb6fceSkg8tRMh7QonuhGW1zDEIvJwz43k9GFmuTvo5ilolbYo82L+cpg0
	bkXZxH3BKJBAgBbPRY879NvOQ17BnEQeUn+bJXzf/nBwiEPFi+h9qGWA5i9gIX1gMW/v0hU8PJ0HH
	Ggq1AsAkkoKBXoZyO7NO2+SYfohunz7i34gP7wmAc3D+0RNJCz9t18XjcOg87zphIE/JZ9kZnAUcE
	hXmU1NnIluSTjOGe7zBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMAm-0000000EegQ-1Nv2;
	Fri, 20 Nov 2026 10:48:54 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMAH-0000000EeRS-194C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:48:27 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so135549f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 02:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795171699; x=1795776499; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soyV8ujwdcUS92i+ptIIRwGgm+3063ycjFG8wPF9I2s=;
        b=jPXawbVWOgdT55uLHMNKmYaGRnP9nRhQYv+oju2dDXquAK59UBHIWeilO2sP/rFdjl
         8+FpUwaozzTgxmON4nfv/gFAmfdqRyk05Twyg9b/3hC9ecSRpsaVMt+4B25s8GWFN9eC
         UKcnJjCgRUnjwZGD37351dp/Yhf64I/dVSb5sroaSty28PsceuECFmY5SZILBr13AVrH
         UJ9EnVQiQbWZMGHPPSjqZfNYfmKNSKPmHfSe3gIyTe91MSbFC3BABG8Jwevl4EJ0Tjv3
         d80MKHi5+ygP7zL9vQR0MROS1hp7U0hcvk2qcdbErDyOHlQ1ogaaL7DBOFiec7wfcZg9
         +Gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171699; x=1795776499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=soyV8ujwdcUS92i+ptIIRwGgm+3063ycjFG8wPF9I2s=;
        b=gTb2DVDOpcTCXbhKaWHpBXBhxC+FyqpZzkzB+h2bmBkEq6E9EYPM29DCSvuDLrlT+1
         OZ89Ic0g+OCBPiqy+VJvr7pWy3Y1ecquVwaTRoa2UH1VGhGCFYfJC37ncQeRuUZL8J+e
         x5DfXwjOdM2XF9Zne6HWMGq3yOhqUXQDHGYUswKOBqq5rhCHFKMGNy6UvCdPWIgIbHL/
         jbvgyDRGAtZNS2Gx4b9H35/bGW25SQWiF41buai0djHNe2YbQvjnerS1k5zH3Ago3ZHq
         SbHhDhKUSFAF6OSd6jmTmanO1vVCvpSAB86/xzRsifcC3IQE8dLE7s8t0ZryTPvWZiJ1
         DLyQ==
X-Forwarded-Encrypted: i=1; AL+hErHjnbsD/RWuiUQtz8mL6JwMsi4iM+2YfsmU6WZ+cntE45+XwXoZ4zOjfEU+kCaFaXaoESjxFHwIEvo+iW8gZ5NO@lists.infradead.org
X-Gm-Message-State: APuU4Z+wbT8y+9BPqDWdJshVCA3KhAdqsmHP0XrfY2bMzRqugF46CFNt
	5b+RXbblsI4fdTO7t34fcC5MKKgcBk6ZiAlQ8CRYJ2/ZXQGf2EIJk5o4HooRjOHIbcbH4nVG0ol
	H6BzpDJhXpg==
X-Gm-Gg: AYBFou0+Cxuf3XCsGTSgfdGHHdslTycuKh90HNTCs/QWIhB81laqywnDyU7QLSgzVN6
	7nodx5/Szb0poh+lFzJj7x6tHHC0R6c9l+8iq8/Fk4pUqLyz+l2t9YxH66g/XAT6/e0DqM0Q8Pn
	LL4uo22VSiTVaUsPvwEmEGxWd/fQFB+DECONY9pgJWlUSjmXUduYk9ifm2CtrzWLljZE/eY8H+B
	7+vYA8Kwuinu7D8LO9c9hfMVZeUmy5dbVJbvqmP1WTENivp+Dklq+gIMprTSUAF4EyMunJhaxZN
	kGv6WkzVX707cYeU2+Nou15gMmT+qqbg/mDvvx4/1zJYigVZInlZ/F6Gt6O46wOzSECyEpZzcp7
	RpdjnAo5I6jSNCARteBKVuQpUHRD5y7/nFo2CMkOsy5IoAWe9m7RnmcICQvRtFou0pZlGHgNwnF
	2G+QFGumHk7b6Gk3wNEPdc+gwqAvqOFH3g69eZf8aMCEHLx+Zqp3Z0HY3Ufi/5a40cBrGEw85Rn
	ADsSm9jX4x4Lkj1moZtuzT3Tk/1vKwbb0n+Mtil9uv4Eqpg6xKUCV9fG/rM+1Hm+onqFwN+SHtm
	ODxbnlz8QUwU/ieGzwGgtSSNUnX2caFNRCwT1IXpqv0tlt9pELr+C56W1IMpVcgBoW5tU73nbpV
	BBFZGisRE
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb8881c741mr66087065e9.6.1795171699317;
        Fri, 20 Nov 2026 02:48:19 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f14f1esm38161425e9.2.2026.11.20.02.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:48:19 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 20 Nov 2026 14:48:09 +0400
Subject: [PATCH 1/7] arm64: dts: rockchip: Describe NanoPi M5 Ethernet PHYs
 by their ID
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rk3576-phys-v1-1-6382cd14e3dc@flipper.net>
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
In-Reply-To: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1793; i=alchark@flipper.net;
 h=from:subject:message-id; bh=8iZDArBxSAUmGNv6IPTGJGDjztGubBmXvBlIYDN4D+g=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQzqOaGLDxxZU/I9L2m66UKdBJ6fbnlWCZ8ufqQ53iy2
 5OgF/+UOyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZhqvuWMDH8Mb1WZb/I3251nW1YhNEub963Z6dUSbM9/akXO+b+pw57hvxPjw6w
 X3PNV3nFoci3Itdvq+6vOvOZp0ibVdRNk7gmt5AIA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_024823_515905_56DC022A 
X-CRM114-Status: GOOD (  12.37  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Both NanoPi M5 GMACs connect to an RTL8211F PHY with its reset line in
the PHY node. With only the generic C22 compatible, an OS has to read the
PHY ID registers before it can bind a driver, and only that driver
releases the reset line. Unless an earlier boot stage has already
released it, the PHY stays in reset, never answers on MDIO, and neither
Ethernet port comes up. Booting straight from U-Boot SPL in Falcon mode
hits exactly that.

Name the PHY by its ID, so it binds without the ID read and comes out of
reset as it does. Name the node ethernet-phy@1 as well, as the Realtek
PHY binding the ID compatible selects requires.

Fixes: 96cbdfdd3ac2 ("arm64: dts: rockchip: Add FriendlyElec NanoPi M5 support")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
index c84afecd6e2a..49bbef5730d2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
@@ -802,8 +802,8 @@ rt5616: audio-codec@1b {
 };
 
 &mdio0 {
-	rgmii_phy0: phy@1 {
-		compatible = "ethernet-phy-ieee802.3-c22";
+	rgmii_phy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
 		reg = <0x1>;
 		clocks = <&cru REFCLKO25M_GMAC0_OUT>;
 		interrupt-parent = <&gpio2>;
@@ -817,8 +817,8 @@ rgmii_phy0: phy@1 {
 };
 
 &mdio1 {
-	rgmii_phy1: phy@1 {
-		compatible = "ethernet-phy-ieee802.3-c22";
+	rgmii_phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
 		reg = <0x1>;
 		clocks = <&cru REFCLKO25M_GMAC1_OUT>;
 		interrupt-parent = <&gpio3>;

-- 
2.56.0



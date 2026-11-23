Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1072E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lx5aMnQi;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=4igURjQK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2Bm8YhjZ0v5Wgz4QHj1tEV+DcKGiAEMpJ+IjKH6ZCa4=; b=lx5aMnQisO/Dy8
	Znt7o3pUMa0mylrqQ5/agHcwimN0r1Ot1A3/O5mNryCFvQQG/rei5AEVMnwD22M1+qeySTo/LiGmI
	k3pboS7kTi8IIDAdgIqlGayPastzxKiDwqTE9kp5GMoCv4pzuldPuCDUKMF3ILE64Yyn227uBgk+0
	QBPjSvCt6yt9lcDCMsg9ijjSIBMX4VBh/H+fkafcxKihJ9XORRqvC4ZRCUedsL+60Oi8N3ljdeTau
	01UJCpH7FZ7CXGmXIsZPBl+FT7INZJLDJkzHDUnyUxmxqXVYSoneey9B2391qFwMheKqjSnOmrhDC
	JVt/iANt3CNhcmhcGHcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW5v-000000041g9-1vhZ;
	Mon, 23 Nov 2026 15:36:42 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW5G-0000000414i-45oP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:36:01 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so26740385e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795448157; x=1796052957; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Bm8YhjZ0v5Wgz4QHj1tEV+DcKGiAEMpJ+IjKH6ZCa4=;
        b=4igURjQKmj1odnCXblrCr4pbePwlDrIfTZW8C7klW+xL5AC49JGEf3vzYcoSVPFKC8
         wMtFZnJeO+LH76/dVDXgNUIYKN2eY5t0uUuFaug0KQtJ1MEGRuMh+kKzod0QBn5I3gbI
         oRZ5oyI/TkBHNA/QkA64qqkLHAcdpZGK6x6KpalR1osNeTeEp7hb3N2J0XI+fvfdRG9L
         sfyq8Q+BhhALJQK+IGHPtiPwWxcYa14h8Cio5w423V4tkZ2reft+wuZmx6ZoKlzGkGEm
         0kNH2/6oFC5ytwVlCMkUzbGCpzz/oBW7sGqLARp0iKxovgfu084R2x4FxhDYWIHocnE5
         G0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448157; x=1796052957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Bm8YhjZ0v5Wgz4QHj1tEV+DcKGiAEMpJ+IjKH6ZCa4=;
        b=J/EARNbNY90yWpsGdY448A++YiM3HJgkibnbrG8a+PFcxF43+M0YZATq36WgxMVOBV
         2NijZHX8Ggcuyaw2dSDAAQIvGXqS2jVGGDzvbySPjkKYzNlR+ZbUT3gx6+HRNB/9M+pE
         a7W8xQGh69OYA37DT+RNrZVJhww2VDUb/qlot75EBT1dHf4uLAmdTZpsBKfCeUw7GR5X
         61VOc1hdmcZHe7yuq+hWVh5/smPfh8JeUWLbeJ0yEBI+hu0oLnmUNmsuxDLmXj2GonZp
         fFenT6kR986J3/D+tWXlQNabzIvaSIKdStuBZEzeZX7rkH5txix1X21nnhqYjSbJWuHd
         gjYw==
X-Forwarded-Encrypted: i=1; AL+hErFmf9w3YMCdNgmX1eeE/yOMyB1K0kJRvxRPwTo/E0cho4qMKMTSSCVAV2UUXjYn9o3YaWXFmZDNNmdRdTdwyV0o@lists.infradead.org
X-Gm-Message-State: APuU4Z/ALIFY+Sdi9T+iHLj0MB3mSt6dAYybawQCtllKmisnPgFS8hQ+
	TGIrYmOlrLIjs1rQoV+xDz0yGMDmOOd/wVHLXFUI7eZSYpXET6yrteX66EGo1+/dDrE=
X-Gm-Gg: AZFdTZfXOve14lwzsE9ONS6IDsCKkgOp0fAZa3uWTSbX5cITBZtfyz9RKA958QgeXEh
	vwds/tIObA+nXE8ccS2gReFhk1HD9Bi+MA6i1IvaFFewr5kege2rRJ/Di6Sn2j1Jyh14FQ7wiC3
	NicCZFmHpSwy79S+0LFH6Cdu7mByalxnlvaq7eqTH/W70BzdKTAWq6f3ctiEwOLR3/62Pc1NLpv
	wbSvlkgRx1sTtsRzma6zNUVkpFqOYr2U35AjKm6mbOdEDVfD0mcO3dlOvqCmlcFe+mCPHo8ddhN
	wH8vysfVR/M835XMFF0Vc8NanxKybJMpd8V8z7x/Ty5UYTh0krT6eEjQU1fPFeN7IAlXNN90ZNT
	3s1HP8dDBwZcILmjFqBZDla0ndYU/hTfl3SAs8XzSEi/9lURgce8Q2PkjcutRKz4VcnTZ3Si/f3
	LSnjIgnB8jg9SaB0dFK0yY6fVVtFXsS6sylT5U2Y0B8smtCQeMaRnfc79CiXcMtkBPSST5BMauA
	CR+2iM34FDhenF3u0KUtPzY58fCNfim/VchnhCWmhsBSAQLYLvuUvzsyhiwNYEUeD4mSnBU8Wng
	RW5rcdWqWGS7oge+UFi9x9hE6Eia6XDxAVQ+q9iYykcGzl13MLn5chjGEU1HLz9/LtX1jktwOi5
	jgECtP2eqhg==
X-Received: by 2002:a05:600c:820d:b0:4bb:5de1:e923 with SMTP id 5b1f17b1804b1-4bb887c33f7mr242774325e9.4.1795448157034;
        Mon, 23 Nov 2026 07:35:57 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm305917455e9.9.2026.11.23.07.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:35:56 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 19:35:39 +0400
Subject: [PATCH v3 5/5] arm64: dts: rockchip: Derive GMAC MAC addresses
 from OTP on RK3576
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-rk3576-otp-cpuid-mac-v3-5-40c756dcf36f@flipper.net>
References: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
In-Reply-To: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032; i=alchark@flipper.net;
 h=from:subject:message-id; bh=B51uTVva+acdeOakuNpTV/eDMYtXnyGK/UsKvNUIWqE=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzxHq13EuasOKLxxHXhLcnC+Kr38/Iz1W+Eq/Fdidbd
 sMRptS7HRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEx1oADDf1dB2d9yu7fbyiT9XO70gFkwc/vXlRfMBOtfnVWdOWMOhxjD/9IKLdX
 z4vqJtRflKjxyGLqVW3NEFnEfzwhIPPrvVNJ7dgA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_073559_070454_51CCF36F 
X-CRM114-Status: GOOD (  12.58  )
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

RK3576 boards without dedicated storage for a MAC address only get a
stable one if the bootloader derives it from the CPU ID and patches it
into the device tree, which not every boot flow does.

Mark the CPU ID cell as such and reference it from both GMACs, so that
the addresses can be derived from the device tree alone, whatever the
bootloader. Boards which store a MAC address of their own can override
the reference with a cell of their choosing.

Note that the GMACs then depend on the OTP memory being accessible, as
the thermal sensors already do for their trim values.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 6f9fd73d24d6..1f9441394a8c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -2070,6 +2070,8 @@ gmac0: ethernet@2a220000 {
 			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
+			nvmem-cells = <&otp_id 0>;
+			nvmem-cell-names = "mac-address";
 			power-domains = <&power RK3576_PD_SDGMAC>;
 			resets = <&cru SRST_A_GMAC0>;
 			reset-names = "stmmaceth";
@@ -2118,6 +2120,8 @@ gmac1: ethernet@2a230000 {
 			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
+			nvmem-cells = <&otp_id 1>;
+			nvmem-cell-names = "mac-address";
 			power-domains = <&power RK3576_PD_SDGMAC>;
 			resets = <&cru SRST_A_GMAC1>;
 			reset-names = "stmmaceth";
@@ -2317,7 +2321,9 @@ otp_cpu_version: cpu-version@5 {
 					bits = <3 3>;
 				};
 				otp_id: id@a {
+					compatible = "rockchip,cpuid";
 					reg = <0x0a 0x10>;
+					#nvmem-cell-cells = <1>;
 				};
 				cpub_leakage: cpub-leakage@1e {
 					reg = <0x1e 0x1>;

-- 
2.56.0



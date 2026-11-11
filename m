Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D753D606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hUTWEGDe;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ifr+QHeI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fK4euQL/sXyPal5+J+hrdUFIpsb4ZufsR9tCvoLGNPE=; b=hUTWEGDe4jbp2n
	+cWEcpXE1fE1KLn1ek3DWdafvyM+1Y6U3olzHjuj7BiH2iMV3nE8zVvH/NtieFr1qfyCYkCJkJJue
	x7JfoUod2yJN/XoiOTSFe3qk4X9IGNUlcSIYNXvtHCfSeeBJD/sm42CUNDIL7YZV7CkR/14K8bc5X
	qJogy30JRMgLJvoKoU4t/0eJ0OVxJ3QIdIrPYFWlVBQQs0liV5GWHYOGk0JitxbOBkoBKFkKkQux4
	wFi5E2dZzEMM7WRXc2mnhZ8BIPl+1JOVWuZUYp9B+frcckYha9EGHN6uGF6P1+HP8DFkx6Sq6ua2y
	w6v54v8yPal6tBXmd0Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1Y2-00000005iMr-2zwt;
	Wed, 11 Nov 2026 06:11:06 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1Xu-00000005iEn-1Rt3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 06:10:59 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3b179528d56so486596a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794377457; x=1794982257; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fK4euQL/sXyPal5+J+hrdUFIpsb4ZufsR9tCvoLGNPE=;
        b=Ifr+QHeI4ZQVX6uQg9Voahwudi5ma+QxvjUl2bSnFz1ewSKbm/8sy3WJ1hZyBe1p05
         vJAbtyx78hP9txNztu/ojQEp7a9Y/LrzHZ/g0A7Q4aY+ic6lagFwtbHMq+4MJFKOEawr
         d7tr6aO7CrnTnUNRWAxvmvElRyXnaU7MFJX/zx3Cz/ZrBKxxbVdB+sffuRe2s32mGWzS
         emAmZlAbj01Gl5ypa5cEJReAou8ZiisazvSyHu42G0rTAwvtXSkTUfa52eaxIVMM3gHR
         5MuciMEQO2gYoztfrVlxUL52VhG0R4C+TkcAkck4qdbO5RooZqdck7swyBlpsAgdD8lU
         9FGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377457; x=1794982257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fK4euQL/sXyPal5+J+hrdUFIpsb4ZufsR9tCvoLGNPE=;
        b=KzPdXQR8aaCZ4M9dRGr4+z6tu8Uc2lEveQFjAOwsdhJxtu+sz2e8+GqWIDnjD+ndhy
         PEi4WFJtFtwS3/u33X45UEwF8ToClam9ccQCF+hrgt4Vht28yC/hy9ijUKA6k7r5das4
         3hWp0KCobnXNeh7NuET8hUQg+dRABcRlfl6qCqBRH6PSCEZqGTbD8VmFKl0MseYPkI0U
         uLgp+mVpAEcNEA5Lg3bL9I9Cbyp2ZgdEwwggeMc+zXHKm+AK83CPrs6BIkxkFs1V3xDC
         uidMuqEtfsqPEolZhGhE3X8Hj2k7imrK3I4vM99HY3ESgN8U5oLUfKbQ69WngWbqzbe4
         KWpA==
X-Forwarded-Encrypted: i=1; AL+hErE7OKYLRf1bAQoKXSfjlZn2yI0Rc6IroisczF7zIZQ2LZvBzj1CUro2FO+eaBogMz5uDwHUqUJeIXoe0lCaJ+9b@lists.infradead.org
X-Gm-Message-State: APuU4Z/V6GSd3S+PtvySUxzJ7kz3uWkrpwq1es/ZlWqnUoY63gzBKiY8
	gc/ziN8uifFPoetC3qeTWSLRdPeB8F1/flvX5UphqZvmOEzYQdYQBtNS
X-Gm-Gg: AYBFou3X8RaK7DQFFfPDCxu2kHOz82QIaGfB5L1TNALghFkdtlQaZGdZPBmNDaOCsDZ
	+e9/6bd2BcAfHuqbhY4J7Xd8JnsVyy1XQ+2Zfza8m44lzXxPjZKciXwNFRK5bBbvTHFWXIwkWKa
	uOfILri+hmY51pGzXYn8IYBG70bpoDD0on4PntF4pIZR0+2swXpk6AXIfttmiNZGUUyYcmDcjGB
	GeeTAbaN8ZHg+mflYhMIi6fkxQ5aaYqBEM9CjnYhA4rCRXcA4WcbJD58upX1F6LOMDHQKbYzdiD
	XuwK1VzhoMdbDjUc0DhzYE7cAzqRGpr+r3aM/2FltTRQ65X0PJKjwP1KvguUFtF42zWX+cUXn8v
	l7AOQm8sYhbBxHdRpgzdrpy1r/69B1wtd2uwraXKZeMP4LIuFDzdfm705W6WD6sKXI0op080ytM
	ITaqODW59WwiYPGL3GmNgET4TSXzSC5rWTTa49yMXO6U5Gz1oV89+pqenR51Tc08V9dKFTuJWOf
	HppahXUdJgnrwKOnBdHXGrPlPIRFvt2LuLftImFn4McAi/YMRshhplDtLgAsz+4+1G1lVNutPHo
	Kk/XtWmR8FN2TrsNk2hWUDZVAlH8LjgcDm5h4DKUMW8Xu+OLSNJ2vh+ysBTprbTgOOjc
X-Received: by 2002:a17:90b:2e46:b0:3ac:aa8d:19eb with SMTP id 98e67ed59e1d1-3b182e0f256mr1318971a91.3.1794377457428;
        Tue, 10 Nov 2026 22:10:57 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7e8b1sm2978557a91.12.2026.11.10.22.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:10:56 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 11 Nov 2026 14:14:46 +0800
Subject: [PATCH v2 5/5] ARM: dts: aspeed: ventura2: Name the 88E1512 PHY
 reset GPIO
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-ventura2-dts-update-v2-5-bce5b5dafc1f@gmail.com>
References: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
In-Reply-To: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=xxMp1/Ez1x0+u4gEwcM37HZ9S+6j5lTG4LB8OtJfTVM=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq9Af26OzcycIkzFNsHXF4FJMNd5XIH5LUASwIA
 6mD6yK5pEWJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCavQH9gAKCRClg0K3CVbE
 gTq3B/9YCHNGgux2LFrmmQhjhNtjCf3sYPpiQCl+wbB3hl5P18p1+BE5tmoWffF8zEbIEKFp1Hv
 Muo+kaAZc6Thx/QsJRcIw9MOsWo1b1WSIBjmYzbdc3uw5wB4s3hdzNqxyZVfKShvw6+238sUSyh
 QLYHpqe7rTQJprLHTtyA9qKJ7EYSckZwx/D7VkPys1Cn3AveHyIChLsITJ/cmhKUFI6bTMTt+J/
 O1SAOCk4wMJHgCLjMaTptjyC22H+MA61k8WCHvULsm3WWZAz1zWZIOh9hdBF/tegK/YTW29XOY3
 K8jE3xCp+6coF8UfdN3+njmgO2NoCDOoUYBXeOpg5lxz76Em
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_221058_412891_4507C4E0 
X-CRM114-Status: GOOD (  11.66  )
X-Spam-Score: -1.9 (-)
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Line 10 of the PCA9555 at address 0x67 on I2C bus 10 drives the reset
of the Marvell 88E1512 PHY. Name it FPGA_RST_88E1512_PLD after the
schematic net so userspace can reset the PHY during network bring-up.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index a5e6cc94b280..aa83233f1710 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -2486,7 +2486,7 @@ gpio@67 {
 			"FPGA_TRAY37_PWRGD_BUF_R", "FPGA_TRAY38_PWRGD_BUF_R",
 			"FPGA_TRAY39_PWRGD_BUF_R", "FPGA_TRAY40_PWRGD_BUF_R",
 			"FPGA_ISO_CARRIER_BOARD_PWR_OK", "FPGA_UART_MUX_SEL",
-			"", "",
+			"FPGA_RST_88E1512_PLD", "",
 			"", "",
 			"", "";
 	};

-- 
2.34.1



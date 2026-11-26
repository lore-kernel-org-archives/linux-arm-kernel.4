Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8F4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 21:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sFobs9Vq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=p0mi0cwT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DFmMnLbE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5TOaY7Fgq8X9NRdZ+s6yjIa1AaIRWGcVdRqEFaeVeKY=; b=sFobs9Vq75wPwm
	lZAAQQQltYX2rHNdURPyZ1c+CGETEnaxEvbWUj5njfkdro9BdYqVOXFAazWHONUV+v2Mdyxdxa96E
	AXx0b0vnSFCso38v5oNn5yAcDpjylU0/cY2OxXXmp8FvsA+7CFXJAWVRbRMnJXidB5dTFSANyMRpu
	WOmMr7Um//3i5DNigcGEr6dOiWOIz2b4xVM6SDXnlLiMgsZwOXXeMK57ss2H1TjVDdc95LblQlT/p
	snBCCqcmFac83xLtSiYE7/bTyQwg9I7H/vbUccu7xUp3xr+H2W7uhi8DwnpbBzN9pHVMixHM7kuGm
	1qsw8jZn+jVGyA6iL4wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhHG-0000000Ea6S-11MY;
	Thu, 26 Nov 2026 21:45:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhH6-0000000Ea2l-3UCc
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Nov 2026 21:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5TOaY7Fgq8X9NRdZ+s6yjIa1AaIRWGcVdRqEFaeVeKY=; b=p0mi0cwTYR9pJ0QOT6MKvITTE0
	SDCJFKMlg6A2gtWeunMH3owbJSL8MhBWd7wspFodT5FOuZVvFBnAvEHKS/+iQvSg2k4AbebS/gqr7
	jvWSazL3eLZEdh3Z31TVRLNCppBwNN9RMJVmxC/TLL8HFZsZZ3Y/Kc7C2HQrr9pau/xyphuO7p6Pd
	VUZmI6pVFMCaUdwJKawNOxtosMzSG/uRelkuDsv4FgalwaN1MeZcqJX+8PiKAOk+6TSBjpzveK0ZR
	hBO4Vw0gn205ss/K4x+vq0ig2888Cyr5rdySPOG1tfDANzgy6mXlyd/E8+cMRXHEaY+VKDvbnLp3S
	isJD8uaA==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhGq-0000000CvMe-1YvY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 21:44:59 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so5041306f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729487; x=1796334287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TOaY7Fgq8X9NRdZ+s6yjIa1AaIRWGcVdRqEFaeVeKY=;
        b=DFmMnLbEQ1AlMZ9M869vaCrltHI6AYFLuAuPffOZvLK2ays4LA46UOG9sn7dHipBpP
         HNF/amY0ShNUFVIDX0ldLl2kiOxVQptgAELsYgsI1RivFUuNtPlY/DPU142ZzV3XpFCt
         +0P5eBA5vnM17HanEbTgwDPshhIYoy3azCUT4cLDPc/FL2F10PpVm8Bu4I+i8WFtNgTH
         Ym5Zzxl+6FvB2/9AxDpufhFOQc/st42dRECgri0DJi4f8Nx6VsUE1BZ0z0gsfOmKqh0A
         gzU7Bqs4CIfY/8gFQrBLBE8CKsyr2knH3xH4oGoqVvqlPPAxLBzmn2PKksBLy3DVOVKA
         FviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729487; x=1796334287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5TOaY7Fgq8X9NRdZ+s6yjIa1AaIRWGcVdRqEFaeVeKY=;
        b=s1WXJGL2OmQv6uwamqrEuyIHDPPzbdJia9DVNa/r5QxruCz4O/9sUWkoI/u4aUXUZU
         JPn6sUl81og8l54AbShUgs2UjBLwg3hEavv10iIae+BNPp2EIlMkM30+KYmDeUF9tkly
         Z1vqRo98D6CLAk62OV95RkbqNZ2784X9xcbG9Kem2qItOkltsEyzMTncHl69cA+Ji/fi
         I9fBZye/GdyiGysf7wa11Pj0mcEfUZECtpBouuPCi1yawdQbyERqWblmFjranIatG6nP
         vCkCRgE38BmP+ONIX6D3wz6BUg4BI3JSnDjMG2WaF3d2R3bBJXtSDcFxbDCw6WBUMzgf
         kf/g==
X-Forwarded-Encrypted: i=1; AL+hErGLBD35nk/J9lJuv6ikcEPWYGU6VWyUpBzB5KUYvjypGgjyvU29VAFABtdLhzU/flXbHjuDhMU3toCUQBIB5UGU@lists.infradead.org
X-Gm-Message-State: APuU4Z8SpmAchRa1Hj+BR748+nvZyJcVLoCUJKG3r4JBUHNxCNpknJeG
	ONvXaXWC+TASY4Ghc8971NrW8aIx91axtv0VfgqAg5D7M0cjvuhS/p+M
X-Gm-Gg: AZFdTZeZYOkpAHefyHYaYHsMXfuzHiWvvzvWQpFMd7P+/y9hFF8l9kK1LmLUp1GIqVr
	LpucMm6F5uejtPLrmx9m7INhToTTJdLz18zLKndlIiGfZ79xljAlodjISFdFP2R6SdY3Ntu+p1w
	C0W5ESMvG/fGvMDLSAC4JkynLZ44OlhaA30tS73eb5NIXTJkuRA93A/cTuaoc6Ud+0zWz88ubob
	pZF/thBldUOJdU8vsCk6DPk3aerPkCzR5rBmGq9+kLrPGiCYtYpqQB+P4wrRSGSDZp2zWHwXVN7
	8DIE3+wKYy5C1H8lP/ndBql9LK/yG4O110XLQoIxtFoSUIF/6d3RDkqihVYKAHlNlC//JidN0NZ
	qMY1wGDaZ2KrnReu5XRsydjvwvELX/5/vD/ALUVESpAHDROI6Ze3tqHU0wMWkRgMxHHRBF/U+jL
	B7EuidTDZsrZo9f/U/PUpvOEoIuS6S36f0qdHKBJyUHPjCsEpKTken0kYqNcSbqnp/w9X98KmOQ
	ESf4b0Urqn3IjX/gWuloWrwFsU+/I3DYvSjJ4nJi60ZptzmEBcXGZhlmApvuZqSLurpNvqi2prU
	FwCrYNcya8TAKSiO//0NeqHgA0z/VJQoiergQLw1bQyhDdDiOpxvP8dKEkiNu+rJwoErF40Et73
	0rfvbJamUccmLI5WbMI6JD5zmvQ5zjq6+4kekbiK9uKR9Usv2wy1xtgdqoSw1A15VdG9M5gdZt3
	haOtVp4B7+2wHMPIBdEBKzeQnemwO/p2EC251XmsXmGS2FCZ8if5o2dIIcifsn5h7pLBi1lsfj2
	Xm+ucMNrOWhVF0MBVe3xzxgvEyOR35qY1FiQWCwiQ==
X-Received: by 2002:adf:e189:0:b0:4b7:6a63:89b2 with SMTP id ffacd0b85a97d-4b76a638a20mr20363316f8f.20.1795729486620;
        Thu, 26 Nov 2026 13:44:46 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:46 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] drm/sun4i: tcon-top: Route LCD TCONs to the LCD pins
Date: Thu, 26 Nov 2026 22:44:27 +0100
Message-ID: <20261126214433.3562326-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_214454_833072_80187064 
X-CRM114-Status: GOOD (  12.58  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TCON TOP selects whether the LCD pins are driven by TCON LCD or TCON TV.
The driver never programs that and relies on the reset value, which
selects TCON LCD. Since the reset is only deasserted, a different value
set by the bootloader would survive and LCD output wouldn't reach the
pins.

Select TCON LCD explicitly, like the vendor driver does. Nothing in the
driver uses TCON TV for the LCD pins.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index 5ea55a2844a7..c7d03c37fd6e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -226,6 +226,8 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 		goto err_assert_reset;
 	}
 
+	/* Route LCD TCONs, not TV TCONs, to the LCD pins */
+	writel(0, regs + TCON_TOP_TCON_TV_SETUP_REG);
 	writel(0, regs + TCON_TOP_PORT_SEL_REG);
 	writel(0, regs + TCON_TOP_GATE_SRC_REG);
 
-- 
2.43.0



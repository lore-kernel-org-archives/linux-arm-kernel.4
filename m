Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AAE60A263C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 08:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=isCwkpIP;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dYQ+q6Sz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3n/gmm5kxWB9YJHd7gfFf9nA3tSx3UHa8E6czMM6l7w=; b=isCwkpIP/GF0Ym
	fnWGwipEqvma1zJhSGbOMbD+/iZTul54NCRh4XPbGuHvmrcUc79NEdsrqSHRVxH6XciIv29i80iUW
	9uVI8Cke2KK2cauEZErG1A9C8/oTr+hPE0eY0usTAF67nuLZWOuhKq+yCiLmbYOyk/e1z7sG32Yn1
	wDYebYIHkWnoACDLjemn7UsWvWkzKSA00iwoY2bClYL2QN8975fI3vcO8BzDgp3QVZJAy1O0jnnLR
	Mj5qurol/YqlVwzoL6mb+eMAd02VG+ft8tfKrLCQrrws/uZpSK9ejKRI2AXFMw+4jEf1JwT8GIP0P
	XB/xuXdgNuGyt7maSVRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh3i-000000034Th-3Xjb;
	Tue, 10 Nov 2026 08:18:26 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh3e-000000034Q7-1rA9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 08:18:24 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-36ecc11bd26so203705eec.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 00:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298701; x=1794903501; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3n/gmm5kxWB9YJHd7gfFf9nA3tSx3UHa8E6czMM6l7w=;
        b=dYQ+q6SzYLDFnd3zrXj/Ukt9GtAcvN0vtZtAFK+BbRbzrW4YOLukLltocZ/afhgXIW
         mlm69ylJ7Cf8ESTuUOyUkb+/EVXMmXU9zDnhXWDvkedE60HbzC797hLFI8jyT2Y88CvJ
         Ip5bpO/X0uVXQcYGRXobhfO9a6+Q0/AfGfgTIRMndAgsbtsEzue5ibI8EPy+uDOCf95K
         2pR/3a3puVaPXzOtReJmBr+Qh/eSOyBr3IY7Gv/d6Ykvj4q4O782A+glH14acEZ10l62
         nHTJycVnARuB2Avp9BsyT6rgl5WLPgjhMv886Pi1vm5WoVKq6vOqjBL4jGWecJdzpK+v
         joXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298701; x=1794903501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3n/gmm5kxWB9YJHd7gfFf9nA3tSx3UHa8E6czMM6l7w=;
        b=wDPs02W9iX/hsLEMVBBQsS3F2RUbsHBXAgG6lnKo6cjBX78ZGSVkBNE4JJUa9QAr6v
         ABU+4Wx4f1tQu8jOb3a14eguyykKDosKQNg3+QTEBD+wgoS87X0bcI8kmUyEOB1O9GAC
         UB6jKDsXoVG/suZwzY93XoiO/ueU8KRas/ayukXqSdHj4m4UFjnMTg+6v1/dFrEjQsys
         e2qJl5SB1trt4FGdA79gVOqibrXE808x1j4hEgzjlu+KOxur3Q9yfW4XN+fsNOH7DqsO
         yhCOV+vYL/mKxGeMsvECr8tGmDF/sE89Wdh7PyAmGlvrQws3Huk6MLiPrfxfZ3UNhR4J
         4V8Q==
X-Forwarded-Encrypted: i=1; AL+hErH6ePtrpL2Yr5nuMxEkd4PlCG11sOHEJfAqKIHnM3mtXoRS1CAOUUraVcI9jkUJKepgLh7t7HwSLTiFGAlRWEWZ@lists.infradead.org
X-Gm-Message-State: APuU4Z9/omM+tpZD8myppKZFNohVxyA7CkdkUvwFvDb91BJ8D0z0TW/e
	BZ7GVtMDi0hVjkMGBifzeaTPWWITdl5N+PzChTE/8IOmWVXEa4OvKmbS
X-Gm-Gg: AYBFou3LZrWfotup7JbvK8t/kjXyk4wO9WKsWYzQTAEkuHwjqAM6N4k2HAC0sHc8KmR
	QgiGo/FFGzK7sfVNwMKtzk+czcf6tEst8ucwj+Rf359XIgcecpZutCsE7ayHjGXMEzeLOphATu9
	kCrbVbmODnEOn933XQWUP25yl2d08dyI8VXiaEvdQl+ADxI3SHwzyYRI+niIVMgjvFFFzSvKTs5
	frpSWGCL57XlYnDDS4Cn6Nt8kqsu5o0tgaU9PeVZ9s9yw3ZQFnBId2tqSktH1FW51AmRe6x5Q+G
	+vCxZaCARe7Pub2haWdE4KYcOsVbqYp4kex11wYBBOKeuNBcQ7KmV7KR2C4wmLi2+t6fgQCL/Nt
	XKOdPujFPpRmJGb+3L/xRmTUbt9qTCS1o1lcHUOoBTTwDU+147jxswcaJT2W8FPAOMGT3gRXhYZ
	BvlaErhIDyPiwM3TmzM8G4DL+WoMmEaq+7/xzE4tF3nsuvUN3YfhcVFT7Je2Nh9dOmkiSCYcpc6
	4Cqk+XqcV0KCg7HOk26LXg+3O+Sb1uZ+vJnuOXaLoeyYltZqxKJ+eoCT/3CcNdpR13haS5YjGsU
	w/7zoA3niHoe4Q/R9ASwiVhMIvUNuLrXSKrtlBM/TvF/oliqvROLu1s/LR0O
X-Received: by 2002:a05:701b:21d3:20b0:144:fd17:3b21 with SMTP id a92af1059eb24-1b3b5bc50c3mr3885712c88.0.1794298700740;
        Tue, 10 Nov 2026 00:18:20 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm5236759c88.12.2026.11.10.00.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:18:20 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Tue, 10 Nov 2026 16:18:04 +0800
Subject: [PATCH v6 1/9] dt-bindings: phy: Add PHY_DIRECTION_TX/RX
 definitions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-dcphy-rx-v1-v6-1-d681ba20b36a@gmail.com>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298691; l=1290;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=boFp+ROAJs+hn528tIchPlOUGZl+pUW4spq3YalZAuQ=;
 b=2Om6akpYt4IeVtY/W3aZ9CiVBUWzCN2RjS/mjsi+pChJrq9agUeJiKjz+mS39Et2p8MKNQOFe
 a8COwdPb0ThCDXpwhBehkJTJFZtzG3JqdNkYva+Xa8x2FSzw82cXcnb
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_001822_908547_843A3813 
X-CRM114-Status: GOOD (  12.39  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A MIPI D-PHY or C-PHY can be a transmitter or a receiver. Some PHY
blocks have one of each and can use them at the same time, so one PHY
node offers two PHYs. The existing cell, PHY_TYPE_DPHY or
PHY_TYPE_CPHY, selects the mode of the whole block, not one of the two
PHYs.

Add PHY_DIRECTION_TX and PHY_DIRECTION_RX for a cell that selects the
transmitter or the receiver. The first user is the Rockchip RK3588 MIPI
DC-PHY, where the transmitter serves a DSI host and the receiver a CSI-2
host.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Link: https://lore.kernel.org/r/7425ac83-f6d8-4443-a26e-a47f9306aa24@collabora.com
Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 include/dt-bindings/phy/phy.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 979b5dfd8353..9ead74d9a172 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -29,4 +29,7 @@
 #define PHY_POL_INVERT		1
 #define PHY_POL_AUTO		2
 
+#define PHY_DIRECTION_TX	0
+#define PHY_DIRECTION_RX	1
+
 #endif /* _DT_BINDINGS_PHY */

-- 
2.43.0



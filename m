Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9822F606A68B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 01:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IAe3KuO4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f9o/UoS0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1uJoG142fYCuU8vw67QDp3rEWq4mupCEBikzvmy4Exg=; b=IAe3KuO4kYDrdH
	OM2u9nK/As8oAR3CouuZ0yoKE7DVqKE+6kdE6dI1F1t+2I0BpJ6r3yRbW2ABwnOoSrmIknbnvMKTB
	EFBpFw3WV1+prXpbWK5s0/605psRpJpKECivLYNjipn1z2zhWJ7jWlSA+V9dyOKqxEG8lpi9+YQ96
	0O/REZA4e4EUcSzPaNRbXVVQe6EQe6f91cDQI7J4XWbvhDBKzenM+ctcC3YUXcQavdIgLdfV74F3h
	ilSBdFQr2poVi5/Yge8MhTD2UwX5xmfsL0JIo1loqtAZp+oPouau8ZbWjXmO6R2UglAz9DcffiIrd
	V87V3lMVZNzXrovKXMPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZh5-0000000GcD4-1bIs;
	Sat, 21 Nov 2026 01:15:07 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdV-0000000GZYF-4AKu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:32 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-55e0090c580so643267b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 17:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223485; x=1795828285; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uJoG142fYCuU8vw67QDp3rEWq4mupCEBikzvmy4Exg=;
        b=f9o/UoS0QEpQKDLFQPmtuitTrHhqN+/LCzbpPqO/QItJab5KOnhosohyfYboMsnUwE
         wHv7DSBcSLAVB88JGF2RbVwGPRT84TpxX98/1gShidYL8bvqmInLExl61pE0qTefEq1d
         ZadDn/UTSbaTDscw3iCWW5X41Z3o8dmFwUOHrfAyrSmoMVJAi2X9tg8kZUjYeSAOmTvQ
         C3AkYhWSXGxi81p7mz7+usMx/3539m8+tDmkXRDX9eObVjkdwXdDLY/+RxLrmVXZs00z
         f9OwaRqXgW6ozyV8qj+f+fPBavTsKkcGOTdRH45Rsjav2sOxj9RY31zXUPNtwK6DbrFh
         os0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223485; x=1795828285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uJoG142fYCuU8vw67QDp3rEWq4mupCEBikzvmy4Exg=;
        b=1hDcKVb6VGte3istZQn7BtDY4z/oT52dxuQhLkM+lHq5FTkV01sbYqyK+VND5uKS5b
         BqKSwwWe8Ofs6THLI3s43d1Z9rBa8XkUAyXkf7suimB8P/Uwlo8mjQnX3OY7qd77W+M6
         gwa/d+/qzcRA5Pi3z4oArr2cbWzC+FKy1lpVurg6wYZQbf/x+MBXLZrH2Cdy4r17p9a/
         8WxOYFnBh6COLYzaCgt8xaTN8wR41M21LWYbQrILvdjBEL3DKm98pPvEi03HQEXxVTJO
         Gpk0sfUGMy2TiCSTG/HN8w+107gMCvMcc3mg0cQUvJLO1cIxxMYnoaN8OwN728nF5/oS
         vkmg==
X-Forwarded-Encrypted: i=1; AL+hErEwcFODkkjP9qcwnT5/odT8/VMKFXV2L5Vqlaugr/i66nuJda+1I6VBYNYREaZfXxGmBkdMccL3ZH3oKN0NSVsH@lists.infradead.org
X-Gm-Message-State: APuU4Z9CXcXuQ4Sl/k0Z5vZo+S+YBzmO8cGKumRyRzPs6IpSObRf1Y6L
	cXzyZPJzbq6yrrQs4N93f7qfr78OehKVcY4i4YAbbOvIJWLzKZpXDFKt
X-Gm-Gg: AYBFou31K+MYpjMXBmbb9CdIvFGCf87S7XBZzWKqkVrvXJrtQvBiaq8Zv0h4beWKKpV
	PyLlqqt80XlCODtpp9RGUCczH8Yu6gbN9F+CSxRv/dootTcqX9EMGhxNM5i+lcvY2XTvEuZ/BMa
	FmdwXi8SZVfMx5WFGkJqsLIDJrOEuQgIdHQSjLP6gMPzn0aVBjmPiRz+7NqAX/YTPpvYjY0fNGz
	Sai/j9o7B7MyLKZvsIroUyVBeBpikI0mPYFmOMG7QrN5+717TqEsRp9j4aC1PspYSO/RhtSWsaB
	jxysRzUpXcKgy7HeT1Z1wkZlr3gx/c2ff/EC+yrD3gTuxwRYQaofpj3Bp2Mtg/mviiV5Cw85C55
	NZMI9sISt36gIm8+XHoYJvzvQnVIHasZYLjHl23H1ZQCdS6Zq5wFYJdTxOfr2SRvoB8JAwFrwCK
	H0KMd8LPJWjVy+uKfRCJ55lHfXPa6upG/TNKAIaQrGfD85uWzimP9R6vw+wucYHg0SW7S8jC3+F
	SVFN2QZbwQ/jVjThEht/s7JUUMqQ93sAsviv56xjmDRpflF3eguqKcMJXcMxrPdjiEh5VkEy0eJ
	32TRHCvWfSNQXiVLZJxEV+Hvy1m9pihYmPDZ9fshxOw+sARAddsP+wkHMxXw59UISzqCh7D646V
	NhAE3eCZ7IyJB9QVajxcVG97orOjXKBtcP9e5njupowUGx4x+Yu6+93fg7S/CmMJP7+GFdcEXQv
	Z3K6oKWgvAwMhBTIyjW3FcnS1+waOxK1EYBMaqEer5XjumxMPJbJSg
X-Received: by 2002:a05:6808:1915:b0:4f7:867a:1136 with SMTP id 5614622812f47-57a0c7bef2emr6229820b6e.64.1795223484984;
        Fri, 20 Nov 2026 17:11:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:44 -0700
Subject: [PATCH v11 21/26] mtd: rawnand: sunxi: skip unavailable NAND child
 nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-21-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_171126_485919_F25BEE52 
X-CRM114-Status: GOOD (  14.24  )
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

A disabled NAND child can prevent usable chips on the same controller
from appearing if there is no chip at its address. The driver scans
every child, even those marked disabled or reserved, and aborts probe
on a scan failure. If the chip does respond, it is registered despite
being marked unavailable.

Iterate over available children so unavailable nodes are skipped before
claiming their chip selects or issuing NAND commands. Keep the scoped
iterator so node references are released on both normal and error exits.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 4478189bf920..73d6cd89ca19 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2661,7 +2661,7 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	for_each_child_of_node_scoped(np, nand_np) {
+	for_each_available_child_of_node_scoped(np, nand_np) {
 		ret = sunxi_nand_chip_init(dev, nfc, nand_np);
 		if (ret) {
 			sunxi_nand_chips_cleanup(nfc);

-- 
2.53.0



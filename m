Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E5C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hzHpeXQ7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXkOgTHx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EJkLT5+FbYsBkV6aiXjOdMACJbaO9v6pAiv+btB2ar8=; b=hzHpeXQ7FX27jHuS//Z8sego15
	8eyPiYL3d8Lw4JMR71JY6Nta1duKwtdNEV2DGLig0fTMHxQEcuU5/F20rQD6cnHIWkNd8WqhgqOoO
	tFe+SJkwHypSDoGY+KSzn4nhd0RD9DPVGWCfTNlLUKODsskDs7V25jsIFivDdu2AbkU+lEdPzanFq
	6P4YHSaGPvngzA6sjp2uPmiMk9dDHdWtQXgjoi6XN+RDzfG+USaQrxOEvxB4oUZktuGA0sKhqNlEu
	b5XTEWlYjohUW60qyf1T4cwzOJa5ZOSmCgzQ+3BvbN8g8gXXNwNkpCPXA/Xd6oEdoOk7cGREtjtSA
	G9+vcgQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuNl-000000022Ti-22qm;
	Mon, 16 Nov 2026 10:56:17 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuNX-000000022Gn-2KgD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:56:06 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-8b4b9ba815bso12505027b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 02:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826562; x=1795431362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EJkLT5+FbYsBkV6aiXjOdMACJbaO9v6pAiv+btB2ar8=;
        b=uXkOgTHxNv58Z03rQpUddCcol98iiPdcUXno3oYkrrFmQi59leYKsHKZ16dlwY5Xh0
         VtmKLqKu6Y3D/e8jb3eOw7bKApW/BkkjWC6K1QiCzGQyh6o72n9DWGDh3aAwW7XFam+n
         LAN4KHkZKgVzXrL8TDdcJHB5TSHYxkuF8fhjSZ2TR74zKs+kaK207BvJP85NXVYyJ1NV
         Zup6GCjnJ42K14M4CuVqoZNxArb9+fvDoc1nRu6fQgfDMsqLN5UaVjxW8Yhc3xUZn5X6
         dNtmY5hb/u20WTv68Yt96+C4MWcJ7rgSgfsOWgeBtRIVsbIVdZfiSsl8sMVmWinB1fPm
         4asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826562; x=1795431362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJkLT5+FbYsBkV6aiXjOdMACJbaO9v6pAiv+btB2ar8=;
        b=YRI1D1FGVtlMIkkfIp6KcTQK2K+9HLhQa3/c84dcZJoFP9KtC5cKcQIReyhA1epk7u
         0vdt64ZKpWJkzyT6bLSi1MqC+tcN6DT/PtrqOQYauqWXFRB19z6dvWQqINNTc/Xuk/m5
         4dh0iGctciqHkwjN9S9/Hmga9AGs86LzFgdHkVu4TKM1Fw9r+Cdx5cOhkhOa7OBjPXfU
         Yy+cpof3Z6LNTEYijn8l661/nBPhsqXO6d0ga7CsHOw7SSWjKgwEb0eo3CZzYWC8wQWO
         oeQwLiOeJzl9ATUZyrom4RJWuzqyeArhZagzHxlEnXOynVCdXlxupvWtlfpGm4VubxFL
         E2dg==
X-Forwarded-Encrypted: i=1; AL+hErG2LbTGT7eRZ4v6jSnK2Ch8dszvBaA04J1nODF8lPMj6aSYvfSoIqn2Xs7gADZHeOsngR+hNeziF6CXpL1AyiWr@lists.infradead.org
X-Gm-Message-State: APuU4Z9u8299cHad0TXf6eE6dGe82gxJ3VIe+qy2jYt23/gHaRzgKCLn
	WQU/Jg44bEROf5ni0PFqhUxeUEDcuHkZRjFwEEnIVpEwew3QdOA9BYBe
X-Gm-Gg: AZFdTZcbglSV1fXpX7vdfhVzOIu6mR9U/fU+RpdvpYYKzcRKk2bjiTEPQfkPyKxi7NX
	8wuNT+AvLyJLeL3NsD/MUZf9rSt2v4cL1tjgfNFz6jqHSNkOBRwxPuEERq91fVS+16rrv4lQzYj
	eK76bayfi6jrY5DeeZTkZODccTPfLMHrRcya5wqNE8XHkFZ3ixp/5w7f+vZ7K/7Cglz54VIGEyg
	8T0zr7MJ93/P6W9QdbLecxKYH2xpFHS/ljgN9+KDedbYFPmUS7eqOmdk0jjyMIIXHMmoL9+RxK+
	9kVVfgumU9lo5awoZrwULE4kLbhIxLz66XX76g9Ugq1D/izcfn/CEAAzS8AncX+2c8ZceQXuGOc
	lKdzcARPU+YB2fEvrAh/ABW7UeH4eS5nvK32MzLZbKKAyHOmBOgmsKtO3s06KCRQn+8Cm4EcBpJ
	iWoadHg3LGBvgfLaHDZkOJ5/AbWkD68AeVh9J3SPiOC15fd2/em5mBranF4FaA1gQ3zun7wJJQW
	IaGfszqz/B69eULLpTFhcVOqMPczHXtAY2zb+a2e/GUAd25a1zKge217kpdsTVJI08zrQE1wnC5
	aAQYpqpHjEQzTaEqI2s4jxgF5YOjb9BtghlA1CVPlNsDO2LWwi+Ju+sJ+7Y7vX0e2AlGx8OztgW
	PYArW8El4+SDqMTd4Z3mNkDzIKCiI0pmNGhedUa2BZUi1a++gXXkGsHNTUA==
X-Received: by 2002:a05:690c:34c9:b0:8b4:c9b1:ba6b with SMTP id 00721157ae682-8b4c9b1c520mr26140997b3.23.1794826561834;
        Mon, 16 Nov 2026 02:56:01 -0800 (PST)
Received: from MaquinaLab.. ([2804:1b2:aa41:8a69:2b8b:32cb:351d:f30d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7f1a0dsm82274987b3.1.2026.11.16.02.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:56:01 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] phy: sun4i-usb: add the Allwinner A733 USB PHY
Date: Mon, 16 Nov 2026 07:55:42 -0300
Message-ID: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_025603_595348_7FCD25BE 
X-CRM114-Status: GOOD (  14.29  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This adds the A733 to the sun4i-usb PHY driver. It works with the D1
settings, except that the A733 gets SIDDQ cleared before the PHY reset
is released (patch 2). That made an intermittent USB1 enumeration
failure go away on my board.

I only have one Cubie A7Z, running a local DT, since there's no A733
dtsi upstream yet. Only USB1 is enabled in it, so PHY0 (the OTG port)
never went through the new order. The boots ran the same reorder on
top of 7.3-rc6, before I turned it into a per-SoC flag.

The numbers are in patch 2. The comparison inside the last run alone
(1/31 vs 0/60) isn't statistically significant, so it leans on the
earlier 3/40 too.

One question. The vendor BSP uses this order in common code, for every
SoC. I kept it per SoC because I can't test the others and the manual
says nothing about the order. Would you prefer it for all the SoCs that
clear PHY_CTL_SIDDQ (D1, H616, and A100/A523 through the D1 fallback),
or is a per-SoC flag fine?

Changes in v2:
- Reword the binding commit message into a single paragraph (Krzysztof)
- Rebase on phy/next and drop the dependency on Xu Rao's "phy:
  allwinner: sun4i-usb: disable the PHY2 PMU clock after SIDDQ setup".
  Patch 2 only overlaps with it in context.

v1: https://lore.kernel.org/all/20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com/

Vinicius

Vinicius Pedrosa (2):
  dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
  phy: sun4i-usb: clear SIDDQ before the PHY reset on A733

 .../phy/allwinner,sun50i-a64-usb-phy.yaml     |  1 +
 drivers/phy/allwinner/phy-sun4i-usb.c         | 35 ++++++++++++++++---
 2 files changed, 31 insertions(+), 5 deletions(-)


base-commit: 6bdfbe223ed4735073c299a6645ebd3faac3f51f
-- 
2.43.0



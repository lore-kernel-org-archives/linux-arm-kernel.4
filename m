Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D32D606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aobLZimB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=We1h7zUF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MOB3aNMg6zK5EGl8etrn5gy8OwqRUvQQTVeOILv9hbo=; b=aobLZimBYvop00
	AZklrOamJ/f0xRqWFGTAGeqmhI2W8jWk8QkQUigrqdnYMSfqfQMH7Obx1AIEjP/tKwozr4P5QGvd8
	5KEW+VqluE54YfiyXGEJGJpm4ZPoOZCV/NLlvPWM/CiFJUqFglo1YLe+uR3P67EBdlD5MAQlXfkoX
	Q3k2bJ7dJsWjZQH57lwYIJsTPAkIWgF4dc834UnML3BuGyitD1v6eNKhIHT0YOvgLy6Clls7iikrj
	n5iLWqlbEaaysJo3W+5uSV6bHA/Z9GTi0tr8twRoTrL4V2hYpPyRH0YaKRp70Vc7YOmi8EZQKD1Ow
	kKm5Sdtf7+Q7h3aWGjAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqgd-0000000FBdp-0j8a;
	Fri, 27 Nov 2026 07:48:03 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqgT-0000000FBU6-3rEu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:47:56 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-386b921f2a5so569597eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 23:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765673; x=1796370473; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MOB3aNMg6zK5EGl8etrn5gy8OwqRUvQQTVeOILv9hbo=;
        b=We1h7zUFlcWxaUuVaSSyQGMY+EtNrKfvr05JX5qRyhbYUYr6d1WUhGrG/LgDYNThMC
         Gt3Usb4mMvkl9QPfnR8DEA74KR/J6UXlRhnif5SfbmwSXzQpPqw98FdG9OB6+y8y+Fgo
         Sl2PPE0JccaxjVizV9wh+Rf1QX4DEOdUrd6YHegcxboo/zNapws/kdif0FLiDW92u5EL
         0nOChEKl7maYYC9SjJHH34505fAIjmYR8VOee93dM0se6kHwNiORGHza8/Nba8O7mIRW
         PqHsYYTylvN6g4FIyQIg/FU0hjJFkbWDEH3bq3nfVWji+c/TwJN/jxhxjmML1DUEW3/V
         WyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765673; x=1796370473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MOB3aNMg6zK5EGl8etrn5gy8OwqRUvQQTVeOILv9hbo=;
        b=gO5zHIGnp6YsIdQPZjtGt0TnM2ypM1I55t0uL9XmPFJQ7K5ivdyjIGXOusX7mvGl+Z
         p+UP7KS7uznuRiQvVgIqbJqCIjxi8oXCzT+GF+OKyjYMEmgqrvB8WvLND7uWOEkkx6GK
         UuIa1a+s4TLcJb7UK2CfpMmCise1wPCFRIeh3NyGL15XbU0mhD85CEG+7gB/OhXKlqCR
         LNn1I1F68UmPw6UlzuK8sayBeCVmsdqD5Z52kUmzaO5ZWlOko2i6y7DN7dhNfvAJdVrO
         6YEkZ+QdoRY9URhi/1DYxBQLTmdaUMeLK3lr9gWMRC7tcKldsGqPswr9ZGCLIf60FJYc
         kJXA==
X-Forwarded-Encrypted: i=1; AL+hErHQ//BmzofiFqCNNIq3Tb0hwSZTIBR73hzB5qIov3ioIrcafT8pGbuasHWZa1AXpQTWfaG4fD4zgsp+HlFN1r6O@lists.infradead.org
X-Gm-Message-State: APuU4Z+loXb2/GXi2Ixs4VhE75EtKW8ccUL3GIMkpsKsolQcgiSCQymt
	Y9rgd0EimI1AifChghOXzOg2wRoJnysF4wYmt3AsV6D3xSgoNrW/nU/I
X-Gm-Gg: AZFdTZfh+FzEptkshXJAvPkrsSpoa22b6p7YwUhABpMi8TAeptsKv8ouBUBgCeSAL+j
	ZepZE7dFmwVSN1jt1HeCjb7x9DSf3BynoHA1BAXbXNi7h+Czk3q6wiOA4yZTGa3S75QLUsg84Lo
	EkjUbNSeizQSrpNXFS+r66aPKDpCcf0yOGu8qfumAF2eAgj8UvBgg7dyBUGXQ+5uNtXe9TIj+CI
	c0jiVgYi1ArNE6fc0ozuEEdB1sGrIQUHCOowcGpKroeMyle1LjKpL9X06fmH/P2gQd+lc1P+lgY
	A4MTgUjxR1i/zdAFsIQNKZuecWzon7PwvDw4TpLHDpHJEzLZFHA/o7+nGDvmwd/o25g9ZSCNBwY
	KkcoaZPawOMLN7X9ygZm7HillFfaA9HoFs0219GXxy065xwWnijR3gqulZaSBbsVDHIfQ6zARwV
	pm70m74W87IS6Ya08BYS+2Pu5yVgR3Qacb+H7J0fluNS8P+qbSYx1Q0Cx6I7BjJfIsNE4M+d6ir
	PcECw2Pib3JV3ZwOtvFT/O0ZH96f9C+y/UTYN914vMvnUqrIzDQUIv+DF/WRxNvyDhnm/RXKsU8
	zuggXANoPrNjO4sKhSN+laVo2jlxgiJKyLIdD7Vxs7vVa6w/JU5ILDswvJVGdnfoIGAEZ5BoJt9
	4B2cCV+fjatqzfK21m6Ib
X-Received: by 2002:a05:7301:6187:10b0:386:a8e0:ac22 with SMTP id 5a478bee46e88-386a8e0b29dmr26742968eec.0.1795765672594;
        Thu, 26 Nov 2026 23:47:52 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm68098252eec.15.2026.11.26.23.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:47:52 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 15:47:37 +0800
Subject: [PATCH v8 1/9] dt-bindings: phy: Add PHY_DIRECTION_TX/RX
 definitions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-dcphy-rx-v1-v8-1-9ddfef99221d@gmail.com>
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
In-Reply-To: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
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
 Quentin Schulz <quentin.schulz@cherry.de>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jason Yang <jason98166@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795765664; l=1350;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=aNt6jFbb1EluDVRLQW8cmmY5lEvfVnKHFjZpwctNRG4=;
 b=/TCcZP1Jwtxcsr499CMyqjBIfHlVD6fhzK+HXpcYMhrJ+L+QrrJw9QVYTVXvoidwRkIabtG5d
 mEbIDCqjHhqBq+hZHZviYPfidoQJ5XIYOzDrekMItz0qTcSXOyruzbw
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_234754_036753_A7A01A99 
X-CRM114-Status: GOOD (  11.64  )
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
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
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



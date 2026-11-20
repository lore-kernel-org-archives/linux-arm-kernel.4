Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B43606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N8ZyA4Wp;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=asvW1+3c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jg4X90e3zV23j2h+WGmYwC1M03nD+Yo2HGjKpBKNeHk=; b=N8ZyA4WpaNzhMEmAlbJE6V3HwG
	UJZlkv6+pG9H8i94RhgDvGWDR5dO/J862yuVe/fMgHl6lEdadIjZkjUoDGVWLTjUP23UW/8gdHl5m
	MOm6lsiXw7GJE3BhS/1hmYipeh8VX9emBkN0fVBeCojrnvF+9pxMnr7ykEzagjSbblRtTOJuVqU/T
	PK92IS4Pss0wEQ9VNs+whnyu9sv0fTaRm6+Rey6TSJV7mb6IGDgueJ+KcKl1zdKWAaMAXGYKxsAa8
	KntaOtjQdsD84jeqiTT8mAzJKscplrxGdhv3THcBq71img0Yb2yW5nM7STzPpP1Q0jwUGR+d4HCSr
	oGb1sv8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMAS-0000000EeXC-0ZV2;
	Fri, 20 Nov 2026 10:48:32 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMAF-0000000EeQP-1q7C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:48:21 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48e3b22e971so367713f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 02:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795171697; x=1795776497; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jg4X90e3zV23j2h+WGmYwC1M03nD+Yo2HGjKpBKNeHk=;
        b=asvW1+3c+MvNj+gkGlbWujAloDIHmApIY0YMf0FHli6n5TjLZ5feTiDQw0x1LCskGl
         eu7KlQuVTybsuNhket7j6uyawXw3z6vORcPboZuwgL3jjB3/WVTFxR6LA3hXcoqbjFuP
         nUKqKlWbhu+55iKAQxNJcf4VSTn80zfs4Ydi9QhEmcM+wUaHLymy4qp6+bz4ywg9d55w
         VkPVjAI9KBJSOAsxe6UshnYozTTi13CoNkNGVPfeEanz/+I+QKdf/WiJ3BN2bgWrJjYz
         Q7wDjwq5Ia8n/FQPyv9fSIz1DaHu37rpl+58N2bRNtHoMP8NoMNG6bgrhWBa8uowg3T0
         Z96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171697; x=1795776497;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jg4X90e3zV23j2h+WGmYwC1M03nD+Yo2HGjKpBKNeHk=;
        b=lg4HOPbG4I2UrbK0Or7iyzv//AVuCd7i4ik/nF45hhUhfhGL5aCMKxWI2v1f4nZnrP
         1nEeM9G/k5wRYfRKykpBw/118xAUcC56rij967H7jRb7Fi0F8n05Ahasg/NYQmkHYIGN
         DKYzo56hpA32beAjHDXyaRrPrxWOtV/0wV/rKwyH8VS0LT6QX3z2XYrBGygpzDCYvkMo
         X5IS28XKFmkDivxvJbGDB/m5bb1AqiXVkKjn2RqPCK11vJlv0kFhb28dDQw4Fn4hgOHc
         AKyaJcY0hM4hgp7p+gFcmnth4Xq4yVtLUe4T3Fl8xsEdTb2vN/kLX22g2QNhF5qFhvzQ
         401g==
X-Forwarded-Encrypted: i=1; AL+hErGCcTMAaT5ZVR2IF3PUNIIUIdkOkK5GbXvMX1x+hn9nJLi9iF7aj9A6IFL18q8sznh9P81M4e2fJEFIhQv7k4o9@lists.infradead.org
X-Gm-Message-State: APuU4Z/tdusoJ7UDgMHF8mBOvF2blKlDX7TRyUoaipQtBg6iKB4Jbjw4
	DowH2SorCRe2KWJpmXCmbehAalffaAKsOSxcZhD2y/9/cXYLe5osjUpSbsfeC7TfGRo=
X-Gm-Gg: AYBFou2wvtY6k/Zby0LnTO2pA6BROtHL93gyOuttmhskrILmap6Dqt6dhBgTlwiCSQK
	Jd+0pBoxduJ8rmGlx3pvDg3AObywz5hQmkZN5kdwugbL99rAdgIN+jVbH3RJacZRcyd/SzutlQd
	SLOfM6q9RhB7DV2jNpmUvZfoUy4HPFrw8qUMhRocXxvh2wWRUVTIlooPqzaEChihl/r75lR3v6R
	ivHKBFco6AH1lUw+ypFjXk1Poddm2YOyxq72uuK6nBGiQ1ZUe8CfsEciDYqWR4+hAjW+oD64oRE
	uQa4URD5t4aDiOcx4gXrlNO4TpLqziEHwJA3eWTHf4vaM0WvzGxGHFmY99XofJjWYxDBIvkGqhP
	VoDpcKaddd19aN8MLPC9PopecZurz4BxjHs5Gazp2fd+vlbwQ1F4E02mtA7DXeH317YgWrEok4/
	mNGRxWwBFJzPHr7dALl+TfjxrzQ/BwLUORDdL/TIbxMbV6sHHhi6B1zlt7+qDJEploMSzMxQu7M
	gfHg8jZIr//3URceQKlhc4zdkp8rhDd5jVA5Ue1QNn6+NTFRCjuI52jq8/C5CH/02Nx8drhbPch
	HNPeORRNg/MnqdfNsyWPJMJm3SRYRWSgG21pYEMse8UrE5O060KugbymFHHQ2obkQxMA6HvnT9k
	1rtKF1MWk
X-Received: by 2002:a05:600c:4e0b:b0:4bb:68f1:5bc0 with SMTP id 5b1f17b1804b1-4bb88920967mr58829305e9.33.1795171696983;
        Fri, 20 Nov 2026 02:48:16 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f14f1esm38161425e9.2.2026.11.20.02.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:48:15 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/7] arm64: dts: rockchip: Updates to RGMII PHYs on Sige5
 and NanoPi M5
Date: Fri, 20 Nov 2026 14:48:08 +0400
Message-Id: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMD3aJsY1NzM92CjMpiXSNzczMLg0QLc/MUcyWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgAJfcibbwAAAA==
X-Change-ID: 20261120-rk3576-phys-277680a877d7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2101; i=alchark@flipper.net;
 h=from:subject:message-id; bh=5sdbEL5GXTFR6FwhqPpfL+d2C9hL8olV/xv+pbxWIgo=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQzqOa83X/p5+Hdf6QYbtcl7MnLMPMpkrVNqZGMX/vZO
 XL3wjM5HRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1qdkM/31T1u/Ku+Mo29m+48QCYVGeRT/fVDT0XBN4vC77QxRv4UWG/wXinNK
 rVhwMf1V8uTqMR06Sq+fuhprm52yME779v277igUA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_024819_537932_BB1D80ED 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

Both ArmSoM Sige5 and NanoPi M5 boards use the same Realtek RGMII PHYs
which currently share an issue preventing them from enumeration unless an
earlier boot stage left them out of reset: at power-on, their reset lines
are asserted, so they cannot answer an MDIO probe. Until they answer, the
OS cannot look up the ID to match a driver. And until the OS has a driver,
nothing releases their reset line.

Fix this by using their known PHY IDs instead of the generic compatible,
so that the deadlock is broken. This also opens up the possibility to
enable the Realtek-specific ALDPS feature (automatic link-down power
saving), which saves around 400 mW for each PHY with no cable attached.

While here, also do a couple of minor cleanups: NanoPi M5 uses a dedicated
crystal to derive the 25MHz reference clock, so it doesn't use the SoC
provided clock, and the current DT property is superfluous and misleading.
RTL8211F datasheet also specifies much shorter reset assertion and
deassertion times than currently used in the DT, so adjust those, too, to
avoid wasting unnecessary time during the reset sequence.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (7):
      arm64: dts: rockchip: Describe NanoPi M5 Ethernet PHYs by their ID
      arm64: dts: rockchip: Describe Sige5 Ethernet PHYs by their ID
      arm64: dts: rockchip: Drop NanoPi M5 PHY reference clocks
      arm64: dts: rockchip: Enable ALDPS on NanoPi M5 Ethernet PHYs
      arm64: dts: rockchip: Enable ALDPS on Sige5 Ethernet PHYs
      arm64: dts: rockchip: Shorten NanoPi M5 Ethernet PHY reset to datasheet timing
      arm64: dts: rockchip: Shorten Sige5 Ethernet PHY reset to datasheet timing

 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts | 18 ++++++++++--------
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts    | 20 ++++++++++----------
 2 files changed, 20 insertions(+), 18 deletions(-)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261120-rk3576-phys-277680a877d7

Best regards,
--  
Alexey Charkov <alchark@flipper.net>



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFEF606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WfXf1xoT;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=S8PF/b2X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OeOsxZrRVRDIqTdGDpdJI5DQe9V4RgKB2bsKt5qqiyw=; b=WfXf1xoTQB4Q7U
	CwXao0J67dUI9uwQxhsZBosaNtZJYsLDKwqJtfFVrHD8odOvL9fh4uUvr5VXr1oZWKf/WjBNicVUp
	r55dyWQY+2lO6z4N+WAVwNgUBcBXudKDAZxglZklfufATaYoHBBPNbLlUO5yVJLcryeNpgZKV8ybo
	H7T/WKkgoOdz1eUxsCHgvQs6oEIgvfVtwKN9zHEdQOffbXeBgPlL+BIIUVL1eAD2VfbcY3Qs+O/+H
	8tF0OlpiI6PoOnICTAolQed+11AyEyQPHj9OVQ4WQt3UJz4ncH9syKX9l1fL5BwnYSqGgpsbxN8Ge
	hDuUqSgPpif2WDbVkRkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyWL-0000000EXKr-49At;
	Fri, 13 Nov 2026 21:09:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyVO-0000000EWnY-0Kr0;
	Fri, 13 Nov 2026 21:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=OeOsxZrRVRDIqTdGDpdJI5DQe9V4RgKB2bsKt5qqiyw=; b=S8PF/b2XIzZBdeBxgIu2e8xOT7
	RUj4jb5ZfUUbi5n3xl8mxvE1yJjjMr0KitMyUPIwiZ0Wuutp608PtIQAhn90ASOsLZJUM7BdzgnR5
	9FxTEfB2aQSACtV5rT5AddyyzRUJVLwLYLk09bUbZX5JHdXYHeckEaDZwic7+V3Bc1F6PGCNm/U+y
	CVDuUDOP7U8fEgxkjaQqUerDSspjNo7AUow4q4Nqtp+XoIeepWbGPy9HydHv297f2q6297q0rBnlv
	rujPtcmVu2NbEn9TpuQkShhn5DVOsAXnICWANlP3lQUU625qk4HnNjSyNYrX1yINoEbeJyp4slk2t
	3rswiM1Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: Deomid rojer Ryabkov <rojer@rojer.me>
Cc: Heiko Stuebner <heiko@sntech.de>,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	luca.ceresoli@bootlin.com,
	robh@kernel.org,
	jin@mediatomb.cc,
	shawn.lin@rock-chips.com,
	jensenhuang@friendlyarm.com
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: NanoPi R2S Plus: fix io-domains, enable SDIO Wi-Fi
Date: Fri, 13 Nov 2026 22:08:07 +0100
Message-ID: <179460406454.1165597.838727442879059278.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031104714.3271017-1-rojer@rojer.me>
References: <20261031104714.3271017-1-rojer@rojer.me>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_130818_654424_170ECEE6 
X-CRM114-Status: UNSURE (   9.40  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sat, 31 Oct 2026 13:47:12 +0300, Deomid rojer Ryabkov wrote:
> Patch 1 fixes the VCCIO4/VCCIO6 supplies of the NanoPi R2S Plus, which
> were inherited from the NanoPi R2S but are wired differently (see the
> schematics referenced in the patch).
> 
> Patch 2 enables the M.2 E-key SDIO slot, which FriendlyElec populates
> with an optional RTL8822CS (Fn-Link 6222B-SRC) Wi-Fi module.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Fix VCCIO4/VCCIO6 supplies on NanoPi R2S Plus
      commit: f889f5d1f9a809fda80d9c6a9e540d8e0e12761f
[2/2] arm64: dts: rockchip: Enable SDIO Wi-Fi on NanoPi R2S Plus
      commit: bcb95c3641b06f20e0c2ed4c849139ad72084d29

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCEA606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 00:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qIzlgB4m;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=a4xwZt9G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8Aw1hKcMo2UwPIo6N+A44TKGRiDCU4zKWVbhcVjBxj8=; b=qIzlgB4mFTqt/h
	ASxufGDyzEopbmOqDCpxjMLTDBiM0bKAPMGyplUutFNLbqvvC357kIHvHKOM7ZZiUjraNdOm4GaVp
	rjEN7Wi2c2B9DHXs1CeQHil3knGxNz4KLej85GoC3qswh9VsBP+yQgoa6UufV5w/qeEPd1CyMADAE
	/DoHWBTpaYkGUz3M5qH7g23fcFWPBXlcvH09RLLV9GKOckxYssUbjDl4tAkx/BQ2TNRDrE1k5hhOh
	+JMJsXWRBmABLIoS1i344q2AhVDF+ocQAVzdLbYp6IngGxg53vv0xg8srsTjYXW9/S7Sey42Jkuky
	0koOdpEZIS93aaJQPGag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPqtb-0000000FY56-3doY;
	Sun, 08 Nov 2026 00:36:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPqtZ-0000000FY4e-0W67;
	Sun, 08 Nov 2026 00:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=8Aw1hKcMo2UwPIo6N+A44TKGRiDCU4zKWVbhcVjBxj8=; b=a4xwZt9G3lGEKgscRRUMeAzU+y
	B9z3VAlYitCLsr5CFHarADdE4jGjOekTu5k/EJ/txsvyOGhytNOKeb2Kd4MlyiXSb5GeeCfBvVomJ
	C0yvJFOo1jaUUow/hYbt8htgqNklZkY6Ox8GEq30N9FwoWRVN1ny0/Wtpu3CDlvdvf8iWWQdHEF36
	cT/Attoc9dgVr0eQPTbMYcTpoG9tI8LFIPOKIeOTnXm4I8urG94bYQ67Hb8IwqdxQwmgPgi3Nq8BQ
	4CDGeOd+jyInB8RwpoO+hzlO2mSx5XlDpi646L7gpKk4jK6SnZyVkJQuTREJHAaFIS5Qoqp/6yNHj
	UvZt6Gdg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <Shawn.lin@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: rockchip: Add NanoPi M6V2 board
Date: Sun,  8 Nov 2026 01:36:16 +0100
Message-ID: <179409813362.1454120.2066114184347271123.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104-nanopi-m6v2-v2-0-dfcd8714f48a@gmail.com>
References: <20261104-nanopi-m6v2-v2-0-dfcd8714f48a@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_163629_209655_559C8857 
X-CRM114-Status: GOOD (  12.46  )
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


On Wed, 04 Nov 2026 21:59:20 +0100, Joachim Eastwood wrote:
> This short patch series add support for the NanoPi M6V2. The board is
> very similar to the original M6 with only a few differences.
> 
> Differences:
> * New audio CODEC (Everest ES8389)
> * New Ethernet PHY (MotorComm YT8531C)
> * 1 extra user button
> * Misc connector changes on the board
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: rockchip: add FriendlyElec NanoPi M6V2
      commit: cfa6ea6d25f73595165482b2326805ecfb375533
[2/3] arm64: dts: rockchip: rename rtl8211f node on rk3588s-nanopi
      commit: b42a3f77ad0b9d672fa6228517442c9675d3caca
[3/3] arm64: dts: rockchip: add support for NanoPi M6V2 board
      commit: 37145821846cb01e1da93753d928e77c42b6bb59

I've reordered some properties in the m6v2 board dts


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


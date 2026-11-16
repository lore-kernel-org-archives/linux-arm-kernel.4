Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1FF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zTZ7p96o;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NcroMnaA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/JOhbAozvllkjpm0FYBXew7/avwMplBesdQ3ypNOrUI=; b=zTZ7p96ozpkaTp
	2B7tw4/OSzL3OuTihaCyhiYePX5wtm8PgzNpgNoZQmJKD9DZEwjlbznjSYb6u/btKVpd4ayEl4E5U
	lHcmPg30nZCZTDiwHdtis/bQZWNNrGAFCNlm/oTc7kppK3CZ3c0tU1uXKF0lWu8X3TjAtQg0L5PB9
	HjuAWo4wt5k3SJMJK0AZIVdH6BEt3LWAWD/LeZxyqzBr1mTwWnIAfFi54SJXKeUrLHlTFn54xpHC5
	/rl19T2jEtKWDG/X6z2xN1xHwEAyI6Y/8wVwsvUj1qO9ql7mFYAm9URUQUQs3RuSwlYmif0be2ZiM
	LK1NOQwOEswEEmEYQzlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzbX-00000003EDH-47Vy;
	Mon, 16 Nov 2026 16:30:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzbW-00000003ECq-2fdc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:30:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D1CB162F3A;
	Mon, 16 Nov 2026 16:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A651F000D0;
	Mon, 16 Nov 2026 16:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794846649;
	bh=/JOhbAozvllkjpm0FYBXew7/avwMplBesdQ3ypNOrUI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NcroMnaAEo2YPK1YnyQQixVQx3SPHW3JilNQOL8Y8NbXEjtgO2kGjHVOFGXLWWdNb
	 PbOw3o3fqFnhVm/LRbpxsiY1n/YoPkf/DIja1dXUkavc3lZ0TX82TMOK5ZZueCgSiv
	 plyud2oiGXGWXSk1CRJXKnEHa/HeagLDEmfXA7h0qgIrlbgp0IoJLS9I+V7BQnT3gE
	 MITtAt4If+7rSWbw5vU4y87fXSa9GFfpAMD3N2yhu1VO1pv8MzEl/ASiKBAEIv4UiH
	 tEoOtp6bXC4UTGeme6n60ok7Xty5ePUyP4lOxlIg3klxJyGMZARaN7mT0+esLfDCUN
	 FLM6xhW3WaQcA==
From: Chen-Yu Tsai <wens@kernel.org>
To: Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261115171148.37784-1-jernej.skrabec@gmail.com>
References: <20261115171148.37784-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: allwinner: h6: Enable Ethernet on
 Tanix TX6
Message-Id: <179484664773.3654899.16017246005378220795.b4-ty@kernel.org>
Date: Tue, 17 Nov 2026 00:30:47 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 15 Nov 2026 18:11:46 +0100, Jernej Skrabec wrote:
> The AC200 MFD and Ethernet PHY drivers and their bindings were merged
> in v7.4-rc1. This series adds the device tree parts needed to use them
> on H6, starting with the Tanix TX6 and TX6 mini TV boxes, whose only
> Ethernet port goes through the PHY in the AC200 co-packaged with the
> H6.
> 
> Patch 1 describes the AC200 in the H6 dtsi: the I2C3 controller with
> the AC200 on it, a pwm-clock that provides its 24 MHz reference clock
> from PWM1, the RMII pins and the EPHY calibration value in the SID.
> Everything stays disabled.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/2] arm64: dts: allwinner: sun50i-h6: Add AC200 companion chip
      https://git.kernel.org/sunxi/linux/c/16272a829005
[2/2] arm64: dts: allwinner: tanix: Enable Ethernet
      https://git.kernel.org/sunxi/linux/c/836398c4e1f2

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>



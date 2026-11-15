Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D80606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 15:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Joc2Hgg6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FXLNTbW+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cL09+MG0ZraL2bAaQRxHl7M+d42ISuPbh90WavM9X8A=; b=Joc2Hgg6rA6ABe
	+o8rDlY+R91lpAdjSqOn9CphWiOlp6yqwLjp9a0DifCrfziELhpEuoCQdjGn0cszAuYpH67COpxgs
	pFeNtResJPjKDRA9U67bkgl14uAmC/sfnFRvpOEKJ+8I+hGPC5E/GFj4ZjL8RFybBY3RtCzoP0Xis
	W1Vc9O6oHEYDv4Xaqbo930KwJ9pN9MPDeLF8W5ydRhPzdj98DONjUzOJbnsy0AtwknMBDRi5ctcxd
	thWWLgsUMJZiUq8OH0yyGShroeG0o0sYvYeF1ARGTS59GqG1gJSQ1fYEVVoQYwbwMECUJcwC1eaCA
	yobRprbb4G2HUWp+tgtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbpG-000000006go-3Z7Y;
	Sun, 15 Nov 2026 15:07:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbpF-000000006gZ-3jds
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 15:07:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EEBA462412;
	Sun, 15 Nov 2026 15:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 299131F000C5;
	Sun, 15 Nov 2026 15:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794755244;
	bh=cL09+MG0ZraL2bAaQRxHl7M+d42ISuPbh90WavM9X8A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FXLNTbW+iVvDwNWFgM46HGA4NeJHET4qpPgmsZdNpf3ul3N/NchPopYgjVN5FKY3W
	 RGgnm1XxSGZPLPWfgRRDlPOy7BgdrDlcuY+xpCqdtTwI8jtmi7ZR/34doybpY1/kep
	 o3MY/VNoqtMryzzFCfTJwWzE9w5y1RoLKaM7ftymTcCqK4a0ixncPLzkOdO56a+8Vd
	 cw/uffczcLbgIxHEB+adDO0Lj8nCAaeZC8HgAZTVAS6y69q9+d4AetDXasUOVmYubI
	 OmUBPMIo/CWZHwC+qFd4zS2Mgz/xp6MbqGA97jde2Xk69LpQuMD9uavdkiZzwG4s9Z
	 t6azmQ2Mpel6w==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261115132215.289236-1-jernej.skrabec@gmail.com>
References: <20261115132215.289236-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: allwinner: h6: Enable GPU and CPU
 DVFS on more boards
Message-Id: <179475524292.3273316.2909957727689381668.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 23:07:22 +0800
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

On Sun, 15 Nov 2026 14:22:11 +0100, Jernej Skrabec wrote:
> Most H6 boards don't use the GPU OPP table, and the Orange Pi One Plus
> and Lite2 lack CPU DVFS as well, so their GPU and CPU run at a fixed
> clock rate. This series enables both.
> 
> Changes in v2:
> - new patch 1: add regulator-ramp-delay to vdd-cpu and vdd-gpu on the
>   Orange Pi One Plus and Lite2, like on the other AXP805-based H6 boards
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/3] arm64: dts: allwinner: h6: orangepi: Add regulator ramp delays
      https://git.kernel.org/sunxi/linux/c/6442683b687c
[2/3] arm64: dts: allwinner: h6: Add GPU OPP table to all boards
      https://git.kernel.org/sunxi/linux/c/348a4f82f13b
[3/3] arm64: dts: allwinner: h6: orangepi: Enable CPU frequency scaling
      https://git.kernel.org/sunxi/linux/c/6527dd6be62e

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>



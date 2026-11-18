Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900E3606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KqyCYTjK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6Svp0TQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JhR61aYjNj6PZ8Va97FkLX9v3sWRWtbAP/NE9nbfsiA=; b=KqyCYTjK32Uwb/
	OebawMwwbNEh+5B40er3iNMemZeA66PsJfQXzMok5RFBmyPoJgoF0qJMtwv4M4V8tJRMQp2H+zl7q
	FnwFLpUbB2nkLZNrm3ISF5jdkEIxoLzfKuMe/8GuMNFfdsCMJodlxC92uT2dBUlQ8wZ1gdt0zIcUl
	tvd4UqiMRu7gGCHa+Xod7uZyqGXkYSvDwRKkIGH2DjF7vMhhIkG+6SSw/RpQOhoPDsF72CA01kiLT
	nMa9pzvn2tZ4nLlYeCVhCKigNsZbVjgvCM08XBh0Cs9NvE6ghIxxMwF3C3ACsWUdVMF8TU8fKm0k+
	LfJlC5Y+jlsis3l08SeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThsq-00000009MMH-0JmN;
	Wed, 18 Nov 2026 15:47:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThso-00000009MM9-3dsv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:47:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 43DC44483C;
	Wed, 18 Nov 2026 15:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835021F000C5;
	Wed, 18 Nov 2026 15:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795016858;
	bh=JhR61aYjNj6PZ8Va97FkLX9v3sWRWtbAP/NE9nbfsiA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=P6Svp0TQv9MlwXEuOAg9asd7uA00k9aOCDZJq7Mxg5UUO7Pfd/7HOiPH7vzIhlHwM
	 mHJLG4wHXrpB3lGY6VJVbBcyy7vwLPTePFDj7L9VufCEbcdHfn3FiaAa7Y8Rb+xFHh
	 4mdmsTz7b9sF59I+HI1UY2lAT4Y9b/0+0ZCITMoc2Nbwmx4JX2AqSHfndG3Oydss0O
	 6u8j+lDU4YGBFDPFtqCW379PkUJo/I7RpDTZ6Va51qgx10f/sJOKqtCZWJvQM5P3Mx
	 W0wEXj2fi/hA0VUFWoEkmsKrGeH+yrVriQ4DdIUCwSTNT6JDFV8AGHE1lATaBTRWzj
	 OfK+jzwVYoM0w==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Rajan Yadav <rajanyadav0307@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
Message-Id: <179501685630.182728.3865040956316474278.b4-ty@kernel.org>
Date: Wed, 18 Nov 2026 23:47:36 +0800
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

On Tue, 03 Nov 2026 03:09:04 -0600, Rajan Yadav wrote:
> The CPU thermal zone in sun50i-a100.dtsi has a sensor but no trip
> points, so nothing throttles the CPU as it heats up and nothing shuts
> the system down before it overheats. On a KickPi K5C (A133) without a
> heatsink, the CPU reaches 90 C within minutes of full load.
> 
> Add a passive trip at 90 C that throttles all four cores through
> cpufreq, and a critical trip at 110 C, using the same layout as
> sun50i-h6.dtsi.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/1] arm64: dts: allwinner: a100: Add CPU thermal trips and cooling maps
      https://git.kernel.org/sunxi/linux/c/90e0d3fd460e

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>



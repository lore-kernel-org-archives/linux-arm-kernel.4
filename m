Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841FF606EE82
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z7Od6AxM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kgiq3tjy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RbIMwh7QjY9H/ESzpnEDNcnjrWVGiNj/JP6ooq2LdsA=; b=Z7Od6AxMzxf10u
	cjmzRU+PrlyTfu9jyfSqGU25s6TvDxEZt2Ij3nMRsUAAhkLI9m9t++8nE34B714aRVgBiWzEkC0+P
	vzOeyq2TbHKrbEQX+dh7KAyrzZu0GDeTo4iajbhLpM13HCtnyEtHvdj70qcY9/DHtjweXcxKB+khE
	d5YiBza9s2wojjbhWSoEgj5AsEJVmImAOheVqhUuYcbt4y1u60WPXv7rRnPDVDhmfK3E+52IWM0Vf
	odd1nEQMSAKTgy9zoMg3ogEBzzzY6cPIPbkKbhxMfcblOBwD4O66KZZUTx1sUDj1O4brEbbZi6XTz
	cIVWCUiJJHJ25MIxIKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSep-00000001H7b-2RJI;
	Mon, 09 Nov 2026 16:55:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSeo-00000001H7V-3xpb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:55:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B199644674;
	Mon,  9 Nov 2026 16:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0B11F0089F;
	Mon,  9 Nov 2026 16:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794243346;
	bh=RbIMwh7QjY9H/ESzpnEDNcnjrWVGiNj/JP6ooq2LdsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kgiq3tjy33avHVpr9ViD1KQQGgwe0ecSe9vXcA2++Xip00YTMrBRcnwboSnomjYWR
	 1cbWAvM7IcWj0HILEFIHtfjJU2HBkVrReM2B8ZtVqwP4JCNfNA2Cj7Fuw87hzeOw0M
	 FvUjAP8UriXi523B5zkRfmF4muMj3uaGDc8ZYCRU3V2BwfGS2+3u+Z7f28g7QdvrdZ
	 DX8r2Q8p/EXUrGIMWFG+SswCt4dsTusbG0HuAcEDM3/CAd9LJCyy1Xmw5TBqq+BF4Y
	 GPD21Axbh3PPRVZTOyGBUM8a1esvnoHYu9sANWPYUyrAah8wnmI18c3XymTqlQVvkn
	 QffTWqGrWlIkQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261104185421.883883-1-jernej.skrabec@gmail.com>
References: <20261104185421.883883-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h616: Add CPU cooling map
Message-Id: <179424334487.1081153.17199236855422635753.b4-ty@kernel.org>
Date: Tue, 10 Nov 2026 00:55:44 +0800
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

On Wed, 04 Nov 2026 19:54:21 +0100, Jernej Skrabec wrote:
> The CPU thermal zone has passive trip points, but no cooling map, so
> nothing throttles the CPUs and only the critical trip point ever acts,
> by shutting the system down. Throttle the CPUs above the 70 C trip
> point.
> 
> 

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/1] arm64: dts: allwinner: h616: Add CPU cooling map
      https://git.kernel.org/sunxi/linux/c/a7f6e476aaed

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>



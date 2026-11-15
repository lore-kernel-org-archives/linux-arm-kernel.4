Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163EB606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 11:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LXr4fAxP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jmf2HchH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iWdxDiJUr7CTWsA2A0qYDKSIE+nDlkJJ+cPmF9OEvPc=; b=LXr4fAxPRS7ig1
	ajHPVWG/J3oclXJorb/6JjwCjmGy4vD5CSQUcUqbkFCFL5g9gXeoQUXSLzRZ1P/Hln9Z15orL+Ac2
	AsXM9j1PB16vTtZ9xUsu9Q8bTY37tAhr5nxV19F4qTYDVhbGMWUZjqjMuSXgzDerc6PF8EgB/6poO
	JyrL6KU51hIFnCOFIE2JL7s0JLXqwOXiEBa5V9r7BYrBiTmCDmOxfWN19QLoMF6VMdte/L2fNVvOs
	7cyMWbC+rXa3GGISZNi3NGdWea3INDwPgsea1TC+E7xuF9tlUxFdzxR9R3Ofu3VGNP8Kw0x9u9KCq
	BPZGxVVC5AKTD/lj8jsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYW3-0000000HSID-3pdo;
	Sun, 15 Nov 2026 11:35:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYW1-0000000HSHL-1OCE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 11:35:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C2F8D60E03;
	Sun, 15 Nov 2026 11:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952521F000C4;
	Sun, 15 Nov 2026 11:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794742520;
	bh=iWdxDiJUr7CTWsA2A0qYDKSIE+nDlkJJ+cPmF9OEvPc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Jmf2HchHYm01YYvRuEsUjJo+sAqhtH3cmNR21NKDC9hw3x3yt5cuGcdyybklO2mr+
	 cimNkkXyyFe+NzrmxoQ7k7IjyVHARiV4kwQY4rkpqhNVog9hB3jk63kUIykuJCHz3J
	 bDLFZAnEV1A8jYlg2644ZfYtmfrHqrXTvYhT2vGQHiVp/m0uivRHnS/z4B6XrEE7MY
	 q3PWKmo8UTbvfZDvSj95e/ia1IRKEGwdR3Rrn6vP31g7XJn1ofV7QUyR3muNvNvviY
	 0ieREEmB7lQxcgCD0irNSi5nCTNV4sWGFGFmHACscitLdw0OMQiBv8NJQEpYo+5SPD
	 IPtvfOZh4T0YQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com>
References: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com>
Subject: Re: (subset) [PATCH v3 0/7] arm64: dts: allwinner: h616: Orange Pi
 Zero2 fixes, GPU DVFS and GPU cooling
Message-Id: <179474251838.3095306.1558008986056795967.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 19:35:18 +0800
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

On Thu, 12 Nov 2026 09:22:30 +0000, Arun Iyengar wrote:
> This series collects the device tree changes we carry for the Orange
> Pi Zero2 (H616):
> 
> - Patch 1 makes the H616 codec node cover the DAC RAMP register that
>   the driver uses (it currently works only because ioremap() rounds up).
> - Patch 2 fixes intermittent dead-RX boots of the Zero2's Ethernet by
>   letting the RTL8211F add the RX delay ("rgmii-rxid"), as the Zero3
>   already does.
> - Patches 3 and 4 add an H616 GPU OPP table and make the Mali-G31 a
>   cooling device of the GPU thermal zone, with a passive trip point.
> - Patches 5 and 6 enable GPU DVFS on the Zero2. Patch 5 first raises the
>   floor of the GPU supply to 900 mV, because on this board the rail is
>   shared with VDD-SYS and the video engine corrupts decoded frames at
>   810 mV.
> - Patch 7 describes the SPI NOR supply.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/7] arm64: dts: allwinner: h616: Cover the codec RAMP register
      https://git.kernel.org/sunxi/linux/c/7d86907c33fb
[2/7] arm64: dts: allwinner: orangepi-zero2: Let the PHY add the RX delay
      https://git.kernel.org/sunxi/linux/c/05006ae70803
[3/7] arm64: dts: allwinner: h616: Add GPU OPP table
      https://git.kernel.org/sunxi/linux/c/e39ccc7f7493
[4/7] arm64: dts: allwinner: h616: Throttle the GPU from the GPU thermal zone
      https://git.kernel.org/sunxi/linux/c/ce0fd2bf5732
[7/7] arm64: dts: allwinner: orangepi-zero2: Describe the SPI NOR supply
      https://git.kernel.org/sunxi/linux/c/e51eaff703b1

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>



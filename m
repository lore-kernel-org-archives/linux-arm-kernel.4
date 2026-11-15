Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A6E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 17:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GjpDwDzc;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e08HEec5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+Qll/vIexU7xeo5M8+gP/uSz39nyTc6xFHqMYnattWI=; b=GjpDwDzcGZLUJL
	R0dHEWEy05Krn7WP5JDIqhG0qzNsR2C9dx0jBd+QgG4NUPZJpnW8hTOU2oUEj2bJJ60T+YJAUp5RI
	97Nn14GXttRW/ZOL5BvPXgCd8M5UYStjc7jGWmdmtf1YV1IkEqQ3BgjYUZCsRiuAgjfSUAuPhZsaw
	OsiqIdZE9qBo/A924Tn0cIt9h2mukpnAz0Za8YIkG3VnPSCLhrs0c5ieHScJ/MoSHC4eN1/oGeGns
	t0Gvv59MprzFcACAn/NfoalZPfFvqXwXTgd2yI4oZrHw2cq/VA8/ZFO/g1CP1Fottm8UvjMeW6dYZ
	0vkQxQYgqR5Uq9RX4fFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeKa-00000000HdB-3W0p;
	Sun, 15 Nov 2026 17:47:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeKZ-00000000Hd5-1wTJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 17:47:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C866A41435;
	Sun, 15 Nov 2026 17:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B601F000C4;
	Sun, 15 Nov 2026 17:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794764874;
	bh=+Qll/vIexU7xeo5M8+gP/uSz39nyTc6xFHqMYnattWI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=e08HEec5dIPXehNCRnJEg48JU/1QYwlptQ8zyYy0r++TbkJG0L+U57dJSR8pC2kzy
	 xnsvVUOoobEjkohZBLo/Zeb+iFgdD85qVX5nzbeaP7dvtPV+MaR+pYJssMCkO2zP6a
	 qVjFMgCsZdJekCIpESDAl2TW9La4eLDu2b9Or5hmeVdBz3fTql14D1ynwdCbREG0qO
	 VdnTAa2TcIGvIa0Xhf4gFHya/Sj45si+jCLdrBohE+xJrSwLgTv7aO7AdN2UXlSI+s
	 lkefWZvBplmVCuWdzzc9qcQD3U3AIxlQXsXJBUwp9ayiMZ6md4E0iv6dCl8G0zeFrZ
	 v5HfX72o+GDqw==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261115170328.34338-1-jernej.skrabec@gmail.com>
References: <20261115170328.34338-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h6: orangepi: Raise CPU
 regulator max voltage
Message-Id: <179476487291.3342574.10682884992397406138.b4-ty@kernel.org>
Date: Mon, 16 Nov 2026 01:47:52 +0800
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

On Sun, 15 Nov 2026 18:03:28 +0100, Jernej Skrabec wrote:
> The vdd-cpu regulator on the Orange Pi One Plus and Lite2 is limited to
> 1.08 V, so the OPP core drops all CPU OPPs that need more. Depending on
> the speed bin, that caps the CPU at 1488 or 1704 MHz instead of
> 1800 MHz.
> 
> The limit dates back to the initial board support and isn't a hardware
> constraint. Raise it to 1.16 V, the highest voltage in the H6 CPU OPP
> table, as was done on the Orange Pi 3 and Pine H64 when they gained
> CPU DVFS. The actual voltage still comes from the OPP for the chip's
> speed bin.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/1] arm64: dts: allwinner: h6: orangepi: Raise CPU regulator max voltage
      https://git.kernel.org/sunxi/linux/c/098728144545

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>



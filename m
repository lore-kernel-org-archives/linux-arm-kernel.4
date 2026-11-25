Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ED7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=42c3LlYq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HG3DS/xm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xqvMv36sU1arvmKl+cIGHmHRCnYWDCYqsUJxqYwyPL4=; b=42c3LlYqVRTgPmzT/9cLQ5asE0
	K5KvT//YSm/XAL6J0S80f4Qgka6RJBY4vLUmS8/3Sl2YG/xR7LJUH8QC6hR5Q+lb/Q9EcI7Pv/UXI
	V/bb9n5Ti1X3IWUDwbNSGCefi4XJqCaMqdT92aJdssSmWiCD8ZRQQ9EVCrK6SGKCLPbNW1pExy2gD
	SmxOFAoAq3ysAUGvcdPP8MT+hklsJ4njb7cXZ6b6UXmKquVYCHwRGXDw9vhSBPZQB7AhgBtnDyTPl
	rhaBja0pNo/ZHNj39bBN7Lh4cM8y7UdhG5fs0ToDDihghnBxSY0nmckACkFKSwC3a+hjx2dVohEUL
	NxLH3+Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBmE-00000009lmT-1niq;
	Wed, 25 Nov 2026 12:07:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBmC-00000009lmD-3Wru
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:07:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A01806298A;
	Wed, 25 Nov 2026 12:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CBD1F000D0;
	Wed, 25 Nov 2026 12:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795608423;
	bh=xqvMv36sU1arvmKl+cIGHmHRCnYWDCYqsUJxqYwyPL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HG3DS/xmRh+hLy/FZR+0DYfYsuM99sOw0N5RdI595AfpTVhkw1ibfxIqv+4SLC1x7
	 nLTTGtcYq6q5oVbibxAcXtlkQEn0KqmBebcb8ICXio1q9HiLRFhghlIyRbxaVn0Zun
	 qQNTUDAeB+BnT4l7UoVIUviBrRlHKASCArw2XfexmDn3CRFd/OAqnOM0zwtolbMTwu
	 PVqAwqMlY4zQ07Lqx8dmdqDP+loL413gUqnJdKgfTYjNlLqDbSTVgDsRXka+wDynLp
	 8AUFPEzcX8r4mVwFvOFahOhpzdNI6EalJ4DGJdaAUxKqoo/QkTXHorxOnFK/6YRA91
	 ktW9x0DaFbLmw==
Date: Wed, 25 Nov 2026 13:07:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Russell King <rmk+kernel@armlinux.org.uk>, 
	Vladimir Zapolskiy <vz@mleia.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [GIT PULL] soc: deprecated platform removal for 7.5
Message-ID: <20261125-judicious-burgundy-bee-89d514@quoll>
References: <7d052ff3-6d0a-47ff-a1cb-b7864ad2c248@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7d052ff3-6d0a-47ff-a1cb-b7864ad2c248@app.fastmail.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 04:47:21PM +0100, Arnd Bergmann wrote:
> The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:
> 
>   Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/board-remove-for-7.5
> 
> for you to fetch changes up to 273a6e23f66433952300d1810b5274786e7e4a25:
> 
>   ARM: at91: remove samv7 support (2026-11-10 22:18:44 +0100)
> 
> ----------------------------------------------------------------
> soc: deprecated platform removal for 7.5

Thanks, applied

Best regards,
Krzysztof



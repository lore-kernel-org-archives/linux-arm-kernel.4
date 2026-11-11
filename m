Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC93606AE41
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 23:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q93I9V44;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oFl+UB35
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sLyZtPTkFdbyABhOZWUDHW8SHa1Rc6mfsRhG3LxmUD0=; b=q93I9V44oj9mHgiUZekix0V3RY
	2nPU+bEFk1suakGFw3IzbZecfD29dLvKaUvGi9ReAwn67av1eKKqvcEez/zmmCGqGTxuunwIxjdaS
	gZQIis4Xu/94p4avILBE7khTUzNFp4bRXBGm0mUKk1uBokTt25LqnLxE0AjaeCwupXYUZ43QTOm5C
	vX3PZyxLll4J29nruhxGRkoifvCdANzbOaJTYe6g/TSM4QLXuQrLloscO0EVzapDpdPR8mFkYD0Ra
	YKuG7aQhItyczrEnK8Kv2TzNBSA9+ztL+soBneKe+ccK7zAifPrtp+TpzzXM2PFOH0/raExzpw/wL
	TGDapQpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRI6L-00000008Bga-2ijl;
	Wed, 11 Nov 2026 23:51:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRI6L-00000008BgG-0oZY;
	Wed, 11 Nov 2026 23:51:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D21A346B04;
	Wed, 11 Nov 2026 23:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C8E1F00ACE;
	Wed, 11 Nov 2026 23:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794441096;
	bh=sLyZtPTkFdbyABhOZWUDHW8SHa1Rc6mfsRhG3LxmUD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oFl+UB35XlTkei2dg8HWPlfN9VCn1rCsmTeH3H5IzZrlXDiIpiE3v4m1lIAtF8/Rw
	 3bBHQ6syxx3BJpoLKRfkjTNirAkRd2ukxnqCC8Hb4Zy6THfbM7E2uyN9mGsN30XU0m
	 ie0UWfgRC4FaOTZg26Fa/ePbfiSPP9I6nXRPlD4g0mXaTH4Sv1t22MBW4GIopqkKMz
	 6wWWpxkjPXFx9261KPn+N53MS/qyqvoFAxelLGstkPooD1KMKwPuvMSedBPZR+/JPL
	 95EtJZWyNStqPbp3uaEbPGybCr3BG6SPbKSKZ4zIPMFu9x6ejfpZ7iVqqDRlNeZki9
	 Z5/I0dKHInjcw==
From: netdev-bot+sinfo@kernel.org
To: Igor Velkov <iav@iav.lv>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Lukas Wunner <lukas@wunner.de>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Wei Fang <wei.fang@nxp.com>,
 Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Doug Berger <opendmb@gmail.com>,
 Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Shenwei Wang <shenwei.wang@nxp.com>,
 Haoning Cheng <Haoning.CHENG@cn.bosch.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v5 0/4] net: phy: postpone PHY interrupts during sleep
 with MAC-managed PM
Date: Wed, 11 Nov 2026 23:51:34 +0000
Message-ID: <179444109487.2168702.10631162542543162252@kernel.org>
In-Reply-To: <20261111-b4-phylib-mac-pm-irq-v3-v5-0-bbfdb5afb7d3@iav.lv>
References: <20261111-b4-phylib-mac-pm-irq-v3-v5-0-bbfdb5afb7d3@iav.lv>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.


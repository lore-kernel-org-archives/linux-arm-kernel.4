Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51204606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oNk4QiLR;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=iqVcN25q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z8rkgdmWzQ5tc6mLgq08LFXko5v7opLhcj8Wj763hEQ=; b=oNk4QiLRubh8557LT106xfFAAN
	t36qAI/HzifGTRZiVUB7rFfuYEk2a4WgOsXCQYFXGVkUtm7ba54TmrLYNPMscwSW5OceJJAz0kMBt
	wgOulqZLYvUn62MbZ+g1BqCufN5ennpeVG+WVBeBHdwDrYcox+aiR3gICjiIDMJGHWY3F5i3jLH5O
	DlJJ11laMAptBWwpAN3j6c5qjIAuzkLkvIFsxlTXQELxk0Y8j2vPibVmWHFITmRcEDIIOoGqXVwRo
	3D0VgZbvYa16Z1ij5zNfR87IWcf5Bwxe3opHaK8/aDkrqdLIHPdfRulTyxkmDLCPPcBEyDXY5sOOz
	IvXtbk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDsD-0000000A8RE-2dfo;
	Wed, 25 Nov 2026 14:21:25 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDsB-0000000A8Pf-0SkD;
	Wed, 25 Nov 2026 14:21:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Z8rkgdmWzQ5tc6mLgq08LFXko5v7opLhcj8Wj763hEQ=; b=iqVcN25qb1t7uOLUUJoVtFnFeF
	f/dsKXucFRBKUrWMKJBnTeCZ93gJS/I3sBjxDlEXA0x8wX3Ft59H/UONxxu5uLKSjNcoWkwLtpb0j
	7X1sQiTann5p6yuAp2duoNKCK024ENeLS8FBX9Omjv5UA0IAzOj7utOhPFRj6KHxBcnw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWDro-001KiR-HS; Wed, 25 Nov 2026 15:21:00 +0100
Date: Wed, 25 Nov 2026 15:21:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ryan Leung <untilscour@protonmail.com>
Cc: Alexey Charkov <alchark@flipper.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from
 the CPU ID
Message-ID: <2f8da604-36af-4944-8168-02b046e97699@lunn.ch>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
 <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
 <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_062123_147528_FDAA7BA9 
X-CRM114-Status: GOOD (  11.82  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> > +static int rockchip_otp_cpuid_pp(void *priv, const char *id, int index,
> > +				 unsigned int offset, void *buf, size_t bytes)
> > +{
> > +	char cpuid[ROCKCHIP_CPUID_LEN * 2];
> > +	u8 digest[SHA256_DIGEST_SIZE];
> > +	u8 *mac = buf;
> > +
> > +	if (!id || strcmp(id, "mac-address"))
> > +		return 0;

I don't know OTP drivers. But to me, a function called
rockchip_otp_cpuid_pp() which does not actually return the CPU ID is
architecturally wrong.

I would probably not mangle the CPU ID in the OTP driver, but in the
MAC driver. The MAC driver should ask for the CPU ID and then hash it.

    Andrew


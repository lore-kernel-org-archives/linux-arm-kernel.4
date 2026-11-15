Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D63F606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 21:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rLsuwxqI;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nFEZvwMx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6XvkMDi42j7sY0SuX8WsFlM/u5/0v+BfHkwMgWB/hdM=; b=rLsuwxqINW2qTdIxz5Q42kB5gp
	qO9J4rQCvJp4dwOwDLFRtXDxzXEr3aV23aFQm6ymRkB7wEkM6JS5uQaD/H86yMBjv2nJfU8SbUXzT
	dKfd8/eTtYljrah9ZyqJ1MN9zxflR2vNsp/WLepcdtbO2wKdQ7XhQJjhgHZ9HRw0Akg+btxg5SNJ9
	O++1/YdYJqb9/0xLgYt9ZWO7E+9no+rMY6borWQyclZHXaJSP4wIgTY06XZP3TXVB6nZBvqVc+Thx
	WaQa7lx5IxtA2yC32jl97exK87R8AjXG2/ETCoC28mKkHCnE5tG1SmDmxNx6VtLtglp+sYpuUKFce
	8p529c5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSi7B-00000000Ynu-1A8h;
	Sun, 15 Nov 2026 21:50:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSi78-00000000YnF-3q3v;
	Sun, 15 Nov 2026 21:50:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BAFC360F01;
	Sun, 15 Nov 2026 21:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE831F000C6;
	Sun, 15 Nov 2026 21:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794779417;
	bh=6XvkMDi42j7sY0SuX8WsFlM/u5/0v+BfHkwMgWB/hdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nFEZvwMxQUzhZeELmnZEHAe8BYEEgWRUOfxA44QqBHDNEHKqgSvZInB5g+iW8EEVD
	 pj76uae/e92fD9oa7MNfKcgyS4hY2nZlIL17HBe7xjGKguIZu4LibMj7CQX65gLdlC
	 yUo+VjdlP1+vkZAuaIRoxfs1kj5AwLhAQdCo42VQe8nfnuhcZ3hXYN39CpJgvecOuQ
	 OPbR4u1buCNQRULF38yfpYWseRPD1F7jg8lXJQQJYmcs8oZQa6WkiiLB7B5pkjQTHZ
	 K+MwzTlKdAZbS9JOeVLV4XkiLpInJkLVuIRCWXH6oroJApZnFqC5JG6gu0J1Vnd/Zo
	 nMGHujxVcHOZg==
Date: Sun, 15 Nov 2026 16:50:10 -0500
From: Brian Masney <masneyb@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Nicolai Buchwitz <nb@tipi-net.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>, netdev@vger.kernel.org,
	James Clark <jjc@jclark.com>
Subject: Re: (subset) [PATCH 0/3] clk: bcm2835: describe the BCM2711 GISB
 clock for the GENET MDIO controller
Message-ID: <avopEsR4AqMUUKBU@x1g10>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <179358503716.355577.9187303706042543606.b4-ty@b4>
 <2e846fdb-32e9-4ba9-a6e7-ef67d24c4f8d@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e846fdb-32e9-4ba9-a6e7-ef67d24c4f8d@broadcom.com>
User-Agent: Mutt/2.4.3 (2026-10-09)
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 07:39:42PM -0800, Florian Fainelli wrote:
> On 11/1/2026 6:03 PM, Brian Masney wrote:
> > 
> > On Tue, 20 Oct 2026 16:58:08 +0200, Nicolai Buchwitz wrote:
> > > clk: bcm2835: describe the BCM2711 GISB clock for the GENET MDIO controller
> > > 
> > > The timestamped MDIO write series [1] needs the reference clock the
> > > GENET MDIO controller divides its MDC from. On BCM2711 that clock is
> > > not described anywhere, so 5/5 of that series hardcodes 200 MHz behind
> > > a compatible match, and mdio-bcm-unimac's clock-frequency handling
> > > assumes the 250 MHz of the STB chips.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/3] dt-bindings: clock: bcm2835: add the BCM2711 GISB clock
> >        https://git.kernel.org/clk/linux/c/af7994af5228
> > [2/3] clk: bcm2835: register the BCM2711 GISB clock
> >        https://git.kernel.org/clk/linux/c/ab94dbf30233
> 
> Brian, can you also take patch #3, or you would have create an immutable
> branch for me to pull from. Patch #3 depends upon the BCM2711_CLOCK_GISB
> constant being defined.

It's a bit late to do the immutable branch now and I don't want to have
to rebase the clk trees.

Can you provide an Acked-by for patch 3 so I can take it?

Brian


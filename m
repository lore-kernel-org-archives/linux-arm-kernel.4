Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4FA606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 23:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CDeBkUbL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G6quvtmI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rSO1YX8ECwF6lWE7jTNfVJI7sFNdXuobHYLm3j4lLjM=; b=CDeBkUbLhD6CG+8vh12YVWqnMh
	fgIHmzxPB9u282kdSPLSeFMMhSJ0UVM+Di/pGJDheREKSM5VDcH7yf23qqB3yVNfcoyElwBoUNu0Z
	1+zVcOLmoLjui47E9rimLEkpC8Vp8p1ywRYxJ7K2fq9QEt66HcWkPPhH+f48rfaFP1N9Nfy6hbcnm
	VWO5dYIq6Y+QTs90zOsv6C9h7ZiVAG5un4hwR/U3ME/DTpvo7l9GRi9CuxAtrLTUN9jWd33NfD0yG
	QsiH4zFcT+Q98HMntwUPobs2FS9kFuGkIzksXnZ+WpAT42pIPzwf0zxzg2v9cLB+AlndWbi5ykB2F
	ue4hFjsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpHR-0000000AWO9-1bZc;
	Wed, 18 Nov 2026 23:41:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpHQ-0000000AWNz-2Hpz;
	Wed, 18 Nov 2026 23:41:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 99B746427E;
	Wed, 18 Nov 2026 23:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A1D1F000C5;
	Wed, 18 Nov 2026 23:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795045291;
	bh=rSO1YX8ECwF6lWE7jTNfVJI7sFNdXuobHYLm3j4lLjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G6quvtmIAnAIa/2BWcN9t0CtnflDE2825rvG4CvCmJtlY/d/K7rXajjLf/3ag9UFF
	 QaKv2LgifFS+21hUYitPHmHbbtoYt2HCNrR5LddVBeYl7rBJM5jgkndby5p+RNwQPt
	 5epMhbP9mzuW8gUqHu+yWYw+6HjDQHOBfv7UO2xjblgACrVAKv/aioDjGOrcBKP7RA
	 u53iU9oszIuzsVCy5CwqAtXzf4d0OolBeribe8ofCdGBZDgaj3NuEvPgEh8+P60U5y
	 j8OIVNNQTdOlIAx4+YbXuYoWdJWmcnZXOuKrqUjF2d2l6bpNPgtH9k8CYsjb58C6eU
	 KNSbkAwvA2ViQ==
Date: Wed, 18 Nov 2026 18:41:28 -0500
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
Message-ID: <av43qJ1JUBgjFUtf@x1g10>
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

Hi Florian,

On Fri, Nov 13, 2026 at 07:39:42PM -0800, Florian Fainelli wrote:
> On 11/1/2026 6:03 PM, Brian Masney wrote:
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

I ended up rebasing the clk trees and I pulled these two commits out
into a separate clk-broadcom branch that's based on top of v7.4-rc1.

https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/log/?h=clk-broadcom

Is that sufficient for you to pull? If not, I can spin off a proper
immutable branch with a signed git tag. If there's any other
Broadcom-related clk commits this development cycle, I will add them to
the clk-broadcom branch, but there's nothing else in the queue at the
moment.

Brian


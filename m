Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A944960A2604
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 16:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GxS92FRd;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IvjL9tvT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DJ8cIXCRUOB9I2+njuBlGE2LdGi0WFfh6HrV7BoGga0=; b=GxS92FRda/hJbhKCVR7YmCo7Zc
	4GKubFVy23nDmZ/nI5v+4uqrIqPm3mgHdkcQCL+UAVDDrts1ezjGeneGoLxamPmR5SF//N8UZQDD6
	7gQCTtNXSOsHRRSCkFNtPMkmxxMRMaEYS65362yUiqmPi5RdRiydCtkkHYU8EcL6rTSe2df/VNT0d
	BlW2y/Il/mzt0JSR8EaG6CjdmvAxfwSMaS2tXNP3KbrFZmEBW9D0WvpvSg2w0uZ+LuiK2fgNqZPur
	DhhO9V40v5IkN0OgnZy6IF55TTib5FNQNbnUOdZuxPS6TMHeLWPXbLdT+B0XjhqdnMOnvSiB3dI8p
	XoxeBZaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURv6-0000000FbfN-0jvd;
	Fri, 20 Nov 2026 16:57:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURv2-0000000Fbep-3ZuP;
	Fri, 20 Nov 2026 16:57:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 18EBA62466;
	Fri, 20 Nov 2026 16:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536F91F000C6;
	Fri, 20 Nov 2026 16:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795193819;
	bh=DJ8cIXCRUOB9I2+njuBlGE2LdGi0WFfh6HrV7BoGga0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IvjL9tvTQiaHmCAeq33bh7cFtxbf7C0P3W2mb5u/sHTjg5ZZ1TlTASaX589CHUTBE
	 SYhMFA7GBcFTiBF20NyZfjJPAWMj+S0i8HfaMniF3IF2WrIfG39DkDkl+w4Sc8ZSJl
	 rl25wzQXY04GQrpJ5sIp1JoOy4BarvUDAgeh2SV0OI4PtT/XqTzTcCFVSs5n0Gp702
	 WcMHxkybAkagD/kGHlIKYRRGjjQmpBseVg1sWbGRqUN3sw7wkBD+EhCrxFCrBOLCX1
	 +pLkiqN1sUQPvCj1nzfaOGFY7AsjZCp5JUOyeollaCp+tKvu0tI8pBJ/5/r8oB7XOb
	 U7IUN3yMvsNyg==
Date: Fri, 20 Nov 2026 11:56:53 -0500
From: Brian Masney <masneyb@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <paul@pwsan.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>, Ulf Hansson <ulfh@kernel.org>,
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/6] clk: Remove unused clk.dev
Message-ID: <awB71ckHyTRIfy0p@x1g10>
References: <cover.1795094688.git.geert+renesas@glider.be>
 <a896e5bdb29c7c6de39df9b28b11d55614f2ec2d.1795094688.git.geert+renesas@glider.be>
 <179513882271.284394.17357508909448455391.b4-review@b4>
 <CAMuHMdWJ8zK+kzcznM7FJ3JCo1xWzjRZ5MQz9jhSUcYQfO5rBA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWJ8zK+kzcznM7FJ3JCo1xWzjRZ5MQz9jhSUcYQfO5rBA@mail.gmail.com>
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 08:44:29AM +0100, Geert Uytterhoeven wrote:
> On Fri, 20 Nov 2026 at 02:40, Brian Masney <masneyb@kernel.org> wrote:
> > > This basically reverts commit efa850487a6b6742 ("clk: Inform the core
> > > about consumer devices").
> > >
> > > This commit added a struct device pointer member to struct clk and a
> > > parameter to clk_hw_create_clk(), but the new member was never used
> > > beyond setting.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > > --- a/drivers/clk/clk.h
> > > +++ b/drivers/clk/clk.h
> > > @@ -5,8 +5,6 @@
> > >   */
> > >
> > >  struct clk_hw;
> > > -struct device;
> > > -struct of_phandle_args;
> >
> > Did you mean to remove of_phandle_args?
> 
> Yes, it was added by efa850487a6b6742, too (although it was
> used in that header file before). Currently it's not used.

OK, I see that.

Reviewed-by: Brian Masney <masneyb@kernel.org>



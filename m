Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A35606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 02:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oJptVVLF;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FkMC/PW7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t7bMvs3lOLPl1TDYCI2zC+6rhjTkCkzXglZIMlkd5+k=; b=oJptVVLFy95G/R2OjbOTdgrskL
	QlEbuRo5pwYdlK1cmat/fvwHgivL/bp4wAukzFN1204M/kW+SlYoNf2YUVF0rBMly1DEcffF0pzBS
	Jp/FTFoYe1yh1Fw/9ee1qKS4E8lq/YbKL9FPvQtvu+GiEFHrpGzQC7qBisT7LwLqmHbA3HGZJAKWA
	aJ23jm3ATlinGYLCGW5sSuxnLIIkHewkiNWGWNAHi62RU4/FHDsl1w7g1vi2wQDlX7LCWG1ePwrMP
	obl0wjP9A8v2QD8p8TEEb0/7uDQJzndYqriJ0NU2zo15es3A7lIw9k0GRtins/yoyXSrg8JiJuO96
	27XGEOiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTroe-0000000AgCe-2Era;
	Thu, 19 Nov 2026 02:24:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTrod-0000000AgCE-0sWy;
	Thu, 19 Nov 2026 02:23:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 846A341B2F;
	Thu, 19 Nov 2026 02:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5189F1F000C4;
	Thu, 19 Nov 2026 02:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795055038;
	bh=t7bMvs3lOLPl1TDYCI2zC+6rhjTkCkzXglZIMlkd5+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FkMC/PW7Y1+qnoXmqOsCT+x/q5Gavm0C3K0CFZ2kjA47d6u18CoYUNL7rrCI+m3ug
	 jTp3laT5FcallKs2mH1tMIM+pmmeQgVIJ0LhJMQYYHbf1jegSuw7NCG2Inu1bOyrWT
	 I6cgUbijNjw3LOG7CVmLUIhdusLvePICdZAxvZ3g+7/cXLk8vvTgWzUCyCYe7JUfaG
	 aghsmPVBeHKZ2RSwFjqQD8BrsMddzAe2iJ0VkS6K+EfT/QrJPQwaufHno1sjpJtSUA
	 jLKinbrg6YJiFJPrH7gI8StE62tCzLpegY3MvtH+hKHhUagM21A766K6EJem7mykeE
	 qv4CPXg59TNuA==
Date: Wed, 18 Nov 2026 21:23:54 -0500
From: Brian Masney <masneyb@kernel.org>
To: Yu-Chun Lin =?utf-8?B?W+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: "sboyd@kernel.org" <sboyd@kernel.org>,
	"bmasney+clk@redhat.com" <bmasney+clk@redhat.com>,
	"jbrunet+clk@baylibre.com" <jbrunet+clk@baylibre.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Edgar Lee =?utf-8?B?W+adjuaJv+irrV0=?= <cylee12@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>,
	Jyan Chou =?utf-8?B?W+WRqOiKt+WuiV0=?= <jyanchou@realtek.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>,
	James Tai =?utf-8?B?W+aItOW/l+WzsF0=?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	Stanley =?utf-8?B?Q2hhbmdb5piM6IKy5b63XQ==?= <stanley_chang@realtek.com>
Subject: Re: [PATCH v16 6/9] clk: realtek: Add support for MMC-tuned PLL
 clocks
Message-ID: <av5dut67EajT0zn3@x1g10>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
 <20261112052544.555563-7-eleanor.lin@realtek.com>
 <179450369605.1227210.10143810675268582312.b4-review@b4>
 <54a7a77705674bfdac23727f5fb92cb6@realtek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54a7a77705674bfdac23727f5fb92cb6@realtek.com>
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Yu-Chun,

On Fri, Nov 13, 2026 at 02:12:59PM +0000, Yu-Chun Lin [林祐君] wrote:
> > > +static const struct rtk_clk_pll_mmc_rate *
> > > +rtk_clk_pll_mmc_find_closest_rate(const struct rtk_clk_pll_mmc_rate *tbl,
> > u32 num,
> > > +                               unsigned long rate, unsigned long
> > min_rate,
> > > +                               unsigned long max_rate) {
> > > +     const struct rtk_clk_pll_mmc_rate *best = NULL;
> > > +     unsigned long best_delta = ~0UL;
> > > +
> > > +     for (unsigned int i = 0; i < num; i++) {
> > > +             const struct rtk_clk_pll_mmc_rate *entry = &tbl[i];
> > > +             unsigned long delta;
> > > +
> > > +             if (entry->rate < min_rate || entry->rate > max_rate)
> > > +                     continue;
> > > +
> > > +             delta = entry->rate >= rate ? entry->rate - rate : rate -
> > entry->rate;
> > > +             if (delta < best_delta) {
> > > +                     best = entry;
> > > +                     best_delta = delta;
> > > +             }
> > > +     }
> > > +
> > > +     return best;
> > > +}
> > 
> > This duplicates the functionality in ftbl_find_closest_by_rate() from patch 3.
> > 
> 
> I considered sharing the logic, but the two tables have different entry
> layouts.
> 
> Unifying them would need a macro or (void *) (both lose type checking), or
> embedding rtk_freq_table with container_of() (a larger rework for little
> gain). I prefer keeping the two type-safe functions. Is that acceptable?

What about this? This is completely untested.

  #define ftbl_find_closest_by_rate(_tbl, _rate, _min, _max) ({         \
        typeof(&(_tbl)[0]) __best = NULL, __e;                          \
        unsigned long __r = (_rate), __lo = (_min), __hi = (_max);      \
        unsigned long __best_delta = ULONG_MAX;                         \
                                                                        \
        for (__e = (_tbl); __e->rate; __e++) {                          \
                unsigned long __d;                                      \
                                                                        \
                if (__e->rate < __lo || __e->rate > __hi)               \
                        continue;                                       \
                                                                        \
                __d = abs_diff(__e->rate, __r);                         \
                if (__d < __best_delta) {                               \
                        __best_delta = __d;                             \
                        __best = __e;                                   \
                }                                                       \
        }                                                               \
        __best;                                                         \ 
  })

Brian


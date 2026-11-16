Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25AE606A890
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tz/32Hot;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNhC6SCb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KwLcRkPnstUk3ARTGuc1rQhwhKTM1szKdxcAeiFBkdE=; b=tz/32Hot/X+h9Up6IDL8lPXpWj
	qqpfThoEwwF7hE9Hrdfk4ui3x6azubzKiPzYolAg7uZGPiqrJ8E1SMsDa05uZnVPSKPjf9iQ1J7x7
	PG4QsPON6ynnECeJ0qh58ALDv2K6L78naoFnAmyZxQxj8ufcohJ8wU0UPcnM01fk9O/kD9ev3xvY2
	cnbwLZ0IuO5YsEMTVcvhh9fQfSHSC8ck8E6xSxL056/Hr/WMvQylP19C3MonQu3ab2h7hCZl7KgxX
	twXSu9kBJcSMWEjbg+OUdPA3Jgi0JrremybyWQVVPw1Ohzgl7/C8qxYV6LdlUoxBiQzi4ZiR3iyWH
	0P3KxOag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxLc-00000002kw2-3gFh;
	Mon, 16 Nov 2026 14:06:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxLb-00000002kvR-1rjP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:06:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 981E36119D;
	Mon, 16 Nov 2026 14:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C401F000C4;
	Mon, 16 Nov 2026 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837974;
	bh=KwLcRkPnstUk3ARTGuc1rQhwhKTM1szKdxcAeiFBkdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iNhC6SCbyr0bjFPBo14UC/W7m2erFrHGvPCaV/tq/GtUg9VgQ1X55EbHnWLAN34RF
	 Hxhdx/seKwL9IL/yEjutCzYGl7TjUSuOAIJR7MPQUhyuwXWaMKTgygymIY2/TCYsYk
	 zpmy5KRgNScVZYzoyv14PJuZ/oKFuBQJcx9oR1I2022PhSeuE/BfjZOX7O7amGmSWc
	 Iyr+52DO80d654LdzhMqw7A7OFODbn5e32tBVAn06TClFDuulRpi/HdNNXkjZnZAe0
	 qZ6IwI/WQKLC1bPnM/MX30nMMznlMqrwdV+ooI2Tqx0eup85FP0k9kWzc56XMBgUqd
	 dBK9wxEjcHBVA==
Date: Mon, 16 Nov 2026 15:06:08 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 00/10] irqchip/gic-v5: Fix misc IRS and ITS host
 driver issues
Message-ID: <avsN0E-6_7kU3pTk@red-moon>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261112145814.853424-1-fuad.tabba@linux.dev>
 <avrzusx1g1ZICo0Q@red-moon>
 <CA+EHjTyGQbS7zcHSRg50c5xVN2AY4AmMc7JqNAvrc=_UhPQ+kg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTyGQbS7zcHSRg50c5xVN2AY4AmMc7JqNAvrc=_UhPQ+kg@mail.gmail.com>
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

On Mon, Nov 16, 2026 at 01:28:56PM +0000, Fuad Tabba wrote:
> Hi Lorenzo,
> 
> On Mon, 16 Nov 2026 12:14:50 +0000, Lorenzo Pieralisi
> <lpieralisi@kernel.org> wrote:
> [...]
> > > invalidate have the same shape. The question is, can an IRS miss the
> > > poll, or is a timeout here only ever a dead IRS?
> >
> > Thank you for your patches Fuad.
> >
> > The latter, though freeing memory on timeout wasn't a good idea given
> > that there is no way to cancel the respective, pending, mapping.
> 
> Thanks, that answers it. If you'd like a patch that doesn't free the
> memory on a timeout, let me know and I'll send one.

Thanks. Again, if that timeout expires I think we have more serious
problems than the IST mapping but I do agree that freeing memory
is not the answer; not urgent - please send a patch given that
you spotted it, can obviously do it too.

> 
> [...]
> > > Notes:
> > >     Setting L1 on every invalidation turns each registration and
> > >     teardown into a range invalidate, both rare paths, and keeps the
> > >     function simple. Setting it only when registration allocates the
> > >     level 2 table would miss a registration that fails after the
> > >     allocation, which leaves the level 1 DTE valid.
> >
> > I can't follow. I agree that we have to invalidate the L1 DTE on
> > L2 allocation but that's a one-off, I don't understand what issues
> > you are pointing out in the Notes above, if you can point out please
> > the code paths it refers to that'd help.
> 
> gicv5_its_device_register() can fail after
> gicv5_its_devtab_get_dte_ref() has made the L1 DTE valid, and before
> the gicv5_its_device_cache_inv() at the end. That happens if the
> EventID bits check fails, or the ITT allocation does. The L1 DTE is
> then already valid for the next device registered under it, so that
> registration doesn't allocate a level 2 table.
> 
> The patch Notes were about setting ITS_INV_DEVICER.L1 in that
> gicv5_its_device_cache_inv() call only when the registration allocated
> the table. In that case the failed registration never reaches that
> call and the next one reaches it with L1 clear, so this L1 DTE is
> never invalidated. Invalidating in gicv5_its_alloc_l2_devtab(), right
> after the L1 DTE write, is the one-off you describe. I'll rework the
> patch to do that instead.

Yes, I think that's what we should do - invalidating in
gicv5_its_alloc_l2_devtab() once for all and leave everything else as-is
matches architecture guidelines.

Thanks again.

Lorenzo


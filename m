Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57405606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oqE/8FyN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q3hqHcR6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ISLuAv+WyTAin19m+4GFCxS3knd9KXbnCR1jZVMEmIk=; b=oqE/8FyNx79T6Eo6vQn+TJWjCj
	4NlUVxwP2frJEXRfcojLAMfcEhcFfzNoIntSswzL+JYSDAMCWILLrDoxT9H3Oy/Fb42JdtFL6l/3A
	kiMACYNNu93bDMHTHVX/AJpwWpegv0wiw3mRQf8OiFO7kP5svujZYEAs6exP7z/gj8Ay8Pb4tANx0
	b8IsPfebsiiYpwD1x2/qj/Usk/oQl9zZp35o2wJAaFhR7HiW8eUZaal0MCs5d+OCeAv3vtUIWjKM+
	j6ksPanA4C0q0ynlzWu3tZ144r5NtrVFEodgtoxpxAs3z+yP6usfkwyogGoh5P4c8DUPMY8iSz+i+
	+L74jz7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuEf-00000007KqL-2rdN;
	Tue, 24 Nov 2026 17:23:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuEZ-00000007KnG-0oBc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:23:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 89218618B5;
	Tue, 24 Nov 2026 17:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5869D1F000CA;
	Tue, 24 Nov 2026 17:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540990;
	bh=ISLuAv+WyTAin19m+4GFCxS3knd9KXbnCR1jZVMEmIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q3hqHcR6IyvIp3CIR96l6pe8MvRJ3w0NF8ApqhHrGE5UhwGDcSCGwCPTwfhhV/DUn
	 cycehnC4syzJ5mQmbeQkV58eWYwLaK/bb2aU5siZBLS+qPiyEboe9O4tXe29PGjViE
	 yVSpXf5NEOGWEB4Tf5JIPNBzsGB/0Ai564nTTb4DoLO2HprRIb3TrUEFDe5ks6Q5D6
	 QVSjYu/XiMzGTQ31qeoa96QytvhqZgKqFPEqOTvAve95oyvpE2zIrPHyM8qurkaCFh
	 umTXf2tiIA/CQzLCtUNK1NRmuDUDVUOHzFNPg1b7+sINbpues4iksrmE8TEDclplbg
	 ++ZFYLW4FcLiw==
Date: Tue, 24 Nov 2026 18:23:04 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/14] irqchip/gic-v5: Retain the L2 IST when mapping
 times out
Message-ID: <awXH-Is5s6eqx8mT@red-moon>
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-4-13c1859e8aa3@arm.com>
 <CA+EHjTzPFjUOXCiccswH2xGvbiqgXPbSihov7MA0WuXn-SmrEg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzPFjUOXCiccswH2xGvbiqgXPbSihov7MA0WuXn-SmrEg@mail.gmail.com>
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 12:00:15PM +0000, Fuad Tabba wrote:
> Hi Sascha,
> 
> On Wed, 18 Nov 2026 17:35:33 +0000, Sascha Bischoff
> <sascha.bischoff@arm.com> wrote:
> [...]
> > diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
> [...]
> > @@ -217,6 +217,10 @@ int gicv5_irs_iste_alloc(const u32 lpi)
> >          if (FIELD_GET(GICV5_ISTL1E_VALID, le64_to_cpu(l1ist[index])))
> >                  return 0;
> >
> > +        /* A previous map timed out; do not overwrite its pending L1 entry. */
> > +        if (READ_ONCE(l1ist[index]))
> > +                return -EBUSY;
> 
> Sashiko's review [1] didn't go on the list, in case you missed it.
> Sashiko found that l1ist[index] is read twice, and that on a
> non-coherent IRS a map completing after the timeout leaves a stale
> copy of the L1 entry in the cache for later allocations. Invalidating
> the entry before it's first read would fix the latter. Invalidating it
> on the timeout path wouldn't, since a later read can refill the line
> before the map completes.
> 
> With those fixed:
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad
> 
> [1] https://sashiko.dev/#/patchset/20261118-host_gicv5_fixes-v3-0-13c1859e8aa3%40arm.com

Hi Sascha,

I am taking some time to revamp the current approach because as a fix
it is getting complicated and there are corner cases that I don't think
are fully covered.

I suggest we drop this patch from this series for now so that it does
not hold off the other patches that I believe are ready to be merged
with very minor tweaks.

Thanks,
Lorenzo


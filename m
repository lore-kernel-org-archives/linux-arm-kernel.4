Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E9460A2602
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UOiFqLnk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TINxLQrK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5M39K3SYmmJG/uu6Nrf7nIbhuUUU2dESxQqOUEafOSo=; b=UOiFqLnk5kA+iqXrUklYtS2RuZ
	7yZ5alUyy/HRc8oE1//pQlphQOKjKPQpC6dNrhliW6VZv5ULIDoFgab7ga/nbHPzKCX0PxeRKu/kf
	eCxCJUhfGrGGos0coG0nyJXk3MWdKh4VJ3giHvRKG/PYjVO3ot/HoRD20BPftUDt0JovrJ1fhJJqr
	CJecgV85CkN9rM9PDnUQRR9irC0/wSvzuQY/xqZIesUUM3LYkzxn/FkJA4mqukAyPBtYQbsAV0VEy
	qS1Qhcd5YMJPCrMa5aYXElzlhfZNhMBbauy2hPcSOlXC5Cux1lWv7JMaFvkndqdLvz+GFASE82Ngp
	V4LEt1bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2Fo-0000000C4NZ-2iHP;
	Thu, 19 Nov 2026 13:32:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2Fn-0000000C4NP-2R6c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:32:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E965062195;
	Thu, 19 Nov 2026 13:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6B01F000C8;
	Thu, 19 Nov 2026 13:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095162;
	bh=5M39K3SYmmJG/uu6Nrf7nIbhuUUU2dESxQqOUEafOSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TINxLQrKG34F1EB9e0P64dGTbPRbiN6OyeYoxP65YwfSHV+G6qiLWBgXZQ/jYMgh4
	 /WQModnOlcVyz5WnASWfzofarXgvnOVi3uzEMwMIOwA57X5qjpfFHMLUmEi8MXty6n
	 2cv4TkLFzhzZv+wmlx79YJfjEiNh97f8n5a/KaoUEAH9EnIkJum5+oVGokOA9M8opl
	 8eXAp9awIBQTbEGeiffU6hS/QXOSmctmA2mOycBw3vq8iqAfaXJmJ6KEIdJ4ij2jM+
	 ULN7Aq02gWWiYzEbLKChHm2DIZ/dmljHco0tvNJG97lzjmIKCpm583JkOp2FjrTEqA
	 Zk8A+NXTjbCTg==
Date: Thu, 19 Nov 2026 14:32:37 +0100
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
Message-ID: <av76dQ_dMCWlTAse@red-moon>
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

Yes, we should read it once but see below.

> non-coherent IRS a map completing after the timeout leaves a stale
> copy of the L1 entry in the cache for later allocations. Invalidating
> the entry before it's first read would fix the latter. Invalidating it
> on the timeout path wouldn't, since a later read can refill the line
> before the map completes.

Well, we don't know when the map completes do we ? Is invalidating
just before it is READ_ONCE() really "fixing" this (actually, is what
we are trying to do minimizing the false negatives ie l1 entries
that we wrote and became valid that we would detect as not valid ?)
or we need to sync the IRS and check for idle before the invalidation ?

I will give it more thought - I don't like this complexity much for
basically fixing a very close to fatal error.

Thanks,
Lorenzo

> With those fixed:
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad
> 
> [1] https://sashiko.dev/#/patchset/20261118-host_gicv5_fixes-v3-0-13c1859e8aa3%40arm.com


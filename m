Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507E8606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 17:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yVHZ46T8;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Jvb50AXx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y9Z+7orzJdSx58L4lqUe9cGolgKUXKFkRTuN7SA8P9w=; b=yVHZ46T8+kRQYM+fnc1xr/3jae
	Cfg08hA5RHRtrx6Pf/+6HUKWmueumwj4o5wg8DQcF031FggS2YJ/e1C8yRuAQ7EPjtBg6M0wqntUP
	H+iGjWfqbB+KHyCh6BUT/GG/v9Tm/1k5301ZRRYN4RkNvjM7kriky8PSczgfbNrx1BeLDM7ryCHeJ
	S65d+jFChImpX/EnDsKp+vlvihiEbyTz2wZaI38lXt+4s7b18MxbW/bpcni7bKp1iA6IZzT82K3sD
	m7yGHsZvr3Ip/wjCytDth4fnhuHOX02rIpYrVp+kdrBeNIJxWnEe/BDem4o9HlrWx4nOm6qeBs0qa
	PUIjYxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBun-00000007HNc-3szZ;
	Wed, 11 Nov 2026 17:15:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBuj-00000007HN7-3Ctg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 17:15:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDE101576;
	Wed, 11 Nov 2026 09:15:07 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9914B3F632;
	Wed, 11 Nov 2026 09:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794417310; bh=2McGIo0I0qUn9Z5Bkhx58ruHvjbNzDromBqTIw7cA/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jvb50AXxGnQj9GSO/QAEN0TazkCWaZ2N/9XsGCnE/0y+001MSDX3Em9LlDYbwWLNr
	 QRDX5Hvi6PR46zWdXB3NvONbRrGlXeIODQnhFpC2TzOqBoUZ6eYJfpjZ9s38QMUWTJ
	 h5VqXB7zhPj4AiQnK6JXy4lYVlq3qKZ2O2qQgOvU=
Date: Wed, 11 Nov 2026 17:14:48 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, will@kernel.org, mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: Re: [RFC PATCH v7 02/28] arm64/sysreg: Define MDCR_EL2.E2PB values
Message-ID: <avSiiFvN13FqNCDm@raptor>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-3-alexandru.elisei@arm.com>
 <atDUMAe0QGP_4swk@gremlin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atDUMAe0QGP_4swk@gremlin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_091514_000547_B9584987 
X-CRM114-Status: GOOD (  27.79  )
X-Spam-Score: -4.4 (----)
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

Hi Lorenzo,

On Thu, Oct 15, 2026 at 02:52:32PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Sep 03, 2026 at 05:05:57PM +0100, Alexandru Elisei wrote:
> > KVM will make use of the different values for MDCR_EL2.E2PB, document them.
> 
> As with 1/28, using [0] to check the definition of the register.
> 
> >
> > Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> 
> Looks correct, a couple small nits below, with those addressed:
> 
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
> > ---
> >  arch/arm64/tools/sysreg | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> > index a11a968eb707..4485736a4f49 100644
> > --- a/arch/arm64/tools/sysreg
> > +++ b/arch/arm64/tools/sysreg
> > @@ -4045,7 +4045,12 @@ Field	17	HPMD
> >  Res0	16
> >  Field	15	EnSPM
> >  Field	14	TPMS
> > -Field	13:12	E2PB
> > +UnsignedEnum	13:12 E2PB
> 
> MEGA NIT: Shouldn't there be a tab rather than a space after '13:12'? :)

Fixed.

> 
> > +	0b00	EL2
> 
> So broadly - this means EL2 owns the profiling buffer right?

Yes.

> 
> This seems to align with the document (which is very verbose, obviously :):
> 
> "If EL2 is implemented and enabled in the Profiling Buffer owning Security
> state, then the Profiling Buffer owning Exception level is EL2. Otherwise,
> the Profiling Buffer owning Exception level is EL1 and, Profiling is
> prohibited at EL2."
> 
> "If EL2 is implemented and enabled in the current Security state, then
> accesses to Profiling Buffer System registers at EL1 are trapped to EL2,
> unless the access generates a higher priority exception."
> 
> > +	0b01	RESERVED
> 
> NIT: Hmm, it seems to be the convention to just omit entries that are
> missing from the definition in the docs? So is this needed?

Removed.

> 
> I see a couple named ones, e.g. in CTR_EL0.L1Ip:
> 
> 	# This was named as VPIPT in the ARM but now documented as reserved
> 	0b00	RESERVED_VPIPT
> 	# This is named as AIVIVT in the ARM but documented as reserved
> 	0b01	RESERVED_AIVIVT
> 
> Which have comments explaining why, i.e. they were defined before but are
> now reserved.
> 
> > +	0b10	EL1_TRAP
> 
> Again my understanding - EL1 owns the profiling buffer, but EL1 sysreg
> accesses trap to EL2?

Yes.

> 
> Seems to align with docs:
> 
> "Profiling Buffer owning Exception level is EL1. Profiling is prohibited at
> EL2."
> 
> "If EL2 is implemented and enabled in the current Security state, then
> accesses to Profiling Buffer System registers at EL1 are trapped to EL2,
> unless the access generates a higher priority exception."
> 
> > +	0b11	EL1
> 
> And finally - EL1, traps to EL1 too right?

Profiling buffer owning exception level is EL1, accesses to the profiling buffer
registers made at EL1 are not trapped.

For the exact trapping priority and possible trap configurations, you can have a
look at the pseudocode for accessing one of the profiling buffer system
registers (PMBSR_EL1, PMPTR_EL1 or PMBLIMITR_EL1).

> 
> Again seems to align with docs:
> 
> "Profiling Buffer owning Exception level is EL1. Profiling is prohibited at
> EL2."
> 
> "Accesses to Profiling Buffer System registers at EL1 are not trapped by
> this mechanism."
> 
> > +EndEnum
> >  Field	11	TDRA
> >  Field	10	TDOSA
> >  Field	9	TDA
> > --
> > 2.43.0
> >
> >
> 
> All LGTM!

Thanks,
Alex

> 
> --
> Cheers, Lorenzo
> 
> [0]:https://support.arm.com/documentation/ddi0601/2026-09/AArch64-Registers/MDCR-EL2--Monitor-Debug-Configuration-Register--EL2-?lang=en


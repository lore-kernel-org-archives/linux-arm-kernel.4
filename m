Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBA1606A89B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 17:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qCVGdyKI;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TuSee7pi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=blGIJDCDss+E3b9SqzgbEdlWTUpb2T+aJik+W4Q8e9Y=; b=qCVGdyKI8pAxs5Vy6q/RdTFhn/
	JPKWZOBK+ciJz/Ulo7BbTzV32fcEnAmJS2f54v8xDIxt/RWj1VTXGCXFgD4EoiGkmjlJckeIgfKFN
	j0ZBeQU17ufdREfzZR3c6apaGhNU1OgK42XBEoV8CH0tK0LFqXRAcenX5yZyGto3+QJ37/aeWRG3Q
	UXvi73Pt+aj6n/A1HjvLZIR0SAThluMQUED4HN/ZkZ7XkpnaNl1CDqF3vUTZO8SSY9Ieh1qJfb3FY
	Q8RSRhlFI64T2/8Rdh0l+tHF/VOdBt/5MIpvGXiYWgXkIu6qPzNpxvL3BLRRZ+6Z4tcBxnzLk1s+V
	IrFfPBnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0re-00000003S8b-1UnR;
	Mon, 16 Nov 2026 17:51:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0rd-00000003S8I-0nEV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 17:51:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 44D51605F0;
	Mon, 16 Nov 2026 17:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290F51F000C4;
	Mon, 16 Nov 2026 17:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794851492;
	bh=blGIJDCDss+E3b9SqzgbEdlWTUpb2T+aJik+W4Q8e9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TuSee7pijL/EQxTZBDS2rvh9VhYUoswVcG+r5Rfl+jzNs9/BAeEA+G64PHMQljEW4
	 S7+o2QcBzV702jg+VlVZ8U1n54eSLYBffN0NJagqWuWShBpfKdl7g64a6qJTsZdjtp
	 uo27CFZfolNpxff3rCt5GoXjpBUS4UCmkjE4y7FrYprtQE8H5Z3M1Dbi67VA3R92IN
	 vJYjoXxHlMokNSSaxfRvRZCrmrdiW5iraCRMUDAxw2kwl3p0Oin+ILPZFgHPaPcRgv
	 ayWoJKO5MJUOllsnyyLN1vcPoBndg3uq5ncW3/V8OCovO2qRViX3sEYv4YGIexL4vR
	 s9kNVS4WatYdQ==
Date: Mon, 16 Nov 2026 17:51:25 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org
Subject: Re: [RFC PATCH v7 00/28] KVM: arm64: Add Statistical Profiling
 Extension (SPE) support
Message-ID: <avs9oxfRNGiIi8an@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <auy-TwnMbIn-r2xl@gremlin>
 <au29ACRXFEOXaWPV@raptor>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au29ACRXFEOXaWPV@raptor>
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

On Fri, Nov 06, 2026 at 11:41:52AM +0000, Alexandru Elisei wrote:
> Hi Lorenzo,
>
> On Thu, Nov 05, 2026 at 05:47:45PM +0000, Lorenzo Stoakes (ARM) wrote:
> > Hi Alex,
> >
> > I've gone through all of the patches now, thank you for your patience with
> > the review :)
>
> Many thanks for the stellar review, will start replying soonish.
>
> >
> > So there are various dependencies/architectural decisions that need to be
> > made here to go from RFC -> non-RFC:
> >
> > 1. The 'Ignore MMU notifiers for guest_memfd-only memslots' patch [0] is a
> >    hard dependency for the series. I chased over there, hopefully we can
> >    get something landed there.
>
> Like you said, Sean is planning to send my original version of that patch with
> an updated commit message, thanks for the ping!

No worries! :)

>
> >
> > 2. non-VHE, pKVM, NV disallowed for SPE - As I mentioned off-list, I spoke
> >    to Marc, and he confirmed that he's more than happy for these to be off
> >    the table for a v1. So I think you can drop the HACK: patches and just
> >    make these conditions of using SPE.
>
> Oliver, some time ago, expressed the opposite preference: VHE-only is OK for an
> RFC, but he was concerned about the discrepancy between VHE and nVHE
> configurations. Maybe the direction for KVM changed in the meantime.
>
> Fine by me to drop the HACK! patches, of course, that's just something to keep
> in mind.

Ack, Oliver - let us know if this is a problem (Marc suggested he was fine with
requiring VHE), I think certainly it's useful most of all to move forwards
without the 'HACK' patches, and with the various architectural points raised
here addressed we can look to a non-RFC series.

And obviously we can update as necessary as we go based on maintainer
requirements.

>
> >
> > 3. The entire VM needs to be pre-faulted, but who should do it? - I do
> >    think that relying on userland to do this is a little iffy. So I wonder
>
> There's plenty of iffiness that userspace already handles when it comes to
> virtual machines.

Yup, does seem to be a fair bit of implicit assumptions of sanity :)

>
> Or, how Oliver put it [1] (regarding migration, but it fits):
>
> 'My take is that there's no amount of idiot-proofing we can do in KVM to prevent
> the VMM from messing this up somehow'.

Haha, right.

I guess fine to require userland to set things up like that, and can always add
an option to have it automatically set up for them in future as a nice-to-have.

I want to separate out the gmem bit though, replying below:

>
> [1] https://lore.kernel.org/kvm/alE3jRLtYeq-WesA@kernel.org/
>
> >    whether it might be possible to, on SPE first run, prefault the ranges
> >    there, and make that a condition of using it? Relatedly, KVM could
> >    reject non-guest_memfd memslots for an SPE VM rather than trusting
> >    userspace there too.
>
> I'm not sure that's the best idea. Mainly two reasons:
>
> 1. KVM will be imposing the condition that *all* writable memslots be backed by
> guest_memfd, and *all* memory backing these memslots be pre-faulted and
> effectively pinned.

I mean this really is a requirement for SPE to work at all, since the guest is
effectively deciding which memory is being used for SPE (I think it's perf AUX
memory right?)

I think given that it's guest-designated _and_ the guest has no idea which parts
of memory are 'SPE safe' and 'SPE unsafe', this is a requirement.

>
> There are use cases for writable memslots to describe guest memory that won't be
> used by SPE. First thing that comes to mind would be paravirtualized interfaces
> between host userspace and the guest. For example, pvtime - kvmtool creates a
> RAM memslot for pvtime (i.e, non-read-only memslot), and it looks to me that
> qemu does the same (but my knowledge of qemu is severely limited, so I might be
> completely wrong).

I don't think any of this is disallowed by the gmem requirement.

>
> Then there's also the possibility that a guest might want to assign a slice of
> RAM for use by SPE, to avoid pre-faulting and pinning the entire VM memory. In
> this case, userspace will want to have *only* the memslot describing that slice
> pre-faulted and pinned, and not the rest of system memory.

As above, there's just no way for userspace to know which bits of memory are SPE
safe and which are not. So I don't think this works.

>
> 2. Perfomance - userspace can pre-fault in parallel, KVM cannot easily do that.
>
> arm64 now has support for KVM_PRE_FAULT_MEMORY, I say let's use that :)

:) right.

OK, so maybe the right path then is to keep the prefaulting with userspace, but
I really do think we have to have KVM reject a writable non-gmem memslot once
SPE is enabled for the VM (and reject enabling SPE if one already exists).

That should be relatively straightforward and avoids at least the most broken
userland mistakes.

>
> >
> > 4. Dirty page logging - patch 27/28 relies on series [1] being landed,
> >    which is also an RFC, and allows migration of SPE VMs. So we need to
> >    decide - do we want this migration? Additionally, I think it's
> >    reasonable to, if we want it, send both [1] and patch 27/28 as a follow
> >    up separate from the v1 non-RFC of the series.
>
> For background, I started this conversation in the LOG_DIRTY_PAGES support for
> guest_memfd series [2]. Oliver had some concerns, but he didn't follow up on my
> explanations, so I decided to send migration support as part of SPE so people
> can have a more complete picture of how everything fits together.
>
> I would be very happy to get basic support for SPE merged in KVM, and, if we
> decide it's useful, migration implemented as a follow up, as that involves
> landing dirty page logging support for guest_memfd.

Ack, thanks, let's treat that as a follow-up then, I think best thing here is
definitely to focus on getting the fundamental bits in for SPE first.

>
> [2] https://lore.kernel.org/kvm/alAFmiAsNf6Xm49_@kernel.org/
>
> >
> > 5. Errata handling - the default already disallows SPE on the affected
> >    silicon, which seems right. I wonder whether kvm-arm.ignore_spe_errata
> >    should exist at all though, other than in some sort of debug mode.
>
> It is intended as a debug/development option, to be used only when the VMs are
> trusted. As to why it's there, it's there because without it, SPE would be
> disabled on all the machines that I have access to, and I suspect systems not
> affected are few and rare between.

Ack ok that clarifies that :) let's then clearly mark that as such
e.g. 'debug/development only, trusted VMs only' in the documentation, and
tainting the kernel if it's enabled, I think, would be sensible.

>
> >
> > So 1 is a known dependency, I think there's no getting around that, and
> > thus that makes merging [0] or something like it a top priority.
> >
> > It seems to me 2 is pretty clear-cut, and 4 can reasonably (if we want it)
> > be sent as a follow up.
> >
> > So really 3 and 5 are the decisions to make here!
>
> I really appreciate your enthusiasm, thanks!

No worries :) am happy to put in some work on my side to help move things
forwards (and obviously more than happy to help with review on respins of
course :)

>
> Alex

--
Cheers, Lorenzo


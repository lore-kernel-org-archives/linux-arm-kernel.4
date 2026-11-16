Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EF2606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SuDyLgls;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=crR46lRa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S7e5/3qhMzwHmcdOrhg3u7+owObXooEMey9O5v8c82I=; b=SuDyLglswwLSlx7wID6weVRQ7O
	7bpq4lDEDe/VUCoHflxkEA3DbEIws8j5ny/xdyolJx2IzC6MILtJAA2EyflTXmrs0dY/01Z8TveNN
	m1F1PhaeTqIPfKOJaiC+nY5tFgpJueEbAHzkK2Iw6koEx6NpIq8JACFIN4M7BwNJJ8qq+zpHAl6xT
	aMJ/940lpclVeGRhRlv3bRAEIZPKZR49vasEZlIbxeshx+wUoUpNKXqel2CqYZ+isgfY1PCRCYJ3C
	zD+EKjKOKZjC+9pdt2hNX3dUfBCVLYkjA5NfZS/blV+a57ZtPx1CTTEFLmFy8zU26udvydpgSAbRO
	UwvF4LQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1U1-00000003ZON-1f9M;
	Mon, 16 Nov 2026 18:31:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1U0-00000003ZNd-45ZE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:31:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6910941E4B;
	Mon, 16 Nov 2026 18:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB1E1F000C4;
	Mon, 16 Nov 2026 18:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794853872;
	bh=S7e5/3qhMzwHmcdOrhg3u7+owObXooEMey9O5v8c82I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=crR46lRanQeAEbsu7dj9ejzkWarMyTE/KgmXszbgPd4x/5fhj4QZ4a3G7UCHVFjus
	 kQmCiu8Nru5pGrzH1NhMFCtcRvGNtOnWEWjYR3t3o2lkrDsmgLl90kFUwh4lDh2l6y
	 YghpD/Bl7eUI8eHkteuehVpoBjx7+8wAFB64aowvkRXhOjJkQ4iSGuQzQVqvNcxfS9
	 0wYf7KlRrWQrqsPs34Vdu2LSr/b04K2bPUeDiuiQQ52iNttgoOAbPsu7SxmL2yvSCn
	 BagwxznYuUMIFk+Wpfu1xumVYR3Te5REvfFbPSntQhf2Se/WwptBq7NtYFTNN5Kret
	 PhGnqfB9wDFvg==
Date: Mon, 16 Nov 2026 18:31:06 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org
Subject: Re: [RFC PATCH v7 06/28] KVM: arm64: Add KVM_CAP_ARM_SPE capability
Message-ID: <avtL0nlA1plEURmz@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-7-alexandru.elisei@arm.com>
 <atDtheEuNRs7v3Gx@gremlin>
 <avXcdwY89YPFGIlk@raptor>
 <avXloVVaBeEwEplU@raptor>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avXloVVaBeEwEplU@raptor>
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

On Thu, Nov 12, 2026 at 04:13:21PM +0000, Alexandru Elisei wrote:
> Hi Lorenzo,
>
> On Thu, Nov 12, 2026 at 03:34:15PM +0000, Alexandru Elisei wrote:
> > Hi Lorenzo,
> >
> > On Thu, Oct 15, 2026 at 05:51:03PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > On Thu, Sep 03, 2026 at 05:06:01PM +0100, Alexandru Elisei wrote:
> > > > [..]
> > > > +	if (!entry)
> > > > +		return;
> > >
> > > Hmm, shouldn't failing to allocate here be an error, or at least a warning?
> >
> > I don't think it's something that should cause the probe to fail. I could
> > add a warning, I guess, to let the user know why KVM_CAP_ARM_SPE is missing
> > even though the SPE module was loaded successfully.
>
> On second thought, there's really no need to taint the kernel if the
> allocation fails, KVM and the SPE driver can still function correctly.
> Since the likelyhood of it happening is very low (it's a small allocation,
> only three pointers), and userspace can detect it happening because
> KVM_CAP_ARM_SPE is not available, I am inclined to keep it as it is and not
> print a warning.

OK, fair enough, this isn't a big deal, thanks! :)

>
> Thanks,
> Alex

--
Cheers, Lorenzo


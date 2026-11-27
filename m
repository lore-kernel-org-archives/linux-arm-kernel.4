Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772BE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t/ALulC7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XYj/5aIK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mQxZgNKSkFZULeyLBw2vkd1drkBFs/zA2t0nGqWgQgc=; b=t/ALulC787lLTCOogUQawtQpzr
	36CqznCh8cBGbH2yfuNrWMFe7ngVrTgwoGm6EcU9BQE5gX5BH7rVoLU638iYSm1lSlnzT4T1Hokzh
	NrCeUIUMe7Dvj4ar/N1UL4lbhwD+RXOxYgjoWzkn0gfm3pV6vbk9y0qSIZPCy976iWvJoUpbMe0Xh
	Aq6+7OSNlBBRA2Fd/+CQWIHTHS04PmsMpkuZ3G9Db4L3sOxEOGPCkRChesIB+uJMWybNOIp1muQQA
	ObIDPYY/f+zyz0YXX7dm0J4oYDcrjyEU4cJ0RWTimcHsz0JMAjbhbJphl862C8VA+8z9D3GrT/+HT
	wjLQTJuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0uI-0000000HSPD-12VN;
	Fri, 27 Nov 2026 18:42:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0tZ-0000000HSIx-4BQ1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:42:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD95345094;
	Fri, 27 Nov 2026 18:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066D51F000C1;
	Fri, 27 Nov 2026 18:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804925;
	bh=mQxZgNKSkFZULeyLBw2vkd1drkBFs/zA2t0nGqWgQgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XYj/5aIKNje6JqthDkZWWZV2dFVOaTWo1mSJQvN9E+Qg0p+X3ARO8tlqC+MYAkTYm
	 KvWle6r2yvC2Iy494gl4yy8yDy3A+r3GwKtjZl0cvybwme6L9vtdCywKy7Af1u9Vwo
	 p33FGVv0tnWC1iKGIJOSN2YesWiXpjdqxKB443FdN2G7fla33C8dVgiddJPGDvUSQF
	 Yax+2rZzmXJcpcHok+Th0zG2l+NT4Gh8GDrgRbmPt3CXGzqihILzDN++VcUPDSrg5N
	 rgh5FdVYHzW/YypwsyyvBfzGjMl/iKi5JlA4XclsWoxBkZ+gVy5HvLBYI9WCl+gQQm
	 drkcRuf7RSTCA==
Date: Fri, 27 Nov 2026 18:42:00 +0000
From: Will Deacon <will@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, leo.bras@arm.com
Subject: Re: [PATCH RESEND] arm64: sleep: factor sleep_save_stash slot lookup
 into a macro
Message-ID: <awnO-FqQDd97ydiP@willie-the-truck>
References: <20260919121044.13883-1-brads@mainlining.org>
 <29F5ED22-7DB5-4AF9-B999-CB3BAAB9A9E2@mainlining.org>
 <6376e301-c6ef-4094-83de-83ea9d17791a@arm.com>
 <2442108F-EE55-40AB-A33C-DEFE0364F704@mainlining.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2442108F-EE55-40AB-A33C-DEFE0364F704@mainlining.org>
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

On Wed, Oct 07, 2026 at 03:57:35PM +0100, Bradley Morgan wrote:
> On 7 October 2026 07:45:18 BST, Vladimir Murzin <vladimir.murzin@arm.com>
> wrote:
> >On 10/4/26 14:05, Bradley Morgan wrote:
> >> On 19 September 2026 13:10:44 BST, Bradley Morgan <brads@mainlining.org>
> >> wrote:
> >>> Both __cpu_suspend_enter() and _cpu_resume() open code the same
> >>> MPIDR_EL1 hash lookup to find the current CPU's slot in
> >>> sleep_save_stash. Factor it into a get_sleep_stash_slot
> >>> macro.
> >>>
> >>> Since that macro would be the only remaining user of
> >>> compute_mpidr_hash, inline the hash computation into
> >>> get_sleep_stash_slot and just remove compute_mpidr_hash
> >>> altogether.
> >> +CC more people, polite ping on this patch guys! :)
> >> 
> >
> >I'm not sure it makes the code clearer:
> >
> >- I see that Will suggested inlining compute_mpidr_hash, but to
> >  my taste, a dedicated helper is easier to comprehend.
> 
> Hmm... It's a bit 50/50 to me.
> 
> >
> >- The new get_sleep_stash_slot uses a mix of fixed and
> >  parameterised registers, which forces the reader to look at how
> >  the registers are used. Also using fixed registers shifts the
> >  burden of making them available to the user of the macro.
> 
> Well, will, any justification?
> 
> The macro at the moment only has one user, so it's pointless to account
> forusers at the moment..

I tend to agree. This macro is private to sleep.S, which is already
doing unholy things with the CPU registers and I don't think named
register parameters are really a concern. In fact, I think the only
reason we need to do any of this hashing in asm is so that we can
retrieve our stack pointer on the resume path.

I would, however, agree with Vladimir that using a mixture of named
register parameters and fixed registers is confusing. So I'd probably
just make the thing behave like a function and unconditionally return the
slot in x0. In fact, we probably could make it a real function if we
tail-called it on the resume path and rewrote the hashing on the suspend
path in C, but I'm not sure whether that's better or not.

Will


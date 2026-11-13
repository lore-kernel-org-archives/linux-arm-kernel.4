Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AD9606A89F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NeAKHv+i;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DlfnLIMw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mRkP4vCBEhwDwIItCpqDxdPiuMhmAWoHVv8GMq0ZNVE=; b=NeAKHv+iaQ4X9nUYUi1BVyrMrB
	hpTnvLwXTpv1a/jvDy8PbJf+/K80ax5zPkljv9xAZ3ywZ9jgySU6UXv++ec+GfnlnxVyE6oJuGwKv
	VYwchxyYDfZ29J8pvXH7oDOp/ZvISrFjJyahHsMQT1bHInUW472q3a24qKZxZSIsMxN9Zc98PeN5I
	OF0i2/mJ4/+wAWohLeB6lJi+Q1LapDM5QiAC3MJnCQDsU8A854YzW+rv0yl0poEy54E14QtD6KXrN
	JWu0WemFuPfKYcO/Puv7wz7aXe1w20iJ+gXLUiQ6wwXSEqOopYkQyH1bALoMvjuUInFMcuUSnfy3J
	XrFcRo6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrLa-0000000CxMT-3qoB;
	Fri, 13 Nov 2026 13:29:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrLa-0000000CxM3-0AXA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:29:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B24B612ED;
	Fri, 13 Nov 2026 13:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906B01F000C4;
	Fri, 13 Nov 2026 13:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794576581;
	bh=mRkP4vCBEhwDwIItCpqDxdPiuMhmAWoHVv8GMq0ZNVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DlfnLIMwN2cGm60Lm5wvzQwZPQSEoJ1NEOBxiV0pRcJDHB8KOEVBRTEIB+jq3xMKL
	 aDeuyD3r6ySM9HG1mLuVemktGLPh8HegaxK8cp/GJjEtYRLiFmIUh1F5zvbCNHYpti
	 DOyEcPdNXgOP2mpJA5R5VVU5v4W3RJ8CKSibz03YjWDqImb6iqYQMD6CzqOxphqhpg
	 5egjD/b5OOUzbuG5LApa10dWDUuQgPNQbQiqoQxaoAgBI3G6Mler/U67nVvm+Y9G0d
	 QXLrvPoB1HgL9jXtKAoNwh7Fvo0DiF44ytwUtEUCAM6uhRlwUXeBYxq6BHcnbFveRY
	 l1hdk8ixRzYig==
Date: Fri, 13 Nov 2026 13:29:35 +0000
From: Will Deacon <will@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Zhao Gongyi <zhaogongyi@bytedance.com>, catalin.marinas@arm.com,
	mark.rutland@arm.com, ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kees@kernel.org
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <avcQv3CPk4uxPl70@willie-the-truck>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com>
 <attf9KALBQyOGyco@redhat.com>
 <aus7mMS4tXAzPCSi@willie-the-truck>
 <avHN-qWRu--arO8a@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avHN-qWRu--arO8a@redhat.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 02:43:22PM +0100, Oleg Nesterov wrote:
> On 11/04, Will Deacon wrote:
> >
> > > > @@ -588,7 +584,7 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
> > > >  	 * Don't update orig_x0 for a syscall-exit-stop, as x0 now contains the
> > > >  	 * return value of the system call.
> > > >  	 */
> > > > -	if ((info->si_code & ~0x80) == SIGTRAP &&
> > > > +	if (info && (info->si_code & ~0x80) == SIGTRAP &&
> > > >  	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT) {
> > > >  		return;
> > >
> > > LGTM, but I don't understand this arm-specific code.
> >
> > Welcome to the club :)
> 
> Thank you ;)
> 
> > The original rationale is described in e057b9477232 ("arm64: syscall:
> > Ensure saved x0 is kept in-sync with tracer updates"), so hopefully that
> > helps to set the scene.
> 
> [...snip...]
> 
> Thanks for your explanations. Yes, I tried to read that and other commits.
> The only result is that I've managed to convinced myself that more or less
> I understand why 88b839ce497c and 5a87e8c7f3702 make sense.
> 
> > So that's the mess we're in and I'm all ears if there's a cleaner way to
> > sort it out without breaking anything that relies on the fragile semantics
> > we already have.
> 
> No, I can't suggest anything better. I think your patches and the fix from
> Zhao are fine.
> 
> ----------------------------------------------------------------------------
> Now the question...
> 
> So we had CVE-2026-68171 and then it was rejected:
> https://lore.kernel.org/linux-cve-announce/2026081123-REJECTED-f1f0@gregkh/
> 
> Now we have another one, CVE-2026-90347
> https://lore.kernel.org/linux-cve-announce/2026091703-CVE-2026-90347-6f2c@gregkh/
> 
> Why?
> 
> To me the problem looks minor (security wise). Yes, a malicious debugger can
> fool seccomp. So what? What is the real problem from the scurity perspective?

I think the security rationale probably goes back to a5cd110cb836
("arm64/ptrace: run seccomp after ptrace") so you'd need to ask Kees!

I suspect that some environments (Android?) don't want the tracer to be
able to execute arbitrary system calls in the context of the tracee.

Will


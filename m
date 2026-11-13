Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999CF60A3825
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=056UhbJL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YgpSEFyf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u9a3QqEM0vSfXTrUaogBVZSa5WWTyqFNUXuzV873bjU=; b=056UhbJLoYDH2xOHPxHvZLMQZs
	jD3inC6Pgb333AEgUNckAr+Es252eZB8PcEqWT0ZSZkFNWqaOtARmRTZ3tizQ7qqksJS493kuAvs+
	jeyU1+HpFsK0aVMpR52p418bBNmlV5+JSsS7BuSQeiYQc0s9xdH5Tfb6GvFITppBvSwwjHEn7lNng
	hhQ68lxE1yhoa/ICkeKAh0PTto6f4C6qd1ZygQUulywJF2ub8MO9i3OIdi130/5EYnwrKcIekQt70
	+hgOgpHRQmDqJWcx+z73hSPBoLYrj4GsYRSECShFk7Shhvydok/g962kaBFRm+4dtUHy0v8ywIyv7
	zcWDUlqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrGs-0000000CvHF-2Udw;
	Fri, 13 Nov 2026 13:24:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrGr-0000000CvG4-325i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:24:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2554160D94;
	Fri, 13 Nov 2026 13:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650B31F000C4;
	Fri, 13 Nov 2026 13:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794576288;
	bh=u9a3QqEM0vSfXTrUaogBVZSa5WWTyqFNUXuzV873bjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YgpSEFyf4mKL+1E2nFyvbEiXeqrlz/27QZWcR3UBnuxXRIQIBE+AwqKsbc6D3U1JH
	 xzIjyGRDalxYrnf8yNQGOBAeBxlOPNS/1vBDDoSwPPYSeqdi0scpZ/HjkOpEbjYDtA
	 KR6CqjgLjpMd8kmG/TQ3HB3kk6VJD06/G4OawD7XvkiiSThn4hc0x0UCZ8LbS+JyMQ
	 897s2nZJ2d51B80OG5Rxf1lMjcbEFwIX4JhDf4+OuQONOstvXIAFM7YeuSAD3G2S5J
	 meUplC099/Bhe4nYGlHvgol2fmj/cr4JADJ9wn+vXnOjyd/wOYnEN5B6BY0QSDA79C
	 vywl5lVzUeUXg==
Date: Fri, 13 Nov 2026 13:24:43 +0000
From: Will Deacon <will@kernel.org>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, mark.rutland@arm.com,
	oleg@redhat.com, ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <avcPmzjYGc-uHMkU@willie-the-truck>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com>
 <at-czRUYRPRxi9dy@arm.com>
 <aus2Aq12Z-PKvoW7@willie-the-truck>
 <56ed8952-fb5a-4f88-90c9-6fe5476237cc@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56ed8952-fb5a-4f88-90c9-6fe5476237cc@bytedance.com>
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

On Thu, Nov 05, 2026 at 12:15:24PM +0800, Zhao Gongyi wrote:
> Hi Will,
> 
> On 11/4/26 9:41 PM, Will Deacon wrote:
> > I can't quite get my head around what it means to set NT_ARM_SYSTEM_CALL
> > in this context. Suddenly, in_syscall() will return true, which has
> > implications for things like signal handling that seem bizarre if we're
> > not actually in a syscall. Should we be avoiding this situation to start
> > with?
> > 
> 
> I ran an additional arm64 KVM test with SIGUSR1 and SIGUSR2 queued at a
> group-stop. After the tracer set NT_ARM_SYSTEM_CALL to __NR_getpid, the
> second signal-handling pass saw syscallno=172 (the control saw -1),
> although the task had not entered a syscall. I did not observe an
> incorrect restart: x0 held the first signal number (10) by that point.
> 
> system_call_set() assigns syscallno before calling
> update_syscall_orig_x0_after_ptrace(), so retaining the early return
> will not prevent that state. I can investigate separately whether the
> regset write should be rejected at such a stop.

Thanks. We probably need to be careful about tightening this up, but if
the current semantics are just that "things go wrong" in some way, then
I think it might be worth it.

Will


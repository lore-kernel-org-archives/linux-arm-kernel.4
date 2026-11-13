Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23118606B54D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a38VkqcC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SFihnx7j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pZ6gA3Y+UTcqk8KmHhY+CJP8JY6AZLSla8IhLC9FqDU=; b=a38VkqcCs4JaTq4WN1lJOY9JPx
	rUSec/4i6+q71k5ANIFIxeNg9T1p6wi2P8I+y5aO0m9WxuyfiqArSbgVtavWXylZNFlW5jGkvXBFw
	vWvOim/M7uFG1iQN+91/RjtOJ1fN7Wlpja4e+t9WiXCTALucLk4NHwqMCCU99vP52Rdui+wFtmfWO
	V+vBFt4QBP3SGLplUdAKjd6JAKIcghZ+WWKtYsqMZEasHoFWuRQJTBb0Jcq7/lyZ2Ff0Dh2bgP+Zf
	y+aYKjzaGCtykNVweGc7v12SfDXBIHpR/gBGTEIvPy4lJmJzfamz1DVk8eYgZAad2DoTrUXO8SHcf
	lycFjyjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrE3-0000000CtQ8-35UP;
	Fri, 13 Nov 2026 13:21:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrE1-0000000CtPq-3EwZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:21:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D49C761200;
	Fri, 13 Nov 2026 13:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2151D1F000C4;
	Fri, 13 Nov 2026 13:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794576112;
	bh=pZ6gA3Y+UTcqk8KmHhY+CJP8JY6AZLSla8IhLC9FqDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SFihnx7jSrjWjs5js7rSDIK1hTYPBwFLTzOLa2x8uJBOUEXFZKNqZSUGqLlfOZpbs
	 KeBJpg9QkbCD9SV+HIeNaO4A29AsXDxtE3t3vdjhGOpOixBzqnKdBT52Y5s6m/SOfF
	 K26M2Tko74C4tsFWFuuTjuXwawROhZJS9o2cQCs7LaXNhJl63K9+Cs9vcK9Uh81TSV
	 mPvgVRBfqq3n8Qrbpy2L9bL6bikAV4qO0uAmtoCZv9dZMu/69nZFcPZz31iUFMD/9O
	 xIsBleFBF/f/9ahjN76NUF+rdVjHYW9NuS2YBuPaNjHUHIKGCEPen5likWLQMMiDEa
	 PmJHoL7Vr6FKg==
Date: Fri, 13 Nov 2026 13:21:47 +0000
From: Will Deacon <will@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Zhao Gongyi <zhaogongyi@bytedance.com>, catalin.marinas@arm.com,
	mark.rutland@arm.com, ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <avcO66Wk6V7oJ4xj@willie-the-truck>
References: <20261105113051.97810-1-zhaogongyi@bytedance.com>
 <avDGjYYR6Tj1sVgP@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avDGjYYR6Tj1sVgP@redhat.com>
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

On Sun, Nov 08, 2026 at 07:59:25PM +0100, Oleg Nesterov wrote:
> On 11/05, Zhao Gongyi wrote:
> >
> > --- a/arch/arm64/kernel/ptrace.c
> > +++ b/arch/arm64/kernel/ptrace.c
> > @@ -573,8 +573,8 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
> >  	if (regs->syscallno == NO_SYSCALL)
> >  		return;
> >
> > -	/* We should only be called when target is in a ptrace stop */
> > -	if (WARN_ON_ONCE(!info))
> > +	/* Non-seized group-stops do not provide siginfo (see do_jobctl_trap()). */
> > +	if (!info)
> >  		return;
> 
> First of all, FWIW
> 
> Acked-by: Oleg Nesterov <oleg@redhat.com>
> 
> This change is "obviously good" and doesn't change the current behaviour.
> 
> 
> 
> ----------------------------------------------------------------------------
> But can't resist... The old comment was obviously wrong, the new one doesn't
> look clear to me. It correctly explains why info can be NULL, but not why we
> should not update orig_x0 in this case. May be it should just say that exit-stop
> always comes with info != NULL?
> 
> Nevermind, I leave this to you, Catalin, and Will.

Yes, I think it makes more sense to talk about the exit-stop, as that
is what this code cares about. Something like:

"For exit-stops, info is always non-NULL, but that's not true for other
 stops such as non-seized group-stops. In those cases, just return early
 as there's no need to update orig_x0 anyway."

With that (or something like it):

Acked-by: Will Deacon <will@kernel.org>

Thanks,

Will


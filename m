Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A5F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k+++DJ7H;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h+WxKwoB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HONgwvcLnwdQ2wr7NdDYe7XePSqL8bRXwzbHmI19pt4=; b=k+++DJ7H59XRy6
	MEBWi8XlydYNUe7bZjJCbtwh1nlpE4szFGaIy+D0OCE5yc7qcqI1uTUR3z055KMj7bXsdnK1FabbR
	KtaWweO5mCBwyVVQgbS9a3M7SB1px3hPfhyReq9o5yozYU+cuz/r3nYaoSgu+2rsFG2P5U7eLi/5/
	JNk5VLjTR8Z+eLwUvFE52ZcsyQAOY2kn90v1fcLgYzo9P/a9qeAstgBallBFhvWGNmR/4hESSxQw4
	8eIS2CeLB/V3wxpZ70fugI9UAi/C+c+AtKgb6v5JCUqEWe0UaNC9vP8LmAUt0dxbfCv++KXe6Umau
	tW1ptk5TimLfQc4qdhiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRcb-000000032fW-0drq;
	Mon, 23 Nov 2026 10:50:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRcZ-000000032en-0ubL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:50:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32286143D;
	Mon, 23 Nov 2026 02:49:59 -0800 (PST)
Received: from [10.57.91.245] (unknown [10.57.91.245])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B8093F632;
	Mon, 23 Nov 2026 02:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795431002; bh=88wKm6a3kg+rRCdOpXoIcUGAgG5m2xf6YFDPEexucGk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h+WxKwoB8MqOR3y6DbBUX+gVZWSCUCEStlY/uJ4F5pyUZHSJkTOnOl5qaT+iImAQz
	 SibvFVG+nLxs2gyjgFTTpoSjEGXdKvhdtuB+LekSEzw6CMbTE4PCvbAGjhbsDR7iw6
	 1uPYGOcS1CkKqQFZ+hRzzeAZi6Hd+4PL/Q7rEBEs=
Message-ID: <85385aae-af06-4742-a39b-5a95e3e73a7e@arm.com>
Date: Mon, 23 Nov 2026 10:49:58 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: Mitigate Spectre v1 in the BPF interpreter
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, stable@vger.kernel.org
References: <20261117172341.3152407-1-ryan.roberts@arm.com>
 <DMYSI3BOQWOC.2P2FZB0H872DR@gmail.com> <awAay4FFj1_wQtaL@arm.com>
 <DN07ZMOAD4GP.37PG3XUPBG4CM@gmail.com>
 <a6cda8a2-992f-41f9-a814-ee78363c3a69@arm.com>
 <DN2ALO12MI1Z.3HI553HDMO2FL@gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <DN2ALO12MI1Z.3HI553HDMO2FL@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_025003_359854_1D859777 
X-CRM114-Status: GOOD (  30.11  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/11/2026 04:07, Alexei Starovoitov wrote:
> On Sun, Nov 22, 2026 at 12:58 AM Ryan Roberts <ryan.roberts@arm.com> wrote:
>> I view this patch as a fix to arm64, not as a fix to BPF. I haven't changed any
>> BPF code - I've only removed an out of date comment in BPF code, which assumed
>> the code path was for Spectre v4 only. But that's not true since Commit
>> dff883d9e93a ("bpf, arm64, powerpc: Change nospec to include v1 barrier").
> 
> Fair enough, but the arm64 part of that comment is stale.
> The verifier relies on nospec for v1 since
> commit d6f1c85f2253 ("bpf: Fall back to nospec for Spectre v1").
> 
>> arm64 was previously nop'ing barrier_nospec() despite seemingly needing it in
>> the same situation as x86. I think this is orthogonal to whether or not the BPF
>> interpreter permits speculation attacks in other places?
> 
> Not quite. In the interpreter the barrier sits behind an indirect branch:
> 
>   goto *jumptable[insn->code];
> 
> arm64 has no retpoline, and the prog can train this branch.
> With a wrong target the CPU skips ST_NOSPEC and runs the next insn.
> So the interpreter is still not safe.
> Yet you're arguing that you're making bpf interpreter a viable option
> on arm64. That's just not fair to users.

I'm not saying that at all. I wasn't aware that it previously considered unviable.

I noticed this particular issue while doing manual code inspection while working
on something else. I sent the patch to close what I perceived to be a bug to try
to be a good citizen.

> Say it in the commit log that you're fixing one tiny issue and leaving
> giant security hole in place.
> With that I'm no longer nacking it.

Happy to fix up the commit log as you suggest.

> 
>> Looking at bpf-next, it is still possible to deselect BPF_JIT when building. If
>> this is such a security issue, shouldn't we disallow that on arm64, or at the
>> every least make it an EXPERT option?
> 
> Yeah. Good point. Let's disallow it on arm64 and x86-64.
> 
> I'm thinking to push something like this
> 
> diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
> index d705d7b..8b8688d 100644
> --- a/kernel/bpf/Kconfig
> +++ b/kernel/bpf/Kconfig
> @@ -26,8 +26,8 @@ config HAVE_EBPF_JIT_KASAN
>  config ARCH_WANT_DEFAULT_BPF_JIT
>  	bool
>  
> -# Used by archs to tell that kernels that were compiled with BPF JIT support
> -# have no BPF interpreter.
> +# Used by archs to tell that kernels with the bpf() system call have the
> +# BPF JIT compiler and no BPF interpreter.
>  config ARCH_WANT_BPF_JIT_ALWAYS_ON
>  	bool
>  
> @@ -36,6 +36,7 @@ menu "BPF subsystem"
>  config BPF_SYSCALL
>  	bool "Enable bpf() system call"
>  	select BPF
> +	select BPF_JIT if ARCH_WANT_BPF_JIT_ALWAYS_ON
>  	select IRQ_WORK
>  	select NEED_TASKS_RCU
>  	select TASKS_TRACE_RCU

Seems reasonable as long as we're sure that there are no users that rely on the
interpreter on arm64 for some reason?

Would you propose that this is something that should be backported? If so, I'll
drop this patch. Otherwise, I'll send a v2 with a more cautious commit log.

Thanks,
Ryan



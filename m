Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C755606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SM1VJZzM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jDjzVVrU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=w49hyKAjJNYQc0T0xEVaI68+0oF+m2dcDRcRYzEk8rs=; b=SM1VJZzMUBLJpl
	XsOKV4Jv7xd6ryesSgKWAoOEBjQcQ0GIQodMzOHZgJgNzf2hcRUvm/Gbjwwyfles0md50ZngQXRLQ
	INnrXSGS4w8nt8lYdu/BAftlUv7yNFjGj/OKoSJ3wTzs1r+Oq0RrcaWS08oRq4d414D/+WJroyHi1
	MIYqbI3Ws+SEC+AGtmwRrj9pmTlp/ePgTGTy+xQWvFPxLIyvYXM/i+0IOzoRW6R2o3GW/6d5bs3cN
	vPVbWiWI7O8YQA2v8L8+GpgaewYn01/EdJeNWEUdDnOt8+TNgUGnUax+hKqfmR0DYV6E3PsbLomRp
	QRBv28zKHx5vlu8+ilsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsO2-0000000DBcU-0iHC;
	Fri, 13 Nov 2026 14:36:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsO1-0000000DBbp-2GTI;
	Fri, 13 Nov 2026 14:36:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 47A0540039;
	Fri, 13 Nov 2026 14:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B8A1F000C4;
	Fri, 13 Nov 2026 14:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794580577;
	bh=w49hyKAjJNYQc0T0xEVaI68+0oF+m2dcDRcRYzEk8rs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jDjzVVrUjcqqvOcF2zRf/R4D2SkobqauH5sB4E4FWc03X74m4jxFCQSio9YHHHuuR
	 9Ml4Tlrckfk60OSmZz+hec4p2l9kmjLvQBMrX/YWsRQQvgUFJp0NHQZIrCyw0Gwiek
	 QZbpgzhogd+cwsY3Nd25gGqUKt3Baw/aKdlCaoUNBkxmn6Z5pyPj2weF8qqKc3/A8M
	 /Hvf3OTZxfDyyZ1sLXoNdqhyld8LAWFVmEcfNS1X7e6OGeS63NUqhOrnPQq/ZF6Igj
	 DMtYYds7K9Hh4P0SFcSWYXYIJSddoBhMr/8mdEZ/t7+gx48plf7GD6vYahVdtRVM4l
	 DMbaEQTybkmNw==
Message-ID: <3f7af771-87a7-4ae7-9919-bc4c23bd31c9@kernel.org>
Date: Fri, 13 Nov 2026 15:36:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v8 11/16] powerpc: extend execmem_params for
 kprobes allocations
To: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>,
 Donald Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>, Liviu Dudau
 <liviu@dudau.co.uk>, Luis Chamberlain <mcgrof@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Russell King <linux@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>,
 Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 bpf@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
References: <20240505160628.2323363-1-rppt@kernel.org>
 <20240505160628.2323363-12-rppt@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20240505160628.2323363-12-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mike,

Looks like I missed this change ...

Le 05/05/2024 à 18:06, Mike Rapoport a écrit :
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> powerpc overrides kprobes::alloc_insn_page() to remove writable
> permissions when STRICT_MODULE_RWX is on.
> 
> Add definition of EXECMEM_KRPOBES to execmem_params to allow using the
> generic kprobes::alloc_insn_page() with the desired permissions.
> 
> As powerpc uses breakpoint instructions to inject kprobes, it does not
> need to constrain kprobe allocations to the modules area and can use the
> entire vmalloc address space.

Using breakpoint means the segment must still be executable.
On book3s/32 VMALLOC segment is not executable, while module segment is.

See commit 6ca055322da8 ("powerpc/32s: Use dedicated segment for modules 
with STRICT_KERNEL_RWX")

See report and fix at 
https://lore.kernel.org/all/ed03d290d440d579a81ae0b7de5243721291d903.1794543909.git.ritesh.list@gmail.com/

Christophe



> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>   arch/powerpc/kernel/kprobes.c | 20 --------------------
>   arch/powerpc/kernel/module.c  |  7 +++++++
>   2 files changed, 7 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index 9fcd01bb2ce6..14c5ddec3056 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -126,26 +126,6 @@ kprobe_opcode_t *arch_adjust_kprobe_addr(unsigned long addr, unsigned long offse
>   	return (kprobe_opcode_t *)(addr + offset);
>   }
>   
> -void *alloc_insn_page(void)
> -{
> -	void *page;
> -
> -	page = execmem_alloc(EXECMEM_KPROBES, PAGE_SIZE);
> -	if (!page)
> -		return NULL;
> -
> -	if (strict_module_rwx_enabled()) {
> -		int err = set_memory_rox((unsigned long)page, 1);
> -
> -		if (err)
> -			goto error;
> -	}
> -	return page;
> -error:
> -	execmem_free(page);
> -	return NULL;
> -}
> -
>   int arch_prepare_kprobe(struct kprobe *p)
>   {
>   	int ret = 0;
> diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
> index ac80559015a3..2a23cf7e141b 100644
> --- a/arch/powerpc/kernel/module.c
> +++ b/arch/powerpc/kernel/module.c
> @@ -94,6 +94,7 @@ static struct execmem_info execmem_info __ro_after_init;
>   
>   struct execmem_info __init *execmem_arch_setup(void)
>   {
> +	pgprot_t kprobes_prot = strict_module_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
>   	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
>   	unsigned long fallback_start = 0, fallback_end = 0;
>   	unsigned long start, end;
> @@ -132,6 +133,12 @@ struct execmem_info __init *execmem_arch_setup(void)
>   				.fallback_start	= fallback_start,
>   				.fallback_end	= fallback_end,
>   			},
> +			[EXECMEM_KPROBES] = {
> +				.start	= VMALLOC_START,
> +				.end	= VMALLOC_END,
> +				.pgprot	= kprobes_prot,
> +				.alignment = 1,
> +			},
>   			[EXECMEM_MODULE_DATA] = {
>   				.start	= VMALLOC_START,
>   				.end	= VMALLOC_END,



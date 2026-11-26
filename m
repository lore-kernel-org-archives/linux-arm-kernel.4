Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5D6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tO0x6/Ve;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=lUPeYaVY;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=NxEw1EdG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AX1bYTPvykJIUAwPITXqI3oZWMupXfBTPAlVUwvP8Ok=; b=tO0x6/VecEFaZ6
	qcsDCkObeGtAn3y9IuF4hAyqPW91Woechy7wnlgVZql35L/MVZpw4yy7NXRyw3jKZx/+lyjf4WqLR
	GRoVWHt2wQwrLlRwnSDzquLeOE80s3McZ1cp5xMxW+Gg/i5rj9IoC0p49WAd9cj5KkYWtvdGfX/EU
	JAXAGHr8Sxk0n0ai+wLlPv6T2rEoQP/unOaDYV6EsJk4LsnhtdgbYvEsUwMV7fe/IjcriHMatamUj
	WCGQeJixOmN7zHZt9a4CNAtEMeZl2gPUpqEAKyB4YHYjU6lxeyOu+cQlnx+QMyRjYqcqQDQRJYmjg
	rUxvd6yye1E7IAYNI0yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbm7-0000000DnrJ-2CWz;
	Thu, 26 Nov 2026 15:52:43 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbm4-0000000Dnqg-3Atb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:52:42 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id B92F11D003C9
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 10:52:35 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 26 Nov 2026 10:52:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1795708345;
	 x=1795794745; bh=AX1bYTPvykJIUAwPITXqI3oZWMupXfBTPAlVUwvP8Ok=; b=
	lUPeYaVYLmY5uA+cJWdkDWMk30QPuAEtP2+wKqSasCGxt/y1lvUwgAwHxbYi3xwl
	mmxz9lQXch/vLB4OXeHrsTR4kRNLxTRmfUTkURgCEw0oxFSpWLzDR1XrEj4LldB0
	XjgmAhbEqFpNshueBGzckIeiXpYyKdfR7Oi0btcc0UKKStG+iR9fCJRlj1omcFc4
	zKP951MU2k/gC9bElyTvpc3uwcKLHzDPVGOEaSC+4LiiBLZjmqvB992yAZbG7x05
	FCdG8ln/NzOaVLOOEUKtnG82X7ZwUeZpviJi5OkOqGrN69LgXLdpOgYeadS90gIY
	SfDYrTSbfolTIWRBh5ZdiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795708345; x=
	1795794745; bh=AX1bYTPvykJIUAwPITXqI3oZWMupXfBTPAlVUwvP8Ok=; b=N
	xEw1EdGR5/uVP6zcVui6qfdRtCMFefohtvEAu17ZyylEnf1zmKMsDOm/uPH9lYr+
	uUZF2NkTeKBuHwKjIEUZf6oLm7a/0gVHrFMprKCj6zF364JloDiQ548Fv33xLM8H
	/f9Ravg7sPWSLG1PXZkoBPEiVFy6nUfGyXoi300U8G7B23pU2boVXKNChs4YNKiJ
	boTNQjcoKPfKqTqAOSevHY0lSIGddl2gQiSMEcO3vdX7RuOD3OZ4e5AdtA/V5tTo
	lP8ACKTW4P9RHpsmEih5YllviwcFmaROmkmeIpKPutPTIJKMGd0MUIGwqz2JhxRX
	1tpisn+HbQ1ZEGK8uG0Xg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795708345; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm3:rsa-sha256:ndtMW05pFv7jtQHxpWHtO6RvePbCMX/eaLyCx/nq4fuzMLR
	gZFkz8jTPHJAJRyA939GY2BVQC5fIjYfKxl3zEEx1YCKY5IIpImSSOfB3ygaaFMd
	k7XViouNcIx2gPaXp4qEFzypwbXcC1iTKkO1s4oL1fH1tCSWmnZFByJQNORnvqJm
	0SApvPlyHshA0lGy7GAt0e3cYjcPW4p+euzzrEkO5+nTj5hOX0Voafyjg6L4aP0i
	ze2u5Frg/LNHBbM3H5oW2dfOhgHFEpeFmN14CAnezQSVbmfseGgUjAg+d53fLxv8
	/K/B0+25Sk6vO8MJtbANgd24oypwp/lBxKUsLHQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:WYM94HgVG7j4l/2HynQNP9YMbdqhQDnwZhmndkDkWJ0=:u7Byv1UG78g93HjvgOCm5GDvrCXsrMB0b/XOH+ouQlw=;
X-ME-Sender: <xms:sVUIaykX1qUlgdkqJflHXpMQuZ3PSKkZVi8PbVcE1jfEmsoZiT1Vsg>
    <xme:sVUIa0qGUbicLxz6yYG0lqPrJ74aKmIuSTVhQChJkDDIQoPEWbprgScOl4ljArrq6
    XGOek9HMCap4IC1rewudy6UebCmHWgGNXHbciGTE38i0KpROQ8ywk-K>
X-ME-Proxy-Cause: dmFkZTGfPR1+WKAR7xxagY6Q50D3fZcfR3EHyDLV5abxUkzV2wVpRmdmegyz19HhYPsZK6
    FIplww2QZlDt92xCVxLC/Tq7h8wQlbgw4lfcQzVeaO4nrBiiWzFHsmZ2CzrOgP+8++GSlY
    dI/p9KKWRCg0+raEFwufPXdZouSJHSI6BUg9CSTIaMxPiBT+zhFiGYPGLk1UnbxWKSxIpX
    YwpKW2u0flWIkgS+fCIadZOmNvdem7tRtw1MaSV0bErIBcQPxis2FXtCuFU2o3paWmeayC
    +2/WcHWLh/UsQuom+Eq+mahptme4X1Da6kI8KOTgj+S14/tC102ceTm5/9hla7oypkKBtK
    er6e5GZn3A43CFlx5BGNv4SNgG2Ne6MEBKma7JyDSG0Z4YrBlBB/w355gBIzN190SOD3qO
    1ZY4rdsvFqPqq8cmYgqarLIZDx0KoUTwEWXm0J2UnV4J6qJTT5lPE7mMAUzBGYT946zY6H
    +sDVNQJzhsEoep96spk1w1SkUnIVaRFG6bMiNvvI7kaTufshOOenDru4smq/PRafuqInE/
    VBi+XrC90BwYZCiwexh3LuNKNGqCZo7xFuhOE78LPeWwZOxZcuPgq/XBtDBNA7ud2rwX54
    Opr/ceOwbrj4ijE1UvmbMZNY0W919KkUL1BFpwuo7DO0f7vXzPIFh8/c4ETA
X-ME-Proxy: <xmx:tFUIayMjVkUAJitPzBq5orBARE3X_ESSp2xF6sOEH4r5_RdM5lUXCA>
    <xmx:tFUIa4D-3Wc3qQ8sxQ16UeZjD1zW3EnOhMa9dYnbVnoj-SUArR5I1A>
    <xmx:tFUIaw9-9lNizjxKHtDcXX_-oMX0rXOxsA0g0vt4hb6ykh-SSmlFEA>
    <xmx:tFUIa5HaFzefBSyNyHU4h4mDz_AVCbLdCK-cNg9lkcTegfyudrJIfA>
    <xmx:uVUIaySjq3Apg-XHfFiwCHyJMj7lyZTd8NUKH-n1UevdR3KpdQwm6lIc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 9767E32A009C; Thu, 26 Nov 2026 10:52:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AkQEWSvHk76g
Date: Thu, 26 Nov 2026 16:51:57 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Siddharth Chintamaneni" <sidchintamaneni@gmail.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Fuad Tabba" <fuad.tabba@linux.dev>, "Marc Zyngier" <maz@kernel.org>,
 "Oliver Upton" <oupton@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Joey Gouly" <joey.gouly@arm.com>, "Zenghui Yu" <yuzenghui@huawei.com>,
 "Steffen Eiden" <seiden@linux.ibm.com>,
 "Yicong Yang" <yangyicong@hisilicon.com>,
 "Zhou Wang" <wangzhou1@hisilicon.com>,
 "Navneet Singh" <navneetsingh@microsoft.com>, apais@microsoft.com,
 hargar@linux.microsoft.com, "Rachel Menge" <rachelmenge@linux.microsoft.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <2bf5ed59-67db-4102-a3a2-3f58929efd0b@app.fastmail.com>
In-Reply-To: <CAE5sdEim3Xz2SPwsb-xP+gp-+w5TOhDv4JtDf0ZbVZ2XSfK+jA@mail.gmail.com>
References: <20261117222224.1465328-1-arnd@kernel.org>
 <20261117222224.1465328-3-arnd@kernel.org>
 <CAE5sdEim3Xz2SPwsb-xP+gp-+w5TOhDv4JtDf0ZbVZ2XSfK+jA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dynamically enable st64bv0 for SVA
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_075241_111375_763A8A76 
X-CRM114-Status: GOOD (  33.00  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026, at 20:51, Siddharth Chintamaneni wrote:
> On Tue, 17 Nov 2026 at 14:22, Arnd Bergmann <arnd@kernel.org> wrote:

>
> 1. SCTLR_EL1_EnAS0 is missing from SCTLR_USER_MASK (and fork/exec reset):
>
> update_sctlr_el1() clears only (SCTLR_USER_MASK & ~SCTLR_ELx_ENIA). Because
> SCTLR_EL1_EnAS0 is not in SCTLR_USER_MASK, once a task enables st64bv0 on a
> CPU, __switch_to() -> update_sctlr_el1() never clears SCTLR_EL1.EnAS0 when
> switching to another task, and switch_iommu_mm() returns early because the
> next task does not have SCTLR_EL1_EnAS0 set in thread.sctlr_user. On Cobalt
> 200, an unprivileged process with no SVA binding scheduled onto that CPU
> executed st64bv0 without trapping while the previous task's PASID was still in
> ACCDATA_EL1.
>
> Similarly:
> - arch_dup_task_struct() copies thread.sctlr_user, so a fork() child inherits
>   SCTLR_EL1_EnAS0 with a fresh mm whose PASID is IOMMU_PASID_INVALID (leaving
>   the parent's PASID in ACCDATA_EL1 when switch_iommu_mm() skips the write).
> - flush_thread() does not clear SCTLR_EL1_EnAS0 across execve().
> - try_enable_st64bv0() can return false if SCTLR_EL1_EnAS0 is already set in
>   current->thread.sctlr_user (matching current->pasid_activated on x86).
>
> Folding in the diff below fixed all three cases (context switch to an unbound
> task on the same CPU, fork(), and execve() all trap with SIGILL again on
> Cobalt 200):
>
>
> diff --git a/arch/arm64/include/asm/processor.h
> b/arch/arm64/include/asm/processor.h
> index 2f368889aa3a..c7243bd4849a 100644
> --- a/arch/arm64/include/asm/processor.h
> +++ b/arch/arm64/include/asm/processor.h
> @@ -264,7 +264,7 @@ static inline void task_set_sve_vl_onexec(struct
> task_struct *task,
>
>  #define SCTLR_USER_MASK
>          \
>   (SCTLR_ELx_ENIA | SCTLR_ELx_ENIB | SCTLR_ELx_ENDA | SCTLR_ELx_ENDB |   \
> - SCTLR_EL1_TCF0_MASK | SCTLR_EL1_TCSO0_MASK)
> + SCTLR_EL1_TCF0_MASK | SCTLR_EL1_TCSO0_MASK | SCTLR_EL1_EnAS0)

Fixed

>  static inline void arch_thread_struct_whitelist(unsigned long *offset,
>   unsigned long *size)
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index b52d4f0cf5b4..6a1cfeb28bf2 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -350,6 +350,13 @@ void flush_thread(void)
>   flush_tagged_addr_state();
>   flush_poe();
>   flush_gcs();
> +
> + if (current->thread.sctlr_user & SCTLR_EL1_EnAS0) {
> + preempt_disable();
> + current->thread.sctlr_user &= ~SCTLR_EL1_EnAS0;
> + update_sctlr_el1(current->thread.sctlr_user);
> + preempt_enable();

Right. For consistency I'll put this into a separate function.

>  void exit_thread(struct task_struct *tsk)
> @@ -395,6 +402,7 @@ int arch_dup_task_struct(struct task_struct *dst,
> struct task_struct *src)
>
>   /* clear any pending asynchronous tag fault raised by the parent */
>   clear_tsk_thread_flag(dst, TIF_MTE_ASYNC_FAULT);
> + dst->thread.sctlr_user &= ~SCTLR_EL1_EnAS0;
>
>   return 0;
>  }

ok

> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index a02dbee8c06d..be84e84c5fa1 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -558,7 +558,8 @@ static bool try_enable_st64bv0(struct pt_regs
> *regs, unsigned long esr)
>   u32 pasid;
>   u64 sctlr;
>
> - if (!system_supports_ls64_accdata())
> + if (!system_supports_ls64_accdata() ||
> +    (current->thread.sctlr_user & SCTLR_EL1_EnAS0))
>   return false;

I don't understand how you hit this one.

I'd change it to report bus error in this case, which also helps
add a testcase for the hwcap.


> 2. Other corners (first three also highlighted by Sashiko [1]):
>
> - EL2 -> EL1 boot setup (arch/arm64/include/asm/el2_setup.h): our bare-metal
>   host ran at EL2 with VHE, so HCRX_EL2 did not affect host EL2/EL0. For
>   kernels booting at EL2 and dropping to EL1 (e.g. CONFIG_KVM=n, nVHE/pKVM, or
>   guest VMs booting at EL2), __init_el2_hcrx and __init_el2_fgt do not yet set
>   HCRX_EL2_EnAS0 or HFGRTR_EL2_nACCDATA_EL1 / HFGWTR_EL2_nACCDATA_EL1, so EL1
>   ACCDATA_EL1 accesses and EL0 st64bv0 will trap to EL2.

I've added the bit to __init_el2_hcrx now, not sure what is actually
needed for __init_el2_fgt.

> - KVM host ACCDATA_EL1 save/restore: regarding the commit message note about a
>   host process using both SVA and KVM, even with Fuad's series applied,
>   ctxt_has_accdata() in arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h returns
>   false when !ctxt_is_guest(ctxt), so KVM loads the guest's ACCDATA_EL1
>   without saving or restoring the host's ACCDATA_EL1 across vCPU run.

I added a check for CONFIG_IOMMU_SVA now, so we always context switch
it in KVM when that is available. In theory, this could be optimized
further to not save it and only restore accdata if the current thread has
enabled it. Not sure if that's worth it, as reading accdata from the host
should be fast.

> - Assembler target: arch/arm64/Makefile caps -Wa,-march at armv8.5-a, which
>   breaks Clang IAS (LLVM=1) on write_sysreg(..., accdata_el1); using
>   write_sysreg_s(pasid, SYS_ACCDATA_EL1) avoids that (and the duplicate manual
>   #define SYS_ACCDATA_EL1 in arch/arm64/include/asm/sysreg.h can be dropped now
>   that tools/sysreg generates it).

ok, changed it now

> - CPU suspend: cpu_do_suspend / cpu_do_resume in arch/arm64/mm/proc.S
>   saves/restores sctlr_el1 across CPU powerdown idle states without
>   saving/restoring accdata_el1.

I've added a restore function now. My first guess was that the cpu_do_suspend
function would always be called from the idle task, but I see that this
is not the case. No need to do anything in suspend though because
the data is already stored in current->mm->iommu_mm.

      Arnd


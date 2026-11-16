Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CCF606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FCioX/oK;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cYIU2x7s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mcuJSSxZnzgSbNJLicY5YRDK+dG26RVtPhpOzcEjiSU=; b=FCioX/oKn0/vS9JaHCA9tzeQ4k
	UWa0lQWSmPOYtY0fA0+ICDKgNC19l01xBvKs3ua5eW65Lf0dK1OtCZVFG/EwE7tu8jkqB3GHpxtQw
	tkv/PTpOn1LFFXo0z0IxTbv/EL7hMV8eqXHvAlsTpU9lD7NJrGXSnE0cH1o9COU4W39lkNd1fq1Qf
	6A4Ek5k1IswkLNt+AWhU5hPSxRsJkCDZOrBm3LK4NSTp7tErL/SBinUakkrhKI5FETLKyqMh86GaB
	5pyVw9VvZ2nRoQOTtsA2Krmr9KlqxIOJwxlpUo+r069qQUx16q/C2GbZRW7umLdsZnQIn1b1CMbOw
	3OAEk0Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrd2-00000001VIT-2qay;
	Mon, 16 Nov 2026 07:59:52 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrcz-00000001VHI-2txE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:59:51 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-492690dd5daso2992158f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 23:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794815987; x=1795420787; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mcuJSSxZnzgSbNJLicY5YRDK+dG26RVtPhpOzcEjiSU=;
        b=cYIU2x7s9CZJG90EnrOwmgEbFZ0wWP74YN75Bx6iTWA1eCfN0l9rhDxVZv1GFM5ZC1
         0Z0TJ3sORT+PHT2JdHOrOJJ0EYANerHzbjc+ST7r3Cs3iJMZO+PbXSvfxM5mLWK8AZTi
         j6Mb7hN02/JKn1DmhpohnGg8FD2IMDRXOFOn0c7lSEFX3GuhY9OB49jQjiLFZwvBmggr
         RpyZU6Osso95c2zidJpbtHjuknenlXCh9K6RZ3tcCdlF2pKA+KUj10xq15eTwMPpV90F
         BnsIslb7MOkQDUgfPESyoZEqSU2SMv5Y7Th4DXsyk7WNDuloJxuE+x3FAzUToar2I7GN
         YrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815987; x=1795420787;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mcuJSSxZnzgSbNJLicY5YRDK+dG26RVtPhpOzcEjiSU=;
        b=watNmyKQSdRyoKV5xE1LNW3LhID0k7qAxiYv++c7k50dRCohHzhUS6fKdYkCvHWl/r
         x4mQ6qPsl7zmtPLfsIyo5v81+b7otqEghK1YvfhDqYIatIvk8MLvr5uMj6+BfIQrKxQp
         MAuMmHi3dVAQoG+8YtQvY/guZh88TPfYsDiIuVwgHexxqF6iI4Ruhw2K0yhpekppitWP
         si5EpDLoPxwOMmwDtqNjC3Li9SleRTYO+aVSRhnY27hJC01S8kXBR/XiQ2F3Ew53Sf3U
         XamlUj0uYggiHL836UJDkBK3shLTeEAvvIPjHh6hmugvstBYubMEpfQtdvJaNECg1+FE
         e7kg==
X-Forwarded-Encrypted: i=1; AL+hErEvLwRxbWKwcTl2HD2diT2KYKiw3Dnqt1ayWVloKGFf6ZDDUjjBAsaXpRxUtuGFnHWDtfZeL3y+NGweibTN4tPN@lists.infradead.org
X-Gm-Message-State: APuU4Z9qHla23iJR5gTNVESEpbYMMzKR+aY8vig7BKMQ0fIM4IufRY25
	0wLmw9XOXSIzH2PNs27U5Bpj+hMP8CYUxrwDFA85yIVe9dGCCYdz48eqNq0PckKNgoqAydVr/DO
	/UxZiZhM2
X-Gm-Gg: AYBFou2E2gprLIwcuJl2lXLtf0TEt8VYjdwOTfJioY6lJpsjZumVy9SHTKWXwaZvJKE
	2RL3xS2xtFLjbfGadV5tJgl35VUzWQyWIQg9tFd1imARedtYZoR++C6qT7CGaygIpsM6g5Fub4j
	lfkAKOE9sArV/2zKU73ueP5e7ic2OClDu/1Lr9xruLfe916CHvdpu9n1ImCVtrU+jRe1SJ9HuF9
	iMYGNxehdBmjKWQgVqOu0IPiQp1GSLzlMHxQUbIVL3oBQXuk3H0KUBv8haGTNV510kerLj4NrSt
	SJgVN8JZKpsD+TBMHx/Iizuc5ZUwdrAV2EuR4nzECpz9nA+j1EF4Hcgkg5d4GpqtR30OxrOu+BC
	03N1Flj9Dntdt6I9DMzApIO/jIsvVd4L2ojm+NSJGWKsR6LnV9qebqzxvHIqHHPFOaZqEWqqMFl
	FJPlSqFe4oShRPFkHoF9c6HUBnd2tIFdr7KZoZUseaFbmbZq/8J4ceQFHTlz61cHGv3luwt/92u
	zF4E3ZDF2gsw57Z+s5kbhx7S7t1WTmf1DRks1CYXktj5zi6YocnuApQdQBUkqrOPJnVmjvK85jz
	pQYY7SsSeD3p3MGWsDTU5isb/ywcUlvhiW9ywTV0s98Z0CTgz+Egbxgj/a8cKOOCcdvID+3xxaW
	HZcouRbwA
X-Received: by 2002:a05:6000:993:b0:48f:bc59:ab9c with SMTP id ffacd0b85a97d-49c6fd932f0mr20349731f8f.12.1794815987554;
        Sun, 15 Nov 2026 23:59:47 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d69c21a17sm15766858f8f.50.2026.11.15.23.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:59:47 -0800 (PST)
Message-ID: <832e0f9ce4e81ee31a6bcde01591a56aac36e976.camel@amutable.com>
Subject: Re: [PATCH RFC 3/4] crash_dump: recover from a machine check in
 copy_oldmem_page()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao
	 <leitao@debian.org>, Chris Mason <mason@kernel.org>, Thomas Gleixner
	 <tglx@kernel.org>, x86@kernel.org, kexec@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>, 
	stable@vger.kernel.org
Date: Mon, 16 Nov 2026 08:59:45 +0100
In-Reply-To: <20261112-work-procfs-oldmem-v1-3-ecdcafd99265@kernel.org>
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org>
	 <20261112-work-procfs-oldmem-v1-3-ecdcafd99265@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_235949_793130_C3FEE992 
X-CRM114-Status: GOOD (  38.80  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 2026-11-12 at 17:37 +0100, Christian Brauner wrote:
> A capture kernel reads the memory of the crashed kernel, and that
> memory
> may well have uncorrectable errors. That is after all what the first
> kernel often died of. Every architecture that maps a page of the old
> kernel and copies it out does so with copy_to_iter(), and a machine
> check in that copy takes the capture kernel down.
>=20
> On x86 a machine check in the kernel is only recovered from if the
> instruction that took it has a machine check safe exception table
> entry
> or copies from userspace (cf. error_context()). The copy of an old
> page
> is neither. Its source is kernel memory, whether it goes to the
> buffer
> of a read() or, since commit 4a22fd20379c ("vmcore: convert
> __read_vmcore to use an iov_iter"), into a kernel page for splice(),
> sendfile() and copy_file_range(). So a read of /proc/vmcore that runs
> into a poisoned page panics the capture kernel, and so do vmcore's
> own
> reads of the ELF headers and notes. Breno sees the result on a fleet:
> the first kernel dies of a machine check and the capture kernel
> produces
> no usable vmcore at all (cf. [1]).
>=20
> On book3s64 a machine check in the kernel is recovered from if the
> instruction that took it has an exception table entry (cf.
> mce_common_process_ue()). The user copy has them, so a read() comes
> up
> short there and read_from_oldmem() returns -EFAULT. The copies into
> kernel pages have none and panic the same way. Other powerpc
> platforms
> don't recover from a machine check in such a copy at all.
>=20
> Copy with _copy_mc_to_iter() instead. x86_64 and PPC64 select
> ARCH_HAS_COPY_MC, and on x86_64 and book3s64 the machine check safe
> copy
> turns the machine check into a short copy, which read_from_oldmem()
> turns into -EFAULT like any other short copy. On x86 that holds for
> the
> fragile and the enhanced fast string variant, a CPU with neither gets
> the plain copy it has today. Everywhere else _copy_mc_to_iter() is
> _copy_to_iter(). Put the call into a helper, copy_oldmem_to_iter(),
> so
> that the copy of a page of the old kernel lives in one place and an
> architecture that gains a machine check safe copy later gets this for
> free. The helper does the same check_copy_size() as copy_to_iter(),
> so
> hardened usercopy keeps checking the copy.
>=20
> With a v7.4-rc1 capture kernel reading /proc/vmcore and a machine
> check
> injected into the copy of an old page the capture kernel is gone. A
> machine check panic prints no trace of its own, this one comes from
> panic_sys_info=3Dall_bt:
>=20
> [=C2=A0=C2=A0=C2=A0 0.580568] mce: [Hardware Error]: CPU 0: Machine Check=
 Exception:
> 7 Bank 1: bd80000000000134
> [=C2=A0=C2=A0=C2=A0 0.580574] mce: [Hardware Error]: RIP 10:<ffffffff8190=
9b11>
> {_copy_to_iter+0x81/0x850}
> [=C2=A0=C2=A0=C2=A0 0.580584] mce: [Hardware Error]: TSC 202f2117f ADDR 1=
0000000
> MISC 8c
> [=C2=A0=C2=A0=C2=A0 0.580587] mce: [Hardware Error]: PROCESSOR 2:aa0f02 T=
IME
> 1794493617 SOCKET 0 APIC 0 microcode aa0021c
> [=C2=A0=C2=A0=C2=A0 0.580589] mce: [Hardware Error]: Machine check: Uncor=
rected
> unrecoverable error in kernel context
> [=C2=A0=C2=A0=C2=A0 0.580591] Kernel panic - not syncing: Fatal local mac=
hine check
> [=C2=A0=C2=A0=C2=A0 0.582587] CPU: 0 UID: 0 PID: 1 Comm: init Not tainted=
 7.4.0-rc1-
> g6628e7d4c6b2 #1 PREEMPT(lazy)
> [=C2=A0=C2=A0=C2=A0 0.583101] Call Trace:
> [=C2=A0=C2=A0=C2=A0 0.583198]=C2=A0 <#MC>
> [=C2=A0=C2=A0=C2=A0 0.583279]=C2=A0 dump_stack_lvl+0x4d/0x70
> [=C2=A0=C2=A0=C2=A0 0.583419]=C2=A0 nmi_cpu_backtrace.cold+0x18/0x6e
> [=C2=A0=C2=A0=C2=A0 0.583584]=C2=A0 ? __pfx_nmi_raise_cpu_backtrace+0x10/=
0x10
> [=C2=A0=C2=A0=C2=A0 0.583772]=C2=A0 nmi_trigger_cpumask_backtrace+0xba/0x=
f0
> [=C2=A0=C2=A0=C2=A0 0.583955]=C2=A0 sys_info+0x83/0xb0
> [=C2=A0=C2=A0=C2=A0 0.584075]=C2=A0 vpanic+0x1b4/0x303
> [=C2=A0=C2=A0=C2=A0 0.584197]=C2=A0 panic+0x66/0x70
> [=C2=A0=C2=A0=C2=A0 0.584488]=C2=A0 mce_panic+0x19e/0x290
> [=C2=A0=C2=A0=C2=A0 0.584799]=C2=A0 do_machine_check+0x627/0x9a0
> [=C2=A0=C2=A0=C2=A0 0.584953]=C2=A0 ? _copy_to_iter+0x81/0x850
> [=C2=A0=C2=A0=C2=A0 0.585099]=C2=A0 exc_machine_check+0x68/0xb0
> [=C2=A0=C2=A0=C2=A0 0.585246]=C2=A0 asm_exc_machine_check+0x1e/0x40
> [=C2=A0=C2=A0=C2=A0 0.587747]=C2=A0 </#MC>
> [=C2=A0=C2=A0=C2=A0 0.587831]=C2=A0 <TASK>
> [=C2=A0=C2=A0=C2=A0 0.588092]=C2=A0 ? iomem_map_sanity_check+0x98/0xb0
> [=C2=A0=C2=A0=C2=A0 0.588430]=C2=A0 ? __ioremap_caller.isra.0+0x1a9/0x300
> [=C2=A0=C2=A0=C2=A0 0.588604]=C2=A0 ? __copy_oldmem_page+0x3d/0xb0
> [=C2=A0=C2=A0=C2=A0 0.588928]=C2=A0 __copy_oldmem_page+0x5e/0xb0
> [=C2=A0=C2=A0=C2=A0 0.589079]=C2=A0 read_from_oldmem.part.0+0xe3/0x140
> [=C2=A0=C2=A0=C2=A0 0.589247]=C2=A0 read_vmcore+0x137/0x280
> [=C2=A0=C2=A0=C2=A0 0.589381]=C2=A0 proc_reg_read_iter+0x49/0x90
> [=C2=A0=C2=A0=C2=A0 0.589533]=C2=A0 vfs_read+0x348/0x490
> [=C2=A0=C2=A0=C2=A0 0.589666]=C2=A0 ksys_read+0x76/0x100
> [=C2=A0=C2=A0=C2=A0 0.589792]=C2=A0 do_syscall_64+0xde/0x4b0
> [=C2=A0=C2=A0=C2=A0 0.590103]=C2=A0 entry_SYSCALL_64_after_hwframe+0x77/0=
x7f
>=20
> With this patch the same injection ends the read() with -EFAULT, the
> capture kernel logs the machine check and keeps running.
>=20
> [1]: https://lore.kernel.org/all/avRXzzCSzT9Qj2FC@gmail.com/
>=20
> Reported-by: Chris Mason <mason@kernel.org>
> Suggested-by: Breno Leitao <leitao@debian.org>
> Fixes: 4ae362be5093 ("[PATCH] kdump: read previous kernel's memory")
> Fixes: 54c32021eb6f ("[PATCH] powerpc: Add arch-dependent
> copy_oldmem_page")
> Fixes: 4a22fd20379c ("vmcore: convert __read_vmcore to use an
> iov_iter")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0arch/powerpc/kernel/crash_dump.c |=C2=A0 4 ++--
> =C2=A0arch/x86/kernel/crash_dump_64.c=C2=A0 |=C2=A0 2 +-
> =C2=A0include/linux/crash_dump.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 22=
 ++++++++++++++++++++++
> =C2=A03 files changed, 25 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/crash_dump.c
> b/arch/powerpc/kernel/crash_dump.c
> index 1543917bd3e1d..f784fc5cb0030 100644
> --- a/arch/powerpc/kernel/crash_dump.c
> +++ b/arch/powerpc/kernel/crash_dump.c
> @@ -83,12 +83,12 @@ ssize_t copy_oldmem_page(struct iov_iter *iter,
> unsigned long pfn,
> =C2=A0
> =C2=A0	if (memblock_is_region_memory(paddr, csize)) {
> =C2=A0		vaddr =3D __va(paddr);
> -		csize =3D copy_to_iter(vaddr + offset, csize, iter);
> +		csize =3D copy_oldmem_to_iter(vaddr + offset, csize,
> iter);
> =C2=A0	} else {
> =C2=A0		vaddr =3D ioremap_cache(paddr, PAGE_SIZE);
> =C2=A0		if (!vaddr)
> =C2=A0			return -ENOMEM;
> -		csize =3D copy_to_iter(vaddr + offset, csize, iter);
> +		csize =3D copy_oldmem_to_iter(vaddr + offset, csize,
> iter);
> =C2=A0		iounmap(vaddr);
> =C2=A0	}
> =C2=A0
> diff --git a/arch/x86/kernel/crash_dump_64.c
> b/arch/x86/kernel/crash_dump_64.c
> index 32d710f7eb84c..e10dada855b70 100644
> --- a/arch/x86/kernel/crash_dump_64.c
> +++ b/arch/x86/kernel/crash_dump_64.c
> @@ -29,7 +29,7 @@ static ssize_t __copy_oldmem_page(struct iov_iter
> *iter, unsigned long pfn,
> =C2=A0	if (!vaddr)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	csize =3D copy_to_iter(vaddr + offset, csize, iter);
> +	csize =3D copy_oldmem_to_iter(vaddr + offset, csize, iter);
> =C2=A0
> =C2=A0	iounmap((void __iomem *)vaddr);
> =C2=A0	return csize;
> diff --git a/include/linux/crash_dump.h b/include/linux/crash_dump.h
> index 8315270e27b7a..12aeaa40c1c94 100644
> --- a/include/linux/crash_dump.h
> +++ b/include/linux/crash_dump.h
> @@ -6,6 +6,7 @@
> =C2=A0#include <linux/proc_fs.h>
> =C2=A0#include <linux/elf.h>
> =C2=A0#include <linux/pgtable.h>
> +#include <linux/uio.h>
> =C2=A0#include <uapi/linux/vmcore.h>
> =C2=A0
> =C2=A0/* For IS_ENABLED(CONFIG_CRASH_DUMP) */
> @@ -33,6 +34,27 @@ ssize_t copy_oldmem_page(struct iov_iter *i,
> unsigned long pfn, size_t csize,
> =C2=A0ssize_t copy_oldmem_page_encrypted(struct iov_iter *iter, unsigned
> long pfn,
> =C2=A0				=C2=A0=C2=A0 size_t csize, unsigned long
> offset);
> =C2=A0
> +/**
> + * copy_oldmem_to_iter - copy from the crashed kernel's memory
> + * @src: where in the mapped page of the crashed kernel to copy from
> + * @count: how many bytes to copy
> + * @iter: where to copy them
> + *
> + * The memory of the crashed kernel may well have uncorrectable
> errors.
> + * Where the architecture has a machine check safe copy a machine
> check
> + * in the copy ends it short, like a fault would, instead of taking
> the
> + * capture kernel down. Everywhere else this is copy_to_iter().
> + *
> + * Return: the number of bytes copied, like copy_to_iter().
> + */
> +static inline size_t copy_oldmem_to_iter(const void *src, size_t
> count,
> +					 struct iov_iter *iter)
> +{
> +	if (check_copy_size(src, count, true))
> +		return _copy_mc_to_iter(src, count, iter);
> +	return 0;
> +}
> +
> =C2=A0void vmcore_cleanup(void);
> =C2=A0
> =C2=A0/* Architecture code defines this if there are other possible ELF


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8110C606A897
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EUJ31XJs;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=awjpyNqZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3EMWJDhBBek59xKnIdxxZDsZ4a9Lk1PMfcEjUKx7BtQ=; b=EUJ31XJsUqe8+yTFerkMo/pqe+
	5eObDWt28tK/eU8CCY9WGr3o9Rkz526djECcBpUpWipbkEJMJQQhjrhzIRSaBLoZ20G3IvfYGXIW9
	849Ld5bkp3LjvVvlYZ0UDMG7kRsuZEi9G2pCN2hCWPKibdqTxzrWSIpVwuCC43eWyR7SsBOGp12dP
	iwY77RsoxaDfKLezstwpKg67cKtjskh17rgf4EDj8m+UYOlkckevfUIdn9lh3G08z9FtfOpVCvRt3
	oyDpAGpKDzTeYvSETsqt2hqe5XE4P944NCbTUR/ejUd3mkii8x529yqFy32+kk//zWwgDvQrDwxu8
	Ok5ctxdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8b4-00000004MHJ-2g9l;
	Tue, 17 Nov 2026 02:06:58 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8az-00000004MFC-3aER
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 02:06:57 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so5292006a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 18:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794881212; x=1795486012; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3EMWJDhBBek59xKnIdxxZDsZ4a9Lk1PMfcEjUKx7BtQ=;
        b=awjpyNqZG5Id8s4kMWbLB4XJuE5meMLFZr7BnLV1S5pHMCipeILlTSfrc04fWKexo1
         ccHx79hqjal9Tmwf9LXXRcauZ0+/RH0K5Io8PAsDbDDCG+GC/SeB3NS2PHhRkVni1N3V
         KGWu7R1Xgu6bEKKbmti9Gna0xJ+vqYk5QLhY/ozoBiphxYHbRV1L48VbRAEfkpyZNk+g
         Sibb6XqKvVINfFWlSZN1O+fDqTDktC7GKpcx6IjkZKkwW4qi6fr/4brWLx8iOO3tS4j0
         bE7OswGeucLwWUOQtNn5wQy0z5vXZrf1vkCccB50CpxCYdc5GhDG8vJO8KJSGmjRngCU
         fPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794881212; x=1795486012;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3EMWJDhBBek59xKnIdxxZDsZ4a9Lk1PMfcEjUKx7BtQ=;
        b=h4zYFRFax60zK2qkYhXVnQ6PFl45Mag8Zbsk8QlHiYV5OmpsIT3ld84hIrfVhsOycs
         GGtZjvArAjVyRIpC/exbtFXnOIxovlhG5u8c7Pjg+WQsVUpldV5CNkSxapWlaAruXib/
         xvYpP5VT2kOfDDBwYLIfwXGtNf6GbNWOsEen9oQCN2r46JTB+MQUx0l9WGA3e512568m
         MwAahZqUm8B+S6aOHVHSVXRal3DypSl7OWMB8ToETvSGJbGnz+iuPYLZzi1V4ni3kd6X
         B/k659juZWVPzH8rqosiJb6AX3wWkDBMm65H5uAUH91BmKlpbULk0sEfiw5piBJhMFZ6
         xatQ==
X-Forwarded-Encrypted: i=1; AL+hErHMUtN35iIvDhDp4mVKlPdxj2RKvGTLy7Gp/bGOrHjBD7mERkhpBrsl+HSexCtVrVFLDj/pGGpyta6Zxt3b3m7f@lists.infradead.org
X-Gm-Message-State: APuU4Z8uY1TlnlNePOzm15NtMso4ZVkULiAqt0NC6VY7HsSv49iAyZNL
	79FGdjkpVMwuG/mwmQIc9ml0gtADEI1nfjkB1SVuZx1leXM9LknHY85A5eKqqnHmo5O0kvd2C04
	egMpDmFLt+wtz2ilAc9FeCkXo+g==
X-Received: from pjbei2.prod.google.com ([2002:a17:90a:e542:b0:3b3:aa49:9102])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3890:b0:3b1:6f2:a188 with SMTP id 98e67ed59e1d1-3b1b0a4e441mr13189767a91.55.1794881211439;
 Mon, 16 Nov 2026 18:06:51 -0800 (PST)
Date: Tue, 17 Nov 2026 02:06:37 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117020648.323464-1-dylanbhatch@google.com>
Subject: [PATCH v9 00/11] unwind, arm64: add sframe unwinder for kernel
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>, joe.lawrence@redhat.com, 
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Mostafa Saleh <smostafa@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_180653_903498_9070F2FD 
X-CRM114-Status: GOOD (  23.66  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement a generic kernel sframe-based [1] unwinder. The main goal is
to improve reliable stacktrace on arm64 by unwinding across exception
boundaries.

On x86, the ORC unwinder provides reliable stacktrace through similar
methodology, but arm64 lacks the necessary support from objtool to
create ORC unwind tables.

Currently, there is a sframe unwinder proposed for userspace [2], along
with an RFC for an .eh_frame unwinder [5]. This patch series implements
a similar SFrame lookup library to [2], but with many simplifications to
account for the fact that user access is not necessary. The intent here
is to continue to leave the door open for common usage of definitions
and algorithms between kernel and user unwind in the future, while at
the same time keeping these patches strictly constrained the minimal set
of features necessary for arm64 kernel unwind.

Unlike past versions of this series, these patches apply directly to
v7.4-rc1 rather than depending upon [2]. To make this possible, I've
adopted a number of patches from [2] with significant squashes and
changes made in order to coherently suit the kernel unwind use case.
I've done my best to maintain appropriate authorship on these changes,
and have added 'Co-developed-by' trailers to attribute shared authorship
as accurately as possible. Please let me know if you see any
discrepencies in my work here.

Currently, only GNU Binutils support sframe. This series relies on the
Sframe V3 format, which is supported in binutils 2.46.

This full series is available on github: [4].

Ref:
[1]: https://sourceware.org/binutils/docs/sframe-spec.html
[2]: https://lore.kernel.org/all/20260505121718.3572346-1-jremus@linux.ibm.com/
[3]: https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git/log/?h=sframe/core
[4]: https://github.com/dylanbhatch/linux/tree/sframe-v9
[5]: https://lore.kernel.org/all/20260821195259.2688377-1-jremus@linux.ibm.com/

---

Summary of changes since v8:
 - Rebase onto v7.4-rc1, resolving merge conflicts in Makefile and
   arch/arm64/lib/strncmp.S and dropping arch/arm64/lib/clear_page.S
   (removed upstream).
 - (sashiko) Add 'depends on !RUST' to HAVE_UNWIND_KERNEL_SFRAME and keep
   KBUILD_RUSTFLAGS conditioned only on CONFIG_UNWIND_TABLES.
 - (sashiko) Move STACK UNWINDING entry in MAINTAINERS to alphabetical
   order and add unwind_sframe.h patterns in the patch introducing them.
 - (sashiko) Filter out $(CC_FLAGS_SFRAME) in efi/libstub, arm64 pi, and
   arm64 kvm/hyp/nvhe Makefiles where unwind tables are disabled.
 - (sashiko) Guard SFrame header, FDE, and FRE bounds calculations
   against integer overflow.
 - (sashiko) Preserve KASAN, KCSAN, and ftrace exclusions on sframe.o in
   kernel/unwind/Makefile, and clean up header includes across sframe.h,
   sframe_debug.h, module.h, and kernel/module/main.c.
 - (sashiko) Mark is_kernel_inittext(), __is_kernel_text(), and
   within_module_mem_type() as __always_inline for noinstr sframe_find().
 - (sashiko) Provide generic include/asm-generic/unwind_sframe.h fallback
   and move <asm/unwind_sframe.h> include to the IP validation patch.
 - (sashiko) Update CONFIG_SFRAME_VALIDATION help text and commit log for
   in-kernel vmlinux and module .sframe validation.
 - (sashiko) Place .cfi_startproc before 'bti c' in call_on_irq_stack()
   using SYM_START().
 - (sashiko) Move out-of-line blocks in pmull_gcm_ghash_4x() and
   pmull_gcm_enc_4x() out of '.subsection 1' and annotate __pi_strrchr
   with SYM_LEAF_FUNC_START / SYM_LEAF_FUNC_END.
 - (sashiko) Restrict SFrame unwinding at KUNWIND_SOURCE_REGS_PC to real
   on-stack FRAME_META_TYPE_PT_REGS exception frames, drop invalid
   cross-stack 'fp < sp' check in UNWIND_CFA_RULE_FP_OFFSET, enforce
   8-byte alignment in get_word(), and propagate state->unreliable on
   -ENOENT in do_kunwind().

Summary of changes since v7:
 - (sashiko): Put .cfi_startproc right after SYM_START to account for
   potential alignment bytes ahead of the actual function symbol.
 - (sashiko) Use __always_inline for IP validation helper.
 - (sashiko) Move .sframe module init and sframe section fields to arch
   generic code.
 - (sashiko) Make sframe_find() noinstr.
 - (sashiko) Add preempt_notrace and instrumentation to
   __sframe_module_find() code path.
 - (sashiko) Block tracing and kprobe on the sframe_find code path.
 - (shashiko) remove KCOV, KCSAN, and KASAN instrumentation from
   sframe.o (copying over ORC's shoulder).

Dylan Hatch (6):
  arm64, unwind: build kernel with sframe V3 info
  module, sframe: Add sframe support for modules
  arm64/sframe: Validate IP addresses
  sframe: Add debug helpers with object name
  arm64, crypto/lib: Annotate leaf functions with CFI info
  unwind: arm64: Use sframe to unwind interrupt frames

Jens Remus (1):
  sframe: Separate reading of FRE from reading of FRE data words

Josh Poimboeuf (3):
  arm64/sframe: Read vmlinux .sframe header
  sframe: Add support for reading vmlinux .sframe contents
  sframe: Add .sframe validation option

Weinan Liu (1):
  arm64: entry: add unwind info for call_on_irq_stack()

 MAINTAINERS                            |  17 +-
 Makefile                               |   8 +
 arch/Kconfig                           |  51 ++
 arch/arm64/Kconfig                     |   1 +
 arch/arm64/Makefile                    |   8 +-
 arch/arm64/crypto/aes-ce-ccm-core.S    |  12 +-
 arch/arm64/crypto/aes-neonbs-core.S    |  16 +-
 arch/arm64/crypto/ghash-ce-core.S      |  76 ++-
 arch/arm64/crypto/sm4-ce-ccm-core.S    |  16 +-
 arch/arm64/crypto/sm4-ce-cipher-core.S |   4 +-
 arch/arm64/crypto/sm4-ce-core.S        |  44 +-
 arch/arm64/crypto/sm4-ce-gcm-core.S    |  16 +-
 arch/arm64/crypto/sm4-neon-core.S      |  12 +-
 arch/arm64/include/asm/linkage.h       |  32 ++
 arch/arm64/include/asm/module.lds.h    |   2 +
 arch/arm64/include/asm/sections.h      |   1 +
 arch/arm64/include/asm/unwind_sframe.h |  32 ++
 arch/arm64/kernel/entry.S              |  17 +-
 arch/arm64/kernel/pi/Makefile          |   3 +
 arch/arm64/kernel/setup.c              |   2 +
 arch/arm64/kernel/stacktrace.c         | 211 +++++++-
 arch/arm64/kernel/vdso/Makefile        |   2 +-
 arch/arm64/kernel/vmlinux.lds.S        |  14 +
 arch/arm64/kvm/hyp/nvhe/Makefile       |   5 +-
 arch/arm64/lib/clear_user.S            |   4 +-
 arch/arm64/lib/copy_from_user.S        |   4 +-
 arch/arm64/lib/copy_page.S             |   4 +-
 arch/arm64/lib/copy_to_user.S          |   4 +-
 arch/arm64/lib/memchr.S                |   4 +-
 arch/arm64/lib/memcmp.S                |   4 +-
 arch/arm64/lib/memcpy.S                |   8 +-
 arch/arm64/lib/memset.S                |   8 +-
 arch/arm64/lib/mte.S                   |  28 +-
 arch/arm64/lib/strchr.S                |   4 +-
 arch/arm64/lib/strcmp.S                |   4 +-
 arch/arm64/lib/strlen.S                |   4 +-
 arch/arm64/lib/strncmp.S               |   4 +-
 arch/arm64/lib/strnlen.S               |   4 +-
 arch/arm64/lib/strrchr.S               |   4 +-
 arch/arm64/lib/tishift.S               |  12 +-
 drivers/firmware/efi/libstub/Makefile  |   2 +
 include/asm-generic/Kbuild             |   1 +
 include/asm-generic/sections.h         |   8 +-
 include/asm-generic/unwind_sframe.h    |   5 +
 include/asm-generic/vmlinux.lds.h      |  15 +
 include/linux/module.h                 |  11 +-
 include/linux/sframe.h                 |  42 ++
 include/linux/unwind_types.h           |  34 ++
 kernel/module/main.c                   |  20 +
 kernel/unwind/Makefile                 |   9 +-
 kernel/unwind/sframe.c                 | 714 +++++++++++++++++++++++++
 kernel/unwind/sframe.h                 |  79 +++
 kernel/unwind/sframe_debug.h           |  38 ++
 53 files changed, 1501 insertions(+), 183 deletions(-)
 create mode 100644 arch/arm64/include/asm/unwind_sframe.h
 create mode 100644 include/asm-generic/unwind_sframe.h
 create mode 100644 include/linux/sframe.h
 create mode 100644 include/linux/unwind_types.h
 create mode 100644 kernel/unwind/sframe.c
 create mode 100644 kernel/unwind/sframe.h
 create mode 100644 kernel/unwind/sframe_debug.h

-- 
2.56.0.679.gc527c65306-goog



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4BF606EE82
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sFz7uNOP;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i8NO4RSW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QyPiotEtbjmbAknxSU0jdiIPb/Ej3HeKpoXn1Xbs3Mw=; b=sFz7uNOPk3ii0qjAaUdvIq+pox
	XLaW1T8OH9pjf/wSFXmSDhzPSPPvbrxZxaUu3uO9bOmbcx0R8+yOexvPEOBcQtZmgKe7+zdQNzuOu
	DpjkhoqzCQU0BlsGYSkdIzdGsfQCFQRvis7jmGlSpLSvSaQQH9vejX65JQSL0YrncCKQHftrKUQ+d
	5ivWWdDdzsex0OXvAqrD/nINY4qVrXSmX1fYEaAqbtLUD7JXIlOJtNqVUEend3a9fKaaXM0SBKVcW
	0MqM9MZ0LmmlsTCX/ykFs5/o+KTw0L+HQFW/UAgNCn+xRESMvdId+9jddxj7GMBFLdJ4YprpcECMd
	rze/PoOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTg-0000000EukX-3hgv;
	Sat, 07 Nov 2026 15:37:12 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTd-0000000EujL-1EzV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:10 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c41f85ee4a3so155538966b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065827; x=1794670627; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QyPiotEtbjmbAknxSU0jdiIPb/Ej3HeKpoXn1Xbs3Mw=;
        b=i8NO4RSWj9Tn6CYLVg3XV6uRo9fANVVNiTXVFu9FHwfJLrYwJ/OqTUQLO83z4tNkH/
         cjSfVDwa1DlRbFbCUp3JjYReeYGQppyMK7x+O9WMUMT/WlOSMmFtze4B4EK0YyOT4g7I
         Ztnc4BosRD7W6CAO0gPsdNoT7DOFOROAN3BXvPmnHfdsE+tN2DBjLS6627d7DF6Mt87W
         cP/hvoV7OUakXHqcFBI4YNaMaKLZfcIV5yOpfc0LHtyPJUilXn6pLa02XQFHlg8DAjM3
         yUBU1OZXrRltU/9oZzPe1rXBkzTUOQbAyDPxoqTnp6ShuD0WlGMO857SDwlnkIEq2wc3
         eyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065827; x=1794670627;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QyPiotEtbjmbAknxSU0jdiIPb/Ej3HeKpoXn1Xbs3Mw=;
        b=NM4RHzw1LbsQCq+XXiDh3kezsn+b0/W+5WOrDBZCSMzl673DqX0gWZ5yadPDoqGR3b
         Ds4pzzqcSy6eArzm7o1mhsuNZYT++XaBcR0laSMqAidyfxQSuFiisI+z74MLpIG8YIYz
         F0bjT8hCdWXQ+VUIyhWaKXB9P27HrEUyN+J69Eq02B02UoZHWlEgJay0983/O7VHhYzi
         fqo4vYOziLSgUqlVQSVliljonbH5tO4GHATGnvqACbvRnOHZGhbagjmNypM03fg0iDpt
         TGSUPDDHypkPR2vtxnVlYKIQ5h2m52WIwR2veZ1kAX3rLU7FeJHtXuPp/EQqrsHX/dMa
         DnAg==
X-Forwarded-Encrypted: i=1; AL+hErE+ppR0NOc3qSyTMt4DDmkYjCnAkNRKwTUUqYRYE7mKm4CBP7kEEeYXMxtjezbSKTPqEhA0OelDImJ4ptxS1Rc2@lists.infradead.org
X-Gm-Message-State: APuU4Z+qKT5Q5cbZF55IEXs7vr/Jasp6Q9NkVT/I7wXWQQgtBmMtgO0h
	GtSSL7dpFXxUA7EO3rlvRYtORLyVi8O6IOYbnIat32NSE8rWWUsnHUJV0bhobvsgZwmQPZd6vUB
	C8g==
X-Received: from ejih2.prod.google.com ([2002:a17:906:2dc2:b0:c31:9613:6217])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:9f8a:b0:c40:d920:747c
 with SMTP id a640c23a62f3a-c4d3449c10dmr439396066b.7.1794065826487; Sat, 07
 Nov 2026 07:37:06 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:06 +0100
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGZF72oC/x3MQQqAIBBA0avIrBtQg9KuEi2kphoqCyciiO6et
 HyL/x8QSkwCjXog0cXCe8wwhYJ+DnEi5CEbrLaVMbrG7SRcgoSIcqx8YlmVlpxxo/c15OpINPL 9H9vufT8GvSV/YQAAAA==
X-Change-Id: 20261107-mte-kasan-split-3632e818f997
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
Subject: [PATCH 00/24] arm64: Decouple MTE code from KASAN support
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peter Collingbourne <peter@pcc.me.uk>, stable@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Alexander Potapenko <glider@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073709_384429_9E0CFF48 
X-CRM114-Status: GOOD (  19.20  )
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
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MTE is a hardware feature, KASAN is software infrastructure.

The direction of the dependency should be clear: KASAN uses MTE.

However, the code does not reflect this split: many mte_*() functions
are actually only intended for HW_TAGS such that there is no way to make
use of in-kernel MTE functionality without enabling KASAN. Furthermore,
there is a lot of unnecessary indirection in those functions, causing
duplication, code that is harder to follow than it should be, and making
it easier for subtle inconsistencies to hide.

Instead, this series aims to untangle the two into a set of reusable,
arch-level MTE functions and a thin wrapper around them that KASAN
needs. For non-KASAN MTE-related code, instead of attempting to reuse
KASAN functions, break out individual MTE primitives into KASAN-agnostic
functions and use them where needed by aligning in style with how other
features are supported e.g. during kernel entry/exit.

The result of this rework made some bugs and inefficiencies obvious so
I ordered the patches into 3 sets: first, bug fixes, then, functional
improvements, and finally the refactor. Specifically:

- patch 1 fixes a bug in the support for userspace MTE, with a kselftest
  reproducer in patch 2
- patch 3 fixes an unsound inline asm statement
- patches 4-7 address inefficiencies in PSTATE.TCO-guarded sections, TCO
  lazy clearing, and harden TTBR1 address categorization
- patches 9-12 rework MTE-specific code in arch-agnostic KASAN, with an
  arch-level early refactor in patch 8 to keep those minimal
- patches 13-23 then proceed with the methodical untangling of MTE
  from KASAN, leaving only a thin KASAN_HW_TAGS wrapper in <asm/kasan.h>
- patch 24 introduces a hidden Kconfig flag ARM64_MTE_KERNEL, to better
  document in the code when logic is required for EL1 MTE, as opposed to
  KASAN

This was tested on v7.4-rc1 and applies cleanly to arm64 for-next/core
at commit f46be4da2cbb ("selftests/arm64: GCS must not leak on a failed
clone3").

The following checkpatch.pl errors are consciously ignored:

- "WARNING: ... does MAINTAINERS need updating?" on patch 2 for the
  new kselftest but selftests/arm64/ is already properly maintained
- "WARNING: Macros with flow control statements should be avoided" on
  patch 5 but the new __raw_{get,put}_mem_tco() macros are intentionally
  consistent in style with the pre-existing __raw_{get,put}_mem()

while the other warnings/error are false-positives I fix in [1] and [2].

[1]: https://lore.kernel.org/r/20261107-checkpatch-asm-complex_macro-v1-1-9=
a7b3c69fc28@google.com
[2]: https://lore.kernel.org/r/20261107-checkpatch-file_path_changes-v1-1-8=
b11814560d8@google.com

---
Pierre-Cl=C3=A9ment Tosi (24):
      arm64: Fix lazy TCO clear when enabling user MTE
      kselftest/arm64: Test lazy PSTATE.TCO handling
      arm64: Fix volatility of IRG inline assembly
      arm64: Skip TCO on privileged uaccess without kMTE
      arm64: Check MTE once per fault-handling section
      arm64: Harden is_ttbr1_addr() on tagged addresses
      arm64: Skip redundant TCO clear post-kernel entry
      arm64: Introduce mte_get_reset_tfsr() helpers
      kasan: rework hw_{force=3D>flush}_async_tag_fault()
      kasan: rework hw_{get=3D>set}_random_tag()
      kasan: provide empty stub for kasan_report_async()
      kasan: drop mte-kasan.h from arch-agnostic header
      arm64: Introduce set_pstate_tco() helper macro
      arm64: Add mte_{enter,exit}_*_{kernel,user}_mode()
      arm64: Refactor and remove mte_disable_tco_entry()
      arm64: Refactor KERNEL_GCR_EL1 out of <sysreg.h>
      arm64: Introduce MTE & KASAN tag handling helpers
      arm64: Inline and remove mte_check_tfsr_*()
      arm64: Rework static branches for kernel MTE
      arm64: Move MTE insn wrappers to <asm/mte-def.h>
      arm64: Introduce mte_tag[_and_zero]_range()
      arm64: Consolidate MTE-based KASAN in mte-kasan.h
      arm64: Fold <asm/mte-kasan.h> into <asm/kasan.h>
      arm64: Introduce CONFIG_ARM64_MTE_KERNEL

 MAINTAINERS                                        |   2 +-
 arch/arm64/Kconfig                                 |   8 +
 arch/arm64/include/asm/kasan.h                     | 103 +++++++-
 arch/arm64/include/asm/memory.h                    |  14 --
 arch/arm64/include/asm/mte-def.h                   |  65 +++++
 arch/arm64/include/asm/mte-kasan.h                 | 266 -----------------=
----
 arch/arm64/include/asm/mte.h                       | 189 ++++++++++-----
 arch/arm64/include/asm/processor.h                 |   6 +-
 arch/arm64/include/asm/sysreg.h                    |  17 +-
 arch/arm64/include/asm/uaccess.h                   | 106 +++++---
 arch/arm64/include/asm/word-at-a-time.h            |  22 +-
 arch/arm64/kernel/entry-common.c                   |  58 ++++-
 arch/arm64/kernel/entry.S                          |   3 +-
 arch/arm64/kernel/mte.c                            |  72 +++---
 arch/arm64/lib/strlen.S                            |   4 +-
 arch/arm64/mm/copypage.c                           |   1 +
 arch/arm64/mm/fault.c                              |   2 +-
 include/linux/kasan.h                              |   8 +-
 mm/kasan/hw_tags.c                                 |   3 +-
 mm/kasan/kasan.h                                   |  14 +-
 tools/testing/selftests/arm64/mte/.gitignore       |   1 +
 tools/testing/selftests/arm64/mte/check_lazy_tco.c | 152 ++++++++++++
 22 files changed, 649 insertions(+), 467 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261107-mte-kasan-split-3632e818f997

Best regards,
--=20
Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>



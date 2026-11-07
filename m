Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFE060A381A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rwfm8pwg;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FyVTNUL/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pV+IB1n1BXqWgEv9HmlY7fFAWYiCGwOeQUGrvdEtK2I=; b=rwfm8pwg8Etif0Jz1cVSgAYrH+
	9Ojrpz5/7KWzvYAHsK6X1EHG/yCiQ6/FHa2c5/O71oCWn+dOeEm5qbcXJys1eCFvMGYswT9i+iIrp
	coo+BVSc8Zl8++Ye9n0GBXiiMVefS8vaXGV9UzDUdFd4RC+Q/YmiD+7+RyRcccklDbwQ6JL3niZ0m
	oyJ1rtJUPpJHxveohssij6U5z6gdPF84TkeGTSaGLdl0G5lFlSsYQyy6WMrezj2UmzoJi519Z42y9
	cwaw5ESEI7jRhvfJo41vRaO+2qCvIfmtMrcqA+NA0Bxb0dh9NYemRwzUKFKnaenvQTEka3dKs/AJD
	srlGqK5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiU0-0000000Ev10-0LTi;
	Sat, 07 Nov 2026 15:37:32 +0000
Received: from mail-ed1-x547.google.com ([2a00:1450:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTq-0000000Eum6-0PLT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:28 +0000
Received: by mail-ed1-x547.google.com with SMTP id 4fb4d7f45d1cf-6b42827bb4bso1471171a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065836; x=1794670636; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pV+IB1n1BXqWgEv9HmlY7fFAWYiCGwOeQUGrvdEtK2I=;
        b=FyVTNUL/dU0cAVWqsWnRUA3u8SjgqkYlRQMDXRUgnpYbvYeQvzQuatgF+uolGTYRh9
         5u7N3st3yKWmfzb31jiv3IAKAQCTAqYjAsQeOZDG+CIYeVML9WRh9I4DZ27USkMpefXD
         z5FbjxF1CYJlq1sHUnbPA4gjQR1pvglnVDPDyhE6GCbOpoTucNXcNa6BF7lDWl0VIDI0
         u7PSSQekbKcEOnfCxAr66zSQ3zJh0N1YmWveayUsj3Bq9Z65rvEaq2ntE5lc/cNP9OM3
         hKqY7muY2QSV55QFCul3Iv9uv6M3T66ssu0vUJdSt31GcOSdNKuD4DLhSFVEGiQ434F3
         mrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065836; x=1794670636;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pV+IB1n1BXqWgEv9HmlY7fFAWYiCGwOeQUGrvdEtK2I=;
        b=W9L1iojc1lswt1MLOYNMZzg8N5jLWQU5ivhmGYRlYJkzmAzT/inoQhOoPquBCnwICd
         Al+PgOMh9IAltaXDO+4mhrEKLNU4DGHyU/tYSf+jM9LzDmDEuoESxq9glKlq8aoJiEAk
         3s42WzrUwr6YEeeqyWa9apXrGFGDH/9L6V/hnVxybleChcHFadFqeQdkTFkEHnUOHPs+
         /Q69m/62gQMFm3YehRfP3JLWIAM80GF6nMLG2q/1BcUY+g2I/otD1IEQQc2Ke4K3sAZ2
         ItsG8l5UJyF9lV9b8O7qNEGLdNaXRao1vSMYZj1o7lRlXbYo49rB6W1+mzvzj6d76Ln2
         UZ2g==
X-Forwarded-Encrypted: i=1; AL+hErEEgnfGHXNddtNFv7S6NdRjDkNAvv1BI4coUkjryxWE6aFzOxU30SgZ5aMOAeLmIROQ6/Ap2I1JalRpJcPY3piv@lists.infradead.org
X-Gm-Message-State: APuU4Z+H9jlVeaUyywk4mNf/guK4aJlJcMMldSrYVgN0O/20cc4VCW4Q
	sHPmqQLQnrd3zwMf6dWTx+VbijlyFsOGmY3+bvXZlHKfE9rrXae07WO37kfXtnvmTZw5dmR1HdV
	WNw==
X-Received: from edev7-n2.prod.google.com ([2002:a05:6402:a2c7:20b0:6b7:d74:97ee])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:916:b0:6ac:a862:d8ce
 with SMTP id 4fb4d7f45d1cf-6b5977d8c92mr3702096a12.7.1794065835799; Sat, 07
 Nov 2026 07:37:15 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:12 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-6-d84ea5f30f94@google.com>
Subject: [PATCH 06/24] arm64: Harden is_ttbr1_addr() on tagged addresses
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073722_191925_357AC857 
X-CRM114-Status: GOOD (  12.79  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When neither CONFIG_KASAN_{SW,HW}_TAGS is enabled, the KASAN function is
a no-op, leading to the check "addr >=3D PAGE_OFFSET". This is inaccurate
as CONFIG_ARM64_MTE=3Dy sets TCR_EL1.TBI1, meaning that addresses with a
non-canonical top byte would get translated through TTBR1 while failing
the check above (PAGE_OFFSET's MSB is 0xff), making is_ttbr0_addr()
wrong on those corner cases.

Remove the KASAN dependency from <asm/processor.h>, as is_ttbr1_addr()
was its sole user and include <asm/mte-kasan.h> from <asm/mte.h> to
satisfy #includes which relied on the transitive include.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte.h       | 1 +
 arch/arm64/include/asm/processor.h | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 83f3b05fc784..1d6113ae786f 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -7,6 +7,7 @@
=20
 #include <asm/compiler.h>
 #include <asm/mte-def.h>
+#include <asm/mte-kasan.h>
=20
 #ifndef __ASSEMBLER__
=20
diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/pr=
ocessor.h
index 481f1999f7c1..510e3a3046bf 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -39,8 +39,8 @@
 #include <asm/alternative.h>
 #include <asm/cpufeature.h>
 #include <asm/hw_breakpoint.h>
-#include <asm/kasan.h>
 #include <asm/lse.h>
+#include <asm/memory.h>
 #include <asm/pgtable-hwdef.h>
 #include <asm/pointer_auth.h>
 #include <asm/ptrace.h>
@@ -366,8 +366,8 @@ static __always_inline bool is_ttbr0_addr(unsigned long=
 addr)
=20
 static __always_inline bool is_ttbr1_addr(unsigned long addr)
 {
-	/* TTBR1 addresses may have a tag if KASAN_SW_TAGS is in use */
-	return arch_kasan_reset_tag(addr) >=3D PAGE_OFFSET;
+	/* TTBR1 addresses may have a tag */
+	return __untagged_addr(addr) >=3D PAGE_OFFSET;
 }
=20
 /* Forward declaration, a strange C thing */

--=20
2.56.0.455.g6c5a503b38-goog



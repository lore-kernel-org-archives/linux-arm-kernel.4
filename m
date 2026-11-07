Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9750D6082BC7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4j/x+muI;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BkwGgeuT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8bPXM2LkmtpK7Ni258d7gmUaqYy5Bmjl3oUXnjWcb2s=; b=4j/x+muIcJCUK5rZ1dxdQPbi+3
	h48OjumdhaWnwMrHId0MtzelPCjwKnNY/D++i3TmZMtHjmKCD7UMdPGiYWk/HvdVr/NLLb9QLcxZQ
	D3fVesaC+A3wTyQKuAtQHEz9JhbbWz9GtPeA8FhpvRnkztlCyDxTKLJ6y2soOe4ZKY+qLfcS3qSLV
	/Iaq7Oz92dQh5Duv1guXdSZGL03vQG8GgSK80Xvvvki50+f6LLegKOSsEPwicSKXfZuLabPw7KMk8
	T1Qy1EE5QWUSw1T7gvRugBNb9R7oBqLyeNkib66pTP//7peHeBPJFvjIAaz5hAgb57INB2sANrOPB
	Pvh78KMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTl-0000000Eump-10zz;
	Sat, 07 Nov 2026 15:37:17 +0000
Received: from mail-ej1-x646.google.com ([2a00:1450:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTh-0000000Euk0-15qQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:14 +0000
Received: by mail-ej1-x646.google.com with SMTP id a640c23a62f3a-c40bbd26f74so144374766b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065831; x=1794670631; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8bPXM2LkmtpK7Ni258d7gmUaqYy5Bmjl3oUXnjWcb2s=;
        b=BkwGgeuT3cOMTHrvexPyzxhwJIQCQMSnthDi+m2MnsMB//YlM5C/KqEj50d+7db6ce
         H0Z/8LtL8GOKjxDdBXjgfdnZKZ/ZsakZm8oQVhQbBcOoho9fxznWUnyHl7u5D5d7z4DP
         RtQrNtsilqpzRx12ZKoaioFlgUSfhSRk0fftnIH0yFcCK13rA2KrGIxfNT5BWel9b+Bs
         n6ZndF9+6xZV+T0q9x7pBpWcKaej51RA8F+7h7RpuBSdmJt+8gKJwMctQa8Af8F0VMnb
         XEjPjDDX+/VmiOmNgAUG5FXnE5ngIpALkxSCplQqrccFMDBug1GTuYiaDkdbyldLWHQy
         NZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065831; x=1794670631;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8bPXM2LkmtpK7Ni258d7gmUaqYy5Bmjl3oUXnjWcb2s=;
        b=e2h5UNXlPqV9x9VdEpJhrsXEr1jfJnvoU4Zjm2nAkQ4WJO6k+2qJUDTQWxfdsjreyx
         6BZmxaj4vPxBP3yg4gFs3RYJ8HX6jnmcCL+Iq4HpeYiwR17o80mQh3SBDnMMBgxuXggh
         MkldqLSm+qWfhpqTDrWMYbDjlJiKnYjXCxfXkS39dGG8k4fyyR093x6yWTHSafHyFUUr
         8Opk3xD8Ikf2YwshrC7KyTLW5g9Ial4s1LZKQ/dM7NHZKSphAGXd5r2qZOYMSRw5+qFn
         uwieKInpld/djyAw5ev40HYp0vlh4KxwbbgHGv0tCdzXCtxheGr2n5FM4bnHMTG32KbP
         wpag==
X-Forwarded-Encrypted: i=1; AL+hErFZOPoSWHsYqiB1pQCuxKtHzBoN1c4rzH0FlZAGlDzIFtFBgJtRx3CuelxYochPloK7U44iktbFQ0gHLmGjOJ4J@lists.infradead.org
X-Gm-Message-State: APuU4Z+hCAfeHL3iZ9QNwM1FlLzGtwHnuJqaYFUzQOuVhJERZ6fSFU4j
	tYVCCtc/Q8nOGU4yYCA6vHDnqTeIffDkDa/kY7fVlb7OiDRJmOPjYQ8KydyrD7ifnfqLTOZICVo
	lhQ==
X-Received: from ejbc21.prod.google.com ([2002:a17:906:3415:b0:c49:c3a3:7a4b])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:ef0c:b0:c4c:eb17:3da
 with SMTP id a640c23a62f3a-c4d34baf049mr438869066b.22.1794065830762; Sat, 07
 Nov 2026 07:37:10 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:09 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-3-d84ea5f30f94@google.com>
Subject: [PATCH 03/24] arm64: Fix volatility of IRG inline assembly
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073713_342303_3C23AB16 
X-CRM114-Status: GOOD (  12.86  )
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

Add the 'volatile' qualifier, without which both GCC and Clang treat the
function as pure, potentially collapsing multiple inlined calls into a
single one (returning the same not-so-random tag) through CSE or moving
an inlined call within a loop out of it. This is not compatible with
IRG's architecturally-defined RNG side effects.

As existing KASAN callers are either not inlined or guarded by runtime
conditions, the compiler isn't allowed to hoist the non-volatile asm.
Note that commit 85f49cae4dfc ("arm64: mte: add in-kernel MTE helpers")
originally introduced the helper as an out-of-line function (in mte.c),
so the risk then was even smaller than when defined in a header.

I'll mark this 'Fixes' since it addresses UB but won't request stable
backports, as none of the issues mentioned above were actually hit.

Fixes: 2cb34276427a ("arm64: kasan: simplify and inline MTE functions")
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte-kasan.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index de910f1c19e1..43510341b965 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -111,7 +111,7 @@ static inline u8 mte_get_random_tag(void)
 {
 	void *addr;
=20
-	asm(__MTE_PREAMBLE "irg %0, %0"
+	asm volatile(__MTE_PREAMBLE "irg %0, %0"
 		: "=3Dr" (addr));
=20
 	return mte_get_ptr_tag(addr);

--=20
2.56.0.455.g6c5a503b38-goog



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97BC60A381F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ehw+AXC3;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KXfih8iR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M19XchmpvjLlLoNr8MoVn8Z+VpoH2MJVmxwn0RCJick=; b=ehw+AXC3oNfPJ/QP7KW0mJCLJK
	WZzNur2dCp1M749ZV3Z3rN+rXAkLP3+Dx/gj976MPhdL2sLWjRJeC8HjjSYwT4APhYzGwXg233tPl
	yTftP4MgWp/9/Ge4bI3WpiI6tBh1r672XTosT/RpGm7JpujiWYr5h8IJ+e9vcRh1i4470crxx+e5e
	Lu/mEhfarHJZhDfGV1TB3nap2LASgXLmrgfvodmedglsEsUk0oyK36BBQLgtuLykEa1yatm4i8wVk
	nv8WTnjJT5bPSXNdEDfuzS/qIQyI5Ouerjjgaf1xlIE8iXxWbIBVI7h6xPhO4f0OySi7+uJIXeCOl
	pOrrCciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiU0-0000000Ev1l-1VON;
	Sat, 07 Nov 2026 15:37:32 +0000
Received: from mail-ed1-x545.google.com ([2a00:1450:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTr-0000000Euns-0Fb4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:28 +0000
Received: by mail-ed1-x545.google.com with SMTP id 4fb4d7f45d1cf-6b1bc2e62d5so2009214a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065837; x=1794670637; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M19XchmpvjLlLoNr8MoVn8Z+VpoH2MJVmxwn0RCJick=;
        b=KXfih8iRLzjgLdu2cN37K6BsZLEJdwgyY6BG0D5FEitdIQ9BhtM5Nkpx4D6+03bjJz
         XksbyhaW1OyX/wU0g3kwBEgSbXSqc444Nd8OKEmdPzb71VLncaLQIug3mMFZZEZ55VB/
         uPpcZMwdeCEH1A/mgXCRGlIxrdKjGNCsLvtJHNj/eYx691rD7e/7d1J9WQAdnWDjTm2V
         2PX24HpjgBzGqwzuf3CpXycmuzbzhEfN097msc2V481l4poy0KvwSjD4bXggd8jHP1QA
         ljm8Xdtg8zS7TJNxBOi/W5SXvbp8lnk108aanNhZO1gHSG5nnH7lRcw4mym0SKI9V2dc
         J/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065837; x=1794670637;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M19XchmpvjLlLoNr8MoVn8Z+VpoH2MJVmxwn0RCJick=;
        b=VVCm87ccNwx2XL0eLdSc+sFrXh2O8oq1fPWi1jPCBY8T9Wqw6ZVDQjH8y9V2Z6p0qT
         Z00u35kpBAI+UAx9v58hTQCU1HoB3vd5vLhdv4eL7dkhnmVqZDO781Uh5pWqxaaI8aec
         Dy98julqdPjmJqYgOlltPyApauZQIRr8USEHkDA7h7nsyMBkKtPdFpVhWxXynYJia7kq
         k+FsFUKU2+UMq0A2kv+D1vZQxGqzqWKgQiNzYOdHTAJGoRCbyaL3s0Yg7Y/J/DWzjLcK
         I9rUuF7+DuDpmOHAXk469ndT/nbDgSwIei2ZMZ3oqSgB7uPzg6Rf6xxWhCbxI1LXpNum
         DJ/g==
X-Forwarded-Encrypted: i=1; AL+hErHP6ov+90/8AtD2rXysFMTxekpFoL8dw+kHvraiE8qPsWo8Rntlzsm6PtP5dKXAQgJpKFBbxwTJi/0I8KEED7Bu@lists.infradead.org
X-Gm-Message-State: APuU4Z/VLNokRh1yDuURUAoACelvmwYKjLac5sZ153bORqDHFNf+1qI8
	//nTuT+WfaWuWgHEZjBpod1IOrCbPGAnPAPJjEO9CwQAvXt3xT/flOXDLAiF7RRvtV937RtG++c
	gYQ==
X-Received: from edcnu31-n2.prod.google.com ([2002:a05:6402:c51f:20b0:6af:acb1:c04d])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1947:b0:6b4:9c38:a990
 with SMTP id 4fb4d7f45d1cf-6b5977f393bmr4155606a12.31.1794065837376; Sat, 07
 Nov 2026 07:37:17 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:13 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-7-d84ea5f30f94@google.com>
Subject: [PATCH 07/24] arm64: Skip redundant TCO clear post-kernel entry
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peter Collingbourne <peter@pcc.me.uk>, "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073723_116309_EFE99904 
X-CRM114-Status: GOOD (  12.37  )
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

For performance reasons, kernel entry might skip clearing TCO. Still,
tasks expecting synchronous uaccess tag faults to be reported (and
therefore raised) require it to be clear; this is why thread switching
and MTE enabling functions were calling into mte_disable_tco_entry().
However, when the kernel itself uses MTE (for KASAN), it must have
cleared TCO on kernel entry.

Use that invariant to skip redundantly clearing TCO and/or checking the
task's SCTLR. As kasan_hw_tags_enabled() uses a static branch, TCO
maintenance is completely optimized out the moment HW KASAN is enabled.

Cc: Peter Collingbourne <peter@pcc.me.uk>
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/kernel/mte.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index d1dd9b80173a..8025ee1f7fdb 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -5,6 +5,7 @@
=20
 #include <linux/bitops.h>
 #include <linux/cpu.h>
+#include <linux/kasan-enabled.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/prctl.h>
@@ -290,7 +291,8 @@ void mte_thread_switch(struct task_struct *next)
 	mte_update_gcr_excl(next);
=20
 	/* TCO may not have been disabled on exception entry for the current task=
. */
-	mte_disable_tco_entry(next);
+	if (!kasan_hw_tags_enabled())
+		mte_disable_tco_entry(next);
=20
 	if (!system_uses_mte_async_or_asymm_mode())
 		return;
@@ -409,7 +411,8 @@ long set_mte_ctrl(struct task_struct *task, unsigned lo=
ng arg)
 		mte_update_sctlr_user(task);
 		mte_update_gcr_excl(task);
 		update_sctlr_el1(task->thread.sctlr_user);
-		mte_disable_tco_entry(task);
+		if (!kasan_hw_tags_enabled())
+			mte_disable_tco_entry(task);
 		preempt_enable();
 	}
=20

--=20
2.56.0.455.g6c5a503b38-goog



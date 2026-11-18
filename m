Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C278606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kcRl31dg;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QYVSy7KJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OIsEMXco2ZhYz3ZqDjy8jJcFD62W77oBBUIsxaXAIKQ=; b=kcRl31dgBDFo59G1ngAUYkMFYs
	O+vHZEgszShvF4sbLno+J0vzW8iCzTFXugrQyO94ROn7CuoCc3aAYDvopt0A2SsYM6R2Da4A3foQi
	jSEu1W0WT1+J1MzmGNC4fnwQaHp0ylL57YPHtFZt+9wGLUku/RLwAV1Gv8IEq2Ye3spepbqwmrl8f
	0XyBoOW5yrp27lLSg6hAXAvJi6ZQonXTVq3sQmNbwrl9vFMkip0XH/9stLH7MvJopWiWupjBEdtnU
	AyJnJtb24SQnlemS2Fdbf16x/4djlQI6ujml8oVsAOjosrre4cy5JSNN/CYj6TKCr2VYVBngw3S48
	Kly1cxmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIN-00000009tTs-3L37;
	Wed, 18 Nov 2026 18:22:11 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkI6-00000009t9b-20N9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:21:55 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4bb6bac1e84so9897665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026111; x=1795630911; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OIsEMXco2ZhYz3ZqDjy8jJcFD62W77oBBUIsxaXAIKQ=;
        b=QYVSy7KJzF5D91OJeB2pysp4u6bDJ5eWimRsYzQcnYPjvR3P6C9GIOHQIwHtsZS2G8
         t21t7bMwplDvBmkSz0kTIGEq+aiFZTfQFJubRZwZXx6rjRRmeIuTtJ5rv84fLYmwq3WH
         rRSfXdicsv4bwOGtEaLkBmpbjbN6rsdVfdZ1j9hFcrDNcEWwVyXjo4gQRTi1+RdwdtkU
         ElKV/O3ZjDf8o5XqyZfzeiSTYmLYAPpnA8TQ22izXLPjZIBO8lPaSDO2XYQfZ5yrQZhV
         qQl4FacR9sW1JzmCHVM5X5G2g3khpmAIkaa/52kejxX4xxQcDTlhkIhMnlksJzr8uPTR
         OIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026111; x=1795630911;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OIsEMXco2ZhYz3ZqDjy8jJcFD62W77oBBUIsxaXAIKQ=;
        b=rEVX9en4M/wNZECBWyX+JHef7ZPy5eEjMI3Hhqxr86ecasFsHBp9xxJWudnRuI/IaU
         vRK8emXGv/YuGuQM271DWj93aP1crUT/Qt7vW0df8P0GY5IomHl0DwGWMNrerQRAZmuu
         d71Tui3bBk9Tv/KQp12dv9TcEzau8R+x3SRYNEw7h9NnfDZfozLrFvxTfvkAEW40VuQP
         tkH8rI/hgZuGHvpNIbx34njWNzw1CtAnZHl2UX/b9CN1JE1VJ9VejjG2cVsc5/oeIM65
         hnLNb+pEwG/WQ/NTiAOaBavjnxM1ghTYcQItZN4T/Iw9K1BBWzOwaVJQtURyVgdMC884
         Ts+w==
X-Gm-Message-State: APuU4Z9+eokanCFARb1IjpPCG/WpZF0kub/YJv/SFKi0jnMA8wdWCvIJ
	sqsPeRtqerOpht29eA/9qvM6Xj2go5qwL7hUosRiybMMZ9HPJTDl9Skl50EZL9vQZyAgX+DX5A=
	=
X-Received: from wmbju10.prod.google.com ([2002:a05:600c:56ca:b0:4a3:5dec:ff72])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b6d:b0:4a7:6425:c274
 with SMTP id 5b1f17b1804b1-4bb7d6d1d71mr71002175e9.2.1795026110241; Wed, 18
 Nov 2026 10:21:50 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:09 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576; i=ardb@kernel.org;
 h=from:subject; bh=tNN7kvvvqrlVm6V6P5FGp3YhgkjQslREMs9fj1wtyFY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm2n9dqmF22tvpj8prrwkcChNKiwqKunG9i7vLGkGk
 5VvOHM7SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwEScZBj+mf9ey6hv/kNuk4P6
 Ua3fjPfW6spdF5s465ttrbKUheWZyQx/JTOspZ0caqaxyXeG69ewGNybOWHKr0bNpV0dTc9kUzb zAQA=
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-24-ardb+git@google.com>
Subject: [PATCH v4 03/19] riscv: Make _text point to the start of the kernel image
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102154_528724_1DB93A33 
X-CRM114-Status: GOOD (  16.88  )
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

From: Ard Biesheuvel <ardb@kernel.org>

On RISC-V, _text currently refers to the start of the .text output
section, which is placed after the image header (.head.text), and is
therefore equal to _stext. On other architectures such as arm64, _text
refers to the start of the image, and is used as such by generic code,
e.g., to describe the kernel mapping in /proc/kcore and in the ELF
headers of the vmcore, and by the EFI stub.

Now that arch/riscv no longer uses _text to refer to the start of the
kernel code, move it to the start of the image so that it is equal to
_start, and the distinction between _text and _stext is the same as on
other architectures.

This also means that the image header is no longer omitted from the
/proc/kcore and vmcore kernel text mappings. Other users of _text, such
as kallsyms and ftrace, only use it as a reference point to calculate
relative offsets, and are not affected by this change.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 1f4f8496941a..9849a3e4d102 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -28,11 +28,11 @@ SECTIONS
 	/* Beginning of code and text segment */
 	. = LOAD_OFFSET;
 	_start = .;
+	_text = .;
 	HEAD_TEXT_SECTION
 	. = ALIGN(PAGE_SIZE);
 
 	.text : {
-		_text = .;
 		_stext = .;
 		TEXT_TEXT
 		SCHED_TEXT
-- 
2.56.1.708.g77570a6a1d-goog



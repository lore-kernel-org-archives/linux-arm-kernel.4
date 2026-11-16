Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D055A606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PEGYWw6F;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=evWE/L6E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ys9OiBJUlo0yeYgXBzy5BjlTE2/m4y7kU18rGSki1UU=; b=PEGYWw6FMjB6Ooy3MvL47HcWEK
	P+KtdggAlhLsC6dbBi1lj4BIQMxCdEfqppvt9RxtWl6jnbptTc8Avd80aGUf/lgYM5YzQ6eCGVY3q
	RYQ1VfQKruzYRRlqcyDRfGptU2b27avyyE7EiFUixZf95fi5xskb2ijeAQvz1OE82Q2VDJMXncso3
	jAYtFsKHb4FDp5R1+8CZQVBZD721vHFJ5YEKxEpxIEpmGSSiKcujmKJ8hjOz2PFd1pOuAiJgSfDNc
	Mrb1zRK0ueFPB4W6Q4uLtXuO5bx3s1eFFC+SSDJQu8Hw4M/GKoAUxfAOyu5cdcyEtjQnzxMBqDUZN
	bAHA+ZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxg5-00000002pNk-2Uoj;
	Mon, 16 Nov 2026 14:27:25 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxfx-00000002pF5-21zG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:27:21 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4a70b42bab0so16582595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839235; x=1795444035; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ys9OiBJUlo0yeYgXBzy5BjlTE2/m4y7kU18rGSki1UU=;
        b=evWE/L6E7Ag3jVApOJchdaaisL19dxsDMIu4PwCQv/3q4xFKb/xzw7uidRxZpstVjF
         y2YQ2hZdn96Cx8zW3B3iEo8MdhJ7Ky7P6E1GGCVSDHK+IWlxUKwzxvTnmIE9LgUvuM5I
         DJyqHNyfHYA2dXg7vW7YEPRZ/jvSoDcfSLJVX6cMf8BIDa9nrmGq/ppUyZroYwusTNvY
         vlaoN4uIyP27Gv/N98w1dky4w4YhkJamAcBp7qVCUEMtEk9nKMY2++tJ+iDWuBd1oKoP
         8ci6mGVLQzQNFKMW2yOvOkCvRIK63mHP8k8RgMCBwB2ebA9yE3CmLWiUqY8sgPSgNbYJ
         Oprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839235; x=1795444035;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ys9OiBJUlo0yeYgXBzy5BjlTE2/m4y7kU18rGSki1UU=;
        b=D+kbeSgG6twbwQUCXGClSreMvYFGPYfzxowtS1NPvH09uJgrkj6gDQjvp0HBLuoN7I
         cgr4/jfBYOAqkUAhzsIui0kzgFxEwXGUi1YDkrR107BjEyhvseZbado0AaB97U4e216K
         uEYC23+sMWugX42oYpFz9DrF1pAG7AcqPg8dBtaAR57NeMp7IHEa8XctKe2i4oA4NfLs
         fRjubcmGGJovH9DAUYvy1aLZRGBJ1ioNfEcD8/lOZBvkAovAm2aloYxxZAHC7GcltEUC
         PhZPXPsEFDaDTRtkOpgP8zA6CHvbFxMwN/NZvloKibJy4+QHnVJQRXkWNaeIZYSiwb7M
         LQiw==
X-Gm-Message-State: APuU4Z/cmg196qdNS100WiUTkFXIF76UOVkL6cCzLlX8rCZtWb1XVPPd
	bTIcL53W2Yk/FZtoXuw3E9Q7lo4/chtd0w2mWHtnzeTVB2qjkAyizbIxFOHmckO3OxYvfb8ekw=
	=
X-Received: from wrbdt8.prod.google.com ([2002:a05:6000:d08:b0:48c:4566:c9eb])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6a0d:b0:4b9:f90b:1c4d
 with SMTP id 5b1f17b1804b1-4bb4e2d5f2bmr239377595e9.5.1794839234339; Mon, 16
 Nov 2026 06:27:14 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:21 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1472; i=ardb@kernel.org;
 h=from:subject; bh=mmsq8s70dc7bNFJDZXgqjzymvtzE/nNvMalQITqcOTw=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu3UJ9vcdyFG2nWGW/zz3w2eSlTsfeBxTOhJUZZb6ctf
 Vhnf+hjRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZiI4SSG/z7r9Rf6bZwfUfP4
 kLHJCjYONxfmqZofN0xSXf/nxdmg0BqGv/IeFg0uLJvZl19WUD+yJqV1hbSMkWSL2P5b2xdw7/x oygwA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-19-ardb+git@google.com>
Subject: [PATCH v3 02/15] riscv: Use _stext not _text to denote the start of
 kernel code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_062717_552076_1254B0F7 
X-CRM114-Status: GOOD (  16.08  )
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

On RISC-V, _text and _stext currently refer to the same location, i.e.,
the start of the .text output section, which follows the image header
(.head.text) emitted by HEAD_TEXT_SECTION. _start is the symbol that
refers to the actual start of the image.

On other architectures such as arm64, _text refers to the start of the
image, and _stext to the start of the kernel code, and generic code
(such as the EFI stub) may start relying on this distinction.

So switch the only user of _text in arch/riscv, i.e., the "Kernel code"
resource that is exposed via /proc/iomem (and from which the "Kernel
image" resource inherits its start address), over to _stext. This is a
no-op given that both symbols currently resolve to the same address, but
it permits _text to be moved to the start of the image, making it an
alias of _start.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index d79f99b86033..e6112d424fde 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -91,7 +91,7 @@ static int __init add_kernel_resources(void)
 	 * child nodes.
 	 */
 
-	code_res.start = __pa_symbol(_text);
+	code_res.start = __pa_symbol(_stext);
 	code_res.end = __pa_symbol(_etext) - 1;
 	code_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
 
-- 
2.56.0.611.g1030f0b940-goog



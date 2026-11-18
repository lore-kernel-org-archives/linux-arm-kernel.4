Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BEE606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A8G4xLeN;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fWuPtWTk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8uARk++meO5zgQMDlHPkaRg5Ipl+Zw0cx2xa6wUMMvU=; b=A8G4xLeNW0TQks7c0YIlHSt219
	eaFX2F9xi4SoS8UEcd7KYzGw0wXosgTdna3lq1pF+bvyZJ3hPt3kLVViGBgMqF6mTesY32vjmZj4d
	aca5afOYNXHW0hFMg8t0pVhv+pzZq8MFoFTOdDL+JruUX3qMwF5GJ+x7x8YeY2dT0ZRoxHDwEbAxX
	jSc5sEPSRJsHg3vLshsWa1/r5UKW7nogTCxV+PeLoc4IQLgdIMyoCfBY9HXne6VKBU3xNxh14T5eF
	TsNHLL3GQ+p6EU5yJoBpkNsLPky2vFcwLOC4e92ijmA0tyrKLPN+zUT68OYgVE7NBKna6RhxIkwdn
	fNiVCF+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIN-00000009tTR-2ZhB;
	Wed, 18 Nov 2026 18:22:11 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkI4-00000009t8i-3GDj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:21:55 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4ba01393800so8827495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026109; x=1795630909; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8uARk++meO5zgQMDlHPkaRg5Ipl+Zw0cx2xa6wUMMvU=;
        b=fWuPtWTkLdD1pApH5G+yIj+wVD8RC3JqkwN8C0Li/6mofEvrqWI8Xr6dy09PycYxUG
         6UFvnyg1Fq/JevYgOiDboxQjF33HQiKfvQteq/KAvtVhjsgpCqefnwToCJTbFdPLGQvp
         2FT8HPXQO81+1qg+UjHcP6cH61N4CfWdvV3h2R0DqBe57IE9rv/7rAApr1wEWds9PXKL
         hruz4A5kVrmfuF7qaMePa1c6R7GpgDyLfGF37pUlLypQSwKMqaksefNvh4o8pbecje0t
         qlXiRW0BPyjFpg+WBBZPyazcFe2dKfstPAuADXLKXwMw5vhsq4mKOaOhbexWkUeWn//k
         0HNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026109; x=1795630909;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8uARk++meO5zgQMDlHPkaRg5Ipl+Zw0cx2xa6wUMMvU=;
        b=sUtxTIK576KfYTfEkMIyhhWIvwxRO1F6A7y6t0F1N5cit9SxHP8zsYZMz5AI+7S7Cz
         ww+gNrQGZFS8NZy3/jskRtU1KjVBLVR5X6nUG70FR5ULfL5C7dwNSvLLc86ySDlzy9V2
         p/eHvCGH4Hk2AUboP7s29LYnhYNXLWzdb30q39sdcscf4pnYWcM0DPo09/YcMzboaSet
         UC/J0zz+0qC625wmm2C/UH6UnDunBlxdscGjIe0h3Y9SBBCb4uJ6cG+Oedt2og9jpiQI
         CK4UNqyiLXwcYvabeUmCGKnaXUQHMB1hRnrQP3gmOq99/Qh1AFXUOC8YuoVWTSrrSgc1
         sCzw==
X-Gm-Message-State: APuU4Z+CQoUIcIHJlPxxKpnC+EqAEbYLbRDLHWHCLixBoCdmcJmHzd2G
	WC/0jm7c4/GAB33OR/jxLlKLiMcdlOjnMCs3jqEn+HEdLwiAIqaxU5cgLnZUKah2w+fhpbvd5Q=
	=
X-Received: from wruh8.prod.google.com ([2002:a5d:6888:0:b0:4a7:4422:f19c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:468b:b0:4bb:6cef:d14b
 with SMTP id 5b1f17b1804b1-4bb7d5d64c3mr73846785e9.2.1795026108878; Wed, 18
 Nov 2026 10:21:48 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:08 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=ardb@kernel.org;
 h=from:subject; bh=vKdz9BGSZVExEz+d9rJxUgExCcdNux9c9+LOmmgmNfY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvmymTmUW7PTesiP30fqlynVQUw7ELZQZ1eu0r/0sfD
 THmbeTsKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABO5sILhr3jAfmfn0L3nqq/N
 4sjPd9leY7N46grXDmOWVeV76+sV5jEy7Mrxff+YpWTaT9GJLTl/ck9uODnZ+qH+kt6Sk/v3H0i IZQIA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-23-ardb+git@google.com>
Subject: [PATCH v4 02/19] riscv: Use _stext not _text to denote the start of
 kernel code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102154_005071_4E16E1BA 
X-CRM114-Status: GOOD (  16.09  )
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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
2.56.1.708.g77570a6a1d-goog



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099AF606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h1/Qqbm5;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D2fyPEAs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AHVLK8gN3JGtLR47/Vi3zFfCL1k2jq913taY3VtB1LY=; b=h1/Qqbm5f8y4hqh9CfnO/nFPss
	EhPaTOQ8aGZvb5cfSbfXfSsPTTcll9LZOpX0W3NELl64sRBrsqwtYPCTvyd3sIKCuuvIZeb3gom6D
	XMz6tCzq6T5udN9TiADlR+NFxzi/DOz03xWu7OBwnQTKZ5LW/FbWbBj/6h1eFbyEH8OUjLS1MiPPu
	a0JmYV2f14/ueU+bA5E1wNqwvoeJxPo19cFiv3OjnqMrPhYVnNH0Z39pYkHNkhIctvp0RNJL+s1Se
	9h4fsY7J4vRpPH5gH+O/xLN2V4bNNn/oV7CjsNDC7W43sLZfows0KBkQYxaqfa/IlrgGnIAs7pEt1
	o/P5IvpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIm-00000009twt-26mA;
	Wed, 18 Nov 2026 18:22:36 +0000
Received: from mail-lf1-x148.google.com ([2a00:1450:4864:20::148])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIA-00000009tD5-3YbF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:22:01 +0000
Received: by mail-lf1-x148.google.com with SMTP id 2adb3069b0e04-5c15bceca9aso762541e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026115; x=1795630915; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AHVLK8gN3JGtLR47/Vi3zFfCL1k2jq913taY3VtB1LY=;
        b=D2fyPEAsDdSDAqdnDPTJwrZ7r6ZA396d0T8PKQvmrYZhF2Q3aG1QadlWxHnTx3fMi+
         jq7GNI1OGLy0dNwGUDz+nKz0DsguR5bSMKPRhrq5EK8aswHTVsdF1jFsU+Fuiv/EtZuo
         kH+0NseF9OXStvEHXh4bw9+SaPGj0SpAmnwdryhMLEHGqcXugB2b5J2VA93xLtqgib2o
         NDlaywQrnkTlUbE41SACnXgeoqhrdV2JJX+ahmnUFK5ns758SvLzzhPdW27zc2QVaieL
         awO6azTKOjN41JROFdT+3TygzyBCH3SD6/TDCjWxtZUkLiQXHjs19ojGhexLooDLLK/O
         xDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026115; x=1795630915;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AHVLK8gN3JGtLR47/Vi3zFfCL1k2jq913taY3VtB1LY=;
        b=tAHiL3lgizShXjdIdZffBY1E3GgJ6VwUA+glcUfggDU/K34DdrR7UUrgpcxnJMACch
         ibjWtFyIVADhNSvFyMNHh8k2f4VGULLRPh84JWBs29ZAp3yelPmT6gZ8aQI/5T9IV5f/
         MktR4MOdqY4k3eMjgwv2NY/Kyjyx4F3f+QbXg2Q6fZV3lPPA7f+pMMI+M3Df2XkQQ9MR
         v3m4eoN7jgZBRMZEAUOAo8+ZupxDuuGpSpKdcwssFcmZlcCkzvazdOCcrFxim1fG2ZoO
         LVj40J++2rr4pFnUWWNQw48fCcpX68Fc33Fcbi4EM5NFxP0AtYeRqM5sOJAIV7a71tBN
         11gA==
X-Gm-Message-State: APuU4Z+Fnqxpl2aFyzKFhpqcIMAVfGnmM23dwM3CuejHl+/sapJItmbl
	fBsYfQKLqypkuDOXf11MV3/BLJ790mapJ/oidGUME4CZAdXkfCG7Ez99dIAkhWXGYKAnYRL7LA=
	=
X-Received: from lfbey12.prod.google.com ([2002:a05:6512:678c:b0:5c0:343:63d0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6512:1322:b0:5be:516f:1b4b
 with SMTP id 2adb3069b0e04-5c1a9bfbef6mr1173325e87.28.1795026114420; Wed, 18
 Nov 2026 10:21:54 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:11 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269; i=ardb@kernel.org;
 h=from:subject; bh=tASZvRhKDOWjZ60RkT+IntWFeW/Kh2vWRn/QEfDreKI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm5msC79deuT9dVvP9cSTiye5ZGrz/fDZqu98+9iRb
 UvzA0OTOkpZGMS4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEFrAwMrz4aNTAevTAi5Xn
 a25PrLxmp6L9PXJNuGF4uKXwH+9Qzj6Gf7Zph5fNXC5YYXDQuCF/wTRJzW9dDzv6xZuPvubr3b+ ngQ8A
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-26-ardb+git@google.com>
Subject: [PATCH v4 05/19] efi/libstub: Avoid _end section marker in library code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102158_897920_A2C7E376 
X-CRM114-Status: GOOD (  14.53  )
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

The _end marker could point to the end of the kernel image being loaded,
or to the _end of the zboot decompressor image, and so it should only be
used in code that is obviously only intended for the former case.

So instead, use kernel_memsize and the image address to obtain the same
quantity.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/kaslr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/kaslr.c b/drivers/firmware/efi/libstub/kaslr.c
index 8f8dc335b3b3..b34e4599f0f6 100644
--- a/drivers/firmware/efi/libstub/kaslr.c
+++ b/drivers/firmware/efi/libstub/kaslr.c
@@ -125,7 +125,7 @@ efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
 		if (!check_image_region(*image_addr, kernel_memsize)) {
 			efi_err("FIRMWARE BUG: Image BSS overlaps adjacent EFI memory region\n");
 		} else if (IS_ALIGNED(*image_addr, min_kimg_align) &&
-			   (unsigned long)_end < EFI_ALLOC_LIMIT) {
+			   (*image_addr + kernel_memsize) < EFI_ALLOC_LIMIT) {
 			/*
 			 * Just execute from wherever we were loaded by the
 			 * UEFI PE/COFF loader if the placement is suitable.
-- 
2.56.1.708.g77570a6a1d-goog



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3127860A2625
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Km2BpVlD;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IGdaR12N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X2HAR1/QIm7cbi9gzcaeZomwRblEdyJ34MRcnIFpfbg=; b=Km2BpVlDVe7a0wfzC3Ku+LUsK8
	C01U/nwByBSxWtFINSmPvPqU0dbojZbslv2JStafv7u167lW9kC04ZJFd9q9KGpgBQj7FlXx16cQq
	vPFmRiZhjSeWKZkzoKS9gMbmVKj0QViDOwAhcHdBGHmb0jGZpqkkexK3P4jBz4ud4XYe8/XMqV/JT
	glwn61K5oWV1kPzmUSHw7SiLDMPpl8LAfuqAvS0A3aenX0uNOqdc4dwAeozyMJnyLNgAaRZNjOykm
	+jDvOqeyj5GQhB7h4c62WncjHXQKvP4Bmp3UiHS3jxfe/1sbZmlD+WYU4yxDxQxutvz1Quc+ggnNa
	tIW6UbcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkJC-00000009uWL-3pv4;
	Wed, 18 Nov 2026 18:23:02 +0000
Received: from mail-ej1-x647.google.com ([2a00:1450:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIJ-00000009tN9-43DT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:22:09 +0000
Received: by mail-ej1-x647.google.com with SMTP id a640c23a62f3a-c50b0de2139so99844366b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026124; x=1795630924; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X2HAR1/QIm7cbi9gzcaeZomwRblEdyJ34MRcnIFpfbg=;
        b=IGdaR12N8qXBg9wyRCwCqEww1JUnpEIgc24Xy5IwBcGmjwc1JuExHG4+Y8NQOeW2LA
         5QnFRULvl4UTHQnkovNJ0wUTYEmu1U5K0plTBNWOqx/pElxjYscECCMsSmnj0gJA3Gsk
         NBEoUzwNOdJWDGXci2BN49Plwgolhp1VBOsErmQRw3rl+whBTYRTHAv3w0sYydtFFghc
         RS2kCiJmh8G89E7MJ2FiIi7fksnC9HlVkAQM7p6o287AEtGp2Kme8/8no6EpqcDmy8tX
         YXAVgLKWLjALb3jBzgcZ8LEyGtAe3E98AEq51ADo/oQxNHJdnqHGs+ug7qct5R2P+7KV
         RqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026124; x=1795630924;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X2HAR1/QIm7cbi9gzcaeZomwRblEdyJ34MRcnIFpfbg=;
        b=NMnx/QtM5M5McKikfk1Jq0sTI8vyCJ7meri3ShxL+vLReubE5v4BALTzIMResSAdhl
         fkUq7nkLXIFHfRnneN4MooY541UtfknpYBHQfQ40bWvdspfqFYp+f32VQkb7TkQeUQQz
         7SaDS1mzQp47g9ZYaHuD9VTEu2J6iB/ZPIFn/U17RGcrgQ0NNJjuPFHfgXwPT8M7GBte
         fMw/F9LiUUSknn86IzseqZHx0ig6vUggKmwELVLo4YZ7jcor2+3v/bAF4LjHh32beElt
         HLXtV6NN+mFIOQgodmueyC/gwgIEB8yqq+6N4wY1hkRf2yHCfg3oORB+MXn3CpVAMpSC
         dtaw==
X-Gm-Message-State: APuU4Z8fmt2xM0MPDZ7cuBbe4QRH/ip9NpVNbgPQiLomTqRPWLeql/qS
	FbmbfV8F1T0nyeMVUuyLAKN2HygqiwL/zCn57oDGglvGQBnHgof90LW3JO62N9waqN1fhqzt7Q=
	=
X-Received: from ejsj16.prod.google.com ([2002:a17:906:4750:b0:c50:9014:5739])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:9490:b0:c31:c767:ae0b
 with SMTP id a640c23a62f3a-c510dc46093mr335886766b.0.1795026123628; Wed, 18
 Nov 2026 10:22:03 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:16 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1913; i=ardb@kernel.org;
 h=from:subject; bh=VIsLiroKmQWhjV/hmhsESRfVSQ8Kw0tSPcHO14prx9s=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvmwWvvm95e17E9K2NDbPkg+j/ukJRfPtiH+Q4JSYcv
 PmxdH9kRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIZgWG/2E7fT4eu39zRh1f
 83dNmbx5TW5zrrkcP5aX7OzzbWmoeCLD/wDLYM3ApSk3e8R+/VvhvkTocrniAeuGitNi00ISZ1g WsgAA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-31-ardb+git@google.com>
Subject: [PATCH v4 10/19] efi/libstub: arm: Simplify handle_kernel_image()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102208_074758_17628443 
X-CRM114-Status: GOOD (  12.83  )
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

Now that ARM moved to efi_image_info for obtaining the base of the
decompressed kernel image in efi_enter_kernel(), it no longer needs to
distinguish between the image address (which might point into an
unrelated allocation below the decompressed image) and the reservation
address (which is what can be freed upon an error).

So use image_addr/image_size rather than reserve_addr/reserve_size in
handle_kernel_image() to return the base and size of the allocated
region to the caller. This will allow those parameters to be dropped
entirely from the prototype in a subsequent patch.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/arm32-stub.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/efi/libstub/arm32-stub.c b/drivers/firmware/efi/libstub/arm32-stub.c
index 798b2ae3bb03..55d4fa3177a9 100644
--- a/drivers/firmware/efi/libstub/arm32-stub.c
+++ b/drivers/firmware/efi/libstub/arm32-stub.c
@@ -128,18 +128,14 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	efistub_image_info._text_offset =
 		kernel_base + TEXT_OFFSET - (u32)&efistub_image_info;
 
-	*reserve_addr = kernel_base + slack;
-	*reserve_size = alloc_size;
+	kernel_base += slack;
 
 	/* now free the parts that we will not use */
-	efi_free(*reserve_addr - alloc_base, alloc_base);	/* no-op if 0 */
-	efi_free(alloc_base + margin - *reserve_addr, *reserve_addr + alloc_size);
+	efi_free(kernel_base - alloc_base, alloc_base);	/* no-op if 0 */
+	efi_free(alloc_base + margin - kernel_base, kernel_base + alloc_size);
 
-	*image_addr = kernel_base + TEXT_OFFSET;
-	*image_size = 0;
-
-	efi_debug("image addr == 0x%lx, reserve_addr == 0x%lx\n",
-		  *image_addr, *reserve_addr);
+	*image_addr = kernel_base;
+	*image_size = alloc_size;
 
 	return EFI_SUCCESS;
 }
-- 
2.56.1.708.g77570a6a1d-goog



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA46960A2602
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i4+EgJgA;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K8ZgQ5po
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ufXRKDkvqGZ7V1E+zy+j379v8X/+jc3iv3T/Ea9AhuA=; b=i4+EgJgAKUq4RJn/FAmdv3GDFO
	dJJO+zxWAo73cx8FukvqT/arJlt9D9FwXfA2Ab1DiSWyImwjHfTrW71QtnQTZkKQn3u/MDy+52CEY
	3eyRpvkWPGTeayOB0rGbxBDFh1Gf7ZS5l2+oJEtcsHj7hFFmpBsod/GPu9iD4BBLB0Ws2FQ1U9Edp
	LgKdc54I9AH2p4lcJWaTvntUORbfd2o6qOlj08l2YgIECBYw0seTVc2JX9pUDzk6AxPQKc+CPM8KS
	Gs22q7tKCj13T+8j7D6ETuKOKn8eDI/eIgwqWz02zGqfGkfikC2k5Yd+rubvA81dNMVeDmwYKMB4l
	lzk7+1yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkJk-00000009vOb-3SjH;
	Wed, 18 Nov 2026 18:23:36 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIR-00000009tVl-02N4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:22:19 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-499ca65ae87so37109f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026132; x=1795630932; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufXRKDkvqGZ7V1E+zy+j379v8X/+jc3iv3T/Ea9AhuA=;
        b=K8ZgQ5poRYbqNWT6CUreXrIWxLieIpAzC81xueH/jC/9vIOykjs3b8fqZztr5+B7GH
         DIZcr9EatC60Dee1IwE4BUBxj1DXgxHzVn8vXQVsg57pksfiWFD1+UJpG8ahFn3ieTcc
         WCoYXPThWWofD+npynRGSNE97brR546WNOcnTa+3DQnFxFsGo81Ntf7KrJ39+dbZCaWK
         uSq2sPPCNgSo8Ua1v5IkDTHmlrppSc0mA/Sh1rzvqI3lqTy4bNaVmRbSCNA/J+LnVQvo
         k0x7VYBITSah8XklLuoIw/BRw0X1eYShlTHLSwNVzSTix/RP4ZXjr3IMTAs3wszPNdp4
         MzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026132; x=1795630932;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufXRKDkvqGZ7V1E+zy+j379v8X/+jc3iv3T/Ea9AhuA=;
        b=Pg71CA+q0leldT6kt0JdvNXOJQGT6Z6m/GplBp4ew/8HnXmeqr6KtGLFIxvmdzfly3
         hpI4NIVTKRUTdOn6V8Yzn9VoviveTdWiVW0mLlgJAoFj3N0go648biSCW9eKS9gwnD4G
         dmVRK16m6V+7RRlR9T+2eg2qQWOZPue3jfCNMh7UkudYkaECBPAJmvlz07160tkJ00Mx
         juM4o2ipfn19udC9P9slPPE8ZHebM05dFOQt2mwT1Ph6upM9zZ6hRgoq46nWLcx7A8sw
         KY95NwSpTZTyApD8kkRQDNhRlmbG6TevDmQIzx7reR1YAEl96sIROPbAHKEdwQCEiE+t
         wdjQ==
X-Gm-Message-State: APuU4Z+iWnmjjoShOIzsKQKndqr57IIt4jOJclDC/kiraSN1WSDcb9bs
	1bcZXolqJa2Y2I23iN1AMQkCKWwCZS//ro1yoQh7vlCcJYGYbIgIxyZKZkQQVe36r7EHB67iww=
	=
X-Received: from wrbdh5.prod.google.com ([2002:a05:6000:a85:b0:48a:f5b5:2f71])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:41dd:b0:492:b1c5:6db6
 with SMTP id ffacd0b85a97d-4a8e3f70001mr836395f8f.6.1795026131432; Wed, 18
 Nov 2026 10:22:11 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:20 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1259; i=ardb@kernel.org;
 h=from:subject; bh=2JP+cT9iihC5uYGXzSyzWCniO925ZMwvqz8a7g9Ari0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm6WGnSc5J+WcVbnAJc433bqPOze3x3t/lFj+ivTJ9
 1IurmjvKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABOxXMrwz2xaQsuyS1zrH/yb
 dOxUcZ7zBe4/av8WMjnc3BUXcZ6ldALDP4s91ycxG6wzmBcq1hDzZc3ikPLX4te+xBasDvn43ri fgxEA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-35-ardb+git@google.com>
Subject: [PATCH v4 14/19] efi/libstub: riscv: Use struct efi_image_info to
 access image properties
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102215_135029_77B2D067 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

Instead of exposing individual symbols to the EFI stub explicitly via
the linker script, use the generic struct efi_image_info, which accesses
the original symbols via PC-relative references from the stub itself.

This improves code reuse across architectures, and makes it easier to
add new references in a generic manner.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/kernel/image-vars.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index bf703eba3fa5..c18b24792a29 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -23,14 +23,6 @@
  * linked at. The routines below are all implemented in assembler in a
  * position independent manner
  */
-__efistub__start		= _start;
-__efistub__start_kernel		= _start_kernel;
-__efistub__end			= _end;
-__efistub__edata		= _edata;
-__efistub___inittext_end	= __inittext_end;
-#if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
-__efistub_sysfb_primary_display	= sysfb_primary_display;
-#endif
 
 /*
  * These double-word integer shifts are used by the library code, and
-- 
2.56.1.708.g77570a6a1d-goog



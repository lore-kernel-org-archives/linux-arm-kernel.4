Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12B5606A8A6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QCuaJk3U;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YZT38HjJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pUSsS83QN+vD2vwv3edINs9yAbdxie8hIvWNEo96nL0=; b=QCuaJk3U6wTjIPqxLwCM59DZEb
	B9SZMuXQC9NGVDWPoUJcRThiCXKiAZo6uszSnDid67tDR6qVLPVfb6r4UNXLNwmJv1vdIGV/+g32L
	Q5Ij4HelgGYGt7TFF0zyDbhwBZF0LziukbZkL1QHzzqP2hSdY8yfyePi/uGWpzEWQoUkkW76VOVi2
	KQC6CISSqbhrwQaq8e+ZeLa6UV3UsRW5QnZccywn5hf+iuMxYncNAErxNBmUBFveHl9ZJVJ/O858o
	MStoKPwP6PfzxQmxOGS1tVI1ootAGl+RJiT1msa/LdL3fyloSanMlA71sXctWIGbbkf6tsdFW8bOb
	QPP5F/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBQq-00000007E3c-2bbZ;
	Wed, 11 Nov 2026 16:44:20 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBQk-00000007Dzd-2TPC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:44:16 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-490c1867460so2572012f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 08:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794415452; x=1795020252; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pUSsS83QN+vD2vwv3edINs9yAbdxie8hIvWNEo96nL0=;
        b=YZT38HjJliOwnBzGT84Czk+wyMAKZWJYVaNcPJm6cbMm0r0VhsgBV10SIlpHL9QtPv
         of0tBGRcGYVT6l513cjzJaUdjdfevWuGLKCyBVuzRCkszuJmUMZ/jkjYY4p+zrmx5C0f
         aaaozj5xe2vVJsr1BjEKXOUQqkTGhXKnTrcM6tgPMw6HPO96a5BcYJIiUlzJzzRHJeY9
         4QD+TaAZV6jSlC7YRSX2V3UlMRUGJKYDpz1Yaa8f5AdNFfQPnG7lnEbhElgOMOHYlJ2s
         ziipAUV1yp3zKlwZmWUxRsOpdKAHwQYN8kNFW+ySz/nXg/BDlzOjvK6/FvH2ie5ai9E3
         B18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415452; x=1795020252;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pUSsS83QN+vD2vwv3edINs9yAbdxie8hIvWNEo96nL0=;
        b=jUfCUOW6aRqc+sQ15vZDbZQWQnEot230DfyXbJ5YUSNvUbeDbfUoKi2GvxLGdDWHP1
         CD3MJKmTTKT25wXHDJtXGh8BkBXx0/XBQTz5bxKG+T7aG/Te5KhKZyVyPtYSzl39o87X
         zFikr/dJjWsOFrR4VQCEL8M3eQ+3lSBH0UEvY1IOExR5mG1PI2+VvejnsrY1xuR6LeZE
         IvMC0aYDCuar0yeiYLUysNv7Nz10zwHqs1MPcw1H5OWngYijzPdtCBAdZCvq5XK61G/C
         fbqB5wkU+qaDGO95wZVoi3S0ADDs7bs4F9MheRWOSmCI/p6LTKV8VJEzQdrh437EmzFV
         Qa6Q==
X-Gm-Message-State: APuU4Z+bkvIX20QzbHDoJDkoB0/EB2B36xS6XBYsj//OZ5bvCpI6tNO9
	MV5mLdyYrraKtUiErXRMFmGawsjn6Ry/0z+lATaqFP5/hHrdXrLHbUUo2K+SQS6fjG7lU57O631
	Y3/UkRSoihUJkqeJJ43BqY4Vgoh5TexvW57qRB7tw4mecZ6uMjl23W4m1Du/SmrJY1g3D8Pmtr+
	uuSILqQfxEjHupfbcASXy36PBQwPwYyWVHtbEc/0pTv/Ub
X-Received: from wrms3.prod.google.com ([2002:adf:ea83:0:b0:48e:a84:d884])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:41c7:b0:48d:fd4d:7fbe
 with SMTP id ffacd0b85a97d-499c3b9e804mr4839243f8f.2.1794415451474; Wed, 11
 Nov 2026 08:44:11 -0800 (PST)
Date: Wed, 11 Nov 2026 17:43:47 +0100
In-Reply-To: <20261111164345.4059964-5-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261111164345.4059964-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1463; i=ardb@kernel.org;
 h=from:subject; bh=CVFgIkpTiEZmWTXEYfFE5fyWaPqBrt/l+On2oTA6XXc=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevLbOf7/A8/m++efrPI1Sdy99vd6ozzgkxf33823Uws+
 fgs25xDHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAi2uUM/4y667b6rH7M/CtX
 9d4coZm6M27ynb+5s3jPffHDQo63Wq8yMhx0TH18Un5+hOqs8waWCQ8kPcImuWx9dM+IsXimW0S vLAMA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111164345.4059964-6-ardb+git@google.com>
Subject: [PATCH 1/3] riscv: Use _stext not _text to denote the start of kernel code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_084414_627987_4FF55527 
X-CRM114-Status: GOOD (  16.11  )
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

On most other architectures, _text refers to the start of the image, and
_stext to the start of the kernel code, and generic code (such as the
EFI stub) may start relying on this distinction.

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



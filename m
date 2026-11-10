Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CF9606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C03U/p1K;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RMsvTuBO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PjRDWUymC+7EL3JaTKRije1yqTzPKOHWaJhKCJD3MI0=; b=C03U/p1K7msJMz3esg1pPfGqJ6
	tPPtBO9aWNpjSP/RBxo2LxD634prD06UmwgFLGYtTlPjurMTikHmpKHQcDIjOZN9kAS7Xj3qsnpU4
	U1ZVvr/ysu45R0Cd8P0gUAbfGwqMUk0HOWeuhBz8I9yP/eOcYoNKEx/F7FFYfak8Z8i3x8N0UJAhy
	siIOWATfkrbvGFfX7bwzFVNUYEtRXz5a02A/8i55rcz88ctGVQRP8oA7ERi1AJANu1/Cc22CZMoEi
	njoKJB+asE2E4asrd4MQ+AN/8Hg/cpWlfAkrIBblwitFHwDhQJ6Yhz28Zs5wxRymWWZDM59eADUhD
	JkTR93Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknM-00000003mzr-1HsA;
	Tue, 10 Nov 2026 12:17:48 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknG-00000003muK-462f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 12:17:44 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4ae2756fa7aso14389905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 04:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313060; x=1794917860; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PjRDWUymC+7EL3JaTKRije1yqTzPKOHWaJhKCJD3MI0=;
        b=RMsvTuBObzecIWcgIe5UiAwkLFlzOMNnJ57iFgQv2csnGGsWg7U7Zxh3isGPJm8y3s
         7evjtuoy/03sNSSy/RgYNstGCeH+3170FgQMnzkJbw+5cnJNuGi8aFmU99yMLc+iwVs0
         fzv9YwW8kkh+lvAkM2c99mrZwDnCPX6loyYZAdJiyzzYKBbustdZ/1SzMigA9zBGhjd/
         5ALJgRBeDw2yV9K3D6M3EkA/++ENj+biut65jDZTjgw6/kpPNNs/4Bcuwj2UfpRjNfmh
         o4mOuCm6fI5aoc5HjNwlScQyHpFScyI7LYACACt7JeN4KNiJpWRuPx3PrFQqKRIcZ2bl
         o0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313060; x=1794917860;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PjRDWUymC+7EL3JaTKRije1yqTzPKOHWaJhKCJD3MI0=;
        b=d8kfYYbYECuBkavtMWaviXqIx/eqKuDR52414r+ZZUtuOf0VAaAmeDjT13IzEJt5yF
         wqctNqprAePX3k51d2XJhj+6D85n4i/FS2a1ZOe2bHkOlqFvCxkaGBtx6X4PXXs/d1P4
         BgSd7ydkp2sh0UlTNbgbUtABkjAqR4WqD9gacIccqdJzCoQHXMJ9J81xJpDaIV7cdYKH
         noBLAtDAsTrnaHZnw/1twuoqzdunXr/hOzB9mrQ1uOgHFnbJ+CkbHSuuh8HBh28JhaRK
         1ALKj8CDV8AR7eQzeUDLA7rIrpkimGKUu8RfFGym3nSajP/Y51zhMs3A+A6ZcvQFY5uI
         f/lA==
X-Gm-Message-State: APuU4Z8nW44rsVpPpi9Id+8Lje/wkX/WNBVhJj8b8mHB4kQNxyk1fCfE
	+SrHb0yJ1Tpvk/zmoIonyGE/EngLJ1Z9Y3/sDYDPMU7qlCt0vChFjimLVrP0Ubx0ntDR68KFVg=
	=
X-Received: from wmbc22.prod.google.com ([2002:a7b:c016:0:b0:4a1:8bbb:59bd])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:19c9:b0:4a7:c366:d791
 with SMTP id 5b1f17b1804b1-4ba02308537mr40596315e9.1.1794313060140; Tue, 10
 Nov 2026 04:17:40 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:33 +0100
In-Reply-To: <20261110121731.2728824-12-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110121731.2728824-13-ardb+git@google.com>
Subject: [PATCH v2 01/10] efi/zboot: arm64: Add missing barrier after cache maintenance
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_041743_016095_33C48FA1 
X-CRM114-Status: UNSURE (   9.71  )
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

Prevent the I-cache from fetching stale data by issuing a barrier after
the data cache maintenance completes but before performing the I-cache
maintenance.

Cc: <stable@vger.kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/arm64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index e57cd3de0a00..62fc8e53c8a0 100644
--- a/drivers/firmware/efi/libstub/arm64.c
+++ b/drivers/firmware/efi/libstub/arm64.c
@@ -107,6 +107,8 @@ void efi_cache_sync_image(unsigned long image_base,
 			base += lsize;
 			size -= lsize;
 		} while (size >= lsize);
+
+		dsb(ish);
 	}
 
 	asm("ic ialluis");
-- 
2.56.0.542.g3ef89b7020-goog



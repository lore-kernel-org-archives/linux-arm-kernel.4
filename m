Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD2E606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cpQXL8TA;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G+wCd10j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=90r0f+b5kRu0Uic25PAyXOgLnJJKMJ4pyDwq3qDyCYw=; b=cpQXL8TAMgy2X0u7TzlAlF5dPF
	kkXrFMsaAurm3UJHfP0eL3sk1yZDJ7wUx5Q9j6fps7GarfHBv8sRO/a7Jf3A+1DB5FngwWsuWDgpo
	SdfrcxnP+ulXJ56xbMqlENEuoas8xVerKJakrDzzP3b1Umipp1OecTyfVVwQXUTMKBP5xa1sKVMTT
	pjfdhhbc0o8Ecj/SLMdwTeAZPtMOm4LDcs8GjSeZwhFY8nFP8tZI1pHp9jBpsQI+Y6hFPzw5yHRJ9
	U9EcwL/7TeLkNTmM0RQjXaVT1Rbb00yP5AWkVvCarwi5L5eRDUyIZCgZ76JPBDshn1KKCgOHiyYCT
	Bfu9nzXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxg5-00000002pNV-20x8;
	Mon, 16 Nov 2026 14:27:25 +0000
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxfv-00000002pES-1kyp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:27:20 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c50a8e37286so268879666b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839233; x=1795444033; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90r0f+b5kRu0Uic25PAyXOgLnJJKMJ4pyDwq3qDyCYw=;
        b=G+wCd10jjSepX2EH7AH2w5oEZloa8zDq+il2svQIF8rgZ2i+/hrFMfx/lCpNRLRhyd
         FgHfaRnNpgZ7Aro/8Ni5MN4RljcuCiyI1paIsTjBGflwGBvaWUPChdT23b5zGhI55Iyq
         eu0zCrsIl4QkDST7shD3l9xD5vU98Mx1PauTA3Dtzzgr6Z/9bZyzVxpWDoFT7xMe6kFk
         CYoDtQCiIhAUjkrDdvy8t9mB3zhuQKSp+OVO3OAZquwWRLL+6Q7SLqER6AGfoPAKnOrN
         BhkcMGacLIctNOoxn6kJtG7o6OeQP4VCfWthdLrMyK1ld39ddOy2DPYVHGvzl8rtfACh
         WHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839233; x=1795444033;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90r0f+b5kRu0Uic25PAyXOgLnJJKMJ4pyDwq3qDyCYw=;
        b=KxahiYEUa2j91KRMt7PKbIlg0DSXJAdEJF+7xZ2voG1vkIdMKL3m1/9a0Sp9oDVaFR
         OGaIRQuXpt8XkFJkBpGOewrHHsqtcms41pNimbWCwkNAGHTmzqUvuD2XY72aJzJyxB5K
         0qw4gZ6zOYsp3Bw14a+RrfNzhE4i7tFpHV8g9xlvmj/aVw2dFK2RNbXe/pNYR1nYieu4
         jiUkyjeqG/J+wI2vtNmruIpdx4yuzXqlGaXFCCIps7NkTktoaym5d202/zbrGptwY8an
         6qeCoHnVc/14/l2hIHSn3xMURT7dNhFMLlK+SZoK7F9is59IRpg8lqHruOAn9CaEP5a1
         s1ug==
X-Gm-Message-State: APuU4Z/S6LUAq2llIsJx7qE+juEIJFGCeptbTtZSnbq667Il6uks3OtS
	JQ4ewqPJbkNsbxrabHTQlRBqoS97pD0xzh/QcmgbO4pKv+LAh9itLZ3aivVrA0+SrfiSjmNNLg=
	=
X-Received: from ejbm16.prod.google.com ([2002:a17:906:2590:b0:c31:b9d1:9418])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:3f93:b0:c50:4a71:cb5
 with SMTP id a640c23a62f3a-c5096325a62mr886143966b.15.1794839232899; Mon, 16
 Nov 2026 06:27:12 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:20 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=746; i=ardb@kernel.org;
 h=from:subject; bh=iJCrUIisab7JCQVRK3E8zIw6kz1I277eBbn3gnc4d2w=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu3UG90+Yzl1rc013y9ZXnQWS/H/X/bfbaiq8UBCq2FN
 gdPX+bsKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPh2cPwh6dmke6e8uL/z2ad
 mSb4JvW/NQNDXmW2/c78Vb+e+jD+jmP4X6y5KONutmDPSvfWR4F7GjZoFLxQSRbMnznVJfniZ95 cXgA=
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-18-ardb+git@google.com>
Subject: [PATCH v3 01/15] efi/zboot: arm64: Add missing barrier after cache maintenance
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_062716_928766_DED6CF43 
X-CRM114-Status: UNSURE (   8.30  )
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
 drivers/firmware/efi/libstub/arm64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index e57cd3de0a00..d35c6dd76601 100644
--- a/drivers/firmware/efi/libstub/arm64.c
+++ b/drivers/firmware/efi/libstub/arm64.c
@@ -109,6 +109,7 @@ void efi_cache_sync_image(unsigned long image_base,
 		} while (size >= lsize);
 	}
 
+	dsb(ish);
 	asm("ic ialluis");
 	dsb(ish);
 	isb();
-- 
2.56.0.611.g1030f0b940-goog



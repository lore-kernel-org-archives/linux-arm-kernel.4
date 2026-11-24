Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254C9606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qNU/Qvo9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=KGExVFoc;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f8+28I9c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zuvz3xSe0E/I6IGKMXvL4wAnV5TL5l4pOkC0AqyMf6I=; b=qNU/Qvo9cdyT53746igmhD4ND4
	E+VUNRcLch6ONltxpN3BaqWx/64WNJc7FqNSLhVc4bFNYXZ+TAeto/Bb0a8oKTr7HNLfzWfeCUHOY
	1xONvjN0j6LuTSCzWx8aR269BH0fdJYhVEDs96hXCTHcrHJHhABH6EZLn2h11lzGKyUlu/DjAfJHR
	GiDzkQ48zK1fv2WpvWpHNCfE69Xzs8zswvKy2wtvLYUeD2/JHAfz2D8FIg4ZlFrJMiYWl1BDxtGvO
	KCm3Y8GM27rGG2K/X8WXWZP1xEX7tbaH7WfsIpjCPiQOr3MK+sfcQFup4kpFAPs4CtgMI6pXpjSkT
	dAtobS+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVte4-00000007Ai7-1dz5;
	Tue, 24 Nov 2026 16:45:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtdx-00000007Afd-3qZW
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 16:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Zuvz3xSe0E/I6IGKMXvL4wAnV5TL5l4pOkC0AqyMf6I=; b=KGExVFocqt/YqIjiSnYpYVei/b
	b8iKmFGf/LAQVr9tKvb0k4qdIC/3wrJ6YKoODTWzNMdacFHL5zWAOrw/3KGjO8Lu00tRuBggsTTMp
	DrhTUgzKcGU0OWKB0rfU5Py5GTQPdvE5GGv/uM6Xs3X9S3YF27UdODtSs/rNmKVlAfJhxHat9ZNEM
	mibk5QDdz03RUL63+2vZYUmQb1lktVnJ/gYUB/xgbkzak6QXKR/B3zg6ONlRQ8rU7dM5jyfm8PQ0l
	XkhHi7gnEV2y3AYFkFwdgRq0pwtNwcG5osKIARopw0df/Bwt4dlDzhgFoCQHwMoPP6RysJujAhxcJ
	T98LersQ==;
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtdq-00000009Dbn-48KE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:45:20 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c504bdea834so342793666b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 08:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795538712; x=1796143512; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zuvz3xSe0E/I6IGKMXvL4wAnV5TL5l4pOkC0AqyMf6I=;
        b=f8+28I9cRiY0/M6ouGKJDHYSC+3ZbbyxQ0L+X4jCpUMvaEwfgWNo12kkcoFBK+IDtG
         qmdaiwHMVUhocQDf1J0DN64zxjphku1Yjn0qSc/YM1vHhK7cwSGwPFfVlgUHAAhAoX9B
         R8+nsGCSYT19+Zt751AQuHYeesU4FzKjp39Ysl661p+Ohi6EUUxSk2zij0V/9c3KFVWY
         m8dAaHXk2VCpLvEjz5XE+xaRVpjvbZJuhV9BkR6Tqe1BzRd2KVrqSkSG8lPVKfHssH+z
         4uOB1mMUMP64qcMwc3oQINHHPf8+8d09w07579QZ3QS+GrlrSWUHm0uqFsymh02ccUyV
         2okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538712; x=1796143512;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zuvz3xSe0E/I6IGKMXvL4wAnV5TL5l4pOkC0AqyMf6I=;
        b=lcbu30u2ev1C9haSHcCl9X3Zx6k1OH25YPUky8/cObpWyG9RPOUdr/EWiinoDPiJzX
         Ug5mBgZ0iuTc2GgNrHtuVYpKEQQlzkCqIayssGuc+Mt0BK56qyys6xaksJQCHLSwBP82
         IEKq3ro4v77NYKJ3XuLYypGbEkx2DnD9Faejb/X0kpdb3e2smDVHdt/aB1KbE7A+M8pA
         IOvxupEqZPiGw1isEdZos6WnC8VQFx+1OHrIIMrKQX1jzIaxiddX0Q8zezqSYV8qF7oH
         oUrJscGXfd/od7xs1IzGONBWAxAh2I3bmM1CLPcSRXQ9f6h+GzkpmMbtkW38/PLNaAM9
         nWUA==
X-Gm-Message-State: APuU4Z9UKJdllXbTCxsI0nlhdRAGUZiL3VJKBYGjqTjmKXHyhiERX9lw
	zBR0bk3p23c8HLKJnNiPe7ESr8LEn4TKSOeNM0EtpiHE5FbzGhTNafUwBOqqNMYlac78Wh9GWNc
	2Ikz6N3mscmC4HLWujZkSXg==
X-Received: from ejbca4.prod.google.com ([2002:a17:906:a3c4:b0:c4d:23b9:1c75])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:e00b:20b0:c4d:22e2:1a2b with SMTP id a640c23a62f3a-c513a47e2ffmr836800066b.1.1795538712212;
 Tue, 24 Nov 2026 08:45:12 -0800 (PST)
Date: Tue, 24 Nov 2026 16:44:43 +0000
In-Reply-To: <20261124164446.2371939-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261124164446.2371939-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124164446.2371939-3-vdonnefort@google.com>
Subject: [PATCH v2 2/5] drivers/virt: pkvm: Make pkvm_granule __ro_after_init
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_164515_066914_2EDA06EC 
X-CRM114-Status: GOOD (  10.03  )
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

pkvm_granule is only written once during init in
pkvm_init_hyp_services(). Mark it as __ro_after_init.

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index e7d7cedf7f6f..fbcb57c31186 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -17,7 +17,7 @@
 
 #include <asm/hypervisor.h>
 
-static size_t pkvm_granule;
+static size_t __ro_after_init pkvm_granule;
 DEFINE_STATIC_KEY_FALSE_RO(pkvm_guest);
 
 static int arm_smccc_do_one_page(u32 func_id, phys_addr_t phys)
-- 
2.56.1.809.ga0b61035b5-goog



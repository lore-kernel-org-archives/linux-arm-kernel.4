Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C83D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oRieJDfG;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TuF7XEMU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DiIv3B/kInSJlpauWNEdFhsRn5B5HF5NbCxXGwR/mKY=; b=oRieJDfGUWWHN7+UueluQkX6ge
	bv2x2fKiKTbGLmsHoYWGZoqXMZehHnLnS7z9WmMPqSFv4KHTJCDOH9KF0RWF0OrVv4A9p+31ag+gW
	Ge4F8cLWz6Dq2+EQSohaDRdfgY2pl13CGdkURCnt/TX7+aGOlOn0oJHo8h1z/O+I1a4smcVfADTJV
	exSXbjkNnRtLa785aGvZBVYOBFn0Wjsqyd5q4E94ozs2t8CcJjnlI8ssYIl8WTkTgqejXIAhPAYt/
	fPTzkSOW1kDXwuYb/5q+6pZm5Rwf0vZ3mGxnHolDo7m+uhua9FtnkDU20dtLw12UYdFg1h77gfIKa
	G5siJPyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkI9-00000009tFB-3Vir;
	Wed, 18 Nov 2026 18:21:57 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkI0-00000009t6L-0tp9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:21:50 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-4a370217dcfso999456f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026104; x=1795630904; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DiIv3B/kInSJlpauWNEdFhsRn5B5HF5NbCxXGwR/mKY=;
        b=TuF7XEMUhkZDf7YeyCv6rjOzxgTwyNrNZp1DNkUH7ZKM2DC5UVdyQnMN2TZ2X6zSQy
         0qV3rfKvZ/MjKP4uV+jDO26dR4zxyD30yoYanNGEGlUq9fjuUxgHLwxZbFNcOVFj1ZYy
         TG4/bykV6G6wk78qC4TTY9CRi69UB3Rm8X1ODc7hqpEnVgHkKJNkqzE9x3GJ64lmvH1b
         RDurE8meppgqhZ8QrzeTtlsJp3YJsbTJ7t1yaz8IdORNZdR1ksevGBUtn1m3Og7QMDm5
         NKbndyK+wbPHlePVJW6kK0BFVlJeZxQatJd6DNjRN+1JViyLGJpjIQ2ht/tligfUEhHn
         iGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026104; x=1795630904;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DiIv3B/kInSJlpauWNEdFhsRn5B5HF5NbCxXGwR/mKY=;
        b=Hzm2XsDL5/qF5N034y+sYuo1z+xF1g0QIzmnow2mb0e6GEPVRwPSYWzJ9X7BuhEwWW
         nrl/3PvadDWC62LPrYD6ET1A7zkuCir/ZfWc81nOo5KOaUTeaOBNoT6IBf6Z5MtwaGSw
         m6rFLmH8pP5NDyoUPURvjiMaePcK0HUxjjdZ1LOtDQpKfeTQinAo5ePbrv2R6Ka82vl5
         jjMOp5D/Oi1B+IecnnXD8LWsY3BcwNRueFxD5f7d7XgAnndf08XQIKhJsf3P/sCa/618
         d22aLFFuYZGcATOPdPiMsa40crT6ktvgRZV0M7/oR0K2b3N/6W/qXWi6WzJNC46JFyRR
         Xe1g==
X-Gm-Message-State: APuU4Z/YJEFBqUhDNqNpZZF0koFAaSCnukfpn63CRDhjuUE3mMl18dp9
	548qTic5n0+AMsu4quD38LrB5nmKr34heAy9Aw+3PYbRE4W2KySxMITuGmYCUeb1Dl1Qwp7fHA=
	=
X-Received: from wmte3.prod.google.com ([2002:a05:600c:8b23:b0:4a1:e44e:ffd0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e87:b0:4a5:75d2:c104
 with SMTP id 5b1f17b1804b1-4bb7da2db77mr71528935e9.22.1795026104151; Wed, 18
 Nov 2026 10:21:44 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:07 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=746; i=ardb@kernel.org;
 h=from:subject; bh=jR9RFbU1DFXzsLcPrZ2t6cFJ9as3lkmb0r9/e4KUO7w=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm8mi3o96JorGnY3c3uniWlKh0aATKFJUMr3DnsWB6
 e3err6OUhYGMS4GWTFFFoHZf9/tPD1RqtZ5lizMHFYmkCEMXJwCMJH6v4wMyw6xcJ6b+EzmOFuT
 1Y2f1xcdyl4ravtF5AjLUUZhfo4b2xgZug9P0Xhuo8DAeP2t7NXOJuVfV/crmV/992mTwjnDW54 WTAA=
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-22-ardb+git@google.com>
Subject: [PATCH v4 01/19] efi/zboot: arm64: Add missing barrier after cache maintenance
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102148_255658_5D08F0F0 
X-CRM114-Status: UNSURE (   8.91  )
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
2.56.1.708.g77570a6a1d-goog



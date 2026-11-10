Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD9C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 01:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pw06BqZJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F/mh06nq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:In-Reply-To:From:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K+WfmWLpflRA+bUwC4gEr75YY4Ckyb5jqXk5SR8iLBA=; b=pw06BqZJ6l9QMwo9NXtBuyW5p8
	QXsbpXkG5b2gwyV9EjttgWeIG6X0bzZVnbOzsZ8B6m7x8S+4WMaEI8FXCIG3KgQouj7fk41rAwnHS
	HbGTCzWQiVyY+YKx4S3EAgqtRhQTZWDXwL3egP2KU7Szky2EO7nNUV9ahR9pUBoH2IHJJlzdreRSw
	WZQbi6WsVBUCtUXWDn2xT+dycjxTsxudb8j3GxErxGfQggpcqjzHsT0hC3niWZQmJbLxjX2GNxeRt
	YOc5EC+749cbiFPhcQzrKyt4zMEybezvxU4xhL1OoV6G4FzZ6PUrH84zifPHI3c1pjF+EnSM1a2AN
	uu9PFjFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaH6-000000023Cb-3Wqf;
	Tue, 10 Nov 2026 01:03:48 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaH3-000000023CF-3bow
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 01:03:47 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso211357666b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 17:03:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794272624; cv=none;
        d=google.com; s=arc-20260327;
        b=hOkEbNNdKHNiosrpEBF3pWe+sPjn0E5iEeYL7Xztvi7U+949MfCtvvnYksN+1ENlfS
         dX724IsrOmfX2ts9HoZXCj6Uyqw3tc4pd2okNJjNZYNQRK7PNQW0NgeQ0aM1d1egIgh7
         bpSoB7KkWZL6ls3aaa7DBTVBs++uBCLLDU+vK5qZga7jjuXjisAU7QAMCk6fB9K5swRi
         DZybnZY9SvVBsOuEyKpK8u5YDM3flaX7hN4a27ie1H4DDmoNqvcS+F4M5xS7NRWdhPkg
         AVj4+omXKBK7q9K2PmyTt0SgTRq6RkWHbPKYSvYCnatMlsLC93dIMfonQuMpBwYWLHZe
         YVyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=K+WfmWLpflRA+bUwC4gEr75YY4Ckyb5jqXk5SR8iLBA=;
        fh=L1/SkdPmmWHcusDoIlOggMTNJLrtvKBIg3gYbGod+zI=;
        b=AjDdQzC2Ua4+f4ZdsyAfmUR8UcMxI5Lk25ljybWuhgxJZLwkdsj2YQGJ+cN+peW/Xm
         jiBxeFlNLyEuIMjVFxJOpaNreQtoZEV/G7OecmWrLKjng9RrAKBSVOAc5oswiRxTPaH9
         nenFMBZ97xpE234Do5JHM+XAaFbvZVZtixEXdApMfDc3kcdl1FICugigL0ssqpylZlmF
         EcojbtIlfzu2CudBV7rPi10kjUZKkWsIqOSM48MEQpWt5E4KrCh9X5+1Gbm7zS5deF3V
         HajukETSxh/6EObtDpfeNGAVCN/cIKMhF4Ud7jpxXjKlDIC9jK79JM7IQlYedU5+SC01
         qXhw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794272624; x=1794877424; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+WfmWLpflRA+bUwC4gEr75YY4Ckyb5jqXk5SR8iLBA=;
        b=F/mh06nqjuwGEGnRRuajjngqdzVrHkvK7DD+Gr4LUQSwZHd8R8wGRt6qtOcK6utN16
         0lurgh0uTjCCqKFwGgFO2CQiJ74QVbdXJrqUoBqgTpDvfIaYN2jD6AH+NBDHxdXyGPKW
         SgLYcc0VO8HUrtzEa0olmIS1JkcfTLF4YUdpTpCUnk99yOVrchdFoKe5XRcTgahOpkb4
         suK5f3HjSfESodmU3rngzwf+KaW/B/g9/tA9Nq3Dy8shJshj1yW3i+L4PUHAjCcgFZZS
         QtlbfI0hC9WQMolTEzCWQY4kXTA6BHarrCouuLc5m8Tk0vC2WEKK4RfUy1KvbjDNvR0m
         nmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794272624; x=1794877424;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+WfmWLpflRA+bUwC4gEr75YY4Ckyb5jqXk5SR8iLBA=;
        b=daxuk/4s3e/zldKtycPLbipehQP1UWT0G6dpM7Jp8g1ZlZRluEOvGi+HuoPOcXLswp
         c4Ku58wbcu5scRge6Zp9GqUXXvUO0BY/qifV5+m6Q0qzouDFQvbv1TwVEJA5lQFwvzjK
         LX0EgyxXSwS/iAz09AG47UUu9sB9kVCowMkBPwLd18uhsj9KfpGok3DAqqaUrQg8bQtg
         iz8N17eudQSb5Zh4FYHrm6XslRgROcTe0pDrP8vdDVAjDfKzqzA4fVZfz7IYlgv5Ed8/
         YKIMiegDF+q0C/scYNhFow2fpzXYx2gJm0AqJmR43X/BKGj6HuZeUl8QVIh3SBLW6aGD
         qMMA==
X-Forwarded-Encrypted: i=1; AL+hErF6GIv57Nt7XEwSqPo1pNOS35NOzalVfV6GTfmcK3rlh6pSt6pOs9X0x1G9t+7b+WgPHDZeWBGnkN8sdr4NeluV@lists.infradead.org
X-Gm-Message-State: APuU4Z+B3r2mWx9nXvzxGdEbWAdGuPxQjJsk4F9E859wNAsOEDLmnDjE
	cs5Sdcaim/UrCiBvQ5sIihbNCsMO1EaR4jsodNu6eAyemnqn2SRUv+Fofjre2V9NOHLzcbOpEd0
	wlT7yOZsheH5aGVDh1hdIzqmcM3Hmsw==
X-Gm-Gg: AYBFou2obiBxaiSXO0bKCVhP8HEKjgc3JQkqxLFBz+X0I0KUxD1WhEnHOhUZb0R6Ymi
	AcphCjhWNYofLtJ+dnqvXJce2tOi6NqNg9tQZj7lEb3jP5B7lv3raicwkENG6oNqWidNt6G5hcX
	jTxYfyIe5tp7ThDWBPR8TsSR0nF7YwifxfVRAVUDfmQRgKeGhYPLidNvbNi9Npn4zCeZFWHpTsp
	2CpF7erTLMfZbIsFVIZzw6zi51vRL3AR1ALCPtOA8mdPZHrsCwAOA4raPiiJ/S93a9/jzN6oOTa
	Yy5mQ6jkt0BOf3is0nsY7TCEEsRm0XSZ8L6dIAE2Azdrz2xJ9x98loFzfQqc6UQ+blKBWLgh4t1
	s1JWTz3+506vBU+irVZaFs2IQQ6YUu1lxw3uFWtSz3PHsJlqowZMnSw1RlAdDLcTBCSNzwWasvd
	rIle5udfu+2BalFLQEF1MeTgnmqwpuT16e/NgIUMUW9JpL
X-Received: by 2002:a17:906:2f88:b0:c4d:4d5b:4bd6 with SMTP id
 a640c23a62f3a-c5049588c43mr49781366b.41.1794272623674; Mon, 09 Nov 2026
 17:03:43 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 9 Nov 2026 19:03:42 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
In-Reply-To: <CAGEsz8ENCW++SA9cdh5=2EVmto=2-2axzTwuNhaKv+xW02Vvtg@mail.gmail.com>
References: <CAGEsz8ENCW++SA9cdh5=2EVmto=2-2axzTwuNhaKv+xW02Vvtg@mail.gmail.com>
Date: Mon, 9 Nov 2026 19:03:42 -0600
X-Gm-Features: AclHuK-OJaw2qupbzmzX6Mid4lqVpd56r616Z45mPkUj2w_nmX7EGPR89o8V2q8
Message-ID: <CAGEsz8Gj01qFUzbEqymn8oPM6puJkaJoD6QLGabFnG9kzMYF=g@mail.gmail.com>
Subject: [PATCH v2 1/2] dmaengine: stm32-dma3: unregister the OF DMA provider
 on removal
To: amelie.delaunay@foss.st.com, vkoul@kernel.org, dmaengine@vger.kernel.org
Cc: Frank.Li@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_170345_957548_0079D9DE 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Probe registers an OF DMA controller, but remove does not unregister it.
The OF DMA helpers retain the driver's data pointer after managed cleanup
frees it, leaving a stale provider entry for subsequent channel requests.

Unregister the OF DMA controller before tearing down the device resources.
There are no fallible operations after its registration in probe, so no
matching probe error path is needed.

Fixes: f561ec8b2b33 ("dmaengine: Add STM32 DMA3 support")

Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware runtime testing.

diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -1921,6 +1921,7 @@

 static void stm32_dma3_remove(struct platform_device *pdev)
 {
+	of_dma_controller_free(pdev->dev.of_node);
 	pm_runtime_disable(&pdev->dev);
 }



On Tue, 10 Nov 2026 00:42:55 +0000, mhun512@gmail.com wrote:
> Split OF provider teardown from the managed clock cleanup requested in the
> review of the original patch. Patch 1 unregisters the provider on removal;
> patch 2 returns the active clock reference after managed DMA/IRQ teardown.
>
> Keep the existing remove-time runtime PM disable barrier. Check initial PM
> activation failure, and let devres handle later probe failures. Remove the
> manual IRQ-free loop from the original submission.
>
> No hardware runtime testing.


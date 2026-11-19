Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E41606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gnZSj/jX;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TSE089Oe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s8nhpF/5t21tllE4kNr5hlFkBROVgPAv06E0/X8d27k=; b=gnZSj/jX5QWHqWQ1jtTKtSJkDL
	Ygdhn2DpdQQrMzHPUjqz3uJm7XC0Wa01bfOdr2vkwekCkhqEQZL6Au9o5Y5KgvQRLE6bne1b2OiiS
	Kyu915LpW6kYbte4jZPB2VBsRtau34oam8S66yS7XXEeIpb8qjDgv5F7uRNiN7bzoIrYBh5GKTaQQ
	awDRmwLF98SmPBvGXCFqRCeng8cdnt9P6ngTt5c0jFiKERhry2BciN6OmeT054fm8OzIgB2FqgOjh
	C8lVh7zgqIZN+Rg9HvmH3/nlHotxqNnYVCN4B+Y6fmv6R9Uu3aA34v0S3iNXUUf54r+MIyN5/dXtk
	Xg2dwZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTybF-0000000BQLA-0YVA;
	Thu, 19 Nov 2026 09:38:37 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTybB-0000000BQJ5-2mmV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 09:38:34 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-93f20b304c0so185742785a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 01:38:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795081112; cv=none;
        d=google.com; s=arc-20260327;
        b=pdzoRn9b28BHx+DIatjXs4bTxvT+9pzqmQ/qELoje9fXjTxp61HFR/awWwf05mwoEj
         zz3QDyUX+Lkp5CfRfSzHGPPo17CIkXQV9XauqaDpsLFdve13HW/N32guFGjtRgrI4uMB
         jUDX8H8Dx4phHpwuuDqp/9Qlb+eWUBzo3mhflXKgyTG9iY/uebGgKKGHztUDjOM1uorR
         86oqpJW3jc8M51PUP1tQ1U95SYT9PSsLzuKDoAicT/p0vaaIXd81F2ftxKBFQvLpPW8S
         3e1A+JQI+Ea3xqDo1d0Tj2cSdegcY+FKuC1IF07sQOFJdZ1kzp7+EeIU6L4Mk67MoyFh
         2EUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=s8nhpF/5t21tllE4kNr5hlFkBROVgPAv06E0/X8d27k=;
        fh=Qm4rBy3Dv+PxLf7HOv78Ruhj7pR5fNHelmceSYMpS8Y=;
        b=IMbMl18ffsGtNUTB52YIENAvJiN13ahBMKgDre/UxbJp2UZrC06yrm5kH6i2zmVOAj
         fcIQJ5lBug0Lh3W3IKkBUJlxOz0r9GqnrQL5ihc44S+rdUKEwSjWKhR5Xb4rOcMzkJsy
         RULY/9i1NOCMh7Yf7peT3KAf47wcaxnhSaocdGTriv7sUuorl7ic7WDE2BkiARz/qHII
         KBj33cesq/4m+CoUiT88cQ/wwEFv/lc0lo73tPu8QyzOGsh6R2szWYvsu5fv4yTJ18sz
         5IU1sx1wwrRmqHFeqO779c9y4lbLVHkoviYEM3ZNy+JDXgIqFbZ3s2rhmdGyZ+IL/dst
         hkFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795081112; x=1795685912; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s8nhpF/5t21tllE4kNr5hlFkBROVgPAv06E0/X8d27k=;
        b=TSE089OeVekk0pGNHI15kXP0usc50jQW8IfXBoXQiGstG2tMau9JgIFFYnshnIDcw0
         MuWtrOB+BRkk6Ck0dP6V9IghxkaX5hhu8yWVFvaDR2q+btRx4/EGiXQ+U5fiYooWifHq
         qIrBXW1LjNF/cCOSJa+zoCCzqqzG2FfhYYTLsRcjAwVzlC3WrbzvBxZRVbuAphu45nKq
         8BZ7tUK8Nqw7qbrgh+h3X+wnUWrsC50F2k5OEFpR8HvJU4nx+YbN9oZfRr1gg7ehwiFe
         5n8pmqo8gP/LgXHesCN9Q12pj+1kswkWZg3QX6THvnZHswIxG4nGpF+yAcHKQDR6yZen
         V6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081112; x=1795685912;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s8nhpF/5t21tllE4kNr5hlFkBROVgPAv06E0/X8d27k=;
        b=mNl5x1uZnQkwF5+ZsIMCTbEwdIT6c3AZDL0pjGLzuzv+T4tcm6v1xhYXIDYFSNIwCq
         fuDrNaoDlmWW7tGzhv6wbfUivnlbbRW+H9gqzqYQe4c6DSO0jHDuOJ+uZvbOV2wbWii3
         VDpqNeDfEroRVHgt92xgc0fxjUFLPRHBC5J8I4TgSaQiDeRg1UxRQJt4QDHRGF8eKv55
         9NT5zeHxPtBdB4zJ0EhjxZdTySD5O6tYiKBGFBpQfN1WAH+gN9R1hvD5efBMbM4AK5ee
         BPj/rslBHs86dH/vffHnox7QXgyfNnDVaE1/gsmiEipAHJXjQ9ChLey/5KK5ALxJQ99S
         LM0Q==
X-Forwarded-Encrypted: i=1; AL+hErGt4LaeiXW4lcafHGKai8B1SPaKvZfforzBta7bGFnpzHWUecFDadLqGupAzN1HaKPlwSlcmNAFGa3qx41OVJf2@lists.infradead.org
X-Gm-Message-State: APuU4Z8zK4pW+Q4nDBUq6edUtEkwTlHLSMih2AvkMgZWLjFrHE8Hjfsj
	2BC4duri9wExAS9Kic+6mHuOFCIQogQ9WvYhbSJyrivwFu/KeH7LVNPlbAR+udf4pE0IfPNYcej
	j0/QcU5zHx2YNXiudUmm6OyANQQOSgZA=
X-Gm-Gg: AYBFou1j7jCZMQV8UNY4xJm6kmsSaPU7t6eHUqPx7VB9LrFL5KnDprqQl+rv70sVmoz
	sHLxDHkLRc04HFC0p8SlXS8x56Nu7u4lbLKhBggRSgYox2fzNMXxl2MC/Kj5bgJqIErOp57cwKz
	xKz62A0xAJl8FD20N1UD6dh6KItxl0lsw9kNWCZbUpc18NdUd+umtLB8lHCNuH3nUthmuwro2pP
	CmddtfLPlIjJBtsHAHckx/0X0ZgsDYpbrcFNKL6lTlW0dMNdfJp4+2qEXssZjkmOTTOZKKiy9nV
	6ib7muO3FzMUpZOxXn9qMbpKnLCAWBHm6DOBxwdNM+ENCT3nDUnBxHy7bnT+4ct9FN09+vD2Msu
	6b9lyPlMUn/w/gx8SG5zOOQcV6YTEi+889bUT13pLU1XBGtVTFhb1iD+PaYN7elr3ZQMKcD8=
X-Received: by 2002:a05:620a:4809:b0:944:d79:c02 with SMTP id
 af79cd13be357-949994a8215mr964986285a.10.1795081111763; Thu, 19 Nov 2026
 01:38:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAAi4Z-d5eV8FM5sYJj1gqudWyioF++fG8P6uGX_LxbiKSXjekw@mail.gmail.com>
 <avyZM-6gM4amnQMT@lizhi-Precision-Tower-5810>
In-Reply-To: <avyZM-6gM4amnQMT@lizhi-Precision-Tower-5810>
From: Alex Guo <alexguo1023@gmail.com>
Date: Thu, 19 Nov 2026 17:38:20 +0800
X-Gm-Features: AclHuK9v7LJbhjVCrFOjeIf_qPnWAg5u9Sv5E5RixcPyL74qGSwBar9TYvQiOSA
Message-ID: <CAAi4Z-eE=16GBivyAz7=ucsD2eBxR3-qG2KebRvKGJUE=VkLHA@mail.gmail.com>
Subject: [PATCH v2] dmaengine: owl: Check IRQ lookup result
To: vkoul@kernel.org, afaerber@suse.de, mani@kernel.org
Cc: Frank.li@oss.nxp.com, Frank.Li@kernel.org, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_013833_738764_266ADA00 
X-CRM114-Status: GOOD (  26.29  )
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

owl_dma_probe() passes the result of platform_get_irq() to
devm_request_irq() even when the lookup fails. The request can replace
the original error with -EINVAL.

Return the lookup error before requesting the DMA interrupt, so a
deferred probe can be retried.

Fixes: 47e20577c24d ("dmaengine: Add Actions Semi Owl family S900 DMA driver")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
Changes in v2:
- Drop the paragraph referring to the similar Tegra QSPI fix.
- Add Frank Li's Reviewed-by tag.

Build-tested the affected driver object with Clang 18 for arm64.
No hardware test was performed.

 drivers/dma/owl-dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
index 31a6c6e01a75..daea82718229 100644
--- a/drivers/dma/owl-dma.c
+++ b/drivers/dma/owl-dma.c
@@ -1156,6 +1156,9 @@ static int owl_dma_probe(struct platform_device *pdev)
         * simplification.
         */
        od->irq = platform_get_irq(pdev, 0);
+       if (od->irq < 0)
+               return od->irq;
+
        ret = devm_request_irq(&pdev->dev, od->irq, owl_dma_interrupt, 0,
                               dev_name(&pdev->dev), od);
        if (ret) {
--
2.43.0

On Tue, 17 Nov 2026 13:13:07 -0500, Frank Li <Frank.li@oss.nxp.com> wrote:
> On Sun, Nov 15, 2026 at 02:45:05PM +0800, Alex Guo wrote:
> > owl_dma_probe() passes the result of platform_get_irq() to
> > devm_request_irq() even when the lookup fails. The request can replace
> > the original error with -EINVAL.
> >
> > Return the lookup error before requesting the DMA interrupt, so a
> > deferred probe can be retried.
> >
> > A similar issue was fixed in commit 47c3e06ed95a
> > ("spi: tegra210-quad: Fix missing IRQ check in tegra_qspi_probe").
> >
>
> Drop this paragraph.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> > Fixes: 47e20577c24d ("dmaengine: Add Actions Semi Owl family S900 DMA driver")
> > Signed-off-by: Alex Guo <alexguo1023@gmail.com>
> > ---
> > Build-tested the affected driver object with Clang 18 for arm64.
> > No hardware test was performed.
> >
> >  drivers/dma/owl-dma.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
> > index 31a6c6e01a75..daea82718229 100644
> > --- a/drivers/dma/owl-dma.c
> > +++ b/drivers/dma/owl-dma.c
> > @@ -1156,6 +1156,9 @@ static int owl_dma_probe(struct platform_device *pdev)
> >          * simplification.
> >          */
> >         od->irq = platform_get_irq(pdev, 0);
> > +       if (od->irq < 0)
> > +               return od->irq;
> > +
> >         ret = devm_request_irq(&pdev->dev, od->irq, owl_dma_interrupt, 0,
> >                                dev_name(&pdev->dev), od);
> >         if (ret) {
> > --
> > 2.43.0


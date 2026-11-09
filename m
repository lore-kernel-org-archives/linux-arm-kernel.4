Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B3E606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SZi2pOF/;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ki3Ju/o7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zv8wE7nYktMBq6L4GF3QSXFm19o0Lrnz7OmEGxn1wZY=; b=SZi2pOF/7cimAlSvKHuyMdGR2D
	Begyo4ZR85yo6tVKApM3xVT6NO4gJVTaTUZ6tvV3Y4EUGLxhUGpl1kUQppYp3SFGRmZ0LR9CbxPu+
	x/onF/3swY6V2G7WnfOJq46PapopRSVj15w3bP9JuH29IJwKlrwjbcRIsfGtaomSHp+qXWDt0U+SO
	eekdFK1akXr0DXB2mxIv/o5VFDdNJTk95ZdY5SwBv9NlyzVDXyVr5d7bxht8jATU2rgdwYv8ae1Jq
	KrqLzhAFOH4AFYzgE8M8OGRvmMXcJu6TnvrtV7pUl9EyVVNT/MS/UGsemh4WQxjTVBBMbZDto+ZvX
	cmXmSACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPZZ-00000000qUk-2gxO;
	Mon, 09 Nov 2026 13:38:09 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPZW-00000000qSQ-3s1j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:38:08 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso2093741a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:38:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794231484; cv=none;
        d=google.com; s=arc-20260327;
        b=LKo7OM83VuoDq2heMuBCqalAjQQC5vfNrnMbnjQrj/McL5pV8RZFtUxwRlXWH0+sG9
         8gDzEFjUB27tVCoEqMoNIGQhacOcqVwUmzE7m0PpvXh4ILrokMBUINJb3Y6xtD0mCVJZ
         EZLWyU6awom0lBc1UCh+wfwTwzGu6AvZQX7CdTp7gYXjI8sOSLFsEPzw2sUEKPWtMlQF
         BpjoOlab1qhrmW+W/4tyBXHLRSFrZEEzdtrRYeOJTGvtWo93wAYZcrkBbRkdFEQla89w
         AnBRRgUGWYBhWBrRqIzFadk+BMSwW+91iPZ3C4NYdiAniBTeXEH8I+53DlajzKuPce0K
         yfhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zv8wE7nYktMBq6L4GF3QSXFm19o0Lrnz7OmEGxn1wZY=;
        fh=Fpi7NUYFQ7ZQGl2AQ603uUxkPSRzTP5OkrSI6Vww00s=;
        b=gPSILbGburHd1x4Wa2zSBE20qjv5GJ8YGHDamprVE9zuB+dyLjWhax76xyx5yOGy82
         K5ZSkG//UMVcn4VSC51bLWIc62lEDK8PX1xQDOQ+77h4r3anPutfOej3ok+may6Xdluy
         FECB9a0EfJ6O+ZDgnu7BS010BOiSgZRLXKQrQetH4Ua3Lh2/NmYEaPKe7CPECFt8SHqu
         EX3POc70lnOixZccrVWvDjuGsligUf5smvF5YLMy0FCqoDsJviz4oCipibFrbP2k4U0E
         6BRPD33O9s+esXIVnysX84YW8O0lRSWx8UWIZj5TbqBrx3TWEMpWCWhe5mztcqL5GqAe
         b1gw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794231484; x=1794836284; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zv8wE7nYktMBq6L4GF3QSXFm19o0Lrnz7OmEGxn1wZY=;
        b=Ki3Ju/o7pOKXcA0pzzRylPdEIsKGkAC6wxUeOFJjD2iharktqJLyateNyvgzypcvWj
         /44//+xCwgJz1BZe/HGV2I2MNALQvRWBozvqocQkNIcWHYUMm8fvdLpj3NtZ20cGqg/h
         OffNeOaHeYSx9Z5OTMT+LOIf2E4AFNoj3m3gSo67ImBs1CQ3t2bptfNL+jsIFsikywfq
         e2usn92iVx3s/7or/KXqQq27V98zPQqqubBdUhcwIli0w8c5Vj9xKBj8aBvJ4LO+Vnsc
         Wzd+/kdMOeQX3+YLgOWo0M83sdIHpuy8cUfgDI8x3yElskvqZP0H+xMUthzJjUZoM6Qb
         BkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231484; x=1794836284;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zv8wE7nYktMBq6L4GF3QSXFm19o0Lrnz7OmEGxn1wZY=;
        b=oP9vW/pYbXvEJpbd5xcTimbjQhD83gsJWWLG6bQZKk7aOxzFfcha8gi9LbbNaRQAgV
         czZfH3Qv/WYtsHZWv46H0FawSjxxOuWerv+c0FLVSatiXfawuXrcJ1DPuYZxs6VtbrvZ
         P9qQAD2Y0ifUUQwepa+9DT642ifL4x/vrUqSH2a+UNtLdJ1xmffI/+hycYY4+8sb8m0b
         dVjKTgpa4A+Vejv8sGIfqqQAIdo5ZwSFRwQc+c+qMm23uRDsfgyExjMAvl5RRoGUMb20
         J8Jk1Nvx/cwUCSQO83wjDOe/BtxZn1/6Dg+tToWUJ0XKESsnnLQZcoOYrn2Qj8QIrRhg
         be+Q==
X-Forwarded-Encrypted: i=1; AL+hErGteL9bEw0+hrB5PjDArP+YGiJKXr6ZEV2s7Jy8oBgKIFEk+r3SxruUaoi9yM2oIEzy+xwzYKIkQkhrd3iQplz9@lists.infradead.org
X-Gm-Message-State: APuU4Z/60WUsx+YGm/qJM53Ppm7uIaJPu7tgIUpycAvtvQeRVUjm6yYn
	sc55P2YzPTjZqZVVTB2S/nIc9o1cJnTIbXk8SKj5NLSMZH7UBufEHQj+jip06J8pjaEkyrM0Fag
	amlrFCadRdbFzPRdiTDEcDejLMujkxuM=
X-Gm-Gg: AYBFou0Rn9v+Mnz69AaGWyISKHRMHREFs4DzeVcCtKXQ3if7EI55NObTCJ5YRHvTJuB
	ckigHm5pFNav+XxHeQf3MmPP8fDgfdgfCAuwMphW4UXJicnMzvrz+c7cd7aNRmSlA1ncE2Z4vhB
	jeod4i7m4iRV3dKNApEqqqolUNd+lHU1d5heem7h0ReHKhB0FEwdcrkGmF4hNYbZ98Ssk23/NCI
	HEkD4wNPUo/Qqq4rQTYobnvG8jPDjZ4I6KEx/CwDiF9OXqR8sNKoT4GqXaO5JHmwMahMVo32mgX
	wTMeIgYy40scy2v5DijIG3DHcYEPXpU0dkTC33W6biG8b2k4byAkdg+dXV0vAI9XpIC9/GDgUkJ
	OzySzsrHYPePtM9rOM9X94IBi2TJ2KUpaInE=
X-Received: by 2002:a05:6402:4403:b0:6b7:186:e60b with SMTP id
 4fb4d7f45d1cf-6b722370721mr3069483a12.5.1794231484049; Mon, 09 Nov 2026
 05:38:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
In-Reply-To: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 9 Nov 2026 14:37:52 +0100
X-Gm-Features: AclHuK-GwXS5uzKJjXZFVGbrq4GgjBtjHoVwLZJ345xo66Ul2iiUwy2U-krDQME
Message-ID: <CAORyz2L6Q=EeY5Oa=ch2R+Mh=xCeWosFPPRe+o8Qjg+Zc4QpDw@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_053806_980899_6B2CF134 
X-CRM114-Status: UNSURE (   7.47  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Thank you!

Reviewed-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Tested-by: Luca Leonardo Scorcia <l.scorcia@gmail.com> # on mt8167
Sony PSC and mt8167 Xiaomi Clock


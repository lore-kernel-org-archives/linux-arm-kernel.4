Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1590F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 02:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AuRw329J;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Wm84xdic
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t8BFlEAmJEj8HGxMKTsLsaY7aesl7fSNxoZ8biKmTbE=; b=AuRw329JHFKjW+
	cd7KRvTfzc/KaADs2/3R9kMr6eHGzcWLRKrRoGE93DmTH9rVm5ltHhQ2CbyT+LuITAwsij2Z6rKXo
	uBPc2QVtxwCGz6tfffhOW+uFCc37gYUlvLgc8fRzJPh07IRA4cujFSgPq950ls1oO2rNraL9831RR
	JTjXN2S3OeWO4H9IqiaVsIN2BtJ6gYgipDK1Odpc7Iee8jB1ue6Qxw3WrAl9VdgJrLkT6Ln+b1rOB
	lzlny4he5r+gdIU0X4V5hSGCBYXHOU6mx7a5K3LSb4iwl9gqcXBnSuiaUwPngZdp9YUBdtJ6JXeGO
	FX6VB7HKJT+Z7WWTrZ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy6v-00000005SDm-2Wan;
	Wed, 11 Nov 2026 02:30:53 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy6t-00000005SD5-22jR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 02:30:52 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-8b33de9d2b1so22285087b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 18:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794364250; cv=none;
        d=google.com; s=arc-20260327;
        b=AlxuzFHxD0hBKOtDh5ppePXtNQk0HiaajcWgAsGneUrt80l70nIdU9rmNzvW4UFjSt
         m9oT8SVY33IzUxD/3lR6zC41680McqG/xeZbi5hmXc/iqink1K5XL1aXooDCCFURv1Gl
         2pzPgf+7G82pUzTM6k24GC8OrfPq4SAYKGmzXExZ2RA9HXx0c/Gb7q5eZ7K0ZbsQJS/h
         U5uBQdfaC/3CvNk470hMOT3ePyAsVTOamBexgPqp8taD4KWFt61j0ZYSBkaFuMbqz5GF
         eeiRWCfAWJriDMXY8hz7k4G4A9K40uqqYcTT4bnsfdad56gH9cPu8uW2ZXQ7p9vJCkt+
         OvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t8BFlEAmJEj8HGxMKTsLsaY7aesl7fSNxoZ8biKmTbE=;
        fh=uj+H/L6WnzEgXruy1PIjFKzOjlyWUrLG+4RYaXju7PY=;
        b=XYVZXXirIjd+k8ZB9hMtDsJ5uoCnbdPAMtLrLTP0sG5dfmIkxIAiPwCkP6MWH3EBL5
         a9IRVDJM680jS+x5MzlCGf93LierOO3hExZBW1M3F/FcMnoBnzNSElFjPyKF5wQJJ6Ev
         01C9vfTKOBw7Ydu+3hWahRECjMDpGv6mr3Td6nyP5mND4N8EiFao73iMjCihItW2QgVm
         o3iXHpXF3gYaTe3zji2ftBouujBow+n4+7ZdVEl9dOQ7BmygV1bI6USO7uBJudXFr5xR
         o/71WF1zuGmURorhYVW4h5r9gj/LyDykV81OOcHycI3qPgYJKRVJCwBgbyX/Cbq4KSsv
         xbEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794364250; x=1794969050; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t8BFlEAmJEj8HGxMKTsLsaY7aesl7fSNxoZ8biKmTbE=;
        b=Wm84xdicY3pqkdrNu+YCBF8RVyUnYSRuCIEFt4eCCN09uxcLlr6uJnes6LDYfSNZjF
         8WJZCDnLtaEW4KZvSj4O2rmphiBqU/N6/UI3o9qevr4GzD8q61Tgmw4Uv0UDdk5xdLeD
         7JBwENO/nChmlZjZLFKc/UYmgBaQ00udABk28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364250; x=1794969050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8BFlEAmJEj8HGxMKTsLsaY7aesl7fSNxoZ8biKmTbE=;
        b=MyWjmifrxkeVrrzMOLDu2rJ2uAFySNxpQwql5lClisBRrrnrroB7zR5QfOZ6uelG65
         7zZEBUTpZYJG1xLFCx3WrpK92Lk/7XyP7Znecad5VL5YfXBCL0Ru6AT/ua3tlMFFy0IY
         Yd7X9NU/p30dGwNWiK6hte04JZrfJ/ROExe9vGzvVXbt1ZgRkLcqMKz5cStmLFYbMbuF
         HofK0rJaRd1kBfp5g+qmBOb8o4RgmZ+O6BEaIvswHZoALF47qDge3RGDOJOw/GVTmssp
         TBkQtEnE1g8eKrVBnsvWq9nBhhMJvoOjn6CH9o1H8IQ3jxCGdeuUAvbbW/ewMCGD3azY
         31qg==
X-Forwarded-Encrypted: i=1; AL+hErGu62cOAxFbHHFcZQCXfyUQb1Fyp+906l69aOZQsgbekLtabJ8oqBFspTZEUz6RBIpvvyXioiNxzh1DcNwcyWx8@lists.infradead.org
X-Gm-Message-State: APuU4Z+W8mLy7K/QPnf+eGcTcbGq75M6wrC+8FxHL793FL60TLIDNzlu
	jnIVyobcW/tf+hUpu6pV7A+GKxemDKVQDfgQR8w7FlKgZF9n/DRV9CQFDkQeRjMbO/pp/6VAPfZ
	zi895Fl0iMZQvC32CB9gol7Ltg/Um1KRG8MlEyeAT1R/+ZmwxTe4uDQ==
X-Gm-Gg: AYBFou2iFv3uS6HWgCwQGGJl9whnzns9YP+bUgffjMV4YSIFjZf1ytlgw1zhcLTZzWc
	WN9ZLZMaRZ8t+KN3oUb1mbbVhRyGDZy9ADrB5Yezt5ySxaH1U41YSa8e9ViNaoiryhIbsDA1OqS
	aqnlJ13n5rjVBHs0pr5GwPjUPvyMazXEiYYGRYgeDUKLYlb7Wd3FHRjmXWDML6sEQKBW9DdO4OT
	h/JtGExxEMlDrM71uLABBGWfdZT1K9u5VVlurg4RjQBP+f9gWob207bOhFDvN8mg30ex+dJ/4pM
	8dJSC8yS7KwrZw1/WEvRfQjB8R78yR/qzTZnhUql4NZutORf+YT1Wo5nzSSe31+xvvyZ4SE7dib
	4g/BKKMiUb9hcngioGle46zIStm1sLMIjR6GZNZI2McmqbXHI0dEERkA9NMMO0joomVPg7nEjRA
	oDP9Xe61MOCuuE
X-Received: by 2002:a05:690c:fd0:b0:8b0:cdf4:94a2 with SMTP id
 00721157ae682-8b3a81ab7e0mr7261967b3.84.1794364250231; Tue, 10 Nov 2026
 18:30:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-mt6397-irq-num-fix-v2-1-9d5853a00437@protonmail.ch>
In-Reply-To: <20261110-mt6397-irq-num-fix-v2-1-9d5853a00437@protonmail.ch>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 11 Nov 2026 11:30:39 +0900
X-Gm-Features: AclHuK9ModA0hBuzgJ5zuMaqQJM9UHprenTTXYDmDO2P6KUA8OGeZIXeF99lf3k
Message-ID: <CAGXv+5FgXESTgZ4hNyPP1Cdd4BfnV8dVTNpitKKpNAuWY-gYMQ@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: mt6397: Use PMIC specific interrupt count for
 domain creation
To: Ben Grisdale <bengris32@protonmail.ch>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_183051_584305_F9EE762E 
X-CRM114-Status: GOOD (  13.02  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 7:51=E2=80=AFAM Ben Grisdale <bengris32@protonmail.=
ch> wrote:
>
> mt6397_irq_init() currently creates its IRQ domain with a fixed number
> of interrupts (MT6397_IRQ_NR). However, not every PMIC supported by this
> driver has the same number of interrupts as the MT6397. The MT6328 has
> 47 interrupts, so its interrupts above MT6397_IRQ_NR (32) are currently
> unusable.
>
> Correct this by passing the PMIC's actual interrupt count to
> irq_domain_create_linear() based on the chip ID. Define the missing
> interrupt count for MT6328, as the other supported PMICs already have
> it defined.
>
> Fixes: 6e31bb8d3a63 ("mfd: mt6397: Add initial support for MT6328")
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>

Changes make sense to me, and it also seems to fix MT6332.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


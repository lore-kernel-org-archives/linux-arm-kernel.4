Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DDE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 05:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i/Ox869p;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=htpCSwap
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TrI0GbzOqH9Y+vNRVIA18oJVEvnOoZMEzsKGzGyq4VY=; b=i/Ox869p95zTTX
	KoXcOWIKdGVB1ZaYmE7tyVMK91MDbi7O84RKxSyvEMpxFF3l7riatenn3O3S0e9jgT2BObv6Potfh
	ADJbaPLD2t1CU1jJpOYyPk/7B72MeXfLvQUKA83amrtjaApHuUKqAorVS61Wl5lOvbH4so27L6qiO
	IieLEPrBK2WYuy6lYYXWcYoBBg7nHlseFVFk4PEgPJeSrTLz4IRhPMQMNBblE0l1wIc6o5Qy+joNq
	D+91AdTZuf7JHr45uQbLcSWKW/3hLT5wpyGNxpf+MacAZl6ykJVZ2DBCh6KUVhI7xTmZnqfjyoL1u
	+5hI6FM+TAF60EkGg8cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQI8R-0000000HRHO-3a9P;
	Mon, 09 Nov 2026 05:41:39 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQI8N-0000000HRGM-1K7c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 05:41:38 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-677bc4704cbso474593d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 21:41:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794202893; cv=none;
        d=google.com; s=arc-20260327;
        b=GfB7TXOIH0xv+hMXwUhp9JQ6hOYcUQTpNXvWjSAYXPf58BFxoYR3P5OLnSkpt1xPha
         zmiFcWVR6IROCzEBsDtNA55ZX7oxoorEi7EO2++TdLF9Xlb/nKudXlEo6IXg9lAP2J1R
         Bt8NK/yG47IjECK1fgpp7b5jDd5sTolOvytfKpFM4jdEVlX1ktkEepti2e4Yc0RiJ/6y
         yfzskbZIpUxH12rYmN0nxA0DqgQOR7b3CrEBS6+ndFbTHL4IxzNhoRNhjwFGGtlXCASB
         Oe0WhW2eTWIOTD40ed+J7NVjV4olBJwVxEwz3lVUwEiB8B7tL5UQ4kJbx2W4RRdVToB9
         K+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TrI0GbzOqH9Y+vNRVIA18oJVEvnOoZMEzsKGzGyq4VY=;
        fh=a3OjuUNBHOZFUwuWcrgF3+2IigUH2BJEEt4tMgDz1nU=;
        b=auZdy1WcLvprOCWcEhamyV7hwUNfO0qInrDjEolvtNtowKkov7JrHBBFfmTiRbtjUk
         Y+ZB9YP9Y62Fz15/AE34n5nXDIThbNIV+XCnp4R4zACs9BTb8RMBKmFvvi8XIjtrud0h
         xQY1ASgxKRRWfhJxWsYb44R6dD+42teG9orkxHU0SJfgcCxgf72dJMn62Fo3z3igdfPn
         meIDLqb9HskfXuZJeKJo9sivsrgne8Y+vFr/ddiXFpb4wdZsk1HHytZGQ5W1tMVTgBQn
         oboJm6uEGo36+Y7+bpORP8l5+A+d8lO1D/thqohn/U9OBqnfvwpRsc8Wc28UiPSg8gaE
         Hdzg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794202893; x=1794807693; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TrI0GbzOqH9Y+vNRVIA18oJVEvnOoZMEzsKGzGyq4VY=;
        b=htpCSwapp/PXyOaPbq+C84EgnWPujfG6AuTJSM3BxqBimiiaLv/P/a9cmdTCa4GC/L
         iKwieMzisl6xZ+dE8+r9yXS+OMvW4xZGH1+ERVNYDlV8LBy4h2CHJOOfNojg/5vCSGYn
         cNXW7x2S4r07IsmpTV0pBojPhOok7p5nEiPIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202893; x=1794807693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TrI0GbzOqH9Y+vNRVIA18oJVEvnOoZMEzsKGzGyq4VY=;
        b=TTXWKMQOk8EGOC+YX0J7KZG4am+ns5RVgM1ImH/MwZckYC/72fTtwHi16TUzeFnUIt
         vfR9iFBkF0aWG5TfVe8vyh4d936SmuIEDYSrcrt4zdPKvGAzV7PC1eWc/O4/LwsuCiEO
         OxJuNZrICyR1KyFe+rtJAVaYmu7X8ymd+PHuTY5Btbu+56XDyGDDTFC4K17Icmc5+J1b
         6GB9gG3wBoHvMhf02PQ1J0RGYeemnmnRKsk3laGs3ticgNZNxN9c0UQ8Mel3d8o/Rhrn
         heDo3cF4d6NiG6DiB190TFozYGuVudstlwAUGBw4mJ+vQG77QNPwAIhOMY/7c/n0HYC3
         aPiw==
X-Forwarded-Encrypted: i=1; AL+hErHLdOW3HrgVy4CdvewAz/33erV5aAPlYrRz28Wgi/u+f2qvGdaUhkraAA/aZoAyWzC32X8RQkFgczTQ0MvAGyyw@lists.infradead.org
X-Gm-Message-State: APuU4Z9kbwnqSnYfrDoNWKJG/dfQ7thKuTAAciJ+nB0qXXdR90mASVYx
	dh+5Gr0jkRiIg6MlA4dnTgTRibXTSPcQ+cFwMBXrnRe09If2jo6NvkCvEaq6rBG4pAYlLfveJEP
	FgSqy3l7AxRRJpezFd7roFjRF4MzS5GdZxCEaGRPu
X-Gm-Gg: AYBFou368qo2wCjBOMo69BnKqaXP/nOnGuHXyoPDuCdaxandMXx03T0MNGrrdl4oU7w
	txJLRuvsZptfAQp05LCx2FA7LRm3P7LOhDF48RrTBpEzt/Rq2FRw4FInn46VQNRoeRVJ8FucuaB
	CD9UilypxCuVRyBYFGx3pinqrpu9PX0SFA5HOsB/gwF1o1ZBqqdgkehN0rLIRy9moX7OxLNoCET
	DknetrzLiL7S1E8Ga3QqMuzV4sqwynSIQ4/wLR7oHMXyyErq80HqOqQGT6SFEc+kM3Bec5Y/KT9
	uoncv30DtsQeMCJxjNyAPFPYuBmQehbrJTwM6AL6sg8MUNBAcgNFwCZU6AjH42Nby5GcX/lFcPl
	joTYDak58YUj0JMgXG0rFSE94FWvzMir9fVQHJA==
X-Received: by 2002:a05:690e:4393:b0:67c:10d:e377 with SMTP id
 956f58d0204a3-67c3d97b42cmr874807d50.24.1794202892850; Sun, 08 Nov 2026
 21:41:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103043734.2179858-1-wenst@chromium.org> <179406980914.3424803.6201831446824678583.b4-ty@b4>
In-Reply-To: <179406980914.3424803.6201831446824678583.b4-ty@b4>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Nov 2026 14:41:21 +0900
X-Gm-Features: AclHuK9Uis4PjHZvlrrahSmg0-iKCJazl9kKs9oybOBLW0q8BipFSNFJ0jiQ-bQ
Message-ID: <CAGXv+5G1SozUuj8v64oD07wz6dFbY+bXh-Q3OVvieY7v41ZJ8A@mail.gmail.com>
Subject: Re: (subset) [PATCH v7 0/8] arm64: mediatek: Chromebook trackpad
 supply fixes
To: Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_214135_361467_FAB7BEF8 
X-CRM114-Status: GOOD (  21.69  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 8, 2026 at 7:25=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Tue, 03 Nov 2026 12:37:24 +0800, Chen-Yu Tsai wrote:
> > arm64: mediatek: Chromebook trackpad supply fixes
> >
> > Hi everyone,
> >
> > This is v7 of my Chromebook trackpad supply fixes and optimization
> > series.
> >
> > [...]
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git =
for-7.5
>
> Thanks!
>
> [1/8] regulator: core: Add "enable and wait" functions
>       https://git.kernel.org/broonie/regulator/c/9f9bcca6adc3

Thanks! Though I was wondering if we could get an immutable branch
or tag for the commit, as three other patches for separate subsystems
use the new function.


Thanks
ChenYu

> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
>


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431AD606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 02:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=io88ntc3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TixTnfWk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UiLHg/bPQc7nmGVUQ0fYMmT5qdFdLgHhxo+4OoJyT8w=; b=io88ntc3W89/Gr
	NGWtewYLtG02wArb3Jtyn7pMkxRtjQVP9h9qhjM0KjL4t5z2buq3melnirfICwZ5G+1CINKpUWYHn
	s22Q+8/fzuqkM2T25k0F8cFUPoXbg/CmW/ZrrfmPlPEiEUNyY7Ss5aq9PgRkRFJPxb+3G5yDWw3CZ
	i82dYJSSovp2vUP5ag4In4/gR9ZcTOunhGXCNaksDh1QW0AyAOriKhsPrQIkeloKSPFJsxctfc2CG
	77Vo2MVYxCjc8iIDVRHeZ3CVQmlV3jz7RkIKSVzBi2SBC6N7QoKAgqg2iuBm9lItsf+jcvaemV0+s
	93FojZnmfzneNR7AP7uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmJn-00000000vXc-0P4K;
	Mon, 16 Nov 2026 02:19:39 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmJk-00000000vXE-3IzL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 02:19:38 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-7d2e14babc8so2865732137.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 18:19:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794795575; cv=none;
        d=google.com; s=arc-20260327;
        b=Luhb2bqaTWDI5P8IxQ4n+It/YLWdbSqFyQ4k9uaHTFSLmyFalsWLmbs4h36nx0QsMh
         l+l56jX8tIELOGRUATdPV0juJGGB9gO+GTazbGq5bSPD80rSDijEWArfxM/hsG6pY9xL
         b4YnxNxPoezy9SMt0+Pm8lxnbszGQBoWMQzguc3srHSTnn6IyQxaXC1+/4JLjHkDuWWb
         oKg1XXs2bioBjvIEAtbHF1viqnaEN+XbLCupDDw9JJ41kdbEpdNpkdkstv26dD7yMyJN
         LDOe8byZsGwRvk30X2h46WxlY53nSmD8L3ZV3LfZyF8ZhH99A/h8e6Yti8JkAKDloNDJ
         Nvlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UiLHg/bPQc7nmGVUQ0fYMmT5qdFdLgHhxo+4OoJyT8w=;
        fh=j3bkWZyr/KSmcSNbOZrZyR85SnsonQ4aq5qUhFW/DII=;
        b=aNmHtBBGKw4EJlbA0WA4QYYEsnRNPzV1mjqAhzPzNrOAjhaO4ltmKPqMcq4c1QdVFs
         ttkeed61NG/3lvjaUb0ktDiFwLHY10cODC9nmWxXsXdvY7AYVkljUmsAiU7ZshsTQ/V6
         rU0YGBs+lnYLHvtlZ7a4axOPLjmmrMbZb0ijiVItMtlMYJ+AaEIiRTzD21W/UgtWSW0d
         O7hOydeCuvO43g6wiZ536EJfMDFOsKj5QPjgVoUItMC0+y7XVeK8ttG5rzmM1FRggzXL
         I8a6vd5HNZdJQ9ToLe3YcI0ihzxnJTIQy1gF8S0KsJNuONTTgWGTDG1W209XjU66hUaV
         XQHQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794795575; x=1795400375; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UiLHg/bPQc7nmGVUQ0fYMmT5qdFdLgHhxo+4OoJyT8w=;
        b=TixTnfWkTsSSctelGZl7vrM52iQbcs0wn6KLLGxdDC3bkd2K/+eN2ISxxyI5sRpr4H
         7BNd/67F6NjedQ302qcPLdHrbnhJgpwaWiEU+BbOzANZ2IGQ25kQoFwU0tX4yyD6FzD0
         6Yxrv4xqjVonis6CaW7RK9MY7SbvAzqD6r6QN7Omm/zGiJVWgePB4fJyfGts+eiqLyfw
         VR/8NB7Buuzl5cfHbu7nHqW22AzF67yjck+qEBc4XpuKi0rlH4b704Sk3QFDHZNe2Lag
         xLaA62/i1SbblMtLim6RT4RyFaX6DLZv1OasP22lKbSkY3Vz985GtiU7WBtzhGV9deJE
         fKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794795575; x=1795400375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UiLHg/bPQc7nmGVUQ0fYMmT5qdFdLgHhxo+4OoJyT8w=;
        b=zupCpaA+m2/rU56XkYZh0Cg+iWcEUtrCNq+LP/gWzcgkTEmeQUHgQicSb+Cnx9BbbT
         wJezAV6ajiS3dThjJPbsIQl9iiX848beoTvL3R9ECej4dgcatufN7SA989pTKHexxex5
         fCEGRD0DuDg/a0PvTk7RDVUWOHO2yZf5KoapMgbm1+sVAAGIVKHsKHsbzr4zT+hnR8tg
         eU2/9sM9QgTduXSXWvzwnMv5EK3XH1muZpsFJwQ+nOXnXBi82xrGE2O+TUmKSdvMp9sJ
         pyqk6m2TE/7yQPm7zEkXwqf2PJHQRzF3QpRUxW5cGhRfNMh/vJhAxhpstKSnE/Pr4zLL
         2MMw==
X-Forwarded-Encrypted: i=1; AL+hErE9qnCcA0OIF1CNm9uk3GVSwdqpxvZ3OpnuyPRqDeeeaFRyhdVJv9r8X2YZpdDgx9fzdsK04SNgGAGFR7yI8huI@lists.infradead.org
X-Gm-Message-State: APuU4Z916BdMdzQ9ZHHcupMcbioDvRTPBPEozl0KcC4jcN6v8hS5AL2s
	wlbfpR/1JoGHbqCo4urcVYcodPfufQUMvEBC4WAqwTIq2WNVctvNI9o49tKW0hs/MLMgCGDDTJW
	fWp8yJAHXZhtwEGF0a3B2aA9kKD0Xubo=
X-Gm-Gg: AYBFou3MmVG/jaSHEnzcpVMl9PsqOX6Jg7VeqY1kqABBUbhK8LpAeEM3at0RexdHPab
	HXL/6Axk9WKYvFxk3AINFTLWX1cT6VfTR1t0kVKHU2tGqJDJZ1VUPuBOSPftA1777oWZh77kxxc
	xMg++wHq0f3ltxwy+pfy+sDRVPweDqrWyf+BltiNi7LxVFHoQiKy4gd/be/wjRVQearL9q+Bj6s
	lzR5JNTO4lF8MDw1Am1XI4bDEyF3pmOjuqNSZfQmhn/h5qzlkRIBwlmKiiSmxPBo/2lMnad02Jj
	4HsAO9nXgaz1tN3HvTkDaDnFsqX+FVfikEmo84SKb8KsUuSDzuY8hmwJ/rWRIjoIcrNPv6W0Sbt
	YXgLjAWQzN4Cnjhw2V+fx8yuxjtkZqUALGCVIy68pDLCUwLnkYfJHtsvDqjpK7PwAXYsKwsigoD
	AnE9GoKlL5Z2B7OAcMth119y2ks8R9/IwHz1TAGAXrCvsI5hNSNRHI0bvjdTIRxDqgTTcvLwWty
	pt6ecR9mPWnaF0+KJk96jIhZkofOA==
X-Received: by 2002:a05:6102:2c8d:b0:7cc:828b:421b with SMTP id
 ada2fe7eead31-7d64d6ca4dbmr3337958137.6.1794795575374; Sun, 15 Nov 2026
 18:19:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <179479100276.3291.7162632058743254408@kernel.org>
In-Reply-To: <179479100276.3291.7162632058743254408@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 19:19:24 -0700
X-Gm-Features: Aa3M54oUIJGqhOxY6fZncLdECG4spZRJMb8V-mVzn2dq9iEZ8uyZ_G6ksg29zgg
Message-ID: <CADvTj4rK0Ew7WDKoxmYhf1FMKx-xZwkhAKc-ABJ3EmOkaSHLPg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_181936_837029_B3C46E66 
X-CRM114-Status: GOOD (  22.92  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 15, 2026 at 6:03=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

This was found while investigating RX checksum offload behavior on
H616 and reviewing the shared setup and feature-filtering paths.

>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.

The capability loss was reproduced in a source-extracted test using the
actual GMAC, GMAC4 and XGMAC checksum callbacks with mocked MMIO and the
relevant setup and feature-filtering logic.

With the original code, disabling offload and following the reopen path
clears plat->rx_coe. The feature filter then prevents offload from being
enabled again. With the patch, the saved capability survives that
sequence. A requested enable that fails hardware readback still clears
the capability.

>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

Tested on an Allwinner H616 board with an AC200 PHY.

>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.


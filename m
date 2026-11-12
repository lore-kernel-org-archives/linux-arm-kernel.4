Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FE9606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 02:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pHWoXs2r;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LXSiawIN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uSIrkRDA93Mj/PVtKNG7+nFpfhhPf2AG8Tz5QutxZsE=; b=pHWoXs2rE11/6V
	qW3HW3s0K8BZfV4inK86iZ7vYjeuYb/Y1tGxEenhkCv9mEQH6PfP0I6sccD+yiTNAEaIbLn6jO43Q
	X/B5deGi/yRr2iod+lOoayxcMWIwPlCGe/GDzQAGC/FXdeQEAqPAXpS5QuxZEpy4iK9cSn7kb/JzN
	9LWeT76L7A4CCs9EafSEmrCNv9z4rsjlRShNE0KLeWAldSl4yjM8WUlSaFmp3zBHsMmUvyy0kQQ9E
	RCwFR9tbh6Q3K9PRKagfe+64mCx/K1ele+tF8JUXPJN51IUqT766XB+kElr1wAkBfqoOgcZtLsnqa
	FpL2ZaZNevu2CNzwMMyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKOw-00000008Umb-3Lyj;
	Thu, 12 Nov 2026 02:18:58 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKOs-00000008Ulc-2e5N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 02:18:56 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-91f1324a134so3817386d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 18:18:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794449933; cv=none;
        d=google.com; s=arc-20260327;
        b=pYIrAgZn12Bpb+mU1utK1eZREHrocaWKExFnG5QaExTM+ANjGtv47DVtBW3QKakAJk
         DJQsFxar/HxJehmYDOAEwJtOsmljhd7Pc7grPocSMNcv63RzzDq7dvazxHoBBO8QSrbF
         OfSUxSqme5xF3AkmiXWHMZk/5djbFCBILwCOs9NuW3grW/Kyvpzf84dM3opbOrbi3f8Y
         DKHCHSacXDP+pdyrIXW+fwdHtUaBsuVdPy3Ur16tH75VJbpLCReJrnWg/y+O4giCxwUb
         xWemfzEUqgV6sdcj6yY2sg/EN/XclGl/kVTLGh0Nyk2PMQLv+GXH8cIYDWyIvEXs8N6R
         Ofvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uSIrkRDA93Mj/PVtKNG7+nFpfhhPf2AG8Tz5QutxZsE=;
        fh=md+HoMqMCqWw6g5KTaUY69jHVjNJ8YTk/0eCV8RCL6s=;
        b=iib2tz2m23FMu6SjZUuJ80+EQYP2M2FUEanWApTIgLsVE1iODMU0FMoNij4SqOIMNv
         i15HcSBDf/NCGrBd9DEE2mWveKHiWpWxhQwQ2FVkb/xUAi6Rli2BiEckDMdAQgZAn0L2
         lG0OZNFbGVyUNJkG1jaoK1mp8odVI3qVBhx9pB1wIvicArp4khf8Vo1O+zpzlriUISmP
         S3d4y8SMjeiQzxa9oXhoAA/ouMHxsTB3UdZa8sb4N7b2NkiKlpKiJ3ujMi70Gg1LD54M
         fuk8ARK6awAHlr58/c0NH14njeMo3IOAGlm+zrrWBuieI4h7cMQ0wP+VZNE+eqt3to1x
         Eg6w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794449933; x=1795054733; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uSIrkRDA93Mj/PVtKNG7+nFpfhhPf2AG8Tz5QutxZsE=;
        b=LXSiawIN5nrc9hRzxCDQGAzz+Uv3RqVCq8azj0LMfqLCphOgBBMEuZeiKaluItLui/
         jY1Xr9GEsavu1tQ0zm6x7brPmcZf75SCH1oA+3dePZc6SkuNsUm+7REJFYXCRO+yhkka
         weZcix0z+F6WHM+KbAgoXCMLfTLYY06N6qDuNhuEFvmRWKlzWg5GpfgMl/Rmq6d2jxTg
         PoonkeSULMq8J8wWYrFc3rtblc+u80zwJn3LtkGImRLOMwN8SDoHPgf2OTgnTuts2++0
         n9DBDBfkGOxO5rEhtHduVufyV+HYbmZFICpnz/4jsvw5CtZiRvDPVjosjXnNS0JoG67J
         2MuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794449933; x=1795054733;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uSIrkRDA93Mj/PVtKNG7+nFpfhhPf2AG8Tz5QutxZsE=;
        b=l7Zq1ifl38NtD+T7H1qxGMRrmSx4HqorsSVLIEUAT/w9XKJ7QyggN5iQtlNWmbkGey
         rS1VOGcesr2b98iR2bTfO28RYh+HtDdWU4y0TLTuQZw+Rvomb/nMy8JEK4zjVUceUnEM
         NdqCg1VmuYv+CqXljNZP1qafcUF8wSpN8SYziVL+Udxu4VqzIF2+K+LPxS8jSnpZQjIH
         hV5Ri+J1nK9r1x8Ma0/EsvRPRYucmlZ9BFSKKEnOd3R6muBRsDIZTu/vG0lnopyfYDZu
         lB5BRKJXy0JXEFfI3cs8JcIrfqgJG10K8DOknin6rzyK2GeE99nQNiLBlaIYbq25x3oj
         KtBQ==
X-Forwarded-Encrypted: i=1; AL+hErEcbwj81PHuIhX5JY0ur6sqnKDaEmO+v7zHQ6BliZCqVwhJygHFvxAMvqIsd4Yg760d9vEKMUoir2MN/C7MP97k@lists.infradead.org
X-Gm-Message-State: APuU4Z+oWY9bEiYxWjGBR62hMt6lPjc7zxCb0OgvL8EVsGs5077Xdoqd
	9KuU6EgyEuK74E1DM9eSmP46uBcYHDXnWwsGdbCDZpHTPCL6bP2NE7o9sQ026uEOqs5In1mzkux
	fSmYrC80By+fq3O5mdeoTIjYmHT4VLxQ=
X-Gm-Gg: AYBFou3VYgK05P/YIBlEQfnjQgzHikhidNXDbc8Wrt7dSGxEAkVw7vt5Pm5x3TE1G3C
	FlnBSpNFBfrmIkSk0fvsW7OR2mJtT030/epdV1PejgZaflBnKhAPA9XLz8h/xGKL9jzF3ysPsCH
	ZEFiUchtB5RCfgbde8B9fbEOdQsS71Fm5dJC/Wo9VOUXoWebfg0Pf13znUyeMb4JteJlI72wEEs
	UjK5J4YskKI17moN4kknw+FZVXU6Khg0WL/rJ8tPmLwyKyGYKwNFxbzxzTAnelbxr7YKi5sOoIV
	zoMMt5aveuTcKplVAnU+H+92N0pm6eaOTGu4AHabtOFCteYxWZ7j/XNGqKv8cfW4luMqlKsbSDE
	bQ1pRzd4uwi/jJYrbX0J3umBnIOh9LXZM3ZZq
X-Received: by 2002:a05:6214:6112:b0:91f:12f9:fc6e with SMTP id
 6a1803df08f44-91f12f9fe1fmr26500366d6.31.1794449933323; Wed, 11 Nov 2026
 18:18:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109134506.2794160-1-zxyan0222@gmail.com> <179423231463.488859.16977464890948797360@kernel.org>
 <20261111152012.3506cf35@kernel.org>
In-Reply-To: <20261111152012.3506cf35@kernel.org>
From: zhu xin <zxyan0222@gmail.com>
Date: Thu, 12 Nov 2026 10:18:41 +0800
X-Gm-Features: AclHuK8QI62ccttn1Xw-oY6fIZrapeK5u9UcITSCWeJbJUttr5lLmZTnCyZA2Bs
Message-ID: <CAP7veT+buHRMu6f3o5RaKFdv3fABkWKgkO6KFn5js4PEeB8b0w@mail.gmail.com>
Subject: Re: [PATCH net-next v10 0/3] net: stmmac: dwxgmac2: timestamp
 interrupt support + Agilex5 fix
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev-bot+sinfo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	richardcochran@gmail.com, muhammad.nazim.amirul.nazle.asmade@altera.com, 
	rohan.g.thomas@altera.com, rmk+kernel@armlinux.org.uk, 
	o.rempel@pengutronix.de, wojciech.drewek@intel.com, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_181854_675849_AE993D95 
X-CRM114-Status: GOOD (  17.79  )
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

Hi Jakub,

On Thu, Nov 12, 2026 at 7:20=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 09 Nov 2026 13:51:54 +0000 netdev-bot+sinfo@kernel.org wrote:
> >  - What hardware the change was tested on. For driver fixes please
> >    mention the device (and if relevant firmware version) used for
> >    testing, or say that the change was not tested on real hardware.
> >
> > Please do not repost the series just to address the above. Instead,
> > reply to this email with the missing information, so that reviewers
> > can take it into account. If the series needs another revision for
> > other reasons, please include the information in the commit messages
> > then.
>
> You are at v10 and still getting these automated emails.
> What's going on?

As for what is going on: I answered the bot's full questionnaire once,
in a direct reply at v7 [1], and since v10 the same facts are
described in the cover letter.  The bot, maybe, evaluates the
individual commit messages, where I never put the information,
assuming the reply and the cover letter would count.  They do not,
so the emails kept coming.  I will fold the tested-on and
found-by-inspection statements into the commit messages with the
next revision, which should settle it.


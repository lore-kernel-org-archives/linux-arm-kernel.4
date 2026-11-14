Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2DD606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4we0/npP;
	dkim=pass (2048-bit key) header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=H57KSfDG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wxTYhvRvzFYh+gzRWgScWVeMkBBcGFa2zq2R3c9b1pU=; b=4we0/npPj7NRze9O8+wDJSMAra
	KMHAHGn3quIbnCU4JUyMCzI9EzuaerTU4bTcfCpd04MW3rMDxX67ilbhxNe3XDKjs3xP0amil49F2
	/MJc/PkeIfpvr46EYi1noPDMojLgtPMr3O4D3jjQ6lmeav2WZCJ3REljnE5bE4pOv4VRJ2icS/rjk
	aFfqZhWvHTQiYk/tz9P66nhu/Vw73PmZyMP/hJdIpDCeoe7TWZ3URKbPHXecHepes/7Xdm/nDUSw7
	SiQo95ZjdUuqMiEmT4yzeC29+5pTgir8rZypPetXGb9C0WOUo/BMhxsLsxm9CvEFa7EUxL9aHVOkD
	SSyONWww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDf8-0000000G6GG-1guj;
	Sat, 14 Nov 2026 13:19:22 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDf5-0000000G6FT-0F4n
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 13:19:20 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c4d30639709so316720866b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 05:19:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794662356; cv=none;
        d=google.com; s=arc-20260327;
        b=sEPYVgLCMV9h7qkzsfLF/6KGKo42eQ8fJzpIPBNHz+zJuKeAyIKBhGSpMihLryBPpG
         GVhYkBAP6l4INLclzWXJuo2YWI3iSlB0wJdEbXtBaa4VFQKCoFGg6KOPFfSLLxqv75nU
         Nj368ztdCZV9XNGKft8vHPExny//vUpYER1scpeuibV6mbXO0G2GJvS909tY2EomT5uO
         w6cP+IZjN7y4c8kCXktSGI+TzMS/J5Slyis8pVrclyPWA9XN5B+ktMngvSbW00WJYICp
         ew4hrpt9TdjlKfX2UVhHEW+08I2F30aMBSN0N7m1k2u72sBbmVHaU/JxT++sM7TliIrr
         l5EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wxTYhvRvzFYh+gzRWgScWVeMkBBcGFa2zq2R3c9b1pU=;
        fh=f1VJbcdQTXTS3miY7a7vZ9VP1u8fScWDXGR3+9XMlxE=;
        b=cy9Pc9EZPZFmCaW7tJkYAqLYNwal72mpbT1GLA6TS1MhsqbTLIIZfcjJyVWqb/rc28
         OIsbdCTeRgus/Pq87GSnBm6QShfFL3fk7yHsuaZefT+y+BUXrLhy4IOfF/r0eljKrXNE
         nrc13AYfGv6AemPZogQh26UezU6K1T0LeFiNsSLY1XQymVdb7VIQv8hzhKg+diMx/Io1
         cnbLVCffOOco/C74a8nh+xVCRQkGP/ceWmiICmn96L8tL08wkxyFWtN0oy4RgTmQkkgC
         Y9Uj3o27onFuwu45nMY8MNALMl+t4qLw3Lifgj95PH5uuEkg+A5o3R9YJOKY5LwcjsVI
         smGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grische.xyz; s=google; t=1794662356; x=1795267156; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wxTYhvRvzFYh+gzRWgScWVeMkBBcGFa2zq2R3c9b1pU=;
        b=H57KSfDGmhbjNyFPwoqDvzB/SMbXKa2c8mG13gjVVFjS0ZWJLUM2/044SwUvCXCeHX
         TGPqDgfttXyiYhXXAMGK3UGL/RPizUQZp8Pwcf3kxtVYNGfzr/3aF15ZfV7erSrHXpkb
         XE63USD5AmmKU1NfcjttslXhEbLFb99s6uS7rZ8doTzWp2ir7RccaItY7L0Ycau7k7TH
         +rqv1PbYbkA6YXFRgY1nzc2pK9YEitxVJNSkdWeiWwCC3qCHYpzetyIK+i0cwjHg2oYA
         hX59XrPLg++xj9OqAzezspUDCXaKnZLcennSKGIQ96N6n6mY4wGhlpNRyy18ZdLdyyZj
         dZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662356; x=1795267156;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wxTYhvRvzFYh+gzRWgScWVeMkBBcGFa2zq2R3c9b1pU=;
        b=mW4aezTc7qeXpADye+Pei+c1ueYM7EK+iTRT+tGe13Vo2429+bXJyGiWilQTw9ftAi
         V5p/VwRWS1P1ZkovKtNE+t+Efj4SBXQit6AqXCzT7MCK6nw2w3Vyob7mnyk/YLyPXe/c
         yD6tc6lqqqp6ctosXspoxe8/3SLPa3Coind3+pVMT0i2OMQRQqOZMIRFwzNoPr1d6fy9
         +VBszj5yQCFzTKC5GCSalpaTTliPw7eQlCKcbn+la9Z3Ta9bMsINuPcrDrf4KHJGXcTD
         44SLNvr0vHgBXHnA89zr/WWclkl3AXivt2BIG2m5k1BxYQIiAc1W4M6ynhOFNWR04HTh
         H5ug==
X-Forwarded-Encrypted: i=1; AL+hErFazxKSA1f4OWROYb8dpI6exGYtBgN3G/IAYnCu6rXZSVCmms+13tCWyaxH8SMSKrc5a0pDDBo51ULvzhBU4Qdd@lists.infradead.org
X-Gm-Message-State: APuU4Z8OY4R5KrRLcePXQ2y8QPDS21z93O2MVbv6BZb5Czawc43ZFVk2
	AaSMFF6pC+RRkCWJmL3teP5q/3AgOWRC2QWhb4K9+1CETpd9zAEwD+sM7S59/PeZa6YCmTAXBpl
	uXg0rGf4HTRyzy+E9FmyKX0VNmah9TZdeFt2ZXAA2fQ==
X-Gm-Gg: AYBFou0lEa/P7m6rNVkTgmiQDCiQ3CT0W9KIc2ig0+cySWDAB1T/5sgtdwkZMChCZXu
	AqIU05f3CMhn7P7DsL6eKpIiwERAqpNA+D22jiw0hZbV1aMQXrDFvUCruPZxpgt/QyQ6Ei1yUgX
	KCVTatwcmlGupr85JTt9AMeo7nx2ie3PoDMEBi1ZdLrB+PXKHGVoi4XsZaJHZb95IEnBWLyIDB2
	sa7fQ1vjOLalfabOogTuBPEqQXta6dcF7dDuiQOUf6org5zdIQ9iSXhDEdupy9VCu+AwbnapNwm
	phpdY+6yOsyaTlIU/2Z9UfPeFs9L5H6UBDKKVwjMO4ly8EBeTnGNM0HH1tA0kNaAjTXOXiy2NEc
	k337XnCULEdwoXSA5Nr2sFBH3ty6xvH570fHT2JcrSz7Y1Xi0r2HRZZ0tGex/WBGAI1PKC0w=
X-Received: by 2002:a17:907:9622:b0:c3f:dce3:20c5 with SMTP id
 a640c23a62f3a-c50968394b6mr566230866b.44.1794662356386; Sat, 14 Nov 2026
 05:19:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104151914.2651241-1-opensource@grische.xyz> <20261104151914.2651241-3-opensource@grische.xyz>
In-Reply-To: <20261104151914.2651241-3-opensource@grische.xyz>
From: Christian Schmidbauer <opensource@grische.xyz>
Date: Sat, 14 Nov 2026 14:18:51 +0100
X-Gm-Features: AclHuK-t4Vi3tD5hB2DBl1bIr6nwi9vm4FOrc1kbogOcAMqHwa7CaPoB_seqTKw
Message-ID: <CALsH2cy0OUN+6EA3Jt0e8B5JGGhVpyR=EuFOaJvxOv-LnfOOvw@mail.gmail.com>
Subject: Re: [PATCH net v2 2/3] net: stmmac: dwmac1000: don't discard frames
 with only a checksum error
To: netdev@vger.kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	Oleksij Rempel <o.rempel@pengutronix.de>, stable@vger.kernel.org, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@nokia.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_051919_129336_116F1E18 
X-CRM114-Status: GOOD (  11.88  )
X-Spam-Score: -1.6 (-)
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,BULK_RE_SUSP_NTLD,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FROM_SUSPICIOUS_NTLD,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replying to the Sashiko review [1]:

> Suppose the MAC sets ES on an oversized frame with a valid FCS only
> because of bit 7. Is that frame still dropped here?

No. In threshold Rx mode it reaches the stack if it fits one Rx buffer.
It is marked CHECKSUM_UNNECESSARY only when Rx COE is on and the
engine reported no error for it.

> The giant-frame status is also no longer recorded anywhere.
> [...]
> Could the status parser be told what bit 7 means (Rx COE enabled and
> its type, ATDS or advanced timestamping)? Then bit 7 could be part of
> the mask whenever it means Giant Frame.

Dropping or counting such a frame needs a new argument for the
rx_status callback, which all four descriptor implementations and both
Rx paths use. I would rather not change that interface in a fix for
net in order to drop an intact frame, and I have no testing hardware
on which bit 7 reports a giant frame.

[1] https://netdev-ai.bots.linux.dev/sashiko/#/message/20261104151914.2651241-3-opensource%40grische.xyz


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4867606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P4tnwzfv;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCiRVKD7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m9qCn8tiC9eOR+AeR03URThDVh6TlV82DdOIxf2Zrx4=; b=P4tnwzfv1Id8xd
	CtKs6Dqt3dtPqEACPCfdkFOE1KJtfa2avpLBbaT07I462IOcAwRvVuI+k7dRfpmA4Kev6ibDKQPHT
	wEQ9LRzuGpbsr0V/38geMba6pOVuTJ9aBjgi1fvG5r4gcq/2GbUIVC5Z7B642wrmCt2abv1qCNwTw
	EXc8EZcbI5Q/Ac+ihy+cd/orZR0wEuGXhG3MBorFGpg2vf9qlyRCZaQ/cF4s4J/nLDvGYbp1uPHHh
	AM9VzH8Mv8PBJx7bs6klGOltZlzhALlDPdZd4tBVMwfytDQ4EWRgcUWzszUv8yS1Mt/8NInoorpxJ
	1/Lx2os8y/1exJaoPeHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM4O-0000000Ed1x-1AIK;
	Fri, 20 Nov 2026 10:42:16 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM4M-0000000Ed1d-1pbj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:42:15 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so328505a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 02:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171333; x=1795776133; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m9qCn8tiC9eOR+AeR03URThDVh6TlV82DdOIxf2Zrx4=;
        b=VCiRVKD7EIvnT9TAWTr4ZRhnSVRKp1OK5OVp2o5MuI/mX89eZ73Pahu0fg/ZMXg/PY
         VXX+18XoT6iXFjhH5FuhjbN5c7zYVHpBogieJn7UNHF4piGkDc42/sKt7AW6GdpIQPdi
         5wD2r8FdbWAoPXlr7123MOQT+R1eI3jfkRCdDUrePjz+Y36Gjxi8tQ82x3a9rX71BpRa
         2H4VVlJjp/+MDYKJKYr2P3VqQFkI7nBENzaL2DO+GUK1Lue5PUPYpz+smOKZ7/Hzc184
         xddc18QPmcGhzCqO4mf8JHvbGP1DO9FLJhnNvs9s6bQQmYn/r5Fcj5wPpJXGLFknUcns
         7a+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171333; x=1795776133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m9qCn8tiC9eOR+AeR03URThDVh6TlV82DdOIxf2Zrx4=;
        b=RihUl3LfxW1UcuJzMnKJAzDt0cahGq/uggmBcL1DylUyF7sJ/y18UdZyIF/BO1IU4H
         qA00+vzzi0fx+6qNgAuVzPvTocisWKiojUHFXx6AP9+w5bVBeX8Vhdz43lxCa3k+RS3E
         vPA7xx1x0eIyoZts/grOSdukBigQWJmottb5BBvWd/gdXT/7F+vSNAVceO23IXOokK4J
         f+djxppUgV1GHYZ6+kvM6JCtwWGmblFz4S7tYBZpl+Ygf8ED+uqJHywcS37pt7FPkTkG
         FqLkY/ZLKYEtx2BaMTG6gWTfX7j0e0Y9k59AMWQMxtp9pWGjqzHkZi7QxZjcQGQj4kJy
         skng==
X-Forwarded-Encrypted: i=1; AL+hErF86JYwY6P+f6W1Wo1n0zgN/gQJDAX1EcHBOtbHdxATWHyhYC6BYM97G5NCPi9b0bJhFCd8qSyM5KtNnnEjNm+B@lists.infradead.org
X-Gm-Message-State: APuU4Z+uKUjOojdXndKmOwzGm6qKZttEw53/ObW7Yqg2RxUR5X8MdgYN
	GVP/i00cpGLxdivSBigA6m4TmYtQ9/dfE6uptLGgxQPrcZqu+Z8omWkA
X-Gm-Gg: AZFdTZfJpJcSZd1BzO+DFoRAS7D3B/zRMTk0c0R1D4+AjByZ9/OJEDCnNCKXqfDbBKN
	cMKauyfFkryHpwy8pDDaUEg13Q9Kk0XNNTjIR+T6SiFaa9LNm8ZuvEVkjQPVdIUAEd2pllaqQae
	sopgoOT1/Waqe6R+bB+dxOZe4Jt9k8bzS84FR3evkX+epPNNoD/FnE5WRE5FB83dC1NgUwzDzbX
	1DKdMUhW+5htGleCBTDggFESWHQoBoZqXQuZKRP13ghfHGKlicLiVXcFjwj8JIUhpBT5BmQro3z
	+4g00rblobA30KBm2I/w/yfSc+1b38JF+aSYvgzvm2Hw1QupA3GKuItU1I90yvbtBSmXLz2ewD2
	3YQWhEVwBeAiHk98fYwapZESiVl+26hZCDwC4nz8A6gSZ5VfWsFwOH+2DyoGG/OhFj6h14+CB2L
	C3QTG200gKwnmhjjV8WazATs0TZ3ScIEecb73FvtTHbPTUvQ6wqfURGwHQihljHb5qKUVxi7LRq
	LA9vCDFtKxRT5/y0OmwImhSGi7pkIUmTnAWDhP1TJ9Z0vyJ21ifgUxPkpUrLRjyNd/yLwYqq6i4
	9to76cxxhp3m8py1+vAX/AiqiBS2RIb9BJpkq3j90cOVjY/I+9lVE83IPwXN+ZIhrHWBs2U=
X-Received: by 2002:a17:90b:248e:b0:3b3:a9d8:ed2b with SMTP id 98e67ed59e1d1-3b41c8fe24bmr1594114a91.14.1795171333416;
        Fri, 20 Nov 2026 02:42:13 -0800 (PST)
Received: from [10.25.164.32] ([128.77.72.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm4115150a91.5.2026.11.20.02.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:42:12 -0800 (PST)
Message-ID: <fa77b633-2c99-46fc-ab36-03f6b5653262@gmail.com>
Date: Fri, 20 Nov 2026 18:42:06 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: imx93-9x9-qsb: Add DMIC codec to replace
 dummy codec for micfil
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 daniel.baluta@nxp.com, chancel.liu@nxp.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
 <20261120031853.1175454-4-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261120031853.1175454-4-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_024214_552015_55CF1B94 
X-CRM114-Status: UNSURE (   8.14  )
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/20/2026 11:18 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The "fsl,imx-audio-card" machine driver uses a dummy codec by default
> which does not allow configuring the channel number according to the
> board design. Replace it with a proper "dmic-codec" node configured
> for 4 channels to match the DMIC hardware layout on the i.MX93 9x9
> QSB board.
> 
> Fixes: 31b2f4e4c4f7 ("arm64: dts: imx93-9x9-qsb: Add PDM microphone sound card support")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu


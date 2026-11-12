Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF36606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 09:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JB+JeW1e;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zu31w4F9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rtcQGxtUUhhpjG057YI1ec0swZMNCA7K0pNp77UPUn4=; b=JB+JeW1eSU+hgk
	zssg6jR7Gcoqdd4CRFPaPMm246p3QKPZ9nhd7kwAap1Bsyg7+Sudqw8YzUKja7A0nyIRFq/9w5lEp
	6hN7Gm2lhi7N5HmB9VVBFOH0JgrPPQstH3WDd87Di7I5+hBWvlWaDbkFzpleg0bTkuG182AXXblai
	UdxOEeyEjrbcHP1qW88Yp1nZrWW6yrfb0c30AWKqFyVfjKFw+ZKk36hWAJZh3NmmUv3NqPYO3BIKu
	+L47eo2VVPb5W1ab5bgRvMoF9NQWSyYeAmFCYGv8fWiid1K7TIFnIraSbLlNs5VS85BrzZznJ8Ziu
	AtPVMoQWyS2Cq2/5ljlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRAH-00000009NvR-2tS4;
	Thu, 12 Nov 2026 09:32:17 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRAF-00000009NuQ-0D8j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 09:32:16 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6de1fd5f572so1695337eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 01:32:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794475934; cv=none;
        d=google.com; s=arc-20260327;
        b=hI3PlsXjRHhBfE3OwThLWg6sVqLtvL6fdIwFC5Qb5goNWLdBBSziVqvraHh4jUf2BH
         e90YzccXd2mV4eJJgKNOHc6lJVwCkFFZ5aFAwHCCE6zl3AJ8s5XH/YTckWLOHY8TW2+d
         qSQG9hehNYMbATnPrNb0rvj3kvcgOO39FYSext5TE8Fjmkzqn2XidjVcKDwDbGzcR3DX
         RVhbl8PE0abIqKRngK5m39wTEWa6UF7i5oRiD8RCfXJrsm/KAc8LjYimf4nUjhTG86N4
         9nIPmAYWnc9K7AL8IYMs8H7v46A5PMwTZRyXrpJGqQPL2mG9T7SkHgRny6U6/O/EaHWO
         iy0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rtcQGxtUUhhpjG057YI1ec0swZMNCA7K0pNp77UPUn4=;
        fh=nQgK3MLCWsAVfEd14+oZBU5IHFa1LnevNTNac50RyrQ=;
        b=JIG42v2wqEsJvKLjiWUk12hYlxtZmFwt4jXcelZBXBIWYIH6CNc4jCSNWryggoaNzI
         HM1vtIFnkqL9S3Jh6ABS+ntmDmAmsvCiV/rTAoYQ9RkDkTbB2QZ67Yr11daZv3+RpYfg
         Gr8+qBh5OSfQ2kMtnyxRVKFyHGk8Snsma149Jrz01FuK37QK/Hs51WqWNf3+DzkXI1Ab
         q4ickM8/trHzVqxEb4o/bapnIyglFNouVOdb1CSRUwlfQ0Lmj5Gd1GfyS+qc9ucXMZ8H
         YwA/FiD8L7oyfaA068LylU+LZv3yx4LP2P44QYwahwvdD0pyr0Py6XCmeZGRfzgLXna7
         BU4Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794475934; x=1795080734; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rtcQGxtUUhhpjG057YI1ec0swZMNCA7K0pNp77UPUn4=;
        b=Zu31w4F96tfjXYj7KmGhk1riW/V011VzEITpPeKzzuLi23aN6nUGfstgLY+bnZomuo
         FacxiVBmyMhBtW3VmAaiwnamArW4ysUhveAUcKJgwRiwvweJ1Wo928Ctl+0UiMY3t+Zk
         ErQIYOWfETCh6uw9acwSqE9xTvHdIkbmk0s1PcLeE+jV4ONna/NUaGHI5dnoXitz565T
         irPlwUqpC7dMGpg+SOfDc1TjVvTnSS3Q5aAO1eNiFyMj4c7TVfGoZY32yfKYsCLQFgXM
         C4FSm78J360eXnrJz5qHMbwCNuuH6DJxwNcfeFZ5bGtXKC/kn1gvCEtSCLibu7DPVTUY
         JM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794475934; x=1795080734;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtcQGxtUUhhpjG057YI1ec0swZMNCA7K0pNp77UPUn4=;
        b=aqWwyESJwW730eZl1IqsYJyOnv2niCgVw4t1hdn6z0V1ko9IhUHRmOMI8JIZLPfkN+
         SjFhXmwJSH43K4Hcca+W/zErL8uDAlvmfCBhuPxHCcMdr138z97ruETjOju3bi759Ynm
         m4MprWmdCRa4s0wqk5MkfXLuVj3OxkTS2ZXxxBm8Otw6v5deL2bDUT+rfq/COdH/VaSQ
         7qNqOHecCh3lYf/WWAGGKkb6/qp26oqLhBeM/zZtNL4ZTBdlEZ3SSP4nc/GOmIxSdgj5
         7/bq9kuXv83LLYyv2YmpJsveSowL7LMYrRmRqx4GJGqv/Cm5YXfipnVrG6M7WXZz5Kv6
         KiSQ==
X-Forwarded-Encrypted: i=1; AL+hErG9Jhad5+TpEPF71xxf7vHXvsEX6zDCy2AEhHCoM9r5qLhREX6Q5iLX64piRYWdiFqggOZyq1ROke2EobL2h4e0@lists.infradead.org
X-Gm-Message-State: APuU4Z8cWFWwyEYBrUaWOnW0wxxwWa9BF3J2Rx/x/px+VCfDZpszkx/7
	8gKmnU38ifE6CLjlwJ5MTPkPkha6O+HwempBceQ7SX6MJo5N5cfyxqfpNK7qYNRxwV61XHCaOOX
	/SdARuYOmV8cVsV2ixoNHddb6xv7RS8M=
X-Gm-Gg: AYBFou3bWESJZD+rmWuTIHynvdeVe1cYHrzGoGO8Le+Fb87HTPeWqS6C9xexzHzizR0
	C9q9yThBZ+vPifmiSOEUZRrPshZmfo+zQIz2JrJ6F3lylzmfEIP2JXRV6W8MN08jgYcJo5aCvjC
	eybIz+MQYJrrnrjPF+M6gOL55XiJ5pT764qgvCs2W0F8/J7hfpIrYyN57lL1XRieKAzz5EkOt7j
	tRBwH1sQzXxdVxa3eOavvZFc5BtuUkb4IId9knqC7KS+KEA/Ogey0ORzYjIkyQygVYpIGSijAhB
	Nly5f5hA5mFCrj/er0p2x4sxtfeNsRDZ8YqZD2pUE0kurxWsCUgNpiM4RJTM4bqZLvkzIhL4v8T
	q2Ymr4SUBm+acaR4zQgaXOOJFb/u+ObaqRcoacA==
X-Received: by 2002:a05:6820:f016:b0:70d:9063:1ff3 with SMTP id
 006d021491bc7-719172c5534mr3337591eaf.0.1794475933878; Thu, 12 Nov 2026
 01:32:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111101345.185122-1-abdelnasserhussein11@gmail.com>
 <20261111121544.00006c23@kernel.org> <20261112022619.5693c4f9@jic23-hlaptop>
In-Reply-To: <20261112022619.5693c4f9@jic23-hlaptop>
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Date: Thu, 12 Nov 2026 11:32:02 +0200
X-Gm-Features: AclHuK9G6SS4NwCS9PaJ-OUYEnCgsYzhvEBdLrccU8KpXeI6G-aNGeVg9dQfdU0
Message-ID: <CANpqX3YF5X1_LjXvymcXPwib9koufOAFaAgd97RH8dB61bmZpQ@mail.gmail.com>
Subject: Re: [PATCH v3] iio: adc: at91_adc: move to devm_* to fix NULL pointer deref
To: Jonathan Cameron <jic23@kernel.org>
Cc: Joshua Crofts <crofts@kernel.org>, linux-iio@vger.kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, mripard@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_013215_176097_D126BD4A 
X-CRM114-Status: UNSURE (   7.36  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

 Hi Jonathan,

Thanks for the review. I=E2=80=99ll prepare a v4 patch series with the chan=
ges
split into three parts: the NULL check, prep cleanups, and the full
devm_* conversion addressing your comments.

Best regards,

Abdelnasser


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680AD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 11:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4pKXJt70
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+8SmpKfanibtqfQvPi11fKmx/q2tro7mfSWNxssCkTI=; b=4pKXJt70T9HAt8
	18lxGxk6HSPgnQy66bKKN+rXKKEspL8sz7/N0PuShP06sXMckpqQEJ+sNtgt0688zhAMc/kfSQBcc
	EPAWYDb8jOKOqR/KtVqaLP4FyyvFB/jKsBDt0qwIGaQnZa6GnMECLoWt9xbbvOEJ1GQlIqoGln9f4
	PwJ9d/fGIuVEWHfOVTILdChYuAytpyroEya3n76jceRUY8HFpeurPG99uccG9eTM4zncWFK2vd/FN
	daSAQ/xg/phWZmpT2no+wwPNVbeJWz/pMvqx1olK2hNaGyZVM8rWP+61cvf6LHo6Xr69Xat1ChJx2
	QshHkwMxoIxxy0SVQ40g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQk1H-00000003dGO-3SBH;
	Tue, 10 Nov 2026 11:28:07 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQk1F-00000003dF4-0wND
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 11:28:06 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a215e64962so21651965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310083; x=1794914883;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8SmpKfanibtqfQvPi11fKmx/q2tro7mfSWNxssCkTI=;
        b=ZoDinTlYTMFwmg/oXJMPCN7nXXhXMifP4fmxjvqkRKx1pwko26KjpvMS7FIg5K8blo
         xqVmJTe00EUZ0mQQED1/c9J2ym5w3hBYmzlhGKcqfnjcF7YLK1zkJ2s/IoOEllPIr4PN
         cLAYGie9YgWF+xW5j/lJUqoejBxc4g0rN2XNIyxHq8eNhqIWD0zhVmxxJqQuD8I6a+ZT
         C8TAcgftHIB4UFdm7erQM0vz+Vzto9qjFzlS+KV3iY0zE6FeKbviDsg7whumG+oQ+Iuu
         ppJwV8Znf+EXF4VpLTLFLpDY6nFauAKi5IQXSGISUEbqISnZfUEXU+p/Fqyj/lb9K94u
         TIVg==
X-Forwarded-Encrypted: i=1; AL+hErGeyUXWYsPwJ7NderbLC8Ree4Ro230Vfc3qwJaXQFSL06fwch+Rc1ffepWMCBZsDZzchHB8NHuzpvPyoDTPjOX7@lists.infradead.org
X-Gm-Message-State: APuU4Z9jiltwYouOmWZ4PJXNWwXB0zrn+4B1doLDEiW6OO5Smnldm+uc
	GVnjUGq9EPKnLKOjNJzAzwUr0dDXFyDEahrvp06s0aIINHdBmp0rJSM3
X-Gm-Gg: AYBFou3j3BeHGX7pCc9RXlzlsqGMLMLNo4Ia+VMFOY4NghDqlmhwE6pQzAkVyY7yUp4
	5piPfG/Rto5JJKRvsAAEDV3RWVHCpnfkl2g+XGH24aYSaz+Xug8unYdIy9d/fj8me45nytc4N1Q
	EyuZpOQw0SQ6x5rVFJjp/KWYSWZQYhqx6knZiTSeqmnGUtTHnxBEVQOXGh+l6ucBP6j/MBvzeQ/
	tmiUEJD4GjgC29jM0K38R+bsr0FHTDBddmDMqnxGmKmKDw5hyCyfytaUmtPvCJB1FAZgDmaPIAt
	FoG64jC+zttc3St+U7GYL5oxfxybaPpx02LbZR/gxdG9qrjjpG91RoW73MW0mx6YQdKsTpPCWgA
	zWe4hZMNaDWYNJxAyr6MF24lOpfCHNrj1LT98xRQ1EHC9dEeqJ2PcoMYUDqzDk1j32KhxKyqaH2
	3USNqPmaok323tGCp4q2iZ4a385ZVinhh/Njv9uU7sFi9RF5vs469LKlnDajpH2fM2SgjSi+RvH
	QNyLI3VGjJ8YjtUkX0uRjrn9VY5+HX5Da+UBVtywYDPErndYyB/U0MmnmRvCrYwimp2k4IpoR6J
	4vrzaMVhfJVcDvNCEWBxysaCzEVMo1WZWcdnLewu+QDUn89ubmkJgwE3sSVZjwVBEaV+E6K7
X-Received: by 2002:a05:600c:3b98:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4ba02351506mr44181675e9.32.1794310082728;
        Tue, 10 Nov 2026 03:28:02 -0800 (PST)
Received: from smtpclient.apple ([194.64.145.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0234a5dcsm58644735e9.2.2026.11.10.03.28.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:28:02 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH 3/3] media: verisilicon: leave room for the JPEG header
 and one stream burst
From: Sergei X. <shomenkow@gmail.com>
In-Reply-To: <d8ba9d67a9452bc44be219d5327aa9d7ad83275f.camel@collabora.com>
Date: Tue, 10 Nov 2026 13:27:50 +0200
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <46F3E2B2-AE47-46D9-BD41-6970B58763F3@gmail.com>
References: <20261109-hantro-buflimit-v1-0-f0b86ce61e66@gmail.com>
 <20261109-hantro-buflimit-v1-3-f0b86ce61e66@gmail.com>
 <d8ba9d67a9452bc44be219d5327aa9d7ad83275f.camel@collabora.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_032805_278076_58C5851B 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.0 (-)
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> +                     max_t(u32, pix_mp->plane_fmt[0].sizeimage,
> +                           fmt->header_size + 64);
>
> Did you mean to align to 64 instead ?

No, the max() is meant as a floor: the 624-byte header plus one 64-byte
stream burst. Patch 2 already rounds the stream limit down to whole
64-byte bursts. ALIGN(sizeimage, 64) would neither keep that floor nor
align the stream part, which starts at offset 624.



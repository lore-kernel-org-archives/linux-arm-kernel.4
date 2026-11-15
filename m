Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3B3606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bBz2yc4G;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OnA1xoy1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:References:In-Reply-To
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wvcPZqOydbJbZA93vSX5EHd5IDhKbwwDJ1uTA6X1prk=; b=bBz2yc4GlPaWitFDVjp5DSpgeQ
	S4VYsRVtPqIvjO+XeXaySlqU0PSq2Ovun5LA5bwjJ/+nejYcSHOwAwmXBrr2+umNoBquHpgvSpTML
	tpT+tyQTsT+h97PnJKKJW40wuXg36PHiKUCdCA2qqKsQiUarZUA/BtVgDY2pSsF4p1FKNK6qwQvcN
	BVE49lyEFIMDE3BgVdx0xEPQ8s1zNQR3/mWKvOzfHJYnkm6Xu0+YC+GwYdtfGfYII97WHWs0vtPig
	B2zZ6TqcU2/9BuzzWT2WEgPzmh/idsnC0hNM7sa1Zh1p6p0IaQR8seTHk8tz2XuhNn+F+BYPkB2FH
	HLijxCIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVAb-0000000HCjQ-1M7u;
	Sun, 15 Nov 2026 08:01:01 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVAY-0000000HChz-129f
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 08:00:59 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3b18bae2d56so387391a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 00:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729657; x=1795334457; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvcPZqOydbJbZA93vSX5EHd5IDhKbwwDJ1uTA6X1prk=;
        b=OnA1xoy1KQdumG7nLPEXXq77sJSf+QmmBanzSIwSVzGLEv9VOsDyvitiwilro3rqZV
         oKDZTi82hZRnUmhX0lpo3GyZpRLScK7PMCzyi0wbN1/RGaJ/Wdwskeqr1lk7c+VWEc8z
         Wo6+zHQH1MICURsSoVm+InXO8M7tcXSw1oa4CPJqTl2wcuySX/m+i9Vw3bKgZPDNPG48
         aArAQ+IFivDF0ANDoJa7Ivi+v1gYpi+qXpfAgFNlIF9YU/YBWY4ziKhY+XPCnY+T/xgE
         Z8Msy0JDCBp2Ge5dpM5EB23fxEFByXP4CJ3P+aQzovwzFMoC3TgI/OEwvjUmopr8Oak0
         sS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729657; x=1795334457;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wvcPZqOydbJbZA93vSX5EHd5IDhKbwwDJ1uTA6X1prk=;
        b=poUnYViOZ7BRCYzBNUA0Z4ubsjsqzNhnXFWeZuPOMF7GoVqbyobTrcGjvI3imFnQqA
         ch20fy//NIhpw2vA2NAt104nq6Wji6qMltT8GKQ/hY9X0WYBm0MiVX+8aoEKt8kwVsOf
         xbiOwBqBwsocqRhuT7TNlPpP9VpuEmeEQEZVe0Kcr1B+BS7CdRaBSKjODR1hNgNi5Cl6
         wxjiUmauEsReYLwrHJObCdsufb35D2dC5rz0fHJJKAl19+Al128DHbLyH9R8YIHnIJKR
         mOVPTJphM3VNnKEgKBzAON68IeNxuuMAF2giWsofrEeVZ5eVMYqzEv7l5dNpENpV54JZ
         z5pA==
X-Forwarded-Encrypted: i=1; AL+hErHp+C1qvUAiZS20t5BFdxqaXupYn6xaxB44PAWcsYlDi2OVfOof2+Vrnlz2EzPQYNaFMkJ22HBtmgSWW8L88rka@lists.infradead.org
X-Gm-Message-State: APuU4Z/Vy06A7YDMjX81CdSXJ+PSeyG3MCnFdtRDXS18Q+u8johxjPzF
	iA/0k8s9Nu4HYm2agSXbTqhv0YlsvStmAs3iKdyKGiaNL5OlS+ZRlgFl
X-Gm-Gg: AYBFou1g+50Bbxy+I+BLWvPYz0N/cdK6sUuabUEea8I763vQu9LuxIVegA7jLQwLw6k
	nb9t17z4/uMQOQQYdhjgbIgkW88jI9IMFwgLuIY9SSe9Q43N5Ayrg1gY4ciBXnNGgQt+X5VxlMG
	OLsFMa3o7FNtbpUUdRYPcIvKvBrp4beHULvqnfISKqvXTni+xXqEbBr6j4sYCwDO3rH31GKHx3g
	QgLnS2fFsEcRkpt3bN/O7Qc8uGn6eGGpmCZ2fL1rFuZN4g+BhHcCDPVlsAgztKoCItg7M9xp4JN
	0SBTDyzatUsuXkckU3uhA6bhmRQUe9O83OVkcYPe+f3rUI58kyJic8wQLwPAV+HuyWkeICmz8px
	KMVOP4Xq9qTGqN/oAyupxYVlI/k8a7AFPpAnJ4JhMfLj2bci++Q4Lqg+j/rm1UxfQxarG6e3m3Q
	N7vZL8A93jhQvsCQ2aJTQHMGsfNlbGcl1prKdCUh9RUOb6Xcuf7HG5ZCL+bfYr/rGwKq4UVlciO
	kLdiNtMG+ZbnPsF5J59h1kfLqQtVSk9q4ng4ljCx2f1eX4/p5m6BbgHNAK28852Dx3wXSa4iIZz
	YdMsvTT8luLAj0wtUi45i4+7gorkAy75trWmBPxSgkJ7yO0iazsz06n7VhsbifzT+bbTICwhLsb
	woXg2CQ==
X-Received: by 2002:a17:90b:5844:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3b1b081cd6amr12270088a91.1.1794729656691;
        Sun, 15 Nov 2026 00:00:56 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb179fasm11795937a91.4.2026.11.15.00.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:00:56 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, hverkuil+cisco@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] media: rkvdec: Add VP9 support for VDPU381 variant
In-Reply-To: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
Date: Sun, 15 Nov 2026 08:00:55 -0000
Message-ID: <179472965541.3841740.13087399923892139638@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_000058_291183_A2EDE456 
X-CRM114-Status: UNSURE (   7.11  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested on an Orange Pi 5 (RK3588S), media next 48fe5a7834cc with this
series, KASAN on, GStreamer 1.28.6: fluster VP9 224/305 as in your
cover, Profile 2 output md5-identical to FFmpeg and libvpx, HEVC
unchanged at 146/147, v4l2-compliance 0 failures, no KASAN or IOMMU
fault. Not tested: 8K, long runs.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>


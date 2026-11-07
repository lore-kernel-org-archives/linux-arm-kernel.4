Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E789606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 13:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CQql90+F;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xX5DeTef
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=60HfFRLQNhaGSHuWAKIr0pymjvkfxobZad0q1Kl1YHo=; b=CQql90+FHIZzza
	CaPqlTeGOjPnjYwGFFo4g8BrEeuaXlO6BGuDcOA1MD4/jBHZ2X8zfFom+GPDEzITCDWz43+pBIByA
	fw3bqsD2MXHmUfoJ6ZvH/l/Ce5AMwN3OMG8O5fjQvu8eV5rGk5W3v3GYPgFTdtJVoVxL3pe39gCUa
	oO1naguzXgjpyVFCHTe+ouF//HI5+7wYxghe6TtLP6Ol4IOd6wH7ljKQk3KYVYbQha/StUWxe2Bx6
	bmSj/NZlXJVIsbZqzJhDf5YD7kwshsEGXNIyfDliCtIZJv44yC7Vuw0Y4HAK7xprZf4ikNERV4NQx
	dwOt0Csf0u2nU4SAFSnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgdX-0000000Ekc2-28kZ;
	Sat, 07 Nov 2026 13:39:15 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgdV-0000000EkbC-0AOL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 13:39:14 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so13311435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 05:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794058751; x=1794663551; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=60HfFRLQNhaGSHuWAKIr0pymjvkfxobZad0q1Kl1YHo=;
        b=xX5DeTefajKJ1ZgPVsMtrNAinjM9c9VBETr/af1MDcrAn83vrpIIStX/Od6Xreq0qN
         843AQ6gtqWJrtdriO88aVoIeLLl/AAVKf0/N9VNnqeRgy9/sOjvW/UZP928Y230rDFGG
         SKj6UdG1BxLqJbHuYss1SNjqWfOb8rXpLLrbf2l3J2v4vox1MUDEfDq6oWOKAlr9qDAJ
         FU0sbooEkBidvkrkNqbBwlMWOE/yL7y1GkzcDIFbsFbDBGLmJezOtfrWauAMxHY44ZGk
         sNt7g6naa5io408tJDlqtg/Mc98G69DqeI7HUJCxQmZzNxs7+zJeqyhOamXX3f6BRhtC
         Lwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794058751; x=1794663551;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60HfFRLQNhaGSHuWAKIr0pymjvkfxobZad0q1Kl1YHo=;
        b=gXxEd8mZB2Ce+m9hzxORL9uIsoGdkkowm7PjTLHoXhpgSNEfbZykQhicz6uWSIHGqt
         sxqHCxnxd5nz/axbuLDs6ilTYgnmp7RwbQdN5ECtaqplTHJ895dFeFwJj77eVo8sQ7+J
         BdjJetogzDiX5a1ORzAE+g9mXz+aOyMGoAC9hE5g4fu1+che3OXVcWLDB4IOwbSwxLAv
         QFAsm32Mt6R2nfKXEcxM0kzdBPiaKYBMgonPkBDPc1fwDF1QRYNGU4InVX/ygPMSlqse
         CIcaJ4l+D7DYl63GhOi9fVSm+hjOF8Hw4B/Qrx0TMSx9CgpuwU+oIw7cY0YfXr4SvBy5
         c6VQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1Ez6QyzqllCQEH5t00XEVjTE+CAZ7r/bFNNzvyK2EPDj8dJzme+ZRG3yXec/H4yDBUb7DdX9KsJ36OH56Fyh+@lists.infradead.org
X-Gm-Message-State: APuU4Z/rsUN9jodvKHVcn+zTm+Enr64TM8LGyF8+hgAtVTw+9ntdBqTb
	RCJSXyKRRgXv/KsEvm2SQFIDhazioj4Rd7N42tBxwjHYozuex4m69vGJv08hRWLOHRA=
X-Gm-Gg: AYBFou2r6juhdya3hCH5AhNztjyFqRtESeZ8IshVpSwKznyQ83Q9O8ZZ6jdF6GPVUXm
	bvHmNX/BZtSOhr+apY6YLa5fu1nxBlWs4e8CEXHXARHazVu6D5epX612LHAp45EzTFRzrBlDI0W
	8M36ViOz8Z79i/fG6DPeeiz2OZM0c4bxIpEbAqN5zV/OVeatpKmyNZHh4KYaAaKImifxruu27DQ
	XonY5BEdq19fw1O20qKjHVdBnLNbREPl4kDvCbyiAlZ7FeuumewxjoKk2wwHU6Gyi/YdNrsVX2s
	xDiNUrgjJzK5zI5R2GsrvQ2Ox58r/KJfQ9ZbujfB+VwrP71o6E5ceCVpWprrJtB6tOegybwHygj
	RO4j0rRZmLowrHC09JxM+SGMNpu6fAo0Y0tH/IeulKpHd6n2g/cf8LmjIMzJS7PnrGAOfaODXyk
	VfJLUdTJFuBnHQCZVV+AwHaWN9cRta2vjCMWUPiYu85fnVImCtAfaPECtag8/FT1wNK7wd73ugC
	owidnme3XsZJjCUMivJmtDGIn2Dwn0Y980SHEAHX83/xWsVT3M9Zu/t36dZzbddHxiiWcqFgXbz
	EhnhQkOmpW72N6PtxhQWI8wXb9tbj0dYK+kMZKw2jktkubqiGDeaTwUkZTVkqzRuJQsI1wI=
X-Received: by 2002:a05:600c:4e05:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4b6de973c54mr87477975e9.10.1794058750949;
        Sat, 07 Nov 2026 05:39:10 -0800 (PST)
Received: from smtpclient.apple ([77.83.249.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e2e9ad7esm71189685e9.1.2026.11.07.05.39.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 07 Nov 2026 05:39:09 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
From: Sergei Khomenkov <shomenkow@gmail.com>
In-Reply-To: <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
Date: Sat, 7 Nov 2026 15:38:56 +0200
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <596F6C9E-4A5D-4AE8-8D26-7A7247050D7D@gmail.com>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
 <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_053913_140666_61C11722 
X-CRM114-Status: GOOD (  13.28  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sascha,

> +/* Bytes per pixel used to size a coded buffer for a given resolution. */
> +#define RKJPEGD_CODED_MAX_DEPTH	2

A valid JPEG can be larger than 2 bytes per pixel. libjpeg-turbo sizes
its worst case in tj3JPEGBufSize() at 3 bytes per pixel for 4:2:0, 4
for 4:2:2 and 6 for 4:4:4, plus 2 KiB. Quality 100 noise comes close:
2.75 bytes per pixel at 4:2:0, both from libjpeg and from the Hantro H1
encoder on an RK3026. Such a frame does not fit the default buffer; by
your commit message a truncated one fails through BUF_EMPTY, so the
client gets an ERROR buffer for a valid picture. I can't run the VDPU720
to confirm.

The default only matters to clients that pass sizeimage 0. GStreamer
1.26 asks for max_width * max_height / 2 of the enumerated range; at
65528x65528 that wraps in its 32-bit calculate_max_sizeimage() to about
255 MiB, which the driver keeps, so 1.26 is not affected. Its main
branch (08ea5bc9fab9) asks for width * height bytes of the stream,
which the driver keeps too, so these frames would not fit. Both are
from reading the code; I did not run them on this driver.

Would 3 bytes per pixel be acceptable as the default, and as a floor
for smaller requests, like the 2 bytes per pixel floor in 6/7 of your
hantro-based v1? 4:4:4 at quality 100 would still not fit, but the
subsampling is not known before the header is parsed.

Thanks,
Sergei


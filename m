Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C09606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iOgiw3n4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UNB+yZPq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=im5VzDYCAR+lhrziKPe6VB/YsWt6tS1hfXIpy0sqr8w=; b=iOgiw3n4j1TjWJ3RoifXuP2adf
	GFqry29ZgZQsjETAyg6trGa8KSIeBkZ9pgbxZJ+YdMmbJCvRQRqS0A3EObmksA9avvdXN24PhlOsb
	nojJAWezvylWEiGQzOnI3/BnAQO3OwtdVIKPGke8Z6yXN8AMosCTWsQm0MxeOsWjHnDtFWfvkHeg7
	KEHZKhJyQQfzUhXsCKJj6A6ni+OByQnxkLNmZ8Dx3HyOOIvDJeADhTClTJL6uqeVSsAjNjRfIHcDF
	cFi3tZ0TpGWOBYocQvtMuvXm/gh7ARqWiFyJFYDIFWMBNUslYmMz4+Wx9s8p+DBu5B27lNqMNC9fI
	kEFaumkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmDU-0000000By82-0DF5;
	Fri, 13 Nov 2026 08:01:00 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmDE-0000000By48-07wf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:00:52 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5c154a41f8aso70637e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 00:00:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794556842; cv=none;
        d=google.com; s=arc-20260327;
        b=P5xWEeMeVKVkD4cLy6ROUOWaSTCu9rJoz863oaFQHP9g4E4a/VDHy7vDHcL3AY1WaV
         RWrs3nQk2qsBQjHHvlkeGQsbVW4iEooiXqw7M6jmqk0pQud5cgo/zBUbBp0ozDwkSDSW
         MbJvh+ohZYuEZynR9uM+Npl5/bsLfCm2KL+eVlChw7w0DwZJlZY9L33TZz7SwfIZUASB
         YpceRlwrbhkbRN/y0E5xJcXzrZ0GXFP0aUPXZovoEe+IAVvhgcgYw7ONB2mybgQkDdyT
         ztb+eUt4lzj0p8ZgXgFnn01LFSoRizsTFqN89BII4ks/jNflg1627XztZ0viLGoeGgQj
         eyQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=im5VzDYCAR+lhrziKPe6VB/YsWt6tS1hfXIpy0sqr8w=;
        fh=Fv5nBZ0kA0fIZ2fDBd7AHAbwn6/AtZ4ROFpuCZ8AZDE=;
        b=Y09kko74dXoUrgt9iWkbw5tSK3K1p/ZhmAuS78IFn0TwWH5yB5cvMqtHvg2Mrv7r1r
         0nUcUaW5xL+NICMFsS2zMvJA4IEqv+eCN2SYwH4Cis9BxtMltjO86J6JB3oehacagDB5
         Dq4NmK5HbVyegaNuiKVFHi4g+vHsiQwnqdtYggjb6Io6Oy43pEl26kRRpZkm6M8V6Wjg
         eYoHzBY585ikdeAPr7dQJz5bf6kMeBPK1cMyp0ryhtffV97M1bOWaNGxa20++J2yBQmk
         IZmH72/M5z9fOvoFxJsw6dt4M09xVj10gC89/QCbQO7w8vWux2oM7s2kUlUwLhp/eUuP
         12qw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556842; x=1795161642; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=im5VzDYCAR+lhrziKPe6VB/YsWt6tS1hfXIpy0sqr8w=;
        b=UNB+yZPqGJN7fzofTFji7BSf5vu3dPYCH60xng7qkX7KxqGby3dKJg3f07r3sJQkhJ
         CuNij1uIxVSuYy2wT53/3yNYrzmT2AEt2xb2pkWEkXYUGlsLE7OYMKRhqNHydlIGOlLY
         e80LfYDJhZzpjCuYqIhhVpBBmQnbYAghOiAkXgwyZDC1WIt39zbU69zPCad8ZWlyGMDl
         gu5cyrYFb+L5Pda1lx16P4p0WTrr+sMmQGBuefvo8Oj3QsaEtf1fCjAatI45C3PDv3cp
         oQnqk8Noow/rAULCHPubmeLQcfZdk4kuD0OefCZpQAo5iV6ittKmrKoqDXv42LYVwHL1
         Z56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556842; x=1795161642;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=im5VzDYCAR+lhrziKPe6VB/YsWt6tS1hfXIpy0sqr8w=;
        b=ueGNJm+b3B4LOls9h5lIYTLGZoELWu97rcRJPdfSS5TdAqAChRBWVkhj51w1uNSUi1
         DSBCVgLa4xxY0xya90WaKqc9YG1gI7jBgEq4JPj3w/biER/7jtBipXXTYfdjbQvUQlbJ
         KUOaSA91rIiLNgU1JLkpYJiahsHYyjBaG63n+RbilCt8KOeanP5ltm+Zpy6VUbwTQ0yr
         7fofTtH4cF5Kdx8/6nhfVpEWikl4yN6/jmFfi07cqiK25Uu486OtxN/eUQndZk+wnS/V
         09pgQ4MR+XNS5aimik8PixuVRRW+Tq4sm5GCFIS+3oPfC/s99a58tfsdm0pNgKqWjakh
         2GrQ==
X-Forwarded-Encrypted: i=1; AL+hErFL27ng3YM8N3Vkdf5espKzzJPXpkgQ4mZq+Nt4jozPl5+Q9ksXEOkCZ60zCtHw/57/nagBh1ndBfO7s9JLGSAa@lists.infradead.org
X-Gm-Message-State: APuU4Z8X4GV2LJRPDepzRUd667dXjLakP/RFwd0Pe8nNGDO/tyQccdv2
	2Knuxxmnx3i9WdSw37KGqm6VzXFRhMw0ZvSSzWZOhe01MwywgMXVakjetYKPwOSbvstoMn9cm9Q
	yBbQRU660h2Pn32+ehdYp3X/b/Cx5xpI=
X-Gm-Gg: AYBFou3f2Pi3F1uJ2XfR6ewsv/A0xzcGf4kWU140iksRy3P3MP6N1z+4JmHnr/hk1ia
	nKMF3EZS1QgXt4z83XaVeqStsV3KVv/GtlxrvCDKU1n8hXSeIIKaeEdNpJr8h6Rm2+iEqLDVcwt
	pdJOGqB0tumb9rdWdZkQnoU6vpyEAYsKAM1+OKutbYyjqSbYMkrFamHf1Ci9n4HulHY9emTIgxZ
	7FT4PLBUW/iEpJisCPd3CQKsp4WzMwjqgNixvd9FUqBqSdVEZf2MqZtK3VOu4DXeWCNbth1zkpJ
	tTez5jPQvvbgwDhIUeZ0jIRT7gE5nYSS9ViO0Sepl0Yiy/WQq3ORiL09ydNZqCKQ6Bmqx+e1ffj
	P0Zh0OxmrOA0QvmQHMJQ8YnusDuinZVwng7enBzCTXemy4/0TVjCMLFivwwtrWMuQzovfESo=
X-Received: by 2002:a05:6512:108a:b0:5c0:b5c:4084 with SMTP id
 2adb3069b0e04-5c1705d663fmr682927e87.1.1794556841810; Fri, 13 Nov 2026
 00:00:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-hantro-codec-fixes-v2-0-f44424df585b@gmail.com>
 <20261112-hantro-codec-fixes-v2-3-f44424df585b@gmail.com> <f041c5d87698ab3be8283ecc71ead0679327238e.camel@collabora.com>
In-Reply-To: <f041c5d87698ab3be8283ecc71ead0679327238e.camel@collabora.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 00:00:30 -0800
X-Gm-Features: AclHuK-I_zgsSZZ7-9_Jv6URD3G7__LXdFVlF7HwZI4Ihkxqdy0NcAMKAgOjjTI
Message-ID: <CAEy9hNVSC7TAvdLmN-yWH9NdtKH9jgVnyxFwLJ+J2qPZvOQTEA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] media: verisilicon: Don't offer VP8 above 1080p on
 the Rockchip VDPU2
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Jeffy Chen <jeffy.chen@rock-chips.com>, 
	Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_000051_078708_38033A23 
X-CRM114-Status: GOOD (  14.73  )
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

> Just to bring to your attention, the IP does support up to 65Kx65k, but then you
> can't do referencing (its the WebP mode, key frame only). Hughes Fruchet from ST
> started looking into this but his work was not completed. The general idea
> though was to perhaps introduce a V4L2_PIX_FMT_WEBP_VP8 (or VP8_INTRA, naming is
> hard) format to signal this to the decoder, and limit to 1080 the FMT_VP8 (what
> you are fixing I suppose).

Thanks, good to know. Yes, this only limits FMT_VP8, so a WebP or
VP8_INTRA format can still be added for the larger sizes.

> If you have time, it is also miss-configured on the imx8mm, the combo-core
> (G1/H1 combined, like RK modified version). While the imx8mq has 4k h264, I
> don't know if the VP8 core actually is capable of 4k, so perhaps both soc need
> fixing.

I have no i.MX8M board to check what the VP8 limit is there, so I left
those tables alone for now. I will take a look at getting a patch for
this separately.

Arun


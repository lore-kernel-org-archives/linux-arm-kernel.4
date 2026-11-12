Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3785960707BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OzveIO60;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=WiGxayX8;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NuEJJH1i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=e1LIqguyGHyugjp6T4wuUZqSXt5F4ivfryPqW2wGYPk=; b=OzveIO60i9cbeR
	v126Rq0XDrjiTVVZGt2t92t5MWJYjFDP805316HAdA23zl629xigZItLskS0wHzlA+ikihMprIBay
	rasc18aN559nc4LCY1SQujYsC9RUTyelCZvDgOB/bekIv9t6EEv6hjmYG7Wk5tf6JNR42jO5Alxjw
	0g+6ZUh4/9T/yYtGbymvWYm6JS74OMHNo0c5FS3ko6bP+dycpwwJgAWKAeyWZQY7gA6l3SCuCJjed
	4qoF4hC0p6kU9B0EagBCQAWhNHinCxdlmqKGAwi3Kw384PB3+P5w5m6KszONJOHrwzQMHXFwHhWQQ
	xMvvNBmqGzUJXhksPqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQNG-00000009CM9-3FvW;
	Thu, 12 Nov 2026 08:41:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQIM-00000009A0g-3L77
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Nov 2026 08:36:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=e1LIqguyGHyugjp6T4wuUZqSXt5F4ivfryPqW2wGYPk=; b=WiGxayX8OU2KROPX0LHcIZ8rf2
	A49PAw+f/rTSpn6D8iqch2nt6v0sP7Sh7h0KWiUvqThNWg/QcKfduno36Y/hd5LA5nS1DB1mqgwD5
	5qhbcOk31BipWBgpwCrryS8YjFw9WxOwpA4ShzoGIVEEZKWOm9vdHc2DrhmMDrSMVdu0LAQ2R7pOJ
	uMCxPe4G0FBCy/cIpkSlV1Y+86xRa5mQ6IUF8V88nm3gZYVYG8u4ia6Q+oScLYZlDTRNoSQmrxVrg
	90A8s8wjCi2Y2j4H8xi1rgD42xUXBqoTSDHlnkt3+sUcZmdcxZja+q35KoaSDGEHhqBK2ssTm8Oh2
	sw2/7Njw==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQIK-0000000A3wD-10jm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 08:36:33 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2e9d7791b00so33891275ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 00:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794472589; x=1795077389; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e1LIqguyGHyugjp6T4wuUZqSXt5F4ivfryPqW2wGYPk=;
        b=NuEJJH1iY6kJWckCUZl2YxUKoxcRWnojwlEoNH831dCPnN4Ulxi7l1h9Vjoqd93F6v
         4rxo7JYHhUNXhdoQhUrhxkDo7blhvEM3o/ugSSBRdlcdPzeAFDj3Qc9jWE/uQrqXBut3
         nv1ZOKE5qExyTSSYnBMONd0xOPPB4ia1y+EtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472589; x=1795077389;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1LIqguyGHyugjp6T4wuUZqSXt5F4ivfryPqW2wGYPk=;
        b=QpEvwiQHSqWojK7F46F9sVAXdxSYzbGxosrYazvslyRjct0zrZ0I9htecs6piwJF6l
         +qK9Sl7N3nxaK4U8wP6rcl/JekpSTM0VtL1OfeZURHqI09jFi+js5sISAWXZh2JWnU30
         Q1X/rp3X62g+Xx3CZBWepFWpE+ydZWAXCWxhVfOyWKiHI1XO/Db33Xk82PWa8OIwT1uJ
         Y0rf4KiBpiSs6kvLgL4hxnN9YdrUnmp3YH7lUbuaJJWXYTGKuY6sCyZSHyOSY4ESrHS2
         lS6PBhGxDn4VRltm4d/5wQHqIalpvm8dPWDiHxc0OiQ5vTw7JOLP344+RTlXIR/P0+x8
         +9Gw==
X-Forwarded-Encrypted: i=1; AL+hErGhcZXPIjG0qfSnRCxerp+X949jTuJMhlsxWilL71EQsU3z3nBc2ZcRxLLaTfwq4e5GI/dx6oPX4lAa4iyh9/IP@lists.infradead.org
X-Gm-Message-State: APuU4Z9Zzh+AP1cIB3/Pd8Kxor3PBji4RVX1Gw7yoFH2RV729ed6THVN
	dTk7Il+YugniA4l5tBabrSJkBVJXFhLpuOAj6KYrQpb5mkmrBjhP46HcO8tTzQJKWvY5+sqwJ51
	Xc/w=
X-Gm-Gg: AYBFou0LE3yddEdoBoIaBmo/ad5574rBBCC4MduFiN2gc1LxCo5iduKWGtUUONeOZk1
	qbkwV76ucQ47FKVYW7h5F4jPbXsLRLPqQffyey/8p6NhfjWS1feXMhevSDLlzpMEnAPpVdderMI
	IZVupX4HQk3uYGExQ+KbjaWBzD90NU/+kCZsFaLdASDCON62p6QAtD/QZ3d2tCx+DN8+7fagOri
	BAI12VG2rB5Yug5XJtibkGH6upuvB1ztPOtU2Kl5nzE19vZ6zNblcVGFX/+9Cbnwdt0joGVW55g
	netvNjygocqIe3NbqtT1oG/kP+Qdl9YtSKv+BqWgEEbX/HdU14K1IUzTjCxTqPt2GneC/Mgwr9m
	8XMK9FjuMXrdz8KuGZFnWlrnWXXjeQwS3256pG6YK2CmHkMhmxqsi7LUbLOWZUNcIWhO294EVYl
	q3hElOQ6bCpd0/XfP4HgfXdygHBNhlI4ebu89mxXkcz6xh+C99v1/+WRbkM7+Q7LFiyae9+YfrD
	N5PH9zPyKViVMjf90HpYqGi+IKw8RmwtTcZMR03DSg/XfryF+FFJ1JdejDwBkHuV4I2bndJ2kF1
	vkXOgISJ78ypkLkuEy6c2BQSMmVHGWH7WUrfE8Gmzf//1m2cPnhhM5SSed4V24AGeLI=
X-Received: by 2002:a17:903:13cf:b0:2dd:ad73:5b6d with SMTP id d9443c01a7336-2edd7b395e9mr51943105ad.29.1794472589218;
        Thu, 12 Nov 2026 00:36:29 -0800 (PST)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com. [74.125.82.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7e062sm30039145ad.35.2026.11.12.00.36.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 00:36:28 -0800 (PST)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36f8cdd30beso7474097eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 00:36:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG8Sh4+sU8LSmeLJx4YAEsgbzacaTBp0bB4TkclrNvPNkpVkXCaOMElw1V2KUTkZ1FPf/8sZZAg6Fmsu0+/yUc0@lists.infradead.org
X-Received: by 2002:a05:7300:fc15:b0:36e:a265:8ee with SMTP id
 5a478bee46e88-37686171585mr5111950eec.18.1794472587019; Thu, 12 Nov 2026
 00:36:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112061736.4014993-1-yidilin@google.com>
In-Reply-To: <20261112061736.4014993-1-yidilin@google.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 12 Nov 2026 16:35:45 +0800
X-Gmail-Original-Message-ID: <CAC=S1ni1r2yWQOntVCJxjU+DkHAVb=gBEE71VN701BxeMCxN+w@mail.gmail.com>
X-Gm-Features: AclHuK-lH1eh8S-718xAEgJiftUumas93CKfUyPQy8uMkB1D_yMS7HqTV46k4yw
Message-ID: <CAC=S1ni1r2yWQOntVCJxjU+DkHAVb=gBEE71VN701BxeMCxN+w@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dp: Wait for the complete AUX reply before
 reading it
To: Yidi Lin <yidilin@google.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_083632_183856_EB8A5C81 
X-CRM114-Status: GOOD (  15.01  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 2:17=E2=80=AFPM Yidi Lin <yidilin@google.com> wrote=
:
>
> mtk_dp_aux_wait_for_completion() returns for a read as soon as the RX
> FIFO write pointer is non-zero, i.e. when the first byte of the reply
> has arrived. The rest of the reply is still on the AUX line, so
> mtk_dp_aux_read_rx_fifo() sleeps 500-1000 us before reading each byte
> of an I2C-over-AUX reply and 100-200 us before each byte of a native
> reply. The FIFO is drained this way even for DEFER replies, which carry
> no data.
>
> A 16-byte EDID read therefore takes about 16 ms, although the reply is
> complete within about 300 us of the request.
>
> Wait for the AUX receive-complete (or 400 us timeout) interrupt status
> instead, which the write path already relies on, and drain the RX FIFO
> without delays. Poll every 20 us instead of every 100-500 us.
>
> Reading the 256-byte EDID through the DP AUX DDC adapter drops from 266
> to 6.5 ms on an MT8189 Chromebook, and from 547 to 23 ms on an MT8196
> Chromebook whose panel defers every 16-byte read once. A 16-byte DPCD
> read drops from about 4.7 to 0.5 ms.
>
> Signed-off-by: Yidi Lin <yidilin@google.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 64 ++++++++++++-------------------
>  1 file changed, 25 insertions(+), 39 deletions(-)
>


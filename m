Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DCF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EZ7q7prx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WgkdVXM/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jsBT0FZpMNikULzHhEfNl07JkOQbHVwUC1+MdqdHryk=; b=EZ7q7prxWuPv2I
	g2cdsvC1xtd/0JxuZLQMfZWypcb0R6LafvSrw0+nNwqHZ6i8nL0tUpqgbux+OdHWPGtbEIjTcBuJu
	hLuDnq6lgCq7Ee/UbVS6ygeP1K4VFXmUTMXUWfxxwqCaqPMWCPGpK9Hwt+q7aOyb0/ayaW1ZpybgA
	N9Dd+ons+FdsfcJhVgqG8h5aDzPI9eOT0G77fZaxi0dRcfrBGnp5XBQw6SvlWkvcyteiZmuE9jghP
	G46RcFnzw5tp/dwt2sj/JEPUmn3jo8OqJbm0Uh4hujLr5ZBS07TOqV+Mit6fkjTDyI3PpUtBEnhgO
	EiKtlsY2Mb6bmB+tX+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyD4-00000002yN2-07aq;
	Mon, 16 Nov 2026 15:01:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyD2-00000002yMc-43zM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 15:01:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 473D546405
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECD71F000CC
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794841288;
	bh=jsBT0FZpMNikULzHhEfNl07JkOQbHVwUC1+MdqdHryk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WgkdVXM/UXQ+P/8FVeaG3uctBI70rCd3thyWrq8PgYspDz9O/pUqZJCa/8rQC4dng
	 GwQvURFQU6YqndYAWAZ+TcpG/e0NSDMfGsot24t5yN08P/NOW0Vlq9uPzUqL0nRjoq
	 2djWIcrsZbuCPc30DJtuZunOnH5WgsljMzcZvo+pLvGWprScSYdlu7b07fh0ag0Srv
	 rrtUbpJWtwTQdt5FgOQ/cZYb32UPI9QkJfcOWKzeaBcu9PCTMnK4EqEcIQGPNX1o9P
	 rGL1oO6kpYd6v6D2/nw/jGQoOKFKHVzZML+cscsIHCPEiB7J21GQkvEWuJkmAemcrp
	 dzKTZN1W5AJ4w==
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-18818daa3e7so1638436c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 07:01:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFlMP8uCM7LoCfVJL52Ibs9rd0jc7Z7TE7LpQWGH5NsSGY+9iMbmFUT/Vucagu7ot+RLKVJbKtW6ckGqmP/ILU7@lists.infradead.org
X-Gm-Message-State: APuU4Z8nkDyZyerNxsPMMuldA/IDdDLNUooyCt2KfudxCyW1GTWM3Xmb
	3oSEDFqbhOItuMNFN4qljhtfkoeRhWo+ILaIei3ENnRSK8Qr8ewCRZD0ridtQB30VsQMuwOvOar
	ClEGq2fLTH/8QNVQSmaVFmPlHwZZiYQ==
X-Received: by 2002:a05:701b:4648:b0:1ad:1574:aa9d with SMTP id
 a92af1059eb24-1b502f8a3femr9454273c88.0.1794841287247; Mon, 16 Nov 2026
 07:01:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921113914.779393-1-l.scorcia@gmail.com> <20260921113914.779393-2-l.scorcia@gmail.com>
In-Reply-To: <20260921113914.779393-2-l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 16 Nov 2026 15:01:14 +0000
X-Gmail-Original-Message-ID: <CAAOTY_9W4MmG74gMgXx=6-QncXs2-DqdR6FqjckJG9bsevyWnw@mail.gmail.com>
X-Gm-Features: AclHuK8ZIdYSrxKs1dMZwhPrKku_6kwGWxmzNQVSAncsA778TJy7Qtii6vDGXkQ
Message-ID: <CAAOTY_9W4MmG74gMgXx=6-QncXs2-DqdR6FqjckJG9bsevyWnw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: mediatek: dpi: Add
 compatible for mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Luca Leonardo Scorcia <l.scorcia@gmail.com> =E6=96=BC 2026=E5=B9=B49=E6=9C=
=8821=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8811:39=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> MediaTek mt8167 SoC has two Digital Parallel Interface (DPI) blocks,
> one can be routed to a DPI display while the other is wired to the HDMI
> block. They are not compatible with any other device, so add a new
> compatible to describe them in the device tree.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---


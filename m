Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B813606A880
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 15:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BYnNHspq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JdFXYXi0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NFaRubGQ2uSM82AzOw+nsHIeODCdYiKnFpnw0Wrcf/c=; b=BYnNHspqAJGSC+
	T2B8jaanzUvuJYqznhEtJhCq/34spXOr1NrLTlIBTYeOD/v2FhRYNffdX1I+AQXr9PSIJvHSDOhi7
	leBPoqKMVtO4pSFQCriVsMjfGwiYDQqm5AaeZ6HTC5YX1AjXozLpqQtxWu896/k5wIoVJt0okvml/
	x/87o/XdLcBTk+vVuNhjsYKmkiDHZzSU3DA697iBY76T0pa0+QCjG/Fi/av/QSWfkR52DjJsQviAX
	pz950GgJ7eQygM7pE8asWUlxaiCd4hp0IvSJDJK0U09LwwAyavbXRWK6JgycBmD7jQgEyzwflvPdO
	ph5lnXaveIeYDxFd8Mpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyMg-0000000307W-3bRx;
	Mon, 16 Nov 2026 15:11:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyMe-0000000306h-4BxO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 15:11:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CF3762D46
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7EC41F000C9
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794841883;
	bh=NFaRubGQ2uSM82AzOw+nsHIeODCdYiKnFpnw0Wrcf/c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JdFXYXi0sztEjaW0m29nlrJdi9t2WrR8uv3y83FxfqQx/yVCZfOBLIdKv7hPG/903
	 TTRzbw1hTVkIFQWTDBpUSkupm7eW6t/ahEultY759TMx444M05wpcJLkWObh6ryWQ8
	 VkqX8noN1+2uYk0ET8OuVKjjNwD1bYTh9sEL26m/uBsfExN+kyBZXetFYJJZ/9Rvwn
	 vIvaeRl2JvgbGBPCErKH5LN0fF1IT+xmWocjpNlLF999YxihcGGmw4prYDbtSmVPTD
	 CnqQ+AIgUSEbxAyEBhRRY5qSUGxYbCyJ3YowiQGPUCVrQ3/2bDksSbYxBjIbGp/ebM
	 j81/uLJoR5iIw==
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15ea896ddc8so5349272c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 07:11:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEt5/U2ovARdoDX4GMbiH0rcdE6zUyJyO3C+EGyYQYoTbsGxlNo0ribx8TP5x2tca5faChFYdi+UeJ6rXoYm2Ly@lists.infradead.org
X-Gm-Message-State: APuU4Z93hi95mT5+EREoYZTEyGHK3czfQ1dm75sfkfVFA79ZFHDQys+7
	+ARFc0FcGxFXv9guzBmzeZKk6UWJ+AVkwWitkM86YOEngJTw0kIQxi6lU84V8XPbBa58RCt0i0N
	sri4ATzfqPX6XCWuwmW5hTdbEnHpBhQ==
X-Received: by 2002:a05:7022:ea24:b0:1a9:e382:cedc with SMTP id
 a92af1059eb24-1b5030fb905mr11645158c88.46.1794841883321; Mon, 16 Nov 2026
 07:11:23 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260924083456.461815-1-peng.fan@oss.nxp.com> <57deb2ae1a6235e9e0b84458ee228b1ce8ed418a.camel@mediatek.com>
In-Reply-To: <57deb2ae1a6235e9e0b84458ee228b1ce8ed418a.camel@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 16 Nov 2026 15:11:10 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8Kuqod1ahnK4enW_qtUcTo6mhZdQiUnsO4tr3YW+7erw@mail.gmail.com>
X-Gm-Features: AclHuK87v-swgB4tyftV1cjviFzSnuNyxXDhT4UWABAFzKQ_MREyYceQWgdsnHc
Message-ID: <CAAOTY_8Kuqod1ahnK4enW_qtUcTo6mhZdQiUnsO4tr3YW+7erw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: hdmi: use regmap_assign_bits() for
 conditional set/clear
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "peng.fan@oss.nxp.com" <peng.fan@oss.nxp.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"airlied@gmail.com" <airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, "peng.fan@nxp.com" <peng.fan@nxp.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) <ck.hu@mediatek.com> =E6=96=BC 2026=E5=
=B9=B410=E6=9C=8812=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=887:34=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> On Thu, 2026-09-24 at 16:34 +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Replace multiple if/else blocks using regmap_set_bits()/regmap_clear_bi=
ts()
> > with the simpler regmap_assign_bits() calls throughout the HDMI v2 driv=
er.
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---


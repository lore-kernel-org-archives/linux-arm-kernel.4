Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112B2606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J0SgJirB;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iy5eNDXe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=I1kqIhwTQbIYkIwvzTT4amDSc4WG19rX5HvViezhfOs=; b=J0SgJirB779Z5U
	76XOmOrxYDculz3k81br8ONU9qkcVjzEfCtDTs6bDDMOAlYY4HPNyd4GvcSRfkoKSxHgYYLrzS4e8
	C3c553/6gVsvtEF/EaL+QWbL3fxK5EMP4mW3kQ5mWE7jMBjil5eEV2w0nCKuug1ACqV11jDGzTYTJ
	ZArvo6x41yho1vSX9I48dwtUeCj4bjK5csD+RWMrO6Rahd/vJhLktcdaPQkuIKbeRu63YXdFmYACw
	McKRW7mLeuy648P+3F4SnbCvIxUBhg7bbRX/hDpUad6iiB5g+AHQuvLMyvrDPvjzOh0WRTiHf04GK
	fP0SIpTpmEfYNQ27IlQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHrI-0000000B1hQ-0Cjl;
	Wed, 25 Nov 2026 18:36:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHrH-0000000B1h3-0QTf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 18:36:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D8BC6464B8
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E131F00A3C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631802;
	bh=I1kqIhwTQbIYkIwvzTT4amDSc4WG19rX5HvViezhfOs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iy5eNDXeajlfmYBUi3HVw+ZOUGhwAcS9hIiWwHa7pO/9JaOtuWpfYI/RLwVEFP+he
	 MsCg3O26VBHd/+Y0Sklk7Ge1L5580uROT71jaRSCDeXEgdGg6S+iO+ht2n8b+ATsG1
	 DT6lbqyVjrFBOoKjwEFfDrUxkVgMpJAyHqCWTfNPCWLy2voxOxy8wG+BTMilO9QyjF
	 oO3fltQ8TrI0PeHEl5mTbGB+xETSqFWYD89ZpwHqaa2/TCLonSH0z4/M/LVWl14tHc
	 2Q7yobtKPVNFJWfgdtBP1G5tbQlXVgiXLfhVm4gtKkXX5rthE91pHEZamYLxadoSA3
	 TD1odtsGC4Org==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae7d1ce1bfso53082361fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:36:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEWefg2vBMFfNWysMuaCsAv0OVHOJ+u+RPjn3b39B9byRkFElDYtG5akbTgS1hJn8YJYz2dh3oMc0Dtk8I1hyTa@lists.infradead.org
X-Gm-Message-State: APuU4Z9fTvlbfi0sb69bUWwjwxPVDXBVkyA0d7FtL2X8hUI5FlfrGEVO
	F4i7MRaOM3Z0gNNTbP7O6wgCZdyt5xeBqGJQkv6tbqDqEW2XAiGtD9/AE5XaAqhHUDRV0+/Epni
	IsUlXLhK2ZB3fcnyzptNFP/TGrwTrnJU=
X-Received: by 2002:ac2:4c49:0:b0:5c1:6ed3:db66 with SMTP id
 2adb3069b0e04-5c1bc812fa8mr6445916e87.46.1795631801074; Wed, 25 Nov 2026
 10:36:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119204748.2558209-1-lee@kernel.org>
In-Reply-To: <20261119204748.2558209-1-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:36:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLktj_m6SzohDWE-1P2fktYy50Kq_V83gyAwvu4oHWuo0Q@mail.gmail.com>
X-Gm-Features: Aa3M54qAGgBABpC37EY4s-xGOSAZePImEjc0mtba_-nxodKr3zcHaitgsE_JuYQ
Message-ID: <CAD++jLktj_m6SzohDWE-1P2fktYy50Kq_V83gyAwvu4oHWuo0Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] pinctrl: Fix out-of-bounds accesses,
 divide-by-zero, and error handling
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Aaron Kling <webgeek1234@gmail.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Bartosz Golaszewski <brgl@kernel.org>, Daniel Golle <daniel@makrotopia.org>, 
	Hao Chang <ot_chhao.chang@mediatek.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Maoguang Meng <maoguang.meng@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>, 
	Olivier Louvignes <olivier@mgcrea.io>, Paul Boddie <paul@boddie.org.uk>, 
	Paul Cercueil <paul@crapouillou.net>, Qingliang Li <qingliang.li@mediatek.com>, 
	Rob Herring <robh@kernel.org>, "Ryder.Lee" <ryder.lee@mediatek.com>, 
	Sam Shih <sam.shih@mediatek.com>, Sean Wang <sean.wang@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Thierry Reding <treding@nvidia.com>, 
	zhouyanjie@wanyeetech.com
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 9:47=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> These issues were reported by Sashiko.
>
> v1 =3D> v2:
>  - Drop patches 05/10, 06/10, 07/10, and 10/10, already applied to pinctr=
l
>    for-next
>  - Drop patch 01/10 (sunxi) in favour of the broader Allwinner IRQ-bank
>    rework in flight (Andre, Sashiko)
>  - mediatek: Guard against NULL eint in mtk_eint_do_suspend() and
>    mtk_eint_do_resume() before resetting hw->eint to NULL on error (Sashi=
ko)

All the v2 patches applied (for v7.5), nice work!

Yours,
Linus Walleij


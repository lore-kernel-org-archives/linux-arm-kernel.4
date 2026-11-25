Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6927606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WyEU6I70;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MKwKUi1f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=prrX32fJ5wksd3jSdKGTMIlOF4TSPJHLdr5EwTLREDg=; b=WyEU6I70Xkb/Zr
	srS+b2i4BYzFfUdC5gWwOb9EruQ6eIr5oCA+xGibSybPBMzkthdzPSCZHI4AOoJYtKvr+OqV0eXDU
	ohvyZoYY+NDwQ1/j2zivt/svVXmaQk3CIh2odEegQe64e89ertVju8EsTKgiTBBXELE8jJLrhgJhC
	fA+inf9Lm+YAODRUq2usI/ULQ8TT+LfTgngG9fyqkNyNs0ewONsZftZwcFc9EcjdyB6fbjsX91yh3
	RYZ2hvRRnita/UOHFqt/lf4Ze2nL0JlIhE0V9t3hEcEaPQoRdoUThH6KFfZc74XicHtgUgndXX/Mu
	VWI0y1BIFmNLMLC5Wnyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHqi-0000000B1Ya-0xKq;
	Wed, 25 Nov 2026 18:36:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHqg-0000000B1YJ-33im
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 18:36:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 41208462ED
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE331F000D4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631766;
	bh=prrX32fJ5wksd3jSdKGTMIlOF4TSPJHLdr5EwTLREDg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MKwKUi1fJJvcCPVdLLxu8p50q0lnzCJf9bfKw3VLUaOnYBTQeZVi70M9Q58NAnrgN
	 Q579fHlrscQ8TCiJBKkDa1/WHtu40DMUvC01Rud71CSQqnqo/hMXAJxqJtF64KqOlT
	 33cT/TxT0+HgAA6PnIfL0jMWqkVu/aQeb391FcsZUts2JlnFYJF2VSdrg7tx+gdI/h
	 8Jyb6qA5oYxFxfTtbxHBWl7dhKSC5Hw3Y2qoMMHAoupwu9/d0AdzteuIwZFsYm5888
	 Ym5VngmyEn9Ipj8Y8UhpLvSOQFRw1PBJ8O923JC1LbqbKNxwArgV6CR/wtKnTYTHPX
	 rpQUJHgZi3uxg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ae25c846edso41153361fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:36:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHt/LWd74iV8HK6Q+drKbIJaJHPEmCl4UmhAQetHja8h2jlF5wGDKTpXsPtDBS2IK9JdHGem+/F1KlSak/i9LBf@lists.infradead.org
X-Gm-Message-State: APuU4Z90fANexRqu9/mmzoHT/BVMz/YzRjU58ifWlEpZ/I3ADTrh3FOA
	MU2o5PvUcAKkETKFZkBAssahHJz+p4C5zBnbL1Gf8KnmGVVrNHKN2A0eOsXS95uSzCOyPXE11G8
	yGIPZj8sM5enpyytpqHD1qcvo0yX8ow0=
X-Received: by 2002:a05:6512:1585:b0:5c1:4cd0:16d6 with SMTP id
 2adb3069b0e04-5c1bc9055eemr5174503e87.65.1795631764829; Wed, 25 Nov 2026
 10:36:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119204748.2558209-1-lee@kernel.org> <20261119204748.2558209-7-lee@kernel.org>
In-Reply-To: <20261119204748.2558209-7-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:35:52 +0100
X-Gmail-Original-Message-ID: <CAD++jLmAsPibiNju4HzAYztN96fwdErzZa2DS1tyThiUAtgzXw@mail.gmail.com>
X-Gm-Features: Aa3M54qVG3vyGiBbOuH0mxEC3oK27vU7UJnEn5z_uqUEslE_IpB0bR_gdzrAv9A
Message-ID: <CAD++jLmAsPibiNju4HzAYztN96fwdErzZa2DS1tyThiUAtgzXw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] pinctrl: mediatek: Prevent divide-by-zero for pins
 with fixed drive strength
To: Lee Jones <lee@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Ryder.Lee" <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 9:48=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> mtk_drive[] only defines entries for DRV_GRP0 (1) through DRV_GRP4 (5),
> leaving mtk_drive[DRV_FIXED] (0) zero-initialised with min =3D 0, max =3D=
 0,
> step =3D 0, and scal =3D 0.  If mtk_pinconf_drive_set() or
> mtk_pinconf_drive_set_rev1() is called with arg =3D 0 on a pin with
> drv_n =3D=3D DRV_FIXED, the range check (0 >=3D 0 && 0 <=3D 0) succeeds a=
nd
> !(arg % tb->step) divides by zero.  Similarly, mtk_pinconf_drive_get()
> and mtk_pinconf_drive_get_rev1() divide by tb->scal (0) if the pin has
> drive register fields defined.
>
> Return -ENOTSUPP immediately when desc->drv_n =3D=3D DRV_FIXED.
>
> Fixes: c28321979ba8 ("pinctrl: mediatek: add driving strength related sup=
port to pinctrl-mtk-common-v2.c")
> Closes: https://sashiko.dev/#/bug/linux-d3852d37-6806-4c41-a493-f249dd59d=
0c6
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Patch applied!

Yours,
Linus Walleij


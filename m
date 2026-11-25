Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B99F606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 19:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=al2O8+Ds;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AccAoIpv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TWsUZ4Yx/ugCrzDX8uSHJCRajgVZgocX3xB6kXa9XWw=; b=al2O8+Ds7YmnG+
	LuqnuIMHRRxLY2Q7RWprnFJjOeTCzRuShCEYbGTm+h69vC6odMijlLPeetY8N4R8aYqM9SgG05p56
	i3y9cKR6qKd830+73tRx/ZoBNWRI1RrOzSMZd/pwz+c0iDdm/DBQ4rtbDK2BrGZjKCE1UvGkNJXoU
	vXzjUlIiCNJsHZdqJYXu0jkiQ3L9qcyB8o6y8MY98EoJ6H6broXJOpIlOZ49noJarja7/+ST3lDNY
	mjQWOTegVKXK6B5olCSfUOyrHO1FK/TSBQxJz+XbclZ7WgvK+nh7GDixIBwPGA2BXalvbGyWKwiOy
	ekvdY2rY+lJnt29Sjvyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHpa-0000000B1C4-1dGQ;
	Wed, 25 Nov 2026 18:34:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHpY-0000000B1BO-3e7b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 18:34:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E84F44F9C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240B11F000E1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631696;
	bh=TWsUZ4Yx/ugCrzDX8uSHJCRajgVZgocX3xB6kXa9XWw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AccAoIpvu7+qzRklPC93AUQnIoHA9P4c6asbAvajc/yCDHHiq7yfcr/0QRdyTgXZI
	 A2OjQon8kfLMRWiYcWm8rA782St9VLQJhdvuodRi4WUnfSiRqBmPibjwAzJMEZ2eJH
	 wWDzp5Fpe7W6kJCLsjxBFGsOjugVcENSk/rjwTiRgmW97BDFjcQzL+T2p5R6kSEQXu
	 ik3BgM9ATnL0YL427gGWegyLvBKlWAsWNIOkoJLZONkQ/Wnfx8IDVSkRUR2hXM6iwT
	 xBugMWnFATHYbWXkw3UAU1SoMkNLa1icZP0HmyMLA1Dd33FQs2kOMogk008U1qqHWJ
	 SSDzWrFG88vMg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adfc004920so58691931fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:34:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGfJTM3vYhU84cK+066VnQgB30Vb+yNYG7mxGh/0oz3CbkYqgZ/zcdSHfmXQ2fnaD8/ZiYNAIL7UxC8WtMCHyf/@lists.infradead.org
X-Gm-Message-State: APuU4Z9rIHNhLdJa1WyTbJc+Rq+PpN6sAFkMzb3OO9xOpdYwwT+VPL3g
	Mdu4aBGqgjyK2m/3pb3o/xGM6EbpO8BJzkwYcHCRlgrS8Ap+7FyPOUfbstxOnqLHhQH8v2RAslv
	6D9Pn09NfMrbTM1Zv/bwM/s2xJEvojhA=
X-Received: by 2002:a05:6512:85ca:20b0:5c1:5970:ae1f with SMTP id
 2adb3069b0e04-5c1bc863452mr4167518e87.63.1795631694900; Wed, 25 Nov 2026
 10:34:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119204748.2558209-1-lee@kernel.org> <20261119204748.2558209-4-lee@kernel.org>
In-Reply-To: <20261119204748.2558209-4-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:34:43 +0100
X-Gmail-Original-Message-ID: <CAD++jL=uCDqb0XJSVdzzMDNrxXYxB9KgJKqEh61mjAKhusMmQw@mail.gmail.com>
X-Gm-Features: Aa3M54qdnjbrThHpc_O_xCS8rqPK1pjBvtoIqC7wMcjPKsfTBJLGOdyvo3aqDng
Message-ID: <CAD++jL=uCDqb0XJSVdzzMDNrxXYxB9KgJKqEh61mjAKhusMmQw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] pinctrl: mediatek: mt7981: Add missing entries to mt7981_ant_sel_funcs
To: Lee Jones <lee@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sam Shih <sam.shih@mediatek.com>, 
	Daniel Golle <daniel@makrotopia.org>, Rob Herring <robh@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	stable@vger.kernel.org
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

> mt7981_ant_sel_pins[] defines 14 pins (pins 14..25, 34, and 35), all of
> which select ANT_SEL at function mux mode 6, but mt7981_ant_sel_funcs[]
> only contains 12 entries.  When mtk_pinmux_set_mux() iterates over
> grp->grp.npins (14), it reads two int elements past the end of
> mt7981_ant_sel_funcs[].
>
> Add the two missing mode 6 entries to mt7981_ant_sel_funcs[] so its
> length matches mt7981_ant_sel_pins[].
>
> Fixes: 6c83b2d94fcc ("pinctrl: add mt7981 pinctrl driver")
> Closes: https://sashiko.dev/#/bug/linux-6233f285-1487-4d2d-afe3-d4ce3c445=
054
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Patch applied!

Yours,
Linus Walleij


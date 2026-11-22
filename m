Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061BE606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 17:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=USdB9OcN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eo4HcbdH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Lqr2my7RK1rlIMbBVQfce1d8JLq0RXfqlMr2oVJYgIw=; b=USdB9OcN/r4YhBB26NbomxeVN4
	Wfd5n40Ry7TyV79nbTzcado+sNTkMgbDc00vLbDjn32rFQxxqdkymKIlQiliuJh9Ew1UBNfenJ3CT
	CKqL2oH3G41RIP0Lg1goCcSxTqSxFWPV9tE6n7s1hltB0was/45C9jSRMVrrmb/dLj/xtZkl647HC
	EwfjJdxlp3//oeRrQJ4Bny/L0ZZPKf0YyP7xwCnrfwVZY8A4tWRcCKgS6BBpFmOxdlo7xC4hFlb9u
	lFEYuYQKTNQaeS+hZEq2vguIu4DzQMDcUd2pDutsxpAhP/bN42kfr611QU+eKcJZcslPJ2nM2N89c
	/Fko4H6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBlV-00000001TFO-2YJG;
	Sun, 22 Nov 2026 17:54:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBlU-00000001TFH-0ifz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 17:54:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E62060F8E
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 17:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B421F000E0
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 17:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795370050;
	bh=Lqr2my7RK1rlIMbBVQfce1d8JLq0RXfqlMr2oVJYgIw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=eo4HcbdHgBVpemzOYf6oy5CgelFnR8d3OVCpLJNniLJk3xN5NwmFhvCdpciT8oVDI
	 C/FQPq6UA1SqdiAZZToK/b4nxVBiYpEVtfnAifv8JTeIXmz6On0l5/WsJl9oNsP3P6
	 awxA/khgreVTcq/A6tSEnSKw/daJ01cXNa6wmeYGMEiBKudPvDi/ooy20J+ntFPt58
	 dKMhLWld7BcM/bIjhoA3dcZ0xMdgMAEJCR6kmKkc1XlhqPbmbRvS52TN00TcoGvZTx
	 tJ3xd+3I3s35BMT2Il98iyTwjjuUwysNC/5nQAWLziGHUCfTAOaY/TWGXLvyb33Pjq
	 nb449gghN/cHg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae0d0b9db2so23533591fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 09:54:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEJ12xDncw2MvqhO6rqOmZcy7UrdgjqsMKGGQQ/MgpGe8TPGahKYc+QHyVxjBeGZVfYsUEOkgDSTEL+wzUedUpB@lists.infradead.org
X-Gm-Message-State: APuU4Z/GSg6Zoy140OSqwAY2QTPl+p3Zaqv98Ag1xFJmZrxQPRqF009X
	HFENJNdxr99coeDyIYj0Xw2LDpUNHxv3NXpm6lBtWEmSsjAazPv9AK5ACXELXYZGLmh6WvksxIS
	cUJr8pbsEjD3E/a+XdudPOcsamSqDhI4=
X-Received: by 2002:a05:651c:1593:b0:3ab:4eb4:5ef5 with SMTP id
 38308e7fff4ca-3ae7f9d5e95mr25703721fa.9.1795370049024; Sun, 22 Nov 2026
 09:54:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119175437.2520400-1-jernej.skrabec@gmail.com> <20261119175437.2520400-2-jernej.skrabec@gmail.com>
In-Reply-To: <20261119175437.2520400-2-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Nov 2026 01:53:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v66dXR=Z9FEcudG8NL_miWWH4uRvwg-RYpkTJnSrx3NKwA@mail.gmail.com>
X-Gm-Features: Aa3M54o38aETzb2mUkHD0BeP41inxjrl5JHrW3hwDkzzKCE5Y7QgUCWC98J_8iU
Message-ID: <CAGb2v66dXR=Z9FEcudG8NL_miWWH4uRvwg-RYpkTJnSrx3NKwA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] drm/sun4i: Reject fractional source coordinates
 without scaler
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Andre Przywara <andre.przywara@arm.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 1:54=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> The layer code programs the scaler whenever the source rectangle has a
> fractional offset, since only the scaler can apply a sub-pixel phase.
> drm_atomic_helper_check_plane_state() with DRM_PLANE_NO_SCALING doesn't
> catch that: it only compares the scaling factor, which may still be
> exactly 1.0 with fractional source coordinates.
>
> Channels without a scaler would thus have the non-existent scaler
> programmed instead of an error being returned. Reject fractional source
> coordinates on such channels.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>


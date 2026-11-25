Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1C2606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SC4dXf0W;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d7ZAtjiu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g0cGllNjSZ1Dlm0jVYy1c6i4slueJeHAQyhOKe/jYNU=; b=SC4dXf0WXQkbBr8/2Pd14Vy84c
	n3+Vnhqa6VpJZKInLavWmob3n+wjYiYmjyAodIBRMDDrYrTOalcQZNNeZObgaeaFEd0K4Q02rthtt
	QXcFUOAza1oUV7tnZ7DaG9/YfcUT2c/Ey5690w+5SxvTvwqZ1/EY8rX0oNUzo18UnEFjpkybzh4lK
	sWgtwzF2fkGagfOo6BgjB90W0V0PG8vmI9KkozVGazLyVoV8p84GsZQz4QKo+ZegxZvw1nf0LgKdg
	tmtZesv04kP7M/cMy2EMmcFhjL7exqtjcqa+NNNfUL7xOauhrw9+I7Yr52MhPD8HAus8oNWLGi0J2
	GfCgiNSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBz2-00000009nRP-1PuS;
	Wed, 25 Nov 2026 12:20:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWByz-00000009nRG-2oaB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:20:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B06DF6015B;
	Wed, 25 Nov 2026 12:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8EB1F000C4;
	Wed, 25 Nov 2026 12:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795609216;
	bh=g0cGllNjSZ1Dlm0jVYy1c6i4slueJeHAQyhOKe/jYNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d7ZAtjiuRyHXkqPBq4xg2DgJbYRJHmkbUzYixCVpFSEAoCHirys2mk6dQ+JIr+J40
	 Knp+k4We+LIxg3mN+xOf5pn5oFGpoRbB7zmzZxMp59fNS4SCtJ2M2GtceeukrKHpUR
	 CS6JtMtrfxBZyLRsDGp7OcyFzczFogVAuryMbi2wUvYwcROvU27p/VH1dlGFp/j0Ad
	 sFVyOPs2tdKw7uiAy7L+7ejV6na1073gaznu18X/foVmIU/fE+KlS73dpFF6YM9oXZ
	 vrK+Iq94NSBDFzduyLUvx6GzHc6gifbkg4mmFeRxn3aIefOLWH+dKs7DKqMk8KeIil
	 CJ/8noLwUVlcg==
Date: Wed, 25 Nov 2026 13:20:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert@kernel.org>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [GIT PULL 2/2] Renesas DTS updates for v7.5
Message-ID: <20261125-qualified-shiny-cat-ade8f1@quoll>
References: <cover.1795540796.git.geert+renesas@glider.be>
 <cover.1795540800.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1795540800.git.geert+renesas@glider.be>
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 06:28:36PM +0100, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.5-tag1
> 
> for you to fetch changes up to df85c8ee22391046200bb057c85717eb906e464a:
> 
>   arm64: dts: renesas: rzg3s-smarc: Enable CAN-FD (2026-11-23 11:05:32 +0100)
> 
> ----------------------------------------------------------------
> Renesas DTS updates for v7.5
> 
>   - Add more timer support for the RZ/N1 SoC,
>   - Add PCIe endpoint suppport for the Renesas Spider development board,
>   - Add CAN-FD support for the RZ/G3L and RZ/G3S SoCs and their SMARC
>     boards.
> 
> ----------------------------------------------------------------

Thanks, applied

Best regards,
Krzysztof



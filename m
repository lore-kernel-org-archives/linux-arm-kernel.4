Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2842E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FDRn4Lvw;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jhv4dGVE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9qm8gKQknLIHjCNA8iGQyl2nV5Vy3wPnee7iGG4J6pY=; b=FDRn4LvwkiQpG0
	R2euQBAQB+rwE0DaAcvcCwQKeiH7mgB3jFq6qlKenufJTBUuBQJG745wggxzfRJcJyDLDBpWupuHD
	6E2IgOimMtF/faZ9ebF67pt2otUyk280nFzIhjVhWKUvG3SJlrWXq5dakVFyKIZh0HPEenRddue+Z
	54gKkubj8xbbPFK4MxhfhMPIcfLzN1J6zO1HueQRrnUIvuzJ12+5tC2FRHaWcStaFVZwSuTjjjLTG
	DhBxzRc0IKfT2oM20YOQeAKKUVO+bOKzeNBBm6senVHdcDju3BkIiCXOkEx+KPbCpVb247gAqvEJc
	QPYYWVQxvA223XbLqa/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxo4-0000000GlPu-18pE;
	Fri, 27 Nov 2026 15:24:12 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxnl-0000000GlHH-0HKs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:24:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4C6494E417C8;
	Fri, 27 Nov 2026 15:23:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20D9A6049C;
	Fri, 27 Nov 2026 15:23:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE47F11E90C4D;
	Fri, 27 Nov 2026 16:23:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795793025; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9qm8gKQknLIHjCNA8iGQyl2nV5Vy3wPnee7iGG4J6pY=;
	b=jhv4dGVE5/LuAMjZj1KaTATnjN7/6Kdobu9r/1C/0OjeCcqpUXC4NsLkcy3zihWtvJ48NC
	eoSmEL7+dXDO36TLUXr2FGk0kpRtLvZKXUug1pNoc3jtXUbvtvvyPebuB5uXBGRB22XiQL
	ztYdDS0L/uXgqQ+EBF7QLggm5EENG2qNFpUP2RXPT8yBpVfubipI85ynMxh9gQ6N6qo3fR
	NJVTJC9cPDQPH21QjQmQUAs9dcy2nHUWF8bJTlYEGaRuVdFakoCVqpm0aKyghhIX+53bLE
	NxhSPPJ+fWAI9NtSgegIYB3DYfrT9ALsD7LKRVJeBz3fpXuWVxaeKNIjPW3tGA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Quentin Schulz <foss+kernel@0leil.net>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] arm64: dts: turris-mox: replace denx.de links with
 official location
In-Reply-To: <20261029-denx-de-links-migration-v1-1-4ffff7db7d98@cherry.de>
References: <20261029-denx-de-links-migration-v1-1-4ffff7db7d98@cherry.de>
Date: Fri, 27 Nov 2026 16:23:42 +0100
Message-ID: <87h5h21eo1.fsf@BLaptop.bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_072353_390289_3153606E 
X-CRM114-Status: GOOD (  16.87  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Quentin Schulz <foss+kernel@0leil.net> writes:

> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> The U-Boot project doesn't own the denx.de domain and we don't know for
> how long it'll redirect to the official location (it currently
> redirects). Update the links to point at the official GitLab instance of
> the project so we're future proof.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>


Applied on mvebu/dt64

Thanks,

Gregory

> ---
> Found when hunting denx.de leftover links in U-Boot where we import the
> kernel device trees verbatim.
> ---
>  arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts b/arc=
h/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
> index bd00e7df87c67..159515f95ef33 100644
> --- a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
> @@ -151,12 +151,12 @@ &pcie0 {
>  	 * for IO and the rest 112 MB (64+32+16) for MEM, despite that maximal =
IO size is just 64 kB.
>  	 * This bug is not present in U-Boot ports for other Armada 3700 device=
s and is fixed in
>  	 * U-Boot version 2021.07. See relevant U-Boot commits (the last one co=
ntains fix):
> -	 * https://source.denx.de/u-boot/u-boot/-/commit/cb2ddb291ee6fcbddd6d8f=
4ff49089dfe580f5d7
> -	 * https://source.denx.de/u-boot/u-boot/-/commit/c64ac3b3185aeb3846297a=
d7391fc6df8ecd73bf
> -	 * https://source.denx.de/u-boot/u-boot/-/commit/4a82fca8e330157081fc13=
2a591ebd99ba02ee33
> +	 * https://git.u-boot-project.org/u-boot/u-boot/-/commit/cb2ddb291ee6fc=
bddd6d8f4ff49089dfe580f5d7
> +	 * https://git.u-boot-project.org/u-boot/u-boot/-/commit/c64ac3b3185aeb=
3846297ad7391fc6df8ecd73bf
> +	 * https://git.u-boot-project.org/u-boot/u-boot/-/commit/4a82fca8e33015=
7081fc132a591ebd99ba02ee33
>  	 * Bug related to requirement of same child and parent addresses for fi=
rst range is fixed
>  	 * in U-Boot version 2022.04 by following commit:
> -	 * https://source.denx.de/u-boot/u-boot/-/commit/1fd54253bca7d43d046bba=
4853fe5fafd034bc17
> +	 * https://git.u-boot-project.org/u-boot/u-boot/-/commit/1fd54253bca7d4=
3d046bba4853fe5fafd034bc17
>  	 */
>  	#address-cells =3D <3>;
>  	#size-cells =3D <2>;
>
> ---
> base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
> change-id: 20261029-denx-de-links-migration-f3880bb40e51
>
> Best regards,
> --=20=20
> Quentin Schulz <quentin.schulz@cherry.de>
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


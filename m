Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE88A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vPjD7SNg;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=ASB9sl6E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2d12lWVGBsaoMn/Enc4uD3O8Aj7O2S/+EaVF50C+EQ4=; b=vPjD7SNg3rCUYb1A7cS5P/bh8S
	QWKQIqppWqxGczZ6cHLLZATKzw45Uf6yvd8VblCuWgjt9FfCAJiaxcWgTX+gKXXMjIv/QMaNI1P9B
	iVFU1JbvPG8KgnkGy6v7KOY3Lxo8m24xpcM0OlL6EfC0ZJU588YAACy/pH5L5zTeDByaoD7wcHctv
	Q2vFacbLgyHLupXQA5qC/hFhykBMUVGZzwp+Mo4culi4gL3BStHmmBtOTvzkj/zX3tTOXz4r3wRwE
	yNROatsxd6OXyyRiw50KM3xQq41Zzz0qiBHwQ9XYdmgs39yMJtKPyQUDuM2m49NYPUpZ4YMpQH4j6
	2Wxh4Fiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdIn-00000008dve-28Hv;
	Wed, 18 Nov 2026 10:54:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdIl-00000008duy-3a5F;
	Wed, 18 Nov 2026 10:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=2d12lWVGBsaoMn/Enc4uD3O8Aj7O2S/+EaVF50C+EQ4=; b=ASB9sl6EOSdJIB1EGdzGn/PsUI
	tjmO5szAeJdZlM3+Q+1IxHT6bEQz7NGbHeDeXN/VaxTVXWPcEGKc4AfeQfzAuyTuxCIVTt7MpD5t/
	XlSIvngr8SDDvOVk9p25Jn/Q/FYRGNish8CUgxxwlY5S/t2eXyRIV1e04CKzxeg55zOC/EKwYhBkO
	GGKPXSQczmZOV3gvlJe9BxKNc5Kdwfh74CEC8xAFFoZieOiti6wZ9MnWlrXi0cC/pRxJv6OdZvQ5k
	F+DEY3D2KFaFrIzZppTvcBQ5gdYd88NvoFprVbrXRsYK2qEsmfnrs9yIAcKEjRDQLi4S3L2LG/LU8
	ffa/brvQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: broonie@kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 quentin.schulz@cherry.de, Lee Jones <lee@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v3 6/7] spi: rockchip: Move to pm_runtime_resume_and_get
Date: Wed, 18 Nov 2026 11:54:02 +0100
Message-ID: <ldw_Vn7fRw2QdWAMZ2npBw@sntech.de>
In-Reply-To: <av0CaMF_jOyqMYA0@venus>
References: <20261117235021.2013719-1-heiko@sntech.de>
 <20261117235021.2013719-7-heiko@sntech.de> <av0CaMF_jOyqMYA0@venus>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_025407_889988_8EC4A64D 
X-CRM114-Status: GOOD (  15.47  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Mittwoch, 18. November 2026, 02:53:32 Mitteleurop=C3=A4ische Normalzeit =
schrieb Sebastian Reichel:
> Hi,
>=20
> On Wed, Nov 18, 2026 at 12:50:20AM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> >=20
> > Currently pm_runtime_get_sync() is used, which increments the usage
> > count even if the resume was not successful.
> >=20
> > Move to the more modern pm_runtime_resume_and_get() which handles the
> > usage counter better.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> > ---
>=20
> This only makes sense when combined with error handling. Keeping
> the use count increased makes more sense for the current code:
>=20
> pm_runtime_get_sync(); // keep use count increased on failure
> random_code();
> pm_runtime_put(); // always decrease the RPM use count
>=20
> Meanwhile your new code would result in double decrease on error:

darn, one should not go "eh, let's just use the same pm-runtime pattern,
should be easy" ;-) .

But I guess real error handling in those cases might actually desireable.


Heiko





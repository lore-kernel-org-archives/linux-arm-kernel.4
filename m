Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F97B606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qfN+qAgX;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UU4rwlcq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lRLh+6ly/zzKoywkZKGuB1GGj84cUkixJQdHrkjHSDI=; b=qfN+qAgXUB1cIG4NQxHMStGRJB
	3cBILlrs6NEZeJkDYsLIw9I/R0EzPI2vPdupN954gqnO9sDVyxK/uItoj05GgrDPPzBLAX5ytFIZf
	YL4bZMEVAsOrpLBe4CYfcBSPS8GWHWaj7wQck9b9lU9uMa9DOZkNhZMnCdQZk2uhTvO/yACDz21MH
	4j8hJHgZwpWc5DTV38E8+oW84zAnNguowkHQOtAhiCnSC2apIsLQG2w4S2U/hqz5rnLPaVkWFfZfI
	Zr1u222NrrimjATVDbz9/04SMktCkzdhbY5WtozLpasYb53f8Mis9TzE5qaFlNZdTtROgmeBk+ky2
	aX0YJBzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxCE-00000002jON-44BS;
	Mon, 16 Nov 2026 13:56:34 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxC8-00000002jKx-3hvJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:56:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C74D1C4EFD7;
	Mon, 16 Nov 2026 13:56:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD6436023F;
	Mon, 16 Nov 2026 13:56:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9801611BC051A;
	Mon, 16 Nov 2026 14:56:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794837386; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lRLh+6ly/zzKoywkZKGuB1GGj84cUkixJQdHrkjHSDI=;
	b=UU4rwlcqjirfQp7/rZvYV3fF/Eo9GbwHtJ54CuOcxg87TpP36NfPrWr9BhCUWWEb0cp06T
	KcJGSg+JEUZeB6kMhgBNP8NaCgbzGr0OFdq/lNw70lKM/TX9lSSGf8+QC9yxTOLuzHW1v1
	y/k1lEPAEP08cbpDIoN1wUwcWEdyepaBZEjSNQTMObIQ1TeUHcZwed00oHrW+aHtbmzKCH
	03Jdoc4miFHVQurIg7Yh4vDeF2b9Omy4SmBVaCfxFAStZqWQmUkJHVeWu0cibgQnfgpk8M
	rIMbrnxzxfZWmTsxB+8TOT3o1Qgfr8Aunb6JDQojaQkAgIyXmsZV28X1j2jS3g==
Message-ID: <2a117360a6842fd3b1929aeade3b05320c9ad4d8.camel@bootlin.com>
Subject: Re: [PATCH] clkdev: Improve clock discovery with clk_find()
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Nov 2026 14:56:23 +0100
In-Reply-To: <20261103084915.8405-1-paul.cercueil@bootlin.com>
References: <20261103084915.8405-1-paul.cercueil@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_055629_088644_1924C83C 
X-CRM114-Status: GOOD (  17.45  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Russell,

FYI I merged this patch into another patchset (of which you're in Cc)
called "ACPI: platform: ACPI 6.5 fixed clock support":
https://lore.kernel.org/linux-acpi/20261116135217.37038-1-paul.cercueil@boo=
tlin.com/T/

So that you also get the context about why it's needed.

Cheers,
-Paul

Le mardi 03 novembre 2026 =C3=A0 09:49 +0100, Paul Cercueil a =C3=A9crit=C2=
=A0:
> With a setup where a clock provider registers a clock with a device name
> "mydev" and a clock name "myclk", calling clk_find("mydev", NULL) would
> not actually return any match.
>=20
> Update the code so that we can support this while maintaining the
> existing behaviour:
>=20
> - clk_find("dev", "con") matches in order of priority ("dev", "con"),
> =C2=A0 ("dev", *) and (*, "con");
> - clk_find(NULL, "con") matches (*, "con");
> - clk_find("dev", NULL) matches the first case of ("dev", *).
> =C2=A0 Note that in that case we don't handle wildcards for the device na=
me
> =C2=A0 or it would end up matching everything.
>=20
> Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
> ---
> =C2=A0drivers/clk/clkdev.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
> index 919fc680ae4d..ee6c0afd6ec0 100644
> --- a/drivers/clk/clkdev.c
> +++ b/drivers/clk/clkdev.c
> @@ -53,7 +53,9 @@ static struct clk_lookup *clk_find(const char *dev_id, =
const
> char *con_id)
> =C2=A0			match +=3D 2;
> =C2=A0		}
> =C2=A0		if (p->con_id) {
> -			if (!con_id || strcmp(p->con_id, con_id))
> +			if (!con_id && !p->dev_id)
> +				continue;
> +			if (con_id && strcmp(p->con_id, con_id))
> =C2=A0				continue;
> =C2=A0			match +=3D 1;
> =C2=A0		}


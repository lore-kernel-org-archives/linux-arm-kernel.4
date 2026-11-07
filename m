Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84879606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 18:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gGbl81jw;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=aSRLOajT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WKXSp5E4s/N1g/AjyLpdmHZ+ZbLwA33yzXCjwWw6QnM=; b=gGbl81jwNiWF+NBGhqQrOO/dlM
	ga+8v+Wz+qxB2GPH7uegvLiLbc4twoxqwu8/7/k5ylZs8fkeRwfYfutepxhKw0W+TLFJVs86uOWKc
	K5XEcTTrctJVIjwLi6RuULAUOyOicQcTe91q0SHH57M4b23xh/G0Ec7YWo+4XwsGVKZ1snbYzjpL4
	E+A8F71w5iyct/vb2px05uB/Dd8nMrnSlqpxLxAto1vOU3JX2aGlit7vG+uiLqLfnjhsVo0mSyMrj
	tzhionOHqeWiNJndNPh9K9IryzNvHnVATG0yOcHMmLzCa6/12le8vQDnFwCxYFNThDERT/Cu96iZk
	Nb5mt4PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPlRI-0000000FCCo-33Qp;
	Sat, 07 Nov 2026 18:46:56 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPlRF-0000000FCC5-05bc;
	Sat, 07 Nov 2026 18:46:55 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jMQ4d6FSzz8t17;
	Sat, 07 Nov 2026 19:46:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794077201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WKXSp5E4s/N1g/AjyLpdmHZ+ZbLwA33yzXCjwWw6QnM=;
	b=aSRLOajTnwysnrnSlz7vzFkxh9vJ63ES6YEeLzkWJP3MO1DemEIuoyPbp9Da7H5oQzNpLG
	8Z6hFswXO2+347svLGKBr15RYI6KAshDbR/klFTRwl2bwfs502vXLj/9VnC66tYCKOkJuD
	39bcdHmnynC6UzcrEQG0L6ieinwDXhR5LoxapMNc3G+Ia6EeUrDsx4WYs/PIq8LqYYfQJM
	bjj98iJOgAZWb2NZH3naMZOWbPJGFVjc7+9ldfSIBKq0u9zgecPhz2qRC1JdQ1xP5Tqqmj
	pq/C0wZfflUbbmtsXpmhE2qQIxioRzICp6DvbpmGpvDnIPEHA5YqEu49JC4QNQ==
Message-ID: <2208f75de73582e4d86e9f276fb3dda8751a9c56.camel@mailbox.org>
Subject: Re: [PATCH v2 5/6] firmware: raspberrypi: Document memory barriers
 in property list path
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Sander Speetjens <sander.speetjens@gmail.com>, Florian Fainelli	
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>, Stephen Boyd <sboyd@kernel.org>, Nicolas
 Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 07 Nov 2026 19:46:38 +0100
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-5-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
	 <20261107-fix-raspberrypi-firmware-v2-5-5bfe605a5cc5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: q6wps7e4n8fd3gycsuy4kgwh91oenkwg
X-MBO-RS-ID: ae976b0d27aad94cd80
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_104653_751297_1F2D36C5 
X-CRM114-Status: GOOD (  11.63  )
X-Spam-Score: -2.8 (--)
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

Hi Sander,

On Sat, 2026-11-07 at 19:21 +0100, Sander Speetjens wrote:
> Add comments explaining the wmb() before the firmware transaction and
> the rmb() before reading the response, as required by coding style.
>=20
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>

For Patches 1-5/6:
Reviewed-by: Manuel Ebner <manuelebnerli@mailbox.org>

Thanks
 Manuel=20

> ---
> =C2=A0drivers/firmware/raspberrypi.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberryp=
i.c
> index d9a569a6dae7..57f21e4e65d6 100644
> --- a/drivers/firmware/raspberrypi.c
> +++ b/drivers/firmware/raspberrypi.c
> @@ -110,10 +110,12 @@ int rpi_firmware_property_list(struct rpi_firmware =
*fw,
> =C2=A0=09buf[1] =3D RPI_FIRMWARE_STATUS_REQUEST;
> =C2=A0=09memcpy(&buf[2], data, tag_size);
> =C2=A0=09buf[size / 4 - 1] =3D RPI_FIRMWARE_PROPERTY_END;
> +=09/* Make sure the writes to the buffer are visible to the firmware. */
> =C2=A0=09wmb();
> =C2=A0
> =C2=A0=09ret =3D rpi_firmware_transaction(fw, MBOX_CHAN_PROPERTY, bus_add=
r);
> =C2=A0
> +=09/* Make sure we see the firmware's response before reading it. */
> =C2=A0=09rmb();
> =C2=A0=09memcpy(data, &buf[2], tag_size);
> =C2=A0=09if (ret =3D=3D 0 && buf[1] !=3D RPI_FIRMWARE_STATUS_SUCCESS) {


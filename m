Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B562A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CNQp4RJb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aloCeD+S;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HgDoRzPi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ESSDfIjILrrrOgKIHFr61CIF+AOlYCTGg3Q7YlxjKtE=; b=CNQp4RJb+kEZIb
	1ld/8zDvuq/jrxAiLhHeB0rirPOuUMR5RJccXI93GHtoS3o6msbiUGegj4iw1mPqBdBDzRitQbnNZ
	KeAPvkR1smC/GxL3CqgRW4qUYO+W6mkLJ4K0pKmohGz4vgajwc7Qx0tkPsY8wslcrOYqa7r3+NWsT
	22stlX7eMo9avSQtDdXa0Kd/L1xyCD/uFauclbSnrDzGE5mW+WKIwI65GGrHgrO9iix85tPxi++KU
	p0Gz7JyW8j1eLKc2Cu2wdtNXBpcgXcSt/+rWc2q/W4aGyzMEPxn7fllZ9aaUesrsZXsRCZa4W1GRL
	+A6+mBLjUYrSjdTAuiIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxpR-0000000GluN-3sap;
	Fri, 27 Nov 2026 15:25:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxpI-0000000GltA-11zg
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 15:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ESSDfIjILrrrOgKIHFr61CIF+AOlYCTGg3Q7YlxjKtE=; b=aloCeD+S9jbX9NIumljPyU/ncF
	oLx4OgnK1KAgtUj0uUMY1uoE8uopYAgUQeRhQzDjYYI6vAp/2KrHCCGlDVWbs4lYT/FQYHRcfzn9c
	rZZmwpjowxXEkiaLdIlYDD1lKiDGMTYUaZ46RpWws+O6pdXFME579MpS5K6q48XAxFRy4zGpqF1Aj
	TN1ZpsS/tFZGRfJn7uBdGS0OC7uActCOAq1E4JWpyw7EZk+DYPu+h4ORL1HcklTRkzMJfuQBrrca5
	tYCoikOvj8dRDy1Qzkk3KP6vNuPp1pyX8qtIKXv7BwrYeI49UF8Y8GbWhMhB8kOMMkiudz/PTJuWu
	WBjDjQNQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxpF-00000007tck-1hCF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:25:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B12461A1838;
	Fri, 27 Nov 2026 15:25:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 864276049C;
	Fri, 27 Nov 2026 15:25:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1738511E90BF8;
	Fri, 27 Nov 2026 16:25:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795793121; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ESSDfIjILrrrOgKIHFr61CIF+AOlYCTGg3Q7YlxjKtE=;
	b=HgDoRzPiVlpwHw7kzmcZNmRaaHAw1o4eLImi3oCCj1kEiCcandDP9AOHW1vUMo/x0Y9Gf+
	kHKBQcRVy9N2dB/LE8k0TTorzt+2qTBfbvWd3Xu1aECCFn3/S7jm3ZwunEpF1M/SsPkY8H
	kdCX0pbk/bhoL1uGlMcXWkHVT8W7jJkdM/0aQx1esn1/gYEXPVvefd7OHLeUDkKM4nfN86
	0JDN1A4QqAgjCwpfzsSK+rl1jY2wW+xBkeAL19NWPd1bDlchbrazY7wq7LXtuJRrfQowhA
	gpe1OqpMRHiKV00gJ80gqiqD8chfS5vc9QK9FO8Wf402rcjiJeZjR4gvPN34cA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Artem Novak <artem122novak@gmail.com>, andrew@lunn.ch, robh@kernel.org
Cc: sebastian.hesselbarth@gmail.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, klightspeed@killerwolves.net, jason@lakedaemon.net,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Artem
 Novak <artem122novak@gmail.com>
Subject: Re: [PATCH v3 0/2] ARM: kirkwood: Remove duplicate DS212 compatible
In-Reply-To: <20261110093120.179318-1-artem122novak@gmail.com>
References: <20261110093120.179318-1-artem122novak@gmail.com>
Date: Fri, 27 Nov 2026 16:25:18 +0100
Message-ID: <87ecc61eld.fsf@BLaptop.bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_152525_357948_A3189CCF 
X-CRM114-Status: GOOD (  11.58  )
X-Spam-Score: -0.2 (/)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Artem Novak <artem122novak@gmail.com> writes:

> This series removes the duplicate "synology,ds212pv10" compatible
> entry from the Synology DS212 Device Tree and its corresponding
> Kirkwood Device Tree binding.
>
> The changes are split into separate patches for the DT binding
> and the Device Tree.
>
> Changes in v3:
> Added the appropriate Fixes tags.
> Split the DT binding and Device Tree changes into separate patches.
> Addressed the checkpatch warnings reported during review.
>
> Artem Novak (2):
>   dt-bindings: arm: marvell: Remove duplicate DS212 compatible
>   ARM: dts: kirkwood: Remove duplicate DS212 compatible


Both applied on mvebu/dt

Thanks,

Gregory

>
>  .../devicetree/bindings/arm/marvell/marvell,kirkwood.yaml       | 1 -
>  arch/arm/boot/dts/marvell/kirkwood-ds212.dts                    | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> --=20
> 2.56.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


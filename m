Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BB6606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 10:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rfmdpeXj;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=O2obj9vK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4VYAg36bzRQtNXdY1YRHBQr5BBzsOdbEIoK2oKxUoYs=; b=rfmdpeXjF8sBGIqS2XQE/t7Kwz
	xyuzbv4hkloP1tT+Szw1oiiNKjSMjTHJMtzwUROAwF454wsDvedMMlzurDG1F+EN9LipD8VUZvNLO
	7l95nj0ca1mXaVhjnGjUQmaWSWab+hNtRNfC6p25us1BgGQ1QbewiQFf4y56CP9pGG6aL82CMWHEY
	wArJc0VqwwVQ1kWnOnSODAvDcoM7dbTDl5X6j8A9VKfHEFaEhSwsCTjJAYcklGeX5Nnry9hXWHzm+
	5+WJaAFok+AAXd8jgS+ascvu0JO0uP8n7Wox3Vn/uqUJ49e80KuBuM48aD7OObTr4bUvKy5vWOAV0
	Zp/gBV9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRtj-00000009UuW-2rQ4;
	Thu, 12 Nov 2026 10:19:15 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRtg-00000009UtU-286g;
	Thu, 12 Nov 2026 10:19:14 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id AB9A52004B4;
	Thu, 12 Nov 2026 11:19:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794478748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4VYAg36bzRQtNXdY1YRHBQr5BBzsOdbEIoK2oKxUoYs=;
	b=O2obj9vKiy8RAL651Nw17SsNvscVe5NWLWrqBbtOf9f80E051DzurxZ5OQYThZs3dXJ2k4
	/ebUywrJhNmQfBlHi+sb3M05tnDQhOhljmDvzHvo1WO6hdc1U7OVG2Gk/v5TRevHcdH0LK
	nJI/UveHe++PxIq4gA6ZNuW7bRITk5ZHKI0oJd3q0px1QQ4TxHrUVt0R+HY+nz+Hqxx917
	LA0cD7I2mO3svbqPN0u4p/A9zs1QzmBvfucPyq14aUkjq4aisup+MfhHNmMg+4pxP49474
	J3HyUe9VApmCLPvRzpoB28CB27qwsfeZqjLvZzIC3t1dEF6Xo9jnIW2m89W2Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794478748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4VYAg36bzRQtNXdY1YRHBQr5BBzsOdbEIoK2oKxUoYs=;
	b=I8gkf2050xIArn/XEyvo/83XwaJRBj6azNQtTxCIY/yHi1zw5BMzwmu2qnZZy1X7mQ5VGh
	V1P0QqzSsNmUbXj9tlqnz8IZQPft8lZorV1UfB97uNQsZ93nEnFjvx4mP51dkut4P0X3xT
	Ol74lUP3wYXUYjIVHAvPEhgubRqHz1eaycsHlgqIfIopSZDDM224iHY0mCcRIq9Msn49gP
	4cLLl2D5M7jyh2RScnIqkV4BXnZEPcIbQiyH2DI9r3tdYqd3hIfso3AN/o1yc1DyW0mu/b
	NX82H8D0tkR16DHyUOyXubWYHS1PWtZJI+kSBhng9Fcr0ytHIAFwRff9Ht+3Ng==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794478748; a=rsa-sha256;
	cv=none;
	b=W+c+029ZeAryrNgfB9iWvxS2lleQ2C711z4nB4g3GeDXtMKxKc7ELfNYPFWYjZupXyKggP
	tl6Nz/nc7FLu+lPISIGmTRveYzBb1eOkXI9C/x+2ygShAMTY9TXnTxMTB70MkC490pRe4j
	ALNoS9ncXsgUd3XvPtsR4rZqPnyiC59vBeWrpYLZDlNgUxS9KPzx2jN+Hs7A8TMNSYJz35
	GEmyDVJzc53dZGlSWpw/XdhKEwcnySj/IHE6FsbBlrE8roZADzuLSigBOxOxEoGppeY3Ru
	la9EADd/9144U70sk+XDQX1hvWa2270oiXD99nIr35CCDerYr4IukA9uHM0VzA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <c97eef1ba88daf83d231d2ecc78b47fcf524385c.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/6] media: verisilicon: Don't hold the VPU in reset
 after remove
From: Philipp Zabel <p.zabel@pengutronix.de>
To: aiyengar1990@gmail.com, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>,  Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring	 <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Nicolas Frattaroli	 <frattaroli.nicolas@gmail.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,  Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Hans Verkuil <hverkuil@kernel.org>, Jernej
 Skrabec	 <jernej.skrabec@gmail.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sergei Khomenkov <shomenkow@gmail.com>,
 Tharit Tangkijwanichakul <tharitt97@gmail.com>, stable@vger.kernel.org
Date: Thu, 12 Nov 2026 11:19:08 +0100
In-Reply-To: <20261112-hantro-robust-v2-2-18561fd48838@gmail.com>
References: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
	 <20261112-hantro-robust-v2-2-18561fd48838@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_021912_706334_90B45F05 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Do, 2026-11-12 at 08:30 +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> On the RK3588, the resets of the AV1 decoder include the AXI and APB
> bus interface resets (SRST_A_AV1_BIU, SRST_P_AV1_BIU), which also cover
> the Verisilicon IOMMU of the decoder. When the driver is unbound, the
> driver core runtime resumes the device and, through the runtime PM
> device link, its IOMMU. hantro_remove() then asserts the resets, and
> when the IOMMU autosuspends 100 ms later, vsi_iommu_suspend() writes to
> its registers while they are held in reset, which raises an SError and
> panics the system:

If vsi-iommu accesses require these bus interface resets to be
deasserted at certain points, why doesn't it request its own reset
controls?

Depending on implicit assumptions like another driver not asserting its
exclusively controlled resets seems fragile.

regards
Philipp


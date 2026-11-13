Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5190E606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 09:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jO7YwxEZ;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=FqvcFHOA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6H6K3uHq6NldMYMP3YlBlDnoWedZJbrPijCyuvU5TUk=; b=jO7YwxEZQFgq1/pWzMhbfTqmOE
	Ol/rASUzyxC156pD2rR0l48guZ5WQDtRDAhIHSv25oNhfJbLGpdOArL8/WeQZHNKLOYpdboviqmXC
	vG7Dl2W4L/QLMpItPOXS49am7/1K02v+NMh44rlTd4PQTtD4cX30zrwt7UofxFzmskE3K/6aJ9Mqi
	unfkmRSNXwMiUQ3A3TgfGVhb4K8PnlymPUkZs/KUpZa3O5g26mjJ52947pK+kqZQNRxP7ZJeNYKUk
	QvoC/Q9V6C/GRKfY5AEItvy8ox/e8vIYWmvesq2JMHYITALjtg25W7CshLYgy3tNaXucS/jlP3y0Z
	fQqoWP1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRntH-0000000CFwY-36f0;
	Fri, 13 Nov 2026 09:48:15 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRntD-0000000CFvq-3n9g;
	Fri, 13 Nov 2026 09:48:14 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 980D3202266;
	Fri, 13 Nov 2026 10:48:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794563289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6H6K3uHq6NldMYMP3YlBlDnoWedZJbrPijCyuvU5TUk=;
	b=FqvcFHOAeaCHKc//EX4Sn8K3WgWUE9ly8lTAA/ubhgL1zyUhcTU49NYaJcy03/u2t82L2W
	UX6G9VcHfqnXq0mqWRNwteHo5xJBoP6Tx5BSLYqxtyEKWVOyKTrpB7xn/rSkr58/b1ho0M
	JWeoMnt1LU/QDcnnf7HcGVahrSiJf5eJWCif3ai//637c9+QsqtaIjPJh7owV9WMyK5ZQv
	Zsrk/Pm6XkdQf2tzoEi+C+QJWgvhy0nb/X5hq1t10P3gzd43rYDbd05at58VOHz4FYSE2m
	8hO6tH3vsmEcF087cew6LcawDaV5ueVfjeJm2N97h2mBzD2mWh4UttExg9DaIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794563289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6H6K3uHq6NldMYMP3YlBlDnoWedZJbrPijCyuvU5TUk=;
	b=F07za/cfOIcBUy3W+xv3VFmG0ykRp8tVU87RsKSyxqY1Z5RAwqaSKdOzAwj1nUT5I4Auaz
	1FiIIWP7NXflJyjVgGZlm6TsW+021zI7asuteUQUvTYP0SCvyeQCrVQT6rWK7+E3ODml5z
	L6FtPBs1/ytxW9zd+KS8kKZZ2TZaCbFHzmb6WzEwP6Ryp1L4uzTS5vZhmo+Y1Wks1A+WKL
	IQMN9NEhy4uFTCu6oOqcE8Tfx0NQlJnfCPiFqwqIkzYz9EV1V5c1r59r/mqTE3EI9FRrEz
	w5EXvwLFlS8IjRBQHzCJBQEEOC66XBFattdrbfPOWjN2Mm9uS4N463WBsTc56g==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794563289; a=rsa-sha256;
	cv=none;
	b=DATszqC5RkaNaiZF3N020sjUU8Dt3zypTQz316EJeMEzE20YJJfUYsbGms8dgsEOH+0FTR
	0cuFWWXTi9H4nm9W66UQxLfGxRADGU+tgQZ/51DV+Dfpx8e4Sn74JcF32JCuDXslkLjKF5
	v+pnIT4/mhmfb0TEpcwwXIGIQwrwCJLDWGEoMEHDulMxaqszKhLbHGc7XEKlnVv5yGL9+S
	iBPXCJszLfz7yjoISZd0P6vmS2s2WaNYP4ay++qtT+8WTKLvsMQpCIc1MXQOUBNt1CfiHo
	GfKNzWN0sxP8v6b3JGt8u51d/JlSwOQKbio8i08p6Uk0XPjH10ZKbuU1pkoSyQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <b3fa092ec9390cf5bfe2f4338af68327be70e6e1.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/6] media: verisilicon: Don't hold the VPU in reset
 after remove
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Arun Iyengar <aiyengar1990@gmail.com>, Benjamin Gaignard
	 <benjamin.gaignard@collabora.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner	
 <heiko@sntech.de>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Hans Verkuil	 <hverkuil@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 	linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org, Sergei
 Khomenkov <shomenkow@gmail.com>, Tharit Tangkijwanichakul
 <tharitt97@gmail.com>, stable@vger.kernel.org
Date: Fri, 13 Nov 2026 10:48:09 +0100
In-Reply-To: <CAEy9hNU2ox76TFKtdisqUHDxZ=3gPVBDBcjz_W8RtCpCpK5d7g@mail.gmail.com>
References: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
	 <20261112-hantro-robust-v2-2-18561fd48838@gmail.com>
	 <c97eef1ba88daf83d231d2ecc78b47fcf524385c.camel@pengutronix.de>
	 <f212840b-92fd-4d97-a6a7-2768a55483f7@collabora.com>
	 <CAEy9hNU2ox76TFKtdisqUHDxZ=3gPVBDBcjz_W8RtCpCpK5d7g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_014813_042571_A83511D1 
X-CRM114-Status: GOOD (  10.38  )
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

On Do, 2026-11-12 at 23:54 -0800, Arun Iyengar wrote:
> > Le 12/11/2026 =C3=A0 11:19, Philipp Zabel a =C3=A9crit :
> > > If vsi-iommu accesses require these bus interface resets to be
> > > deasserted at certain points, why doesn't it request its own reset
> > > controls?
> > >=20
> > > Depending on implicit assumptions like another driver not asserting i=
ts
> > > exclusively controlled resets seems fragile.
>=20
> The AV1 node lists these resets for hantro only.
> vsi-iommu would need them in its own node and binding,

Would that more correctly describe the hardware though?

> and both drivers would have to move to shared reset controls.

Worse, shared reset controls don't work if one party temporarily needs
full control, for example to issue a reset pulse after timeout.
So this likely would require exclusive reset controls with
acquire/release.

regards
Philipp


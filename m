Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13307606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lY4ylNAB;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NY9/si+Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aJM0dawyH8gXbWmqX0nGo7HUQ8+upl7nxWuHmU22MH8=; b=lY4ylNABF/xIBhX11S3HNw5hYI
	Mf8dVeCbmsuFFDEWXFHehBoZBIEoLTeiy4rbkKdVCvRiJL/1EpzyMh9LLZmwARU48QsI6gcBjw+eM
	BIGg/Paj8QQEkz/EfDpjWbldjf03pbuy+siOzH6CIAm14+eiL31WCHRcf1xkzrufXdFOreosuLTfP
	0WS//E0cp77t+mF7RUIVk9NWvpvHBDEJUtvLd4Xp0jObryu0FsAWhhK+61UFbIfHYbFwfRKvTvJDF
	1bjOZzGS9SMoV4u6h4vBcohhFkZtVrAbokY9hJ4G/GbvRv+unyqEH/C1kwZkEDIw2+3ZGs7tAXjYh
	VBFAHgiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuSC-000000023eZ-1KkB;
	Mon, 16 Nov 2026 11:00:52 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuRu-000000023Yn-3KCP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 11:00:36 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 64BE82001E8;
	Mon, 16 Nov 2026 12:00:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794826832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aJM0dawyH8gXbWmqX0nGo7HUQ8+upl7nxWuHmU22MH8=;
	b=NY9/si+YW84m+SS5J42fHf5A73xFx/MS++ISlMVs/Lmy84ooe4ApSUZeHakT61dxlJs7mM
	0yoYDEteEAFt29328JOeis8SVgQkzh+tvl9uc8WUxX7JRPVDQ+hQ8VSUTfdCxEH0u87Nex
	otO10oTjG2j5YhzMbQ/MOlCaIfJadzxiAPzPtYPc8n4OKsM4MiJI3ENmUH+VkKLlyXa7gz
	xfmg7hVf8ijp014JSRExXacJX8XnpfGVpGoOZxIRIk8n/08Tidchzt1Xz8R7b1swO1pSlT
	SDxhDAOClBHo2heTAWwennxo3khY3exT9p/VpkL8u75hfG3LOPY64VWuqefBYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794826832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aJM0dawyH8gXbWmqX0nGo7HUQ8+upl7nxWuHmU22MH8=;
	b=BpsYkN0qtdfxnjyNg0TugXXbCP0r18Y2MTiFvJQ8bzJ/gw0J2NVBu2X1NoOxGVd8qPgsxj
	ibKMkFfhU29tax2fbPe4PzW/UbjZdYIdEH7cVMDuZ9S+1TBeTLataNXn0sqb4j0w0HoY1P
	VFm0Lf//UPvGoG3CfTIlTPFqhCSr19L2xJqmBUd0181CimoJr/UdPIiBQRYs9tnt5paQAl
	ibiH0jn8aQTt5UCb3oNaYQFm78D8+QAPL/eS+fVpGr+3olICBRsSwabA575BZzWZXJkuBB
	xNNzN6FrpqVZpQgzb8kR1VBWY+4g8m2ZhTB7N1IRntIkmwNIKXfawwWRSt+9Tg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794826832; a=rsa-sha256;
	cv=none;
	b=UxgYkZY4wxVdPW+p/h6wNa0wjVq9umd2QZCZv8vk2kdpWbJ7FYICcKYVx7AwmkD8P69tih
	SNzftfgQF1tyKan4mPdS+7KsB3T9Hc4JulJ/aPfaPE1aUlwqeP3SAy5ukgomcdka2Tk9/F
	CuX0/c7S2botvYurBUK39Z4fSI5ZqeG1vKAXeJmMHQviBYapzmYLPMTXkMkufj/+W0f7eg
	2mseE8l66fgG39F+I4MKtczsIGCBCpWrWJTfWImzJ2PiOdk08nwsvk0sgFNsBXUw4qPmJ+
	ajxmmQSpVq/eu8dSve8qDT0kIes//7CEPOGlMcfL0S/+Wb3feydjz5ccsLiLlg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <1b6620f4c2cbed3124e5521f18585132d2e8dca2.camel@pengutronix.de>
Subject: Re: [PATCH] hwmon: (aspeed-g6-pwm-tach) Use
 devm_reset_control_get_exclusive_deasserted() in aspeed_pwm_tach_probe()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Markus Elfring <Markus.Elfring@web.de>, linux-aspeed@lists.ozlabs.org, 
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Billy Tsai
 <billy_tsai@aspeedtech.com>,  =?ISO-8859-1?Q?G=FCnter_R=F6ck?=	
 <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>, Ryan Chen	
 <ryan_chen@aspeedtech.com>, Tan Siewert <tan.siewert@9elements.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
Date: Mon, 16 Nov 2026 12:00:32 +0100
In-Reply-To: <bbbc7228-cf98-437d-b240-ad29ee7fb4ac@web.de>
References: <bbbc7228-cf98-437d-b240-ad29ee7fb4ac@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_030034_982714_3D7BF6EF 
X-CRM114-Status: UNSURE (   8.27  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sa, 2026-11-14 at 17:28 +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 14 Nov 2026 17:11:34 +0100
>=20
> Use devm_reset_control_get_exclusive_deasserted() to replace the
> explicit reset acquisition, deassertion, and cleanup action registered
> with devm_add_action_or_reset().
> Simplify reset handling and remove the custom reset assertion callback
> while preserving reset assertion during cleanup.
>=20
> The source code was transformed by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

It looks like the reset_control doesn't have to be stored in
aspeed_pwm_tach_data, it could be a local variable. That is a
preexisting issue though.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp


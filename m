Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F74F606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 11:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lgvczh2L;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=qqtOx6p6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tSZhKAIK1EHxD3XnyhYBftCRX2avMBVk9Fjkswdk57s=; b=lgvczh2LtVG6zz
	5pgMNLCq25XYQejNUEh/tMABpaZvXWav33z9hvInP8k5QnCv4/QhMc9SuDX2SIdHUJDI5xNnInRxP
	kn0RYqCJhlostm4uQJFmeEiIngJ1bQVVYnZSnyksfnrSLdiE+ksEqY/p01Z1SlY8hVD0J1+qJGKnB
	aFyxtCwedt+7F+4H/gU3PxB5c2r4KaxrWRBBsJqnqm7FZvG5lA8YZhYDjgff2XZLc067s6iKJoTyf
	P8Wqvw9eQ+zUhZhZxA2ZFNGRnwpjclhSUuyJH4/JRNox9dKtXalV6dIzjuoG8PfMx7kLs30PqO95Q
	S7akwm05/jkfXMagKWYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkLE-00000003gKf-0WbT;
	Tue, 10 Nov 2026 11:48:44 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkLB-00000003gJF-0eEP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 11:48:43 +0000
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D05D33D;
	Tue, 10 Nov 2026 12:46:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794311173;
	bh=tSZhKAIK1EHxD3XnyhYBftCRX2avMBVk9Fjkswdk57s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qqtOx6p60ZFA7kfVRbtUBadyGZVACGSAhtNYhMG70e/xaOTbs1fvT3czoHy4nzOub
	 rswa3AR9CdilC95o8FcHOvcnZBq7V55yydP3MsPFIO3VbbjkJcHCuIkgcQ2EJwbr+R
	 rga9Ct3Bo23RZBe8A6a2U96VtderXVHXSRuYobC0=
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261110093954.GA129290@francesco-nb>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com> <20261110093954.GA129290@francesco-nb>
Subject: Re: [PATCH v3 0/4] arm64: dts: freescale: Add Verdin iMX8M OV5640 camera overlays
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>, Francesco Dolcini <francesco@dolcini.it>
Date: Tue, 10 Nov 2026 11:48:33 +0000
Message-ID: <179431131331.194410.16578072822295578866@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_034841_358856_A47A3D1B 
X-CRM114-Status: GOOD (  15.14  )
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

Quoting Francesco Dolcini (2026-11-10 09:39:54)
> Hello all,
>=20
> On Thu, Oct 22, 2026 at 04:31:24PM +0200, Ernest Van Hoecke wrote:
> > Following feedback on the Verdin iMX8M Mini series, introduce a binding
> > for the connector's sideband GPIO nexus. Add connector mappings to the
> > carrier descriptions and stable labels for the SoM-specific CSI media
> > nodes. This allows one pair of OV5640 overlays to be shared by both SoMs
> > and all three carrier boards.
> >=20
> > The binding intentionally covers only the connector's GPIO signals.
> > MIPI CSI-2 endpoints, I2C, clocks and supplies continue to use their
> > existing bindings and are connected through stable labels in the Verdin
> > device trees.
>=20
> We have now an official page documenting this connector
>=20
> Link: https://developer.toradex.com/hardware/hardware-resources/periphera=
ls/toradex-camera-connector/
>=20
> Ernest: if there is a new patch series, I would mention it.
> Kieran: the danger note in the page is for you ;-)

Awesome. Lets hope the fire stays as imagery :D

I did get my 'camera dt-addon' compiling with Herve's DTC updates, but
there's still (probably quite a bit) more work to do yet before we could
have generic camera addons for connectors.

Looks promising though!

--
Kieran


>=20
> Francesco
>


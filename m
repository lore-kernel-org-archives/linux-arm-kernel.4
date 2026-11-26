Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5F1606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 18:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RxDkc2zr;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=Aa6U7TmI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TmIlGqYRKL1N0DbrflYbwLWHTPbsYPsvR4Gqt4JhWS0=; b=RxDkc2zr0GMV+dlP5PV7TTFvR7
	9C8XEVYUdEkJTUcvpHHyl+tqK9NOXqdTI9U6GbQQY/kHtZb4juW2aR2UmOxzWyUvgU0XmqQZWVMhc
	xSLXROBgPV+bqIHnpAwdJcmgWUR8xvLKGiIblOpKcOpHZZ3rgXM2krOjstE80Y/MIAzdnW7It+6Be
	Pt7YGQFcxkV05mTtZ7ITmSTkaN0XLj25yhERMmFjasXU/dMzpzKgErGnlIlTywb0pMT+EJxS52+N8
	D3Oda1CYeX4kjyFzTOTnadjVniEIXSt0FrTm4EI2dBYM62lCqKkOEiRaMmu1Im92+ado1/adGkG66
	eEdFv9ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeQB-0000000ECD1-09ud;
	Thu, 26 Nov 2026 18:42:15 +0000
Received: from smtp3-g21.free.fr ([212.27.42.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeQ7-0000000ECCj-4Blg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 18:42:13 +0000
Received: from L30177.local (unknown [78.240.251.125])
	(Authenticated sender: vjardin@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 60E9A13F8A7;
	Thu, 26 Nov 2026 19:41:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1795718527;
	bh=RdqlfcRYRyRN/alGMnwzCeIIWGVeJlTeO4EFT1U28HY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aa6U7TmI2pqdSQbqnVAZ9wKX17hNwrxb7sJCGV9smHxFQfk8SZWDVGYgaykp5Bf+o
	 Opuxeg1dm6O2Towg5dhvaWuHtmKMVxBIpCDJOJUzALDj0tAlCADAWMldG++WYO4dsN
	 tDKK5u0vaKg0Hh0rViFgV+Z7rXpZrG6kvHPnaxKg9+faXcARzsIOmnPngTAZJ1RQeY
	 AZKeO66aAoBCbr2OWpSffyoctoL1hHR+Y9O5W9fT+//ct768q/Pc8Nn2hEz+EkLXrS
	 fh+6gnFi83iGV1NNb8Hvel5dZrW6Ix3LBfLHl8lPGGBHCoQYeaY5+SmE2AeSVI3HwU
	 ecFfi6TA2wvLg==
Date: Thu, 26 Nov 2026 19:41:40 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH v8 0/6] lx2160a: change the pad muxes through the RCW
 override
Message-ID: <awh9ZB5V3vG0gg4S@L30177.local>
References: <20261118-for-upstream-lx2160a-rcw-pinmux-v1-v8-0-d01bc837593e@free.fr>
 <CAD++jLnRWZrLfyBGGOikx_eeYXirahuB7E7yuDhB6KoSAQoA5w@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jLnRWZrLfyBGGOikx_eeYXirahuB7E7yuDhB6KoSAQoA5w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_104212_194813_F77C9A0D 
X-CRM114-Status: UNSURE (   9.76  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Linus,

On Thu, Nov 26, 2026 at 01:53:00PM +0100, Linus Walleij wrote:
> Once the review is complete, can I merge all patches except the DTSI
> patch through the pin control tree, i.e. does it have the right ACKs?

Yes for patch 1/6 to 4/6, however, I believe that 1/6 needs an ack't
from a DTS maintainers. The status is the following:

- 1/6 dt-bindings: pinctrl: Reviewed-by Frank Li and Vladimir Oltean,
  but TBC if any DTS maintainer Ack, is needed ?

- 2/6 dt-bindings: soc: fsl: Reviewed-by Rob Herring, Frank Li and
  Vladimir Oltean

- 3/6 soc: fsl: guts: Acked-by Frank Li (fsl tree) and Christophe Leroy,
  Reviewed-by Vladimir Oltean

- 4/6 pinctrl: Reviewed-by Frank Li and Vladimir Oltean

Regarding the DTS, if my understanding is correct, please,
Rob, Krzysztof, Conor: could you have a look at 1/6 ?

Then, the two DTSI patches, 5/6 and 6/6, will go through Frank once 1/6 to 4/6
are in your tree, as he wrote:
   https://lore.kernel.org/all/awebHKtul2FHepc7@SMW015318/

Thank you,
  Vincent


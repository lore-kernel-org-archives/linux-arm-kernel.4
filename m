Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A20606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IThrAzx0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m6wEKaGX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CQmJN+K2DWg1ta3Pd0qSDV/I7eFiKregSRjAIlFg0LA=; b=IThrAzx0ofiiA2oz9wJMqlk9nV
	6ILLVAfYGLFwSHH0pep1Pjonq82yXyDCtt7JEWNXpedCRXDJn6pBS8Ud1CymLlw/vPTfrJ0xQm2eO
	8xZ3+yvtDILIV5YIPXk/Mj9DwEaWp1eg9aWeCZiD+Tb7ec5lT4MBIDM/gOG6TplfzXCDE5qy3C8qz
	RpF7EroyWdxkP927xeEt6dClCccYVcJ5h2Sdo4Yk2UmrinfA1iiQS+i66BZvpCpbgwrSGKq+TwGOK
	oe+BtjtShKynyYjLPkckkijZQtER4XG3S+Xz07ng0FWoZ7znwkkt2P5rTtUVKdv8C9bFi0LfQKTvq
	/F3GwPTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWa4i-0000000DSyk-0IVy;
	Thu, 26 Nov 2026 14:03:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWa4g-0000000DSyP-0ZeS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 14:03:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BBFC62025;
	Thu, 26 Nov 2026 14:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6DA1F000C6;
	Thu, 26 Nov 2026 14:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795701824;
	bh=CQmJN+K2DWg1ta3Pd0qSDV/I7eFiKregSRjAIlFg0LA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m6wEKaGXyRERWQgso8SRd+SHGpfz4XUnCQIx0dqN5yKwrc1IetWft3BvIDEN6qJTV
	 1S7YeI9WIcLBE7GG9xSL3M497DBa9aQ/8yeB+cVY7zDGFGQ4C54RpM1GhzU4S8OlPk
	 CJliW0TK7rNy/rnrfRQ1X3dknlVbbrFd8T6pwId/l631V4DO0vowGZycZXRV9MDNtu
	 2jeowLoCM/dcNGgIzz7Zf91MYOEGO+rTin6lbLY+tW8BeVuUm3WA75UFT503L6ivrc
	 3ZitzUKjj6kuPeO04VhkxivZJz8POcUwUuoGrZoK7o5fFaxOtigLH2LuyK05PxtOw4
	 SPMcXVJeIaZGg==
Date: Thu, 26 Nov 2026 14:03:40 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clegoffic@baylibre.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/10] pinctrl: scmi: fixes and GPIO function support
Message-ID: <20261126-maroon-bettong-of-energy-455a9b@sudeepholla>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
 <CAD++jL=GRrzWy9p43FqK4WXDiTVpP_0n8sxj698csiCaA6mJ+g@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=GRrzWy9p43FqK4WXDiTVpP_0n8sxj698csiCaA6mJ+g@mail.gmail.com>
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

On Wed, Nov 25, 2026 at 07:52:31PM +0100, Linus Walleij wrote:
> Hi Clément,
> 
> On Mon, Nov 23, 2026 at 4:21 PM Clément Le Goffic
> <clegoffic@baylibre.com> wrote:
> 
> 
> > Clément Le Goffic (10):
> >       pinctrl: scmi: report an off setting as not set
> >       pinctrl: scmi: refuse an inexact drive strength in milliamperes
> 
> I applied these two as fixes, waiting for someone else to pick
> the firmware patches (or ACK them).
> 

I have moved the all Arm generic firmware drivers under drivers/firmware/arm
(as you can see in -next). I can pick up 3,4 and 9. If 10 is the only
dependent change:

1. Can it wait for v7.6 ?
   or
2. Would be prefer to have a branch with the code moved shared as baseline ?
   (so that you can take all the changes together for v7.5)
   or
3. Would you want me to pick up 3-10 and send it via arm-soc ?

-- 
Regards,
Sudeep


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99B8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 08:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WTkGU9Qu;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ACknxjPd;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=X4/X251s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wmJ1b9tTWjRzHKg6nN8Y+a7QMFiCp98+UkeR3JuH5bc=; b=WTkGU9Quhkb67oQukfo5RkgEn1
	B+ugMMGaPkXpWq/qMS88I8+SvxHN7UUFlRXP1dyA8l0MHoJxLxHDpc09NUWx+IcJv0LGVTLC3AAtY
	XZ8+t07xq3znYPl0WnbEUnKdsnTNOvfTgC18W+tQP2PAyfZ+0S+NQxDOp0LPXvawgr9SRW8jrDyTw
	Og1SxFgQd6pOBFVyeo7YVT+AHU2aj/nhjld7mE50zwMF3BAsCPnEPO/EDR1TzqH4uJZsHRU9bp1cv
	NJjAkWtFEeU65t0FSqguODs3/p5F/OP/LF7fohRo43Vb8IILuKUhrC55CL07lo5g7405hUKXfmcRc
	HvBC6H/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Ta-000000061Rc-33nX;
	Wed, 11 Nov 2026 08:14:38 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3TY-000000061QK-0DsZ;
	Wed, 11 Nov 2026 08:14:37 +0000
Date: Wed, 11 Nov 2026 09:14:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794384873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wmJ1b9tTWjRzHKg6nN8Y+a7QMFiCp98+UkeR3JuH5bc=;
	b=ACknxjPdebw24cai+wRztA8YbfoiKGH3lQps7QtppIkCXFbDZttO0oQ+Fq8N2YUBZqPW9G
	Y4aubWBAQWvDF1wFF92KqdWYYr/2ApOPKWwgwXV/tODBz6VYc4ttmhXo3aX9gIIZ7lSduP
	1A9NfjHHwda+nlZFatWBY9BYEOLfaAzUy0Duu8C/AF9MRzfcFDIr2wp1QXwuuRmb89PnN9
	PR4viPPL+Z2kcAiUW+mEGxbNGjTVSiFV5WYCtlcUBX3y7LolQYNhdgT2KDWUhNq3YJl8JM
	dxv9A7pLPrSClMBbFHhJRk4NdMODVuLqL6pdVQ3Kzcc3pfgFa3ZAOkqMiOgfgQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794384873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wmJ1b9tTWjRzHKg6nN8Y+a7QMFiCp98+UkeR3JuH5bc=;
	b=X4/X251s/ZiAX1MjcpLjNyXXGutSoNKv4fi+XLSCARWmJ0XzxrdyH8IPU7sWh1u5YZ4/gN
	p9DApfiwFN5dagDQ==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v9 00/12] nvmem: Add Raspberry Pi OTP nvmem driver
Message-ID: <y2ocj374gtrwf3ozptwgmqhsy5k26y45uwlbgtyvvmlxkftc2k@gjs3jsbxbm4w>
References: <20261111-rpi-otp-driver-v9-0-0a7292a7a5b4@linutronix.de>
 <66bf8629-225d-4f65-84dd-67f02aa4cab6@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66bf8629-225d-4f65-84dd-67f02aa4cab6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_001436_243115_4080E4EE 
X-CRM114-Status: GOOD (  17.32  )
X-Spam-Score: -4.4 (----)
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

On Wed, Nov 11, 2026 at 09:02:19AM +0100, Krzysztof Kozlowski wrote:
> On 11/11/2026 08:23, Gregor Herburger wrote:
> > Hi,
> > 
> > This series adds support for the Raspberry Pis OTP registers. The
> > Raspberry Pi has one or more OTP regions. These registers are accessible
> > through the firmware. Add a driver for it and add updates the devicetree
> > for the Raspberry Pi 5.
> > 
> > ---
> > Changes in v9:
> > - Fix sashiko comment and use fwbuf->count instead of bytes in memcpy
> > - Link to v8: https://patch.msgid.link/20261110-rpi-otp-driver-v8-0-797e0577d414@linutronix.de
> > 
> 
> Big series sent three times within last 24 h. Please slow down and give
> people chance to review your work.
I sent v7 with a missing commit and based on an wrong commit so Sashiko could
not apply the series. Sashiko found an issue in v8 so I tried to fix it in v9.

I have the impression people are not reviewing stuff as long as sashiko has
issues. So I wanted to fix those things quick.

Anyway I will wait a bit with the next revision.
> 
> Best regards,
> Krzysztof

-- 
Gregor Herburger
Linutronix GmbH | Bahnhofstrasse 3 | D-88690 Uhldingen-Mühlhofen
Phone: +49 7556 25 999 35; Fax.: +49 7556 25 999 99

Hinweise zum Datenschutz finden Sie hier (Informations on data privacy 
can be found here): https://linutronix.de/legal/data-protection.php

Linutronix GmbH | Firmensitz (Registered Office): Uhldingen-Mühlhofen | 
Registergericht (Registration Court): Amtsgericht Freiburg i.Br., HRB700 
806 | Geschäftsführer (Managing Directors): Dr. Wilfried Wessner, 
Katharina Kopp, Alexander Gieringer


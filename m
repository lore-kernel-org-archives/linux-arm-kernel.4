Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD781606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L1gI0R0r;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=QPjXvev/;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=IU/57tgZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IKV0hxoQg5hgOML35K8D4/uSv/9pAoDIN4rBZUJXI8Q=; b=L1gI0R0rqOqBPNJnN2VuUx5plm
	BUn9Jz/2Rugdvyf9RvZcrvpcv2yaWIgqrHUPSC5u3WLVo4TVt7LEGAUgPhqUAH3xc4+Ewj1yhLb3o
	bmQoSIk0M8pFmlsI0+emt3BvFUdhrKfyz8Ye+2aF05txAclibR2Qag2zxU7/MZQisidZD0HDPKajT
	zCuCquEFZxTD7ZHzj6tjAbxwAnS97HqinCn4bJthMwM6elZKHpZY3OhKv0Weznx5qgXvQj566slRc
	6IdsjTsw8OrkTFOz50L1PZt7yrWdDeIzJzIyf7Qivz7hUqkTZk/n7HGHF3rRb2FQnkXResOdCjYkO
	EWHm29aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzEq-000000039th-3Lug;
	Mon, 16 Nov 2026 16:07:24 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzEo-000000039tH-2kiZ;
	Mon, 16 Nov 2026 16:07:24 +0000
Date: Mon, 16 Nov 2026 17:07:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794845239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IKV0hxoQg5hgOML35K8D4/uSv/9pAoDIN4rBZUJXI8Q=;
	b=QPjXvev/fmS6baQMvJBooWt282/oYgPtyoqzKqIpkRejy6aJWhsfurqQa378ygpzgJpeiT
	aqhautM0UdBIonR2K2lYfJD4lRf/KXcI9iJlzmPYMQaHq/tS45NxGn2KQ7vRQtOLMYgg2+
	cWAnfzs4MaPkNrfvw8EbL6V6jX/3L21fsPz/ms+TYmTKnNhDSP+PX/xhVfeJb8wIB9k/+g
	ST3DkvRqEfAgTHDzDhPX05Z6tKw+7E/RhUxoVRYtFvRLmEn/wggWsjMSZePi8uRgQNnoBA
	fHKl2MUgkSM8P02kR/pCri04E1Cl7wZdqNrazsoOXnrb0fv1Kos5T7lKeFXVag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794845239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IKV0hxoQg5hgOML35K8D4/uSv/9pAoDIN4rBZUJXI8Q=;
	b=IU/57tgZJYBCfpVisNGjzh93D7596t+Pl1ZUmiCHZzHb39PZoAhhQB+ZLrU+pByZTEEmiq
	FCcW9vUaWjDaH2DQ==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 00/12] nvmem: Add Raspberry Pi OTP nvmem driver
Message-ID: <dzxhqxl4dn7jeqjr3qhvmzegyqyxnrstwotoqkoqoxiipwfxao@pzawf4vd3gos>
References: <20261110-rpi-otp-driver-v8-0-797e0577d414@linutronix.de>
 <336dc797-2406-4d81-b322-61b85ac52bdd@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <336dc797-2406-4d81-b322-61b85ac52bdd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_080722_863983_FCDBEB47 
X-CRM114-Status: GOOD (  16.11  )
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

Hi Srini,

On Mon, Nov 16, 2026 at 03:56:06PM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 11/10/26 4:33 PM, Gregor Herburger wrote:
> > Hi,
> > 
> > This series adds support for the Raspberry Pis OTP registers. The
> > Raspberry Pi has one or more OTP regions. These registers are accessible
> > through the firmware. Add a driver for it and add updates the devicetree
> > for the Raspberry Pi 5.
> 
> What is the merge strategy for this series?
> Am happy to pick up non-dt patches 1-6/12 and 12/12.
> let me know other wise.
Wondering why you answer on the v8 series. Have you seen that I have sent
another series with some additional fixes?
see: https://lore.kernel.org/all/20261116-rpi-otp-driver-v10-0-15302dcfd5e1@linutronix.de/ 

Also please note that the first patch has already been applied by Florian. So
one of you must drop that patch.
see: https://lore.kernel.org/all/20261114032710.874144-1-florian.fainelli@broadcom.com/
I included the patch here because I didn't knew which was going to be applied
first and I wanted that the series can be applied cleanly by Sashiko.

Maybe Florian can pick the rest of the patches?

Best regards
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


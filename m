Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F124606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 09:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WAcnORIL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XgrYTDUz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8epGz59D4MdEX407F6itbh+0d06Zih6gwa0uldXtP/Y=; b=WAcnORILrnT1FnbB7Vdu5o5eex
	qA4vNmXYN1xqqkkGgFob9zUcroX1P9bOUAiZVFDHW8XTDACWoM1Y5aEcjLAbr5fNyKnj9ayO1zDGH
	QPnpUKzP3A/ko5y/MC2OodZMDWR1DY1k+UZzbrivibvYshO0EiAf8r678F3uJyBs0B8AUgrol4n5l
	hfjD4m7wXUckcbwPMleU+hYB3hi1ywVK69m0lJ8rSYWfMMxe5zJpqrVta8MLZX/e9mkEwGaMdc3cn
	SM7IWBmfT14aXz25i9m345ARobo8Wr9qW7tpH8QJprkkHJo8o6C8uEvvk1fUbCDtVtXOFUBzOPukX
	REHLdFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3dI-00000000tVX-3wPH;
	Sun, 22 Nov 2026 09:13:12 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3dF-00000000tV7-3GW6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 09:13:11 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-3adb75e65ecso1668391fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 01:13:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795338788; cv=none;
        d=google.com; s=arc-20260327;
        b=KuAkEhFeZsEJysg1XOLph0i22zskhRRMYLcGc5xgO9qUjBSkoI0GLWusiAUCPd6UPX
         XBrp9096XvvQvhspznvM4BBt/06uifTpXuOtViMIJfqPgcKNhnAaJQXhbgcYBPVUlnKL
         YmRvqJv55prPMeb71j104zyVZZysqgOYeYkU/P1vzIMp2MufVn/F3G3eyijEJcleTK8q
         /bD4tm9M1sRUklT/KYZNQYrf3ITbXtZ4D5/pJrOcGgpNFWRrIGnmRo8GiU6kM+heZrpa
         MouG91n9pTHIv1cN1SDHIGZO1hc4LmFgcl+N9ZDa1V7/YPJVYk2mND+zBU18pkpv7PIp
         Mu/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8epGz59D4MdEX407F6itbh+0d06Zih6gwa0uldXtP/Y=;
        fh=Sx0ldCgNEv4I0cJ3dr5PpDWTfZMoyGDRJS4PYE0BfCc=;
        b=MMvodn0QCZVEqEjFCCDNVXHExhXsPWnqPaUic0ZinaaH1Q2qgWAj9RtNesBD7IcDU1
         X/VSioJ5iOFGPiOZmcVwUTsaInPIz0X+bWTqDcDC0ivbIjomwya7KPHPTeiX0yk/FZq6
         5SEVumN4kVp+H32v+HvP6LIzLWG9nTUDKQNmjo0+Pf3+b9geiVoKU379kgDFBtFaQhaw
         Eg4aDoijYxHCnUIU/wzykmjLryQ6NQxbYduOsWHFrsVVT82JbvQ8ZlvOF6ML8enXnzM+
         2sbuiPSQMLzSWYxoz8EEDYRHsm3JiXbSkZ7LRiCJMRAkDy1xCiRkIbIWQ3LcK7MHHvmr
         +I4g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795338788; x=1795943588; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8epGz59D4MdEX407F6itbh+0d06Zih6gwa0uldXtP/Y=;
        b=XgrYTDUzWSP897PEqoPIojjjhApGoc8ZTlA2y2HouJDFUUqlGVBdf+E3rxUEXOD9D1
         ZCuI/Ss2FFQg0fDCdpLN/22PbsW3DcEofqhu4PGHSROIyC82DnppooULl+JgVLPJzQf7
         B4qd9Pfy+RYKj59O4lRO7IBuJBmHT8kSZsvDypnetziwVgCmIbqe4puaqo3s7CqkqJr+
         BtU1j1OLgwhZ4yLZYyRgagKqB28UdAggKROS8RJSAcaSEqpqt6U6FVxWHyh+A+kAHaeJ
         wSPIss5IwhuYUvk6Luk8SRIVmN2ul3gpD4NjZai164m5PdTSRLB42BVX4nSsXo1c0qtc
         IYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795338788; x=1795943588;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8epGz59D4MdEX407F6itbh+0d06Zih6gwa0uldXtP/Y=;
        b=Oh/lts8hv5s5ADsrSABEdr+3UUPYzJulE4PtB7RKs4ihEQpz8doLxEV2Gl+YInP18o
         A83EsxcDsECTbyoCrYWZtgsD7buOAVR5f7kP3z8k9YhvdNULGorhz3PJrJT5MR2KTl2g
         8QNk1wm1S5pzaJRAQovpOF/mrdAJFOcHSXj37XsYf89bqGUfs3m4AAvXtqKZicjC0GF5
         XPk+t1L8cv4PytGlxjwbCJHMGqxwaWsxwu8MZG7SjHaiobKthnhe9zaNmiE1c4nEjlf4
         dKe+UZ6Zl4m+JId7+0YJ9X1dwwzQpr3hpGyiucwEwX5iZlAnjfg87UjO+VBTHkPZbYJh
         hBvw==
X-Forwarded-Encrypted: i=1; AL+hErHyBfwClcnTxoCml9mOyiiUu1p6O45rG4dgvb8Bu7QMUXnCcx3kOY4MyVCAAk7nA/uCQ3P4HOK+n7RMXkZTWVOE@lists.infradead.org
X-Gm-Message-State: APuU4Z9nuaSVrRJ//haxJF1JxRT4YblbEO9gAdzuyDSd0z/cLHBo74F+
	l1Bxl5T4BCnxLsOy6/hE4u3DPxmjgsBH58RzGY9zshG741U8ya15VbzV9xijTBtwza8hqjRcIin
	vVYfTS/kE5ZwyPMg8yiyxVmjytAEW6YM=
X-Gm-Gg: AZFdTZcHmw9M88xcDKrE5Zz5PM4laXFDWxhfc32UtIsmHZ+QvmDajJCd3AvwZ76BpS2
	xyRi5nO3BpDWgPEfTH1z1xAFlknsbtp5Wg1KrqRRo1MAY9Svo0mEQpvVnp+CiA8/e6ioBXZVp+s
	DnR3I2ypqUHJ9lVeAAGjPGz7uFdu2vvBBCCDFJWa67nfEk6yQqZ43aYwtHRa4qavLE3AjhUR2kQ
	ZdVMEvCWJQRbWOH8+sNKuduQ1x3VnuJOSgrBNsCp8B2qS5JCNUceTPmIOHRGBCRjmylewMON0C9
	kZe9u8iwtgNCjLn1BvSy82c0igP1HxP3NpX0yBFFHkjab4nzSFL0g9GpIHgE5h9d7VAKHEEFjaT
	Wb3jth2ccqugqAK5CV0tT3hNFAE0acBXbDUhktwTQiJEHzH5/gYxhF5TQaShn0Dov1Rud/nM=
X-Received: by 2002:ac2:4c4d:0:b0:5c1:5703:46ed with SMTP id
 2adb3069b0e04-5c308ed81f9mr799710e87.6.1795338787631; Sun, 22 Nov 2026
 01:13:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121-sun8i-emac-mtu-limit-v1-1-22492842d318@gmail.com> <7dee2bac-9892-42df-b2d3-62d648af3452@lunn.ch>
In-Reply-To: <7dee2bac-9892-42df-b2d3-62d648af3452@lunn.ch>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sun, 22 Nov 2026 01:12:55 -0800
X-Gm-Features: Aa3M54p83wm_hVpGZBJqvMK9Qxelv-vsaTFx_mZWuVaXR63vDKf_CE4mO6QIPQ0
Message-ID: <CAEy9hNVmG0FiYWR8ENyQjfnCKrcMrNNJtTMJLZQ226FQjQSUGg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Limit the MTU to one
 descriptor buffer
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	LABBE Corentin <clabbe.montjoie@gmail.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Russell King <rmk+kernel@armlinux.org.uk>, Nicolai Buchwitz <nb@tipi-net.de>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_011310_035379_934FDD03 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 21, 2026 at 07:02:38PM +0100, Andrew Lunn wrote:
> Is this problem specific to the dwmac-sun8i?

No. As Russell wrote in his RFC, every core with normal descriptors
gets max_mtu = SKB_MAX_HEAD() while a descriptor buffer holds 2047
bytes. dwmac-sun8i is the only glue always in chain mode and the only
such hardware I have, so that is where I measured it.

I will send a v2 that limits normal descriptors to one buffer in the
core, with the lower sun8i limit on top, tested on the H616 only.

